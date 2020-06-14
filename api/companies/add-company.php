<?php

include_once '../../config/Database.php';
include_once '../../models/Company.php';
include_once '../../models/Users.php';


$data = json_decode(file_get_contents("php://input"));

$CompanyName = $data->CompanyName;
$CompanyPhone = $data->CompanyPhone;
$CompanyEmail = $data->CompanyEmail;
$ParentId = $data->ParentId;
$CompanyType = $data->CompanyType;
$CompanyAddress = $data->CompanyAddress;
$City = $data->City;
$PostalCode = $data->PostalCode;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$IsDeleted = $data->IsDeleted;
$StatusId = $data->StatusId;

// connect to db
$database = new Database();
$db = $database->connect();
$CompanyId = $database->getGuid($db);
// instantiate
$company = new Company($db);
$users = new Users($db);

$result = $company->AddCompany(
    $CompanyId ,
    $CompanyName,
    $CompanyPhone,
    $CompanyEmail,
    $ParentId,
    $CompanyType,
    $CompanyAddress,
    $City,
    $PostalCode, 
    $CreateUserId, 
    $ModifyUserId,
    $IsDeleted,
    $StatusId);

if($result) {
    if($result["ParentId"] == null) {
        $userToUpdate = $users->getUserByUserId($CreateUserId);
        $userToUpdate["CompanyId"] = $result["CompanyId"];
        $userResult = $users->UpdateUser(
            $userToUpdate["UserId"],
            $userToUpdate["FirstName"],
            $userToUpdate["LastName"],
            $userToUpdate["Email"],
            $userToUpdate["Cellphone"] ,
            $userToUpdate["CompanyId"],
            $userToUpdate["RoleId"],
            $userToUpdate["CreateUserId"],
            $userToUpdate["ModifyUserId"],
            $userToUpdate["StatusId"]
        );
    }


    echo json_encode($result);   
}


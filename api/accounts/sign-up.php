<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';
include_once '../../models/Roles.php';
include_once '../../models/Company.php';

$data = json_decode(file_get_contents("php://input"));

$Email = $data->Email;
$Password = $data->Password;
$FirstName = $data->FirstName;
$LastName = $data->LastName;
$UserType = $data->TypeOfUser;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$Cellphone =  $data->Cellphone;
$CompanyName =  $data->CompanyName;
$CompanyPhone =  $data->CompanyPhone;
$CompanyRepresentative =  $data->CompanyRepresentative;
$StatusId = 9; // Awaiting Activation
$UserCompanyId = null; // CompanyId
$database = new Database();
$db = $database->connect();

$users = new Users($db);
$roles = new Roles($db);

$roleResult = $roles->getByRoleName($UserType);
$RoleId = $roleResult['Id'];
$RoleName = $roleResult['RoleName'];
if($RoleName == "Supplier") {
    $companies = new Company($db);
    $CompanyId = $database->getGuid($db);
    $CompanyResults = $companies->AddCompany(
        $CompanyId,
        $CompanyName,
        $CompanyPhone,
        null,
        $CompanyRepresentative,
        null,
        "HeadQuarter",
        $CreateUserId,
        $ModifyUserId,
        0,
        $StatusId 
    );

    $UserCompanyId = $CompanyResults['CompanyId']; 
}
$UserId = $database->getGuid($db);

$result = $users->AddUser(
    $UserId,
    $FirstName,
    $LastName,
    $Email,
    $Password,
    $Cellphone,
    $RoleId,
    $UserCompanyId,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

if ($result) {
    echo json_encode($result);
} else {
    echo json_encode('internal error');
} 
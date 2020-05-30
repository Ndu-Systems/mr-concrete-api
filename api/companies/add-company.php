<?php

include_once '../../config/Database.php';
include_once '../../models/Company.php';


$data = json_decode(file_get_contents("php://input"));

$CompanyName = $data->CompanyName;
$CompanyPhone = $data->CompanyPhone;
$CompanyEmail = $data->CompanyEmail;
$ParentId = $data->ParentId;
$CompanyType = $data->CompanyType;
$CompanyAddress = $data->CompanyAddress;
$City = $data->City;
$PostalCode = $data->PostalCode;
$CreateUserId = $data->UserId;
$ModifyUserId = $data->UserId;
$IsDeleted = $data->IsDeleted;
$StatusId = $data->StatusId;

// connect to db
$database = new Database();
$db = $database->connect();
$CompanyId = $database->getGuid($db);
// instantiate
$company = new Company($db);

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

echo json_encode($result);   
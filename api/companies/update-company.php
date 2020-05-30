<?php

include_once '../../config/Database.php';
include_once '../../models/Company.php';

$data = json_decode(file_get_contents("php://input"));

$CompanyId = $data->CompanyId;
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


$database = new Database();
$db = $database->connect();

$company = new Company($db);

$result = $company->UpdateCompany(
    $CompanyName,
    $CompanyPhone,
    $CompanyEmail,
    $ParentId,
    $CompanyType,
    $CompanyAddress,
    $City,
    $PostalCode,
    $CreateDate,
    $CreateUserId,
    $ModifyDate,
    $ModifyUserId,
    $IsDeleted,
    $StatusId
);

echo json_encode($result);
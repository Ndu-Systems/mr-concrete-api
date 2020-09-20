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
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$IsDeleted = $data->IsDeleted;
$StatusId = $data->StatusId;


$database = new Database();
$db = $database->connect();

$company = new Company($db);

$result = $company->UpdateCompany(
    $CompanyId,
    $CompanyName, 
    $CompanyPhone, 
    $CompanyEmail, 
    $ParentId, 
    $CompanyType,       
    $ModifyUserId, 
    $IsDeleted, 
    $StatusId
);

echo json_encode($result);

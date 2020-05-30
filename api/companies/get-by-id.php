<?php

include_once '../../config/Database.php';
include_once '../../models/Company.php';

$data = json_decode(file_get_contents("php://input"));



$CompanyId = $data->CompanyId;
$IsDeleted = $data->IsDeleted;
$StatusId = $data->StatusId;

$database = new Database();
$db = $database->connect();

$company = new Company($db);

$result = $company->GetCompanyById($CompanyId, $IsDeleted, $StatusId);

echo json_encode($result);
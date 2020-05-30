<?php

include_once '../../config/Database.php';
include_once '../../models/Company.php';

$data = json_decode(file_get_contents("php://input"));


$UserId = $data->UserId;
$IsDeleted = $data->IsDeleted;
$StatusId = $data->StatusId;

$database = new Database();
$db = $database->connect();

$company = new Company($db);

$result = $company->GetAllCompaniesForUser($UserId, $IsDeleted, $StatusId);

echo json_encode($result);
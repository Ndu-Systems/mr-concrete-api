<?php

include_once '../../config/Database.php';
include_once '../../models/Company.php';

$data = json_decode(file_get_contents("php://input"));



$database = new Database();
$db = $database->connect();

$company = new Company($db);

$result = $company->GetDetailsCompanies();

echo json_encode($result);
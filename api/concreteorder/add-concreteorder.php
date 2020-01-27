<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';

$data = json_decode(file_get_contents("php://input"));

$CompanyId = $data->CompanyId;
$Name = $data->Name;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$concreteorder = new Concreteorder($db);

$result = $concreteorder->add(
    $CompanyId,
    $Name,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);

 
 



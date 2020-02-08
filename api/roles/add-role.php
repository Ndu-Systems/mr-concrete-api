<?php

include_once '../../config/Database.php';
include_once '../../models/Roles.php';

$data = json_decode(file_get_contents("php://input"));

$RoleName = $data->RoleName;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();

$roles = new Roles($db);

$result = $roles->AddRole(
    $RoleName,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);
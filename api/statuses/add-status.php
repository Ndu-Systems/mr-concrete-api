<?php
include_once '../../config/Database.php';
include_once '../../models/Statuses.php';

$data = json_decode(file_get_contents("php://input"));

$StatusCode = $data->StatusCode;
$Description = $data->Description;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$IsActive = $data->IsActive;
$Type = $data->Type;

$database = new Database();
$db = $database->connect();

$statuses = new Statuses($db);
$StatusId = $database->getGuid($db);
$result = $statuses->add(
    $StatusId,
    $StatusCode,
    $Description,
    $CreateUserId,
    $ModifyUserId,
    $IsActive,
    $Type
);

echo json_encode($result);

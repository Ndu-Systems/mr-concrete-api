<?php
include_once '../../config/Database.php';
include_once '../../models/Measurement.php';

$data = json_decode(file_get_contents("php://input"));
 
$MeasurementId = $data->MeasurementId;
$Name = $data->Name;
$UnitOfMeasurement = $data->UnitOfMeasurement;
$Type = $data->Type;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;


//connect to db
$database = new Database();
$db = $database->connect();
 
// create user first to get UserId
$measurement = new Measurement($db);

$result = $measurement->updateMeasurement(
    $MeasurementId,
    $Name,
    $UnitOfMeasurement,
    $Type,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);

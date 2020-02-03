<?php
include_once '../../config/Database.php';
include_once '../../models/Measurement.php';

$data = json_decode(file_get_contents("php://input"));
 
$Name = $data->Name;
$UnitOfMeasurement = $data->UnitOfMeasurement;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;


//connect to db
$database = new Database();
$db = $database->connect();
$OrderId = $database->getGuid($db);

$MeasurementId = $database->getGuid($db);

// create user first to get UserId
$measurement = new Measurement($db);

$result = $measurement->add(
    $MeasurementId,
    $Name,
    $UnitOfMeasurement,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);

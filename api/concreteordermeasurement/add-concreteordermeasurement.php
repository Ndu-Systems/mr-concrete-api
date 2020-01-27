<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteordermeasurement.php';

$data = json_decode(file_get_contents("php://input"));


$OrderId = $data->OrderId;
$MeasurementId = $data->MeasurementId;
$Value = $data->Value;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;


//connect to db
$database = new Database();
$db = $database->connect();
$Id = $database->getGuid($db);


// create user first to get UserId
$concreteordermeasurement = new Concreteordermeasurement($db);

$result = $concreteordermeasurement->add(
    $Id,
    $OrderId,
    $MeasurementId,
    $Value,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);

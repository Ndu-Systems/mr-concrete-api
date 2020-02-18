<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';
include_once '../../models/Concreteordermeasurement.php';


$data = json_decode(file_get_contents("php://input"));
$concreteordermeasurements = $data->measurements;

$CreateUserId = $data->CreateUserId;
$ProjectCode = $data->ProjectCode;
$OrderNumber = $data->OrderNumber;
$SupplierId = $data->SupplierId;
$OrderDate = $data->OrderDate;
$DeliveryDate = $data->DeliveryDate;
$TruckArrivalTime = $data->TruckArrivalTime;
$Directions = $data->Directions;
$SpecialInstructions = $data->SpecialInstructions;
$CategoryId = $data->CategoryId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();
$OrderId = $database->getGuid($db);


// create user first to get UserId
$concreteorder = new Concreteorder($db);

$result = $concreteorder->add(
    $OrderId,
    $CreateUserId,
    $ProjectCode,
    $OrderNumber,
    $SupplierId,
    $OrderDate,
    $DeliveryDate,
    $TruckArrivalTime,
    $Directions,
    $SpecialInstructions,
    $CategoryId,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

if ($result['OrderId']) {
    foreach ($concreteordermeasurements as $measurement) {
        $order_measurement = new Concreteordermeasurement($db);
        $measurementId = $database->getGuid($db);

        $result = $order_measurement->add(
            $measurementId,
            $OrderId,
            $measurement->MeasurementId,
            $measurement->Value,
            $measurement->CreateUserId,
            $measurement->ModifyUserId,
            $measurement->StatusId
        );
    }
    $order = $concreteorder->getOneById($OrderId);
    echo json_encode($order);
}

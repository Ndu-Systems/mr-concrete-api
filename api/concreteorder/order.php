<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';
include_once '../../models/Concreteordermeasurement.php';


$data = json_decode(file_get_contents("php://input"));
$concreteorder =$data->concreteorder;
$concreteordermeasurements = $data->concreteordermeasurements;

$CreateUserId = $concreteorder->CreateUserId;
$ProjectCode= $concreteorder->ProjectCode;
$OrderNumber= $concreteorder->OrderNumber;
$SupplierId= $concreteorder->SupplierId;
$OrderDate= $concreteorder->OrderDate;
$DeliveryDate= $concreteorder->DeliveryDate;
$TruckArrivalTime= $concreteorder->TruckArrivalTime;
$Directions= $concreteorder->Directions;
$SpecialInstructions= $concreteorder->SpecialInstructions;
$CategoryId= $concreteorder->CategoryId;
$ModifyUserId= $concreteorder->ModifyUserId;
$StatusId= $concreteorder->StatusId;

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

if( $result['OrderId']){
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
    echo json_encode('true');
    
}

// $allorders = $orders->getDetailedCampanyById($order->CompanyId);
// echo json_encode($allorders);

 
 



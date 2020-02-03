<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';
include_once '../../models/Concreteordermeasurement.php';


$data = json_decode(file_get_contents("php://input"));
$concreteorder = json_decode($data->concreteorder);
$concreteordermeasurements = json_decode($data->concreteordermeasurements);
// echo json_encode($concreteorder);

//connect to db
$database = new Database();
$db = $database->connect();
$OrderId = $database->getGuid($db);


// create user first to get UserId
$concreteorder = new Concreteorder($db);

$result = $concreteorder->add(
    $OrderId,
    $concreteorder->CreateUserId,
    $concreteorder->ProjectCode,
    $concreteorder->OrderNumber,
    $concreteorder->SupplierId,
    $concreteorder->OrderDate,
    $concreteorder->DeliveryDate,
    $concreteorder->TruckArrivalTime,
    $concreteorder->Directions,
    $concreteorder->SpecialInstructions,
    $concreteorder->CategoryId,
    $concreteorder->CreateUserId,
    $concreteorder->ModifyUserId,
    $concreteorder->StatusId
);

if( $result['OrderId']){
    foreach ($concreteordermeasurements as $measurement) {
        $order_measurement = new Concreteordermeasurement($db);
    
        $result = $order_measurement->add(
            $measurement->Id,
            $measurement->OrderId,
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

 
 



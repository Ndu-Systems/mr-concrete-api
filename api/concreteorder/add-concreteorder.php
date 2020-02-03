<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';

$data = json_decode(file_get_contents("php://input"));


$UserId= $data->UserId;
$ProjectCode= $data->ProjectCode;
$OrderNumber= $data->OrderNumber;
$OrderDate= $data->OrderDate;
$DeliveryDate= $data->DeliveryDate;
$TruckArrivalTime= $data->TruckArrivalTime;
$Directions= $data->Directions;
$SpecialInstructions= $data->SpecialInstructions;
$CategoryId= $data->CategoryId;
$CreateUserId= $data->CreateUserId;
$ModifyUserId= $data->ModifyUserId;
$StatusId= $data->StatusId;


//connect to db
$database = new Database();
$db = $database->connect();
$OrderId = $database->getGuid($db);


// create user first to get UserId
$concreteorder = new Concreteorder($db);

$result = $concreteorder->add(
    $OrderId,
    $UserId,
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

echo json_encode($result);

 
 



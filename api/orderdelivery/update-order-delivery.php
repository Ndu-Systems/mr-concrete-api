<?php

include_once '../../config/Database.php';
include_once '../../models/Delivery.php';

$data = json_decode(file_get_contents("php://input"));

$OrderId = $data->OrderId;
$Id = $data->Id;
$UserId = $data->UserId;
$DriverId = $data->DriverId;
$DeliveryStartDateTime = $data->DeliveryStartDateTime;
$DeliveryEndDateTime = $data->DeliveryEndDateTime;
$IsDeleted = $data->IsDeleted;
$StatusId = $data->StatusId;


if ($IsDeleted == true) {
    $IsDeleted = 1;
} else {
    $IsDeleted = 0;
}

// connect to db
$database = new Database();
$db = $database->connect();
 
// instantiate
$delivery = new OrderDelivery($db);

$result = $delivery->UpdateOrderDelivery(
    $Id,
    $OrderId,
    $UserId,
    $DriverId,
    $DeliveryStartDateTime,
    $DeliveryEndDateTime,
    $IsDeleted,
    $StatusId
);

echo json_encode($result);

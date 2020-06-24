<?php

include_once '../../config/Database.php';
include_once '../../models/Delivery.php';

$data = json_decode(file_get_contents("php://input"));

$UserId = $data->UserId;
$IsDeleted = $data->IsDeleted;
$StatusId = $data->StatusId;

// connect to db
$database = new Database();
$db = $database->connect();
 
 
// instantiate
$delivery = new OrderDelivery($db);

$result = $delivery->GetOrderDeliveriesByUserId(
    $UserId,
    $IsDeleted,
    $StatusId
);

echo json_encode($result);

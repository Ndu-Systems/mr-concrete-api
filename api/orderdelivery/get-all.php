<?php

include_once '../../config/Database.php';
include_once '../../models/Delivery.php';

$data = json_decode(file_get_contents("php://input"));

$IsDeleted = $data->IsDeleted;
$StatusId = $data->StatusId;

// connect to db
$database = new Database();
$db = $database->connect();
$Id = $database->getGuid($db);

if ($IsDeleted == true) {
    $IsDeleted = 1;
} else {
    $IsDeleted = 0;
}
// instantiate
$delivery = new OrderDelivery($db);

$result = $delivery->GetAll(
    $IsDeleted,
    $StatusId
);

echo json_encode($result);

<?php
include_once '../../config/Database.php';
include_once '../../models/Order.php';

$data = json_decode(file_get_contents("php://input"));

$OrderId = $data->OrderId;
$CustomerId = $data->CustomerId;
$SupplierId = $data->SupplierId;
$Total = $data->Total;
$DeliveryDate = $data->DeliveryDate;
$CrateUserId = $data->CrateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$Order = new Order($db);

$result = $Order->update(
    $OrderId,
    $CustomerId,
    $SupplierId,
    $Total,
    $DeliveryDate,
    $CrateUserId,
    $ModifyUserId,
    $StatusId
);

    
    echo json_encode($result);

 
 



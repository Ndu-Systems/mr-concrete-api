<?php
include_once '../../config/Database.php';
include_once '../../models/Order_products.php';



$data = json_decode(file_get_contents("php://input"));

$OrderId = $data->OrderId;
$ProductId = $data->ProductId;
$CompanyId = $data->CompanyId;
$ProductName = $data->ProductName;
$UnitPrice = $data->UnitPrice;
$Quantity = $data->Quantity;
$subTotal = $data->subTotal;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$order_products = new Order_products($db);

$result = $order_products->add(
    $OrderId,
    $ProductId,
    $CompanyId,
    $ProductName,
    $UnitPrice,
    $Quantity,
    $subTotal,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

    
    echo json_encode($result);

 
 



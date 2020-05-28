<?php
include_once '../../config/Database.php';
include_once '../../models/Product.php';

$data = json_decode(file_get_contents("php://input"));

$UserId = $data->UserId;
$ProductName = $data->ProductName;
$ShortDescription = $data->ShortDescription;
$Description = $data->Description;
$ProductCode = $data->ProductCode;
$Price = $data->Price;
$Quantity = $data->Quantity;
$Units = $data->Units;
$CategoryId = $data->CategoryId;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$product = new Product($db);

$result = $product->update(
    $ProductId,
    $UserId,
    $ProductName,
    $ShortDescription,
    $Description,
    $ProductCode,
    $Price,
    $Quantity,
    $Units,
    $CategoryId,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

    
    echo json_encode($result);

 
 



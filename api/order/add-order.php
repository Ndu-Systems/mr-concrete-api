<?php
include_once '../../config/Database.php';
include_once '../../models/Order.php';
include_once '../../models/Orderproduct.php';

$data = json_decode(file_get_contents("php://input"));


$CustomerId = $data->CustomerId;
$SupplierId = $data->SupplierId;
$ProjectNumber = $data->ProjectNumber;
$DeliveryDate = $data->DeliveryDate;
$DeliveryTime = $data->DeliveryTime;
$DeliveryAddress = $data->DeliveryAddress;
$SpecialInstructions = $data->SpecialInstructions;
$Total = $data->Total;
$CrateUserId = $data->CrateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;
$Orderproducts = $data->Orderproducts;

//connect to db
$database = new Database();
$db = $database->connect();
$OrderId = $database->getGuid($db);

// create user first to get UserId
$Order = new Order($db);
$orderproducts = new Orderproduct($db);

$result = $Order->add(
    $OrderId,
    $CustomerId,
    $SupplierId,
    $ProjectNumber,
    $DeliveryDate,
    $DeliveryTime,
    $DeliveryAddress,
    $SpecialInstructions,
    $Total,
    $CrateUserId,
    $ModifyUserId,
    $StatusId
);

if (isset($Orderproducts)) {
    $OrderproductsResults = array();
    foreach ($Orderproducts as $product) {
        $OrderProductId = $database->getGuid($db);
        $OrderproductsResult = $orderproducts->add(
            $OrderProductId,
            $OrderId,
            $product->ProductId,
            $product->ProductName,
            $product->Price,
            $product->Quantity,
            $product->Units,
            $CrateUserId,
            $ModifyUserId,
            $StatusId
        );
        array_push($OrderproductsResults, $OrderproductsResult);
    }
    $result["Orderproducts"] = $OrderproductsResults;
}
echo json_encode($result);

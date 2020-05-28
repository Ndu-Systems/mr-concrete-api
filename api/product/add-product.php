<?php
include_once '../../config/Database.php';
include_once '../../models/Product.php';
include_once '../../models/Productproperty.php';


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
$Properties = $data->Properties;

//connect to db
$database = new Database();
$db = $database->connect();
$ProductId = $database->getGuid($db);

// create user first to get UserId
$product = new Product($db);
$productproperty = new Productproperty($db);

$result = $product->add(
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

if (isset($Properties)) {
    $productpropertyResults = array();
    foreach ($Properties as $property) {
        $ProductpropertyId = $database->getGuid($db);
        $productpropertyResult = $productproperty->add(
            $ProductpropertyId,
            $ProductId,
            $property->Name,
            $property->Code,
            $property->Value,
            $CreateUserId,
            $ModifyUserId,
            $StatusId
        );
        array_push($productpropertyResults, $productpropertyResult);
    }
    $result["result"] = $productpropertyResults;
}
echo json_encode($result);

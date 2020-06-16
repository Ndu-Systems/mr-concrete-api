<?php
include_once '../../config/Database.php';
include_once '../../models/Product.php';
include_once '../../models/Productproperty.php';


$data = json_decode(file_get_contents("php://input"));

$ProductId = $data->ProductId;
$CompanyId = $data->CompanyId;
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
$product = new Product($db);
$productproperty = new Productproperty($db);

$result = $product->update(
    $ProductId,
    $CompanyId,
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

        if ($property->ProductpropertyId != "new") {
            $productpropertyResult = $productproperty->update(
                $property->ProductpropertyId,
                $property->ProductId,
                $property->Name,
                $property->Code,
                $property->Value,
                $property->Units,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            );
            array_push($productpropertyResults, $productpropertyResult);
        } else {
            $ProductpropertyId = $database->getGuid($db);
            $productpropertyResult = $productproperty->add(
                $ProductpropertyId,
                $ProductId,
                $property->Name,
                $property->Code,
                $property->Value,
                $property->Units,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            );
            array_push($productpropertyResults, $productpropertyResult);
        }
    }
    $result["Properties"] = $productpropertyResults;
}


echo json_encode($result);

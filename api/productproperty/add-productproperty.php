<?php
include_once '../../config/Database.php';
include_once '../../models/Productproperty.php';

$data = json_decode(file_get_contents("php://input"));
$ProductId = $data->ProductId;
$Name = $data->Name;
$Code = $data->Code;
$Value = $data->Value;
$Units = $data->Units;
$CrateUserId = $data->CrateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();
$ProductpropertyId = $database->getGuid($db);

// create user first to get UserId
$productproperty = new Productproperty($db);

$result = $productproperty->add(
    $ProductpropertyId,
    $ProductId,
    $Name,
    $Code,
    $Value,
    $Units,
    $CrateUserId,
    $ModifyUserId,
    $StatusId
);
echo json_encode($result);

 
 



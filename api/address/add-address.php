<?php
include_once '../../config/Database.php';
include_once '../../models/Address.php';

$data = json_decode(file_get_contents("php://input"));
$OtherId= $data->OtherId;
$AddressType= $data->AddressType;
$AddressLine1= $data->AddressLine1;
$AddressLine2= $data->AddressLine2;
$AddressLine3= $data->AddressLine3;
$City= $data->City;
$Province= $data->Province;
$PostalCode= $data->PostalCode;
$CrateUserId= $data->CrateUserId;
$ModifyUserId= $data->ModifyUserId;
$StatusId= $data->StatusId;

$database = new Database();
$db = $database->connect();

$address = new Address($db);
$AddressId = $database->getGuid($db);
$result = $address->AddAddress(
    $AddressId,
    $OtherId,
    $AddressType,
    $AddressLine1,
    $AddressLine2,
    $AddressLine3,
    $City,
    $Province,
    $PostalCode,
    $CrateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);
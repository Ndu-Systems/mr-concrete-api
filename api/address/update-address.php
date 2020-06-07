<?php
include_once '../../config/Database.php';
include_once '../../models/Address.php';


$data = json_decode(file_get_contents("php://input"));

$AddressId= $data->AddressId;
$UserId= $data->UserId;
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
$result = $address->UpdateAddress(
    $AddressId,
    $UserId,
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

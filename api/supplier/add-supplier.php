<?php
include_once '../../config/Database.php';
include_once '../../models/Supplier.php';

$data = json_decode(file_get_contents("php://input"));

$SupplierName= $data->SupplierName;
$ContactNumber= $data->ContactNumber;
$EmailAddress= $data->EmailAddress;
$ContactPerson= $data->ContactPerson;
$SupplierAddress= $data->SupplierAddress;
$City= $data->City;
$PostalCode= $data->PostalCode;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();
$SupplierId = $database->getGuid($db);


// create user first to get UserId
$supplier = new Supplier($db);

$result = $supplier->add(
    $SupplierId,
    $SupplierName,
    $ContactNumber,
    $EmailAddress,
    $ContactPerson,
    $SupplierAddress,
    $City,
    $PostalCode,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);

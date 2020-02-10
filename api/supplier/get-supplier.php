<?php
include_once '../../config/Database.php';
include_once '../../models/supplier.php';

$data = json_decode(file_get_contents("php://input"));

$supplierId = $data->SupplierId;
$email = $data->Email;


//connect to db
$database = new Database();
$db = $database->connect();


// create user first to get UserId
$supplier = new Supplier($db);

$result = $supplier->getSpecificSupplier($supplierId , $email);

echo json_encode($result);

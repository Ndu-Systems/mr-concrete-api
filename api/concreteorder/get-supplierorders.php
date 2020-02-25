<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';
include_once '../../models/Supplier.php';

$data = json_decode(file_get_contents("php://input"));

//connect to db
$database = new Database();
$db = $database->connect();
$SupplierId = $_GET['UserId'];


// create user first to get UserId
$concreteorder = new Concreteorder($db);
$supplier = new Supplier($db);

$supplierResult = $supplier->getById($SupplierId);
$result["Orders"] = $concreteorder->getOrdersForSupplier($SupplierId);


$result['supplier'] = $supplierResult;
echo json_encode($result);
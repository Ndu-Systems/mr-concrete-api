<?php
include_once '../../config/Database.php';
include_once '../../models/Supplier.php';

$data = json_decode(file_get_contents("php://input"));
$StatusId = $_GET['StatusId'];

//connect to db
$database = new Database();
$db = $database->connect();


// create user first to get UserId
$supplier = new Supplier($db);

$result = $supplier->getAllOrders($StatusId);

echo json_encode($result);

 
 



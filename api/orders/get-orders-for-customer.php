<?php
include_once '../../config/Database.php';
include_once '../../models/Orders.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$ParntersEmail =$_GET['ParntersEmail'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$orders = new Orders($db);

$result = $orders->getDetailedCustomerEmail(
    $ParntersEmail
);
 
    echo json_encode($result);

 
 



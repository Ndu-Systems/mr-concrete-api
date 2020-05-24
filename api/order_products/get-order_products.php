<?php
include_once '../../config/Database.php';
include_once '../../models/Order_products.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$OrderId =$_GET['OrderId'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$order_products = new Order_products($db);

$result = $order_products->getBOrderIdId(
    $OrderId
);
  echo json_encode($result);

 
 



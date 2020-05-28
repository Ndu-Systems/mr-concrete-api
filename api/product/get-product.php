<?php
include_once '../../config/Database.php';
include_once '../../models/Product.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$ProductId =$_GET['ProductId'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$product = new Product($db);

$result = $product->getById(
    $ProductId
);
 
    echo json_encode($result);

 
 



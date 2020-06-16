<?php
include_once '../../config/Database.php';
include_once '../../models/Product.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$UserId =$_GET['UserId'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$product = new Product($db);

$result = $product->getByCompanyId(
    $UserId
);
 
echo json_encode($result);

 
 



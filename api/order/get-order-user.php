<?php
include_once '../../config/Database.php';
include_once '../../models/Order.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$UserId =$_GET['UserId'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$Order = new Order($db);

$result = $Order->getBySupplierId(
    $UserId
);
 
echo json_encode($result);

 
 



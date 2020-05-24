<?php
include_once '../../config/Database.php';
include_once '../../models/Order_options.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$OrderId =$_GET['OrderId'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$image = new Order_options($db);

$result = $image->getByOrderId($OrderId);

    echo json_encode($result);

 
 



<?php
include_once '../../config/Database.php';
include_once '../../models/Orders.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$CompanyId =$_GET['CompanyId'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$orders = new Orders($db);

$result = $orders->getDetailedCampanyById(
    $CompanyId
);
 
    echo json_encode($result);

 
 



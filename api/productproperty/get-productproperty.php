<?php
include_once '../../config/Database.php';
include_once '../../models/Productproperty.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$ProductpropertyId =$_GET['ProductpropertyId'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$productproperty = new Productproperty($db);

$result = $productproperty->getById(
    $ProductpropertyId
);
 echo json_encode($result);

 
 



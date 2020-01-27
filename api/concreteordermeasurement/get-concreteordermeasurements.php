<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteordermeasurement.php';

$data = json_decode(file_get_contents("php://input"));

//connect to db
$database = new Database();
$db = $database->connect();


// create user first to get UserId
$concreteordermeasurement = new Concreteordermeasurement($db);

$result = $concreteordermeasurement->getCampanyById("00");

echo json_encode($result);

 
 



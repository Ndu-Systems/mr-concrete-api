<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';

$data = json_decode(file_get_contents("php://input"));

//connect to db
$database = new Database();
$db = $database->connect();
$UserId = $_GET['UserId'];


// create user first to get UserId
$concreteorder = new Concreteorder($db);

$result = $concreteorder->getUserById($UserId);

echo json_encode($result);

 
 



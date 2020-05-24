<?php
include_once '../../config/Database.php';
include_once '../../models/Image.php';

$data = json_decode(file_get_contents("php://input"));

// create user data only
$OtherId =$_GET['OtherId'];


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$image = new Image($db);

$result = $image->getParentIdById(
    $OtherId
);
 
    echo json_encode($result);

 
 



<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';

$data = json_decode(file_get_contents("php://input"));

 $Token = $data->Token; 

$database = new Database();
$db = $database->connect();

$user = new Users($db);
 
$result = $user->getUserByToken($Token);
if($result) {  
    $result['Password'] = null;
    echo json_encode($result);
}else {
    echo json_encode("Invalid request");
}
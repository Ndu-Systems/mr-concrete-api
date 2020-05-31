<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';
 
$data = json_decode(file_get_contents("php://input"));

$Email = $data->Email;
$Password = $data->Password; 

$database = new Database();
$db = $database->connect();

$user = new Users($db);
 
$result = $user->getUserByEmailAndPassword($Email,$Password);
if($result) {
    $userResult = $user->getUserDetailedByUserId($result["UserId"]);
    $userResult['Password'] = null;
    echo json_encode($userResult);
}else {
    echo json_encode("the email/password entered is invalid");
}
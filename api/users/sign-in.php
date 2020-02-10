<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';
include_once '../../models/Roles.php';

$data = json_decode(file_get_contents("php://input"));

$Email = $data->Email;
$Password = $data->Password; 

$database = new Database();
$db = $database->connect();

$user = new Users($db);
$role = new Roles($db);

$result = $user->getUserByEmailAndPassword($Email,$Password);
$Id = $result["RoleId"];
$roleResult = $role->getRoleById($Id);
$result['Password'] = null;
$result['Role'] = $roleResult;
echo json_encode($result);
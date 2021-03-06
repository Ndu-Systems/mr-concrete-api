<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';

$data = json_decode(file_get_contents("php://input"));

$UserId = $data->UserId;
$FirstName = $data->FirstName;
$LastName = $data->LastName;
$Email = $data->Email;
$Cellphone = $data->Cellphone;
$CompanyId = $data->CompanyId;
$RoleId = $data->RoleId;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

$database = new Database();
$db = $database->connect();

$users = new Users($db);
$result = $users->UpdateUser(
    $UserId,
    $FirstName,
    $LastName,
    $Email,
    $Cellphone,  
    $CompanyId,  
    $RoleId,   
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);

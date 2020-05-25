<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';
include_once '../../models/Roles.php';
include_once '../../models/Account.php';


$data = json_decode(file_get_contents("php://input"));

$Email = $data->Email;
$Password = $data->Password;
$FirstName = $data->FirstName;
$LastName = $data->LastName;
$UserType = $data->TypeOfUser;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$Cellphone =  $data->Cellphone;
$StatusId = 9; // Awaiting Activation

$database = new Database();
$db = $database->connect();

$users = new Users($db);
$roles = new Roles($db);
$account = new Account($db);

$roleResult = $roles->getByRoleName($UserType);
$RoleId = $roleResult['Id'];

$UserId = $database->getGuid($db);
$userResult = $users->AddUser(
    $UserId,
    $FirstName,
    $LastName,
    $Email,
    $Password,
    $Cellphone,
    $RoleId,
    $UserType,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

$result = $account->GenerateToken($userResult["Email"]);

if ($result) {
    echo json_encode($result);
} else {
    echo json_encode('internal error');
}

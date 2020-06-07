<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';
include_once '../../models/Roles.php';

$data = json_decode(file_get_contents("php://input"));

$StatusId = $data->StatusId;
$UserType = $data->TypeOfUser;
$RoleId = 0;
//connect to db
$database = new Database();
$db = $database->connect();


// create user first to get UserId
$users = new Users($db);
$roles = new Roles($db);

if ($UserType) {
    // get users for a specific type
    $roleResult = $roles->getByRoleName($UserType);
    $RoleId = $roleResult['Id'];
}

$userList= $users->getAllUsers($RoleId,$StatusId);
if($userList) {
    $userModelList = array();
    foreach ($userList as $user) {
        # code...
        $detailedUser = $users->getUserDetailedByUserId($user["UserId"]);
        $detailedUser['Password'] = null;
        array_push($userModelList,$detailedUser);
    }
    echo json_encode($userModelList);
}


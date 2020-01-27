<?php
include_once '../../config/Database.php';
include_once '../../models/category.php';

$data = json_decode(file_get_contents("php://input"));


$CategoryName = $data->CategoryName;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;


//connect to db
$database = new Database();
$db = $database->connect();
$CategoryId = $database->getGuid($db);


// create user first to get UserId
$category = new Category($db);

$result = $category->add(
    $CategoryId,
    $CategoryName,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);

echo json_encode($result);

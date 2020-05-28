<?php
include_once '../../config/Database.php';
include_once '../../models/Image.php';

$data = json_decode(file_get_contents("php://input"));

$CompanyId = $data->CompanyId;
$OtherId = $data->OtherId;
$Url = $data->Url;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();
$UserId = $database->getGuid($db);

// create user first to get UserId
$image = new Image($db);

$result = $image->add(
    $ImageId,
    $CompanyId,
    $OtherId,
    $Url,
    $CreateUserId,
    $ModifyUserId,
    $StatusId
);
echo json_encode($result);

 
 



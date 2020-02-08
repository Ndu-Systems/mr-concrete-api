<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';
include_once '../../models/Roles.php';
include_once '../../models/Supplier.php';

$data = json_decode(file_get_contents("php://input"));

$Email = $data->Email;
$Password = $data->Password;
$FirstName = $data->FirstName;
$LastName = $data->LastName;
$TypeOfUser = $data->TypeOfUser;
$SupplierName = $data->SupplierName;
$CreateUserId = $data->CreateUserId;
$ModifyUserId = $data->ModifyUserId;
$Cellphone = 'na';
$StatusId = 1;

$database = new Database();
$db = $database->connect();

$users = new Users($db);
$roles = new Roles($db);

if ($TypeOfUser == 'Supplier') {
    $roleResult = $roles->getByRoleName($TypeOfUser);
    $RoleId = $roleResult['Id'];
    $UserId = $database->getGuid($db);
    $result = $users->AddUser(
        $UserId,
        $FirstName,
        $LastName,
        $Email,
        $Password,
        $Cellphone,
        $RoleId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    );
    if ($result) {

        $supplier = new Supplier($db);
        $SupplierId = $database->getGuid($db);
        $ContactNumber = $Cellphone;
        $EmailAddress = $Email;
        $ContactPerson = $FirstName;
        $SupplierAddress = 'na';
        $City = 'na';
        $PostalCode = 'na';

        $supplierResult = $supplier->add(
            $SupplierId,
            $SupplierName,
            $ContactNumber,
            $EmailAddress,
            $ContactPerson,
            $SupplierAddress,
            $City,
            $PostalCode,
            $CreateUserId,
            $ModifyUserId,
            $StatusId
        );

        if ($supplierResult && $result) {
            echo json_encode($result);
        }
    }
} else if ($TypeOfUser == 'Engineer') {

    $roleResult = $roles->getByRoleName($TypeOfUser);
    $RoleId = $roleResult['Id'];

    $UserId = $database->getGuid($db);
    $result = $users->AddUser(
        $UserId,
        $FirstName,
        $LastName,
        $Email,
        $Password,
        $Cellphone,
        $RoleId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    );

    if ($result) {
        echo json_encode($result);
    }
}

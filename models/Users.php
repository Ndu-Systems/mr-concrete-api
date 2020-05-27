<?php
include_once 'Address.php';
include_once 'Image.php';
include_once 'Account.php';

class Users
{
    //DB Stuff
    private $conn;


    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function getAllUsers($RoleId, $StatusId)
    {
        if ($RoleId > 0) {
            return $this->getUsersByRole($RoleId, $StatusId);
        } else {
            return $this-> getUsersByStatus($StatusId);
        }
    }
    private function getUsersByStatus($StatusId)
    {
        $query = "SELECT * FROM user WHERE StatusId =?";

        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($StatusId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    private function getUsersByRole($RoleId, $StatusId)
    {
        $query = "SELECT * FROM user WHERE RoleId =? AND StatusId =?";

        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($RoleId, $StatusId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

    public function getUserByUserId($UserId)
    {
        $query = "SELECT * FROM user WHERE UserId =?";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($UserId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
    public function getUserDetailedByUserId($UserId)
    {
        $query = "SELECT * FROM user WHERE UserId =?";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($UserId));

        if ($stmt->rowCount()) {
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($user) {
                $address = new Address($this->conn);
                $image = new Image($this->conn);
                $user["Address"] = $address->getUserByUserId($user["UserId"]);
                $user["Images"] = $image->getParentIdById($user["UserId"]);
                return $user;
            }
            return null;
        }
    }

    public function getUserByEmail($Email)
    {
        $query = "SELECT * FROM user WHERE Email =?";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($Email));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getUserByToken($Token)
    {
        $query = "SELECT * FROM user WHERE Token =? ";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($Token));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    

    public function getUserByEmailAndPassword(
        $Email,
        $Password
    ) {
        $query = "SELECT  * FROM user WHERE Email =  ? AND BINARY Password = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($Email, $Password));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }


    public function AddUser(
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
    ) {
        $account = new Account($this->conn);

        if ($this->getUserByEmail($Email) > 0) {
            return "user already exists";
        }

        $query = "INSERT INTO  user(        
            UserId ,  
            FirstName ,  
            LastName ,  
            Email ,  
            Password ,  
            Cellphone ,  
            RoleId ,          
            CreateUserId , 
            ModifyUserId ,  
            StatusId ) 
            VALUES (?,?,?,?,?,?,?,?,?,?)";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
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
            ))) {

                return $account->GenerateToken($Email);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
    public function UpdateUser(
        $UserId,
        $FirstName,
        $LastName,
        $Email,
        $Cellphone,
        $Gender,
        $DOB,
        $RoleId,
        $UserType,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {

        $query = "UPDATE  user      
           SET 
            FirstName = ?,
            LastName = ?,
            Email = ?,
            Cellphone = ?,         
            RoleId = ?,  
            ModifyDate = now(),
            CreateUserId = ?,
            ModifyUserId = ?,
            StatusId = ?
            WHERE 
            UserId = ?
            ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $FirstName,
                $LastName,
                $Email,
                $Cellphone,
                $RoleId,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $UserId
            ))) {
                return $this->getUserByUserId($UserId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
    public function UpdateUserPassword(
        $UserId,
        $Password
    ) {

        $query = "UPDATE  user      
           SET 
           Password = ?,
            ModifyDate = now()
            WHERE 
            UserId = ?
            ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $Password,
                $UserId
            ))) {
                return $this->getUserByUserId($UserId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
}

<?php
include_once 'Address.php';

class Users
{
    //DB Stuff
    private $conn;


    public function __construct($db)
    {
        $this->conn = $db;
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
                $user["Address"] = $address->getUserByUserId($user["UserId"]);
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
            UserType , 
            CreateUserId , 
            ModifyUserId ,  
            StatusId ) 
            VALUES (?,?,?,?,?,?,?,?,?,?,?)";

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
                $UserType,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getUserByUserId($UserId);
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
            Gender = ?,
            DOB = ?,
            RoleId = ?,
            UserType = ?,
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
                $Gender,
                $DOB,
                $RoleId,
                $UserType,
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

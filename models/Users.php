<?php

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
        $FirstName,
        $LastName,
        $Email,
        $Password,
        $Cellphone,
        $RoleId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        if ($this->getUserByEmail($Email) > 0) {
            return "user already exists";
        }

        $UserId = getGuid($this->conn);

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
                return $this->getUserByUserId($UserId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
}

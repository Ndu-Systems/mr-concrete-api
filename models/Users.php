<?php
include_once 'Address.php';
include_once 'Image.php';
include_once 'Account.php';
include_once 'Roles.php';
include_once 'Company.php';

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
        $query = "SELECT * FROM user WHERE StatusId =? OR StatusId=?";

        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($StatusId, 9));

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
                $role = new Roles($this->conn);
                $company= new Company($this->conn);
                $userId = $user["UserId"];
                $user["Company"] = $company->GetAllCompaniesForUser($userId, false, 1);
                $user["Roles"] = $role->getRoleById($user["RoleId"]);
                $user["Address"] = $address->getAddressByOtherId($userId);
                $user["Images"] = $image->getParentIdById($userId);               
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
        $query = "SELECT  * FROM user WHERE Email =  ? AND BINARY Password = ? AND StatusId = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($Email, $Password, 1));

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
        $CompanyId,
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
            CompanyId ,          
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
                $CompanyId,
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
        $CompanyId,    
        $RoleId,      
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
            CompanyId = ?,         
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
                $CompanyId,
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

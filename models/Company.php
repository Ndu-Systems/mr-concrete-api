<?php

include_once 'Users.php';

class Company
{

    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function AddCompany(
        $CompanyId,
        $CompanyName,
        $CompanyPhone,
        $CompanyEmail,
        $ParentId,
        $CompanyType,
        $CompanyAddress,
        $City,
        $PostalCode,
        $CreateUserId,
        $ModifyUserId,
        $IsDeleted,
        $StatusId
    ) {   
        $query = "
        INSERT INTO company(
            CompanyId, 
            CompanyName, 
            CompanyPhone, 
            CompanyEmail, 
            ParentId, 
            CompanyType, 
            CompanyAddress, 
            City, 
            PostalCode,       
            CreateUserId,       
            ModifyUserId, 
            IsDeleted, 
            StatusId) 
            VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)
        ";
        try {
            //code...
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CompanyId,
                $CompanyName,
                $CompanyPhone,
                $CompanyEmail,
                $ParentId,
                $CompanyType,
                $CompanyAddress,
                $City,
                $PostalCode,
                $CreateUserId,
                $ModifyUserId,
                $IsDeleted,
                $StatusId
            ))) {
                // get by id
                return $this->GetCompanyById(
                    $CompanyId,
                    $IsDeleted,
                    $StatusId
                );
            }
        }  catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function UpdateCompany(
        $CompanyId,
        $CompanyName, 
        $CompanyPhone, 
        $CompanyEmail, 
        $ParentId, 
        $CompanyType, 
        $CompanyAddress, 
        $City, 
        $PostalCode,      
        $ModifyUserId, 
        $IsDeleted, 
        $StatusId
    ) {
    
      $query = "  UPDATE
                    Company
                    SET
                    CompanyName = ?, 
                    CompanyPhone = ?, 
                    CompanyEmail = ?, 
                    ParentId = ?, 
                    CompanyType = ?, 
                    CompanyAddress = ?, 
                    City = ?, 
                    PostalCode = ?,       
                    ModifyDate = NOW(),       
                    ModifyUserId = ?, 
                    IsDeleted = ?, 
                    StatusId = ?
                    WHERE 
                    CompanyId = ?
        ";
        try {
            //code...
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CompanyName, 
                $CompanyPhone, 
                $CompanyEmail, 
                $ParentId, 
                $CompanyType, 
                $CompanyAddress, 
                $City, 
                $PostalCode,      
                $ModifyUserId, 
                $IsDeleted, 
                $StatusId,
                $CompanyId
            ))) {
                // get by id

                return $this->GetCompanyById(
                    $CompanyId,
                    $IsDeleted,
                    $StatusId
                );
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }



    public function GetAllCompaniesForUser($UserId, $IsDeleted, $StatusId)
    {
        $users = new Users($this->conn);
        $userResult = $users->getUserByUserId($UserId);
        $CompanyId = $userResult["CompanyId"];
        $query = "SELECT * FROM company WHERE CompanyId = ?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CompanyId));
        if ($stmt->rowCount()) {
            $company = $stmt->fetch(PDO::FETCH_ASSOC);
            $company["SubBranches"] = $this->GetAllSubBranches($CompanyId, $IsDeleted, $StatusId);
            return $company;
        }
    }

    public function GetCompanyById(
        $CompanyId,
        $IsDeleted,
        $StatusId
    ) {
        $query = "SELECT * FROM company WHERE CompanyId = ? AND IsDeleted= ? AND StatusId = ?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array(
            $CompanyId,
            $IsDeleted,
            $StatusId
        ));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    private function GetAllSubBranches(
        $CompanyId,
        $IsDeleted,
        $StatusId
    ) {
        $query = "SELECT * FROM company WHERE ParentId =? AND IsDeleted=? AND StatusId = ?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array(
            $CompanyId,
            $IsDeleted,
            $StatusId
        ));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}

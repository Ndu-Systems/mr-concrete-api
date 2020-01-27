<?php
class Category
{
    //DB Stuff
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    //Add user
    public function add(
       $CategoryId,
       $CategoryName,
       $CreateUserId,
       $ModifyUserId,
       $StatusId

    ) {


        $query = "
        INSERT INTO category(
            CategoryId,
            CategoryName,
            CreateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CategoryId,
                $CategoryName,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($this->conn->lastInsertId());
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function updatecategory(
        $categoryId,
        $CompanyId,
        $Name,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
        category
    SET
        CompanyId = ?,
        Name = ?,
        CreateUserId = ?,
        ModifyUserId = ?,
        StatusId = ?,
        ModifyDate = NOW()
        WHERE
        categoryId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(               
                $CompanyId,
                $Name,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $categoryId

            ))) {
                return $this->getById($categoryId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($categoryId)
    {
        $query = "SELECT * FROM category WHERE categoryId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($categoryId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getCampanyById($CompanyId)
    {
        $query = "SELECT
      *
        FROM
            category WHERE 1";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array());

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}

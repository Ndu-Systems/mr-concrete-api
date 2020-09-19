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
        $CategoryName,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $query = "
        INSERT INTO category(
             CategoryName,
            CreateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
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




    public function updateCategory(
        $categoryId,
        $Name,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
        category
    SET
        CategoryName = ?,
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
        $query = "SELECT * FROM category WHERE CategoryId =?";

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

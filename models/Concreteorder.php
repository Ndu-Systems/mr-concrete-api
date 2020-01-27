<?php
include_once '../../common/common.php';


class Concreteorder
{
    //DB Stuff
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    //Add user
    public function add(
        $CompanyId,
        $Name,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $concreteorderId = getUuid($this->conn);

        $query = "
        INSERT INTO concreteorder(
            concreteorderId,
            CompanyId,
            Name,
            CreateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $concreteorderId,
                $CompanyId,
                $Name,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($concreteorderId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function updateconcreteorder(
        $concreteorderId,
        $CompanyId,
        $Name,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
        concreteorder
    SET
        CompanyId = ?,
        Name = ?,
        CreateUserId = ?,
        ModifyUserId = ?,
        StatusId = ?,
        ModifyDate = NOW()
        WHERE
        concreteorderId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(               
                $CompanyId,
                $Name,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $concreteorderId

            ))) {
                return $this->getById($concreteorderId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($concreteorderId)
    {
        $query = "SELECT * FROM concreteorder WHERE concreteorderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($concreteorderId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getCampanyById($CompanyId)
    {
        $query = "SELECT
        concreteorderId,
        CompanyId,
        Name,
        CreateDate,
        CreateUserId,
        ModifyDate,
        ModifyUserId,
        StatusId,
        CASE WHEN StatusId = 1 THEN 'true' WHEN StatusId = 0 THEN 'false'
        END AS Status
        FROM
            concreteorder WHERE CompanyId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CompanyId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}

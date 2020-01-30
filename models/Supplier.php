<?php
class Supplier
{
    //DB Stuff
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    //Add user
    public function add(
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

    ) {


        $query = "
        INSERT INTO supplier(
            SupplierId,
            SupplierName,
            ContactNumber,
            EmailAddress,
            ContactPerson,
            SupplierAddress,
            City,
            PostalCode,
            CreateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
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
            ))) {
                return $this->getById($SupplierId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function updatesupplier(
        $supplierId,
        $CompanyId,
        $Name,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
        supplier
    SET
        CompanyId = ?,
        Name = ?,
        CreateUserId = ?,
        ModifyUserId = ?,
        StatusId = ?,
        ModifyDate = NOW()
        WHERE
        supplierId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CompanyId,
                $Name,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $supplierId

            ))) {
                return $this->getById($supplierId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($supplierId)
    {
        $query = "SELECT * FROM supplier WHERE supplierId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($supplierId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getCampanyById($CompanyId)
    {
        $query = "SELECT
      *
        FROM
            supplier WHERE 1";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array());

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}

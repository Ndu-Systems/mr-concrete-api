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




    public function updateSupplier(
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
        $query = "UPDATE
        supplier
    SET
        SupplierName = ?,
        ContactNumber = ?,
        EmailAddress = ?,
        ContactPerson = ?,
        SupplierAddress = ?,
        City=?,
        PostalCode=?,
        CreateUserId = ?,
        ModifyUserId = ?,
        StatusId = ?,
        ModifyDate = NOW()
        WHERE
        SupplierId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $SupplierName,
                $ContactNumber,
                $EmailAddress,
                $ContactPerson,
                $SupplierAddress,
                $City,
                $PostalCode,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $SupplierId

            ))) {
                return $this->getById($SupplierId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($supplierId)
    {
        $query = "SELECT * FROM supplier WHERE SupplierId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($supplierId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getSpecificSupplier($email)
    {
        $query = "SELECT * FROM supplier WHERE  EmailAddress = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($email));
        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getAllOrders($StatusId)
    {
        $query = "SELECT *, 'no' as 'Selected'
        FROM
        supplier WHERE StatusId = ?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($StatusId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}

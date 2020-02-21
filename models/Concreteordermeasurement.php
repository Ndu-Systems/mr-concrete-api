<?php
class Concreteordermeasurement
{
    //DB Stuff
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    //Add user

    public function add(
        $Id,
        $OrderId,
        $MeasurementId,
        $Value,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {


        $query = "
        INSERT INTO concreteordermeasurement(
            Id,
            OrderId,
            MeasurementId,
            Value,
            CreateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $Id,
                $OrderId,
                $MeasurementId,
                $Value,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($Id);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function updateconcreteordermeasurement(
        $Id,
        $OrderId,
        $MeasurementId,
        $Value,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
        concreteordermeasurement
    SET
        OrderId = ?,
        MeasurementId = ?,
        Value = ?,
        CreateUserId = ?,
        ModifyUserId = ?,
        StatusId = ?
        ModifyDate = NOW()
        WHERE
        Id = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $Id,
                $OrderId,
                $MeasurementId,
                $Value,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($Id);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($Id)
    {
        $query = "SELECT * FROM concreteordermeasurement WHERE Id =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($Id));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
    public function getByOrderId($OrderId)
    {
        $query = "SELECT * FROM concreteordermeasurement WHERE OrderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

    public function getCampanyById($CompanyId)
    {
        $query = "SELECT
      *
        FROM
            concreteordermeasurement WHERE 1";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array());

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}

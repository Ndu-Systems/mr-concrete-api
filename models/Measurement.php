<?php
class Measurement
{
    //DB Stuff
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    //Add user
    public function add(
        $MeasurementId,
        $Name,
        $UnitOfMeasurement,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {
        $query = "
        INSERT INTO measurement(
            MeasurementId,
            Name,
            UnitOfMeasurement,
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
                $MeasurementId,
                $Name,
                $UnitOfMeasurement,
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




    public function updateMeasurement(
        $measurementId,       
        $Name,
        $UnitOfMeasurement,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
        measurement
    SET
        Name = ?,
        UnitOfMeasurement =?,
        CreateUserId = ?,
        ModifyUserId = ?,
        StatusId = ?,
        ModifyDate = NOW()
        WHERE
        measurementId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $Name,
                $UnitOfMeasurement,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $measurementId

            ))) {
                return $this->getById($measurementId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($MeasurementId)
    {
        $query = "SELECT * FROM measurement WHERE MeasurementId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($MeasurementId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getCampanyById($CompanyId)
    {
        $query = "SELECT
      *
        FROM
            measurement WHERE 1";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array());

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}

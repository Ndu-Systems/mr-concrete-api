<?php


class Image
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
        $OtherId,
        $Url,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $ImageId = getUuid($this->conn);

        $query = "
        INSERT INTO image(
            ImageId,
            CompanyId,
            OtherId,
            Url,
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
                $ImageId,
                $CompanyId,
                $OtherId,
                $Url,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($ImageId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function updateImage(
        $CompanyId,
        $OtherId,
        $Url,
        $CreateUserId,
        $ModifyUserId,
        $StatusId,
        $ImageId
    ) {
        $query = "UPDATE
        image
    SET
        CompanyId = ?,
        OtherId = ?,
        Url = ?,
        CreateUserId = ?,
        ModifyUserId = ?,
        StatusId = ?,
        ModifyDate = NOW()
    WHERE
    ImageId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CompanyId,
                $OtherId,
                $Url,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $ImageId


            ))) {
                return $this->getById($ImageId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($ImageId)
    {
        $query = "SELECT * FROM image WHERE ImageId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($ImageId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getParentIdById($OtherId)
    {
        $query = "SELECT * FROM image WHERE OtherId =? AND StatusId = ?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OtherId, 1));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    public function getParentIdByIdSigle($OtherId)
    {
        $query = "SELECT * FROM image WHERE OtherId =? AND StatusId = ? order by CreateDate desc";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OtherId, 1));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
}

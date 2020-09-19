<?php

include_once 'Productproperty.php';
include_once 'Image.php';
include_once 'Category.php';

class Product
{
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function add(
        $ProductId,
        $CompanyId,
        $ProductName,
        $ShortDescription,
        $Description,
        $ProductCode,
        $Price,
        $Quantity,
        $Units,
        $CategoryId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $query = "
        INSERT INTO product(
            ProductId,
            CompanyId,
            ProductName,
            ShortDescription,
            Description,
            ProductCode,
            Price,
            Quantity,
            Units,
            CategoryId,
            CreateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $ProductId,
                $CompanyId,
                $ProductName,
                $ShortDescription,
                $Description,
                $ProductCode,
                $Price,
                $Quantity,
                $Units,
                $CategoryId,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($ProductId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function update(
        $ProductId,
        $CompanyId,
        $ProductName,
        $ShortDescription,
        $Description,
        $ProductCode,
        $Price,
        $Quantity,
        $Units,
        $CategoryId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
                    product
                        SET
                        CompanyId =  ? ,
                        ProductName =  ? ,
                        ShortDescription=?,
                        Description=?,
                        ProductCode =  ? ,
                        Price =  ? ,
                        Quantity =  ? ,
                        Units =  ? ,
                        CategoryId =  ? ,
                        CreateUserId =  ? ,
                        ModifyUserId =  ? ,
                        StatusId=  ?,
                        ModifyDate = NOW()
                        WHERE
                        ProductId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CompanyId,
                $ProductName,
                $ShortDescription,
                $Description,
                $ProductCode,
                $Price,
                $Quantity,
                $Units,
                $CategoryId,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $ProductId


            ))) {
                return $this->getById($ProductId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($ProductId)
    {
        $query = "SELECT * FROM product WHERE ProductId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($ProductId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
    public function getByCompanyId($CompanyId)
    {
        $query = "SELECT * FROM product WHERE CompanyId =? ORDER BY CreateDate DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CompanyId));
        $detailedProducts = array();
        if ($stmt->rowCount()) {
            $products =  $stmt->fetchAll(PDO::FETCH_ASSOC);
            $productproperty = new Productproperty($this->conn);
            $category = new Category($this->conn);
            $image = new Image($this->conn);

            foreach ($products as $product) {
                $product["Properties"] =  $productproperty->getByProductId($product["ProductId"]);
                $product["Images"] =  $image->getParentIdById($product["ProductId"]);
                $product["Category"] =  $category->getById($product["CategoryId"]);
                array_push($detailedProducts, $product);
            }
        }
        return $detailedProducts;
    }

    
}

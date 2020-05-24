<?php
include_once 'Image.php';
include_once 'Order_options.php';


class Order_products
{
    //DB Stuff
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    //Add user
    public function add(
        $OrderId,
        $ProductId,
        $CompanyId,
        $ProductName,
        $UnitPrice,
        $Quantity,
        $subTotal,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $Id = getUuid($this->conn);
        $UnitPrice = number_format((float) $UnitPrice, 2, '.', '');
        $subTotal = number_format((float) $subTotal, 2, '.', '');

        $query = "
        INSERT INTO order_products(
            Id,
            OrderId,
            ProductId,
            CompanyId,
            ProductName,
            UnitPrice,
            Quantity,
            subTotal,
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
                $Id,
                $OrderId,
                $ProductId,
                $CompanyId,
                $ProductName,
                $UnitPrice,
                $Quantity,
                $subTotal,
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




    public function updateorder_products(
        $Id,
        $Name,
        $Description,
        $UnitPrice,
        $Code,
        $SKU,
        $Quantity,
        $LowStock,
        $ModifyUserId,
        $StatusId
    ) {
        $UnitPrice = number_format((float) $UnitPrice, 2, '.', '');
        $query = "UPDATE
        order_products
    SET
        Name = ?,
        Description = ?,
        UnitPrice = ?,
        Code = ?,
        SKU = ?,
        Quantity = ?,
        LowStock = ?,
        ModifyDate = NOW(),
        ModifyUserId = ?,
        StatusId = ?
    WHERE
    Id = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $Name,
                $Description,
                $UnitPrice,
                $Code,
                $SKU,
                $Quantity,
                $LowStock,
                $ModifyUserId,
                $StatusId,
                $Id


            ))) {
                return $this->getById($Id);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($Id)
    {
        $query = "SELECT * FROM order_products WHERE Id =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($Id));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
    public function getByCompanyId($CompanyId)
    {
        $query = "
        SELECT * 
        FROM
            order_products
        WHERE
            CompanyId = ?
        ";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CompanyId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    public function getTopSellingByCompanyId($CompanyId)
    {
        $query = "
        SELECT
        `ProductId`,
        `ProductName`,
        COUNT(`ProductId`) AS 'Times',
        SUM(`Quantity`) AS 'Quantity',
        SUM(`subTotal`) AS 'Total'
        FROM
            order_products
        WHERE
            CompanyId = ?
        GROUP BY
            `ProductId`
        ORDER BY
        SUM(`Quantity`)
        DESC
            
        ";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CompanyId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

    public function getBOrderIdId($OrderId)
    {
        $query = "SELECT * FROM order_products WHERE OrderId = ?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));

        // if ($stmt->rowCount()) {
        //     return $stmt->fetchAll(PDO::FETCH_ASSOC);
        // }
        $productsWithImages = array();
        $image = new Image($this->conn);
        $order_options = new Order_options($this->conn);

        if ($stmt->rowCount()) {
            $products =  $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($products as $product) {

                $images = $image->getParentIdById($product["ProductId"]);
                $options = $order_options->getByOrderProductId($product["Id"]);
                $product["Images"] = $images;
                $product["Options"] = $options;
                array_push($productsWithImages, $product);
            }
        }
        return  $productsWithImages;
    }
}

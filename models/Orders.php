<?php
include_once 'Partner.php';
include_once 'Order_products.php';
include_once 'Company.php';
include_once 'Order_products.php';
include_once 'Creditnote.php';
// include_once 'Config.php';


class Orders
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
        $ParntersId,
        $ParntersEmail,
        $OrderType,
        $Total,
        $Paid,
        $Due,
        $CreateUserId,
        $ModifyUserId,
        $Status,
        $StatusId

    ) {

        $OrdersId = getUuid($this->conn);
        $OrderId = $this->getLastOrderId($CompanyId) + 1;
        $Total = number_format((float) $Total, 2, '.', '');
        $Paid = number_format((float) $Paid, 2, '.', '');
        $Due = number_format((float) $Due, 2, '.', '');



        $query = "
        INSERT INTO orders(
            OrdersId,
            OrderId,
            CompanyId,
            ParntersId,
            ParntersEmail,
            OrderType,
            Total,
            Paid,
            Due,
            CreateUserId,
            ModifyUserId,
            Status,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $OrdersId,
                $OrderId,
                $CompanyId,
                $ParntersId,
                $ParntersEmail,
                $OrderType,
                $Total,
                $Paid,
                $Due,
                $CreateUserId,
                $ModifyUserId,
                $Status,
                $StatusId
            ))) {
                return $this->getById($OrdersId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function update(
        $OrdersId,
        $CompanyId,
        $ParntersId,
        $OrderType,
        $Total,
        $Paid,
        $Due,
        $CreateUserId,
        $ModifyUserId,
        $Status,
        $StatusId
    ) {
        $Total = number_format((float) $Total, 2, '.', '');
        $Paid = number_format((float) $Paid, 2, '.', '');
        $Due = number_format((float) $Due, 2, '.', '');

        $query = "UPDATE
        orders
    SET
        CompanyId = ?,
        ParntersId = ?,
        OrderType = ?,
        Total = ?,
        Paid = ?,
        Due = ?,
        CreateUserId = ?,
        ModifyDate = NOW(),
        ModifyUserId = ?,
        Status = ?,
        StatusId  = ?
    WHERE
    OrdersId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CompanyId,
                $ParntersId,
                $OrderType,
                $Total,
                $Paid,
                $Due,
                $CreateUserId,
                $ModifyUserId,
                $Status,
                $StatusId,
                $OrdersId
            ))) {
                return $this->getDetailedSingleCampanyById($OrdersId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function cancelOrder(
        $OrdersId
    ) {

        $query = "UPDATE
        orders
    SET
        Status = ?
    WHERE
    OrdersId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                'Cancelled',
                $OrdersId
            ))) {
                return $this->getDetailedSingleCampanyById($OrdersId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }


    public function getById($OrdersId)
    {
        $query = "SELECT * FROM orders WHERE OrdersId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrdersId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
        return null;
    }

    public function getLastOrderId($CompanyId)
    {
        $query = "SELECT OrderId FROM orders WHERE CompanyId = ?
                 ORDER BY CreateDate DESC LIMIT 1";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CompanyId));

        if ($stmt->rowCount()) {
            $item = $stmt->fetch(PDO::FETCH_ASSOC);
            return $item["OrderId"];
        }
        return 0;
    }

    public function getCampanyById($CompanyId)
    {
        $query = "SELECT * FROM orders WHERE CompanyId =? order by CreateDate desc";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CompanyId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

    public function getDetailedCampanyById($CompanyId)
    {
        $query = "SELECT * FROM orders WHERE CompanyId =? order by CreateDate desc";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CompanyId));
        $ordersWithCustomers = array();
        $partner = new Partner($this->conn);
        $product = new Order_products($this->conn);
        $order_charges = new Config($this->conn);
        $creditnote = new Creditnote($this->conn);



        if ($stmt->rowCount()) {
            $orders =  $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($orders as $order) {

                $products = $product->getBOrderIdId($order["OrdersId"]);
                $customer = $partner->getByPartnerId($order["ParntersId"]);
                $charges = $order_charges->getCampanyByIdAndType($order["OrdersId"], 'shippingFee');
                $creditnotes = $creditnote->getByOrderId($order["OrdersId"]);


                $order["Customer"] = $customer;
                $order["CardClass"] = ['card'];
                $order["Charges"] = $charges;
                $order["Products"] = $products;
                $order["Creditnotes"] = $creditnotes;
                array_push($ordersWithCustomers, $order);
            }
        }
        return $ordersWithCustomers;
    }

    public function getDetailedCustomerEmail($ParntersEmail)
    {
        $query = "SELECT * FROM orders WHERE ParntersEmail =? order by CreateDate desc";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($ParntersEmail));
        $ordersWithCustomers = array();
        $partner = new Partner($this->conn);
        $product = new Order_products($this->conn);
        $order_charges = new Config($this->conn);
        $creditnote = new Creditnote($this->conn);



        if ($stmt->rowCount()) {
            $orders =  $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($orders as $order) {

                $products = $product->getBOrderIdId($order["OrdersId"]);
                $customer = $partner->getByPartnerId($order["ParntersId"]);
                $charges = $order_charges->getCampanyByIdAndType($order["OrdersId"], 'shippingFee');
                $creditnotes = $creditnote->getByOrderId($order["OrdersId"]);


                $order["Customer"] = $customer;
                $order["CardClass"] = ['card'];
                $order["Charges"] = $charges;
                $order["Products"] = $products;
                $order["Creditnotes"] = $creditnotes;
                array_push($ordersWithCustomers, $order);
            }
        }
        return $ordersWithCustomers;
    }

    public function getDetailedSingleCampanyById($OrdersId)
    {
        $query = "SELECT * FROM orders WHERE OrdersId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrdersId));
        $ordersWithCustomers = null;
        $partner = new Partner($this->conn);
        $order_products = new Order_products($this->conn);
        $company = new Company($this->conn);
        $order_charges = new Config($this->conn);
        $creditnote = new Creditnote($this->conn);


        if ($stmt->rowCount()) {
            $order =  $stmt->fetch(PDO::FETCH_ASSOC);
            $customer = $partner->getByPartnerId($order["ParntersId"]);
            $products = $order_products->getBOrderIdId(
                $OrdersId
            );
            $charges = $order_charges->getCampanyByIdAndType($order["OrdersId"], 'shippingFee');
            $creditnotes = $creditnote->getByOrderId($order["OrdersId"]);

            $order["Customer"] = $customer;
            $order["Products"] = $products;
            $order["Company"] = $company->getById($order["CompanyId"]);
            $order["CardClass"] = ['card'];
            $order["Charges"] = $charges;
            $order["Creditnotes"] = $creditnotes;

            $ordersWithCustomers = $order;
        }
        return $ordersWithCustomers;
    }
}

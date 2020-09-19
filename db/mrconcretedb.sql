-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2020 at 11:13 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrconcretedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressId` varchar(225) NOT NULL,
  `UserId` varchar(225) NOT NULL,
  `AddressType` varchar(50) DEFAULT NULL,
  `AddressLine1` varchar(50) NOT NULL,
  `AddressLine2` varchar(50) NOT NULL,
  `AddressLine3` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(20) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressId`, `UserId`, `AddressType`, `AddressLine1`, `AddressLine2`, `AddressLine3`, `City`, `Province`, `PostalCode`, `CreateDate`, `CrateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('efcd8d6f-afff-11ea-a173-c8f7501047dc', 'fc193bea-affe-11ea-a173-c8f7501047dc', 'Physical Address', '12 Bother', '12', '', 'Bloemfontein', 'FS', '9660', '2020-06-16 20:33:56', 'fc193bea-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:33:56', 'fc193bea-affe-11ea-a173-c8f7501047dc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `Id` int(11) NOT NULL,
  `url` varchar(225) DEFAULT NULL,
  `OtherId` varchar(225) DEFAULT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `BillingId` varchar(225) NOT NULL,
  `UserId` varchar(225) NOT NULL,
  `Description` varchar(225) NOT NULL,
  `TotalProducts` int(10) NOT NULL,
  `TotalDeliviries` int(10) NOT NULL,
  `TotalUsers` int(10) NOT NULL,
  `PremiumAmount` decimal(11,0) NOT NULL,
  `AmountDue` decimal(11,0) NOT NULL,
  `TotalAmountPaid` decimal(11,0) NOT NULL,
  `BillingMonth` varchar(10) NOT NULL,
  `NextBillingMonth` varchar(10) NOT NULL,
  `SubscriptionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CancellationDate` date DEFAULT NULL,
  `CancellationReason` varchar(225) DEFAULT NULL,
  `IsProcessed` tinyint(1) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryId`, `CategoryName`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(1, '98ef60c3-fa98-11ea-80de-c8f7501047dc', '2020-09-19 18:53:09', 'Domestic', '2020-09-19 18:53:09', 'System', 0),
(2, '9e6dec6c-fa98-11ea-80de-c8f7501047dc', '2020-09-19 18:53:18', 'Commercial', '2020-09-19 18:53:18', 'System', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `Id` int(11) NOT NULL,
  `Comment` int(11) NOT NULL,
  `OtherId` varchar(225) NOT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CompanyId` varchar(225) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `CompanyPhone` varchar(15) NOT NULL,
  `CompanyEmail` varchar(50) NOT NULL,
  `ParentId` varchar(225) DEFAULT NULL,
  `CompanyType` varchar(50) DEFAULT NULL,
  `CompanyAddress` varchar(225) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyId`, `CompanyName`, `CompanyPhone`, `CompanyEmail`, `ParentId`, `CompanyType`, `CompanyAddress`, `City`, `Province`, `PostalCode`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `IsDeleted`, `StatusId`) VALUES
('32071848-affe-11ea-a173-c8f7501047dc', 'Been Streets Tailors', '2774521101', '', NULL, 'HeadQuarter', '21 Rand', 'Bhisho', 'EC', '123354', '2020-06-16 20:21:28', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:21:28', '06b13d08-affe-11ea-a173-c8f7501047dc', 0, 1),
('a93ebe5e-b000-11ea-a173-c8f7501047dc', 'Hough Builders', '2778542110', '', NULL, 'HeadQuarter', '12 Rand', 'Johannesburg', 'GP', '2001', '2020-06-16 20:39:07', '83a7313f-b000-11ea-a173-c8f7501047dc', '2020-06-16 20:39:07', '83a7313f-b000-11ea-a173-c8f7501047dc', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `ImageId` varchar(225) NOT NULL,
  `CompanyId` varchar(225) NOT NULL,
  `OtherId` varchar(225) NOT NULL,
  `Url` text NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`ImageId`, `CompanyId`, `OtherId`, `Url`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('383a9c9b-afff-11ea-a173-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', '9e0c8758-affe-11ea-a173-c8f7501047dc', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1592332128iio.jpg', '2020-06-16 20:28:48', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:28:48', '06b13d08-affe-11ea-a173-c8f7501047dc', 1),
('3a8b0f59-afff-11ea-a173-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', 'removed-9e0c8758-affe-11ea-a173-c8f7501047dc', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1592332132iio.jpg', '2020-06-16 20:28:52', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:28:54', '06b13d08-affe-11ea-a173-c8f7501047dc', 2),
('40157209-afff-11ea-a173-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', '9e0c8758-affe-11ea-a173-c8f7501047dc', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1592332141iio.jpg', '2020-06-16 20:29:01', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:29:01', '06b13d08-affe-11ea-a173-c8f7501047dc', 1),
('54e3a6dc-afff-11ea-a173-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', 'e446b9d6-affe-11ea-a173-c8f7501047dc', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1592332176iio.jpg', '2020-06-16 20:29:36', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:29:36', '06b13d08-affe-11ea-a173-c8f7501047dc', 1),
('56ab026b-afff-11ea-a173-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', 'e446b9d6-affe-11ea-a173-c8f7501047dc', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1592332179iio.jpg', '2020-06-16 20:29:39', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:29:39', '06b13d08-affe-11ea-a173-c8f7501047dc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdeliveries`
--

CREATE TABLE `orderdeliveries` (
  `Id` varchar(225) NOT NULL,
  `OrderId` varchar(225) NOT NULL,
  `UserId` varchar(225) NOT NULL,
  `DriverId` varchar(225) DEFAULT NULL,
  `DeliveryStartDateTime` datetime DEFAULT NULL,
  `DeliveryEndDateTime` datetime DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdeliveries`
--

INSERT INTO `orderdeliveries` (`Id`, `OrderId`, `UserId`, `DriverId`, `DeliveryStartDateTime`, `DeliveryEndDateTime`, `IsDeleted`, `StatusId`) VALUES
('16bfe562-b7e0-11ea-8a42-c8f7501047dc', '4df7967f-b721-11ea-925a-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', 'bc43d2a2-b09b-11ea-a173-c8f7501047dc', '2020-07-04 00:00:00', '0000-00-00 00:00:00', 0, 1),
('3aaf4c15-b727-11ea-925a-c8f7501047dc', '6d525cf9-b3e3-11ea-a5ac-c8f7501047dc', '32071848-affe-11ea-a173-c8f7501047dc', NULL, '2020-06-16 20:20:15', '2020-06-16 20:20:15', 0, 1),
('abd2a49f-b726-11ea-925a-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', 'bc43d2a2-b09b-11ea-a173-c8f7501047dc', NULL, '2020-06-16 20:20:15', '2020-06-16 20:20:15', 0, 1),
('b0c94fb9-b7e0-11ea-8a42-c8f7501047dc', 'a3181fb4-b7e0-11ea-8a42-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', 'bc43d2a2-b09b-11ea-a173-c8f7501047dc', '2020-08-08 00:00:00', '0000-00-00 00:00:00', 0, 1),
('be27c2bb-b726-11ea-925a-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', 'bc43d2a2-b09b-11ea-a173-c8f7501047dc', NULL, '2020-06-16 20:20:15', '2020-06-16 20:20:15', 0, 1),
('d71723b5-b726-11ea-925a-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', '32071848-affe-11ea-a173-c8f7501047dc', NULL, '2020-06-16 20:20:15', '2020-06-16 20:20:15', 0, 1),
('ed39c150-b7df-11ea-8a42-c8f7501047dc', '550d29e3-b71f-11ea-925a-c8f7501047dc', '06b13d08-affe-11ea-a173-c8f7501047dc', 'bc43d2a2-b09b-11ea-a173-c8f7501047dc', '2020-07-04 00:00:00', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `OrderProductId` varchar(225) NOT NULL,
  `OrderId` varchar(225) NOT NULL,
  `ProductId` varchar(225) NOT NULL,
  `ProductName` varchar(500) NOT NULL,
  `Price` varchar(50) NOT NULL,
  `Quantity` varchar(50) NOT NULL,
  `Units` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderproduct`
--

INSERT INTO `orderproduct` (`OrderProductId`, `OrderId`, `ProductId`, `ProductName`, `Price`, `Quantity`, `Units`, `CreateDate`, `CrateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('31cea4ab-b000-11ea-a173-c8f7501047dc', '31ce058b-b000-11ea-a173-c8f7501047dc', 'e446b9d6-affe-11ea-a173-c8f7501047dc', 'Escavator', '150000000', '1', 'day', '2020-06-16 20:35:47', 'fc193bea-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:35:47', '', 1),
('4df8514c-b721-11ea-925a-c8f7501047dc', '4df7967f-b721-11ea-925a-c8f7501047dc', 'e446b9d6-affe-11ea-a173-c8f7501047dc', 'Escavator', '150000000', '3', 'day', '2020-06-25 22:20:25', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-25 22:20:25', '', 1),
('550dbbe9-b71f-11ea-925a-c8f7501047dc', '550d29e3-b71f-11ea-925a-c8f7501047dc', 'e446b9d6-affe-11ea-a173-c8f7501047dc', 'Escavator', '150000000', '3', 'day', '2020-06-25 22:06:18', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-25 22:06:18', '', 1),
('6d52eb02-b3e3-11ea-a5ac-c8f7501047dc', '6d525cf9-b3e3-11ea-a5ac-c8f7501047dc', 'e446b9d6-affe-11ea-a173-c8f7501047dc', 'Escavator', '150000000', '4', 'day', '2020-06-21 19:19:56', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-21 19:19:56', '', 1),
('a318a56d-b7e0-11ea-8a42-c8f7501047dc', 'a3181fb4-b7e0-11ea-8a42-c8f7501047dc', 'e446b9d6-affe-11ea-a173-c8f7501047dc', 'Escavator', '150000000', '3', 'day', '2020-06-26 21:10:02', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-26 21:10:02', '', 1),
('aadf5594-b71e-11ea-925a-c8f7501047dc', 'aadeba3c-b71e-11ea-925a-c8f7501047dc', 'e446b9d6-affe-11ea-a173-c8f7501047dc', 'Escavator', '150000000', '3', 'day', '2020-06-25 22:01:33', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-25 22:01:33', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderId` varchar(225) NOT NULL,
  `OrderNo` int(11) NOT NULL,
  `CustomerId` varchar(225) NOT NULL,
  `SupplierId` varchar(225) NOT NULL,
  `ProjectNumber` varchar(400) DEFAULT NULL,
  `DeliveryDate` varchar(150) DEFAULT NULL,
  `DeliveryTime` varchar(20) DEFAULT NULL,
  `DeliveryAddress` text,
  `SpecialInstructions` text,
  `Total` varchar(225) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderId`, `OrderNo`, `CustomerId`, `SupplierId`, `ProjectNumber`, `DeliveryDate`, `DeliveryTime`, `DeliveryAddress`, `SpecialInstructions`, `Total`, `CreateDate`, `CrateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('31ce058b-b000-11ea-a173-c8f7501047dc', 1, 'fc193bea-affe-11ea-a173-c8f7501047dc', 'a93ebe5e-b000-11ea-a173-c8f7501047dc', '', '2020-06-18', '07:37', 'efcd8d6f-afff-11ea-a173-c8f7501047dc', 'Get it in time please', '150000000', '2020-06-16 20:35:47', 'fc193bea-affe-11ea-a173-c8f7501047dc', '2020-06-16 20:35:47', '', 1),
('6d525cf9-b3e3-11ea-a5ac-c8f7501047dc', 2, '06b13d08-affe-11ea-a173-c8f7501047dc', '32071848-affe-11ea-a173-c8f7501047dc', '', '2020-06-22', '10:30', 'Guest', '', '600000000', '2020-06-21 19:19:56', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-21 19:19:56', '', 1),
('aadeba3c-b71e-11ea-925a-c8f7501047dc', 3, 'bc43d2a2-b09b-11ea-a173-c8f7501047dc', '32071848-affe-11ea-a173-c8f7501047dc', '', '2020-06-10', '23:06', 'Guest', '', '450000000', '2020-06-25 22:01:33', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-25 22:01:33', '', 1),
('550d29e3-b71f-11ea-925a-c8f7501047dc', 4, '06b13d08-affe-11ea-a173-c8f7501047dc', '32071848-affe-11ea-a173-c8f7501047dc', '', '2020-06-02', '03:11', 'Guest', 'Just a delivery required', '450000000', '2020-06-25 22:06:18', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-25 22:06:18', '', 1),
('4df7967f-b721-11ea-925a-c8f7501047dc', 5, 'fc193bea-affe-11ea-a173-c8f7501047dc', '32071848-affe-11ea-a173-c8f7501047dc', '', '2020-06-03', '02:24', 'efcd8d6f-afff-11ea-a173-c8f7501047dc', 'Nelly likes panctuality', '450000000', '2020-06-25 22:20:25', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-25 22:20:25', '', 1),
('a3181fb4-b7e0-11ea-8a42-c8f7501047dc', 6, 'fc193bea-affe-11ea-a173-c8f7501047dc', '32071848-affe-11ea-a173-c8f7501047dc', '', '2020-07-11', '02:14', 'efcd8d6f-afff-11ea-a173-c8f7501047dc', 'k', '450000000', '2020-06-26 21:10:02', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-26 21:10:02', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `StatusId` int(11) NOT NULL,
  `Description` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductId` varchar(225) NOT NULL,
  `CompanyId` varchar(225) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `ShortDescription` varchar(300) NOT NULL,
  `Description` text NOT NULL,
  `ProductCode` varchar(225) NOT NULL,
  `Price` varchar(10) NOT NULL,
  `Quantity` decimal(10,0) NOT NULL DEFAULT '0',
  `Units` varchar(100) NOT NULL DEFAULT 'each',
  `CategoryId` varchar(225) DEFAULT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductId`, `CompanyId`, `ProductName`, `ShortDescription`, `Description`, `ProductCode`, `Price`, `Quantity`, `Units`, `CategoryId`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('e1c393ca-fa97-11ea-80de-c8f7501047dc', '32071848-affe-11ea-a173-c8f7501047dc', 'Concrete All Purpose', 'Concrete for all types of building purposes both industrial and commercial use.', 'Grades of concrete are defined by the strength and composion of the concrete, and the minimum strength the concrete should have following 28 days of inial construcon. The grade of concrete is understood in measurements of MPa. Concrete mixes are defined in ascending numbers starng at 10Mpa and show the compressive strength of the concrete aer 28 days. For instance, 10Mpa has the strength of 10 Newtons, 15Mpa has the strength of 15 Newtons, 20Mpa has 20 Newtons strength etc.Different mixes come in various mix proporons of the various ingredients of cement,sand and coarse aggregates. For instance, 20Mpa comes in the respecve rao of 1:1:5:3.The rao means 1 bag of cement 1 bag ofsand 5 bags of coarse aggregates and 3 buckets ofsand Choosing the right concrete grade for the construcon job is very vital as it can help in saving me and money potenally prevenng structural failures in he future.', 'CONALLPUR_001', '1500.00', '3', 'meter', '1', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `productproperty`
--

CREATE TABLE `productproperty` (
  `ProductpropertyId` varchar(225) NOT NULL,
  `ProductId` varchar(225) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Code` varchar(250) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Value` varchar(500) NOT NULL,
  `Units` int(100) DEFAULT NULL,
  `Cost` decimal(11,0) DEFAULT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productproperty`
--

INSERT INTO `productproperty` (`ProductpropertyId`, `ProductId`, `Name`, `Code`, `Type`, `Value`, `Units`, `Cost`, `CreateDate`, `CrateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('e1c421e4-fa97-11ea-80de-c8f7501047dc', 'e1c393ca-fa97-11ea-80de-c8f7501047dc', 'Pao slabs, pathways and non-structural work', '10Mpa', 'Domestic & commercial use', 'R25.00/Kg', 25, '25', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('e1c4a754-fa97-11ea-80de-c8f7501047dc', 'e1c393ca-fa97-11ea-80de-c8f7501047dc', 'Pavement kerbs and floor blinding', '15Mpa', 'Domestic & commercial use', 'R25.00/Kg', 25, '25', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('e1c53440-fa97-11ea-80de-c8f7501047dc', 'e1c393ca-fa97-11ea-80de-c8f7501047dc', 'Domesc floors and foundaons (where the weight ofstructure will be lighter). Also good for workshop bases, garages, driveways and internal floorslabs.', '20Mpa', 'Domestic & commercial use', 'R25.00/Kg', 25, '25', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('e1c60b7d-fa97-11ea-80de-c8f7501047dc', 'e1c393ca-fa97-11ea-80de-c8f7501047dc', 'Construction in all areas. Mult-purpose concrete mix usually used for foundaons.', '25Mpa', 'Domestic', 'R25.00/Kg', 25, '25', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('e1c6df2e-fa97-11ea-80de-c8f7501047dc', 'e1c393ca-fa97-11ea-80de-c8f7501047dc', 'Pathways and roadways (this is the lowest grade concrete mix that can be used for this purpose). More durable than the grades that have come before, and thus is much more weather-resistant and can take heavy road    traffic.', '30Mpa', 'Domestic & commercial use', 'R25.00/Kg', 25, '25', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('e1c76f80-fa97-11ea-80de-c8f7501047dc', 'e1c393ca-fa97-11ea-80de-c8f7501047dc', 'Used for: Commercial structures. This heavy concrete mix is usually used for creang external walls and slabs, as well as forstructural piling.', '35Mpa', 'Commercial use', 'R25.00/Kg', 25, '25', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('e1c7f894-fa97-11ea-80de-c8f7501047dc', 'e1c393ca-fa97-11ea-80de-c8f7501047dc', 'Pavement kerbs and floor blinding', '10Mpa', 'Domestic & commercial use', 'R25.00/Kg', 25, '25', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-09-19 18:48:02', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `Id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `OtherId` varchar(225) DEFAULT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(5) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `RoleName`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(1, 'Admin', '2020-01-21 20:41:37', 'sys', '2020-01-21 20:41:37', 'sys', 1),
(2, 'Engineer', '2020-01-21 20:41:37', 'sys', '2020-01-21 20:41:37', 'sys', 1),
(3, 'Supplier', '2020-02-08 17:22:50', 'sys', '2020-02-08 17:22:50', 'sys', 1),
(4, 'Assistant', '2020-02-08 21:39:07', 'sys', '2020-02-08 21:39:07', 'sys', 1),
(5, 'Customer', '2020-05-25 18:46:37', 'sys', '2020-05-25 18:46:37', 'sys', 1),
(6, 'Driver', '2020-05-25 18:59:29', 'sys', '2020-05-25 18:59:29', 'sys', 1);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `StatusId` varchar(225) NOT NULL,
  `StatusCode` int(11) NOT NULL,
  `Description` varchar(25) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `IsActive` int(11) NOT NULL,
  `Type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`StatusId`, `StatusCode`, `Description`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `IsActive`, `Type`) VALUES
('07042ad3-a631-11ea-912c-48f17f8d4d88', 1, 'Active', '2020-06-04 09:00:08', 'postman', '2020-06-04 09:00:08', 'postman', 1, 'product'),
('51aa8305-a631-11ea-912c-48f17f8d4d88', 2, 'Disabled', '2020-06-04 09:02:14', 'postman', '2020-06-04 09:02:14', 'postman', 1, 'product'),
('76e2a06f-a631-11ea-912c-48f17f8d4d88', 3, 'Deleted', '2020-06-04 09:03:16', 'postman', '2020-06-04 09:03:16', 'postman', 1, 'product'),
('eebf6a3d-a632-11ea-912c-48f17f8d4d88', 3, 'Deleted', '2020-06-04 09:13:47', 'postman', '2020-06-04 09:13:47', 'postman', 1, 'order'),
('f33ce9e1-a632-11ea-912c-48f17f8d4d88', 1, 'Active', '2020-06-04 09:13:54', 'postman', '2020-06-04 09:13:54', 'postman', 1, 'order');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` varchar(225) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Cellphone` varchar(15) DEFAULT NULL,
  `RoleId` int(11) NOT NULL,
  `CompanyId` varchar(225) DEFAULT NULL,
  `Token` varchar(225) DEFAULT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `Cellphone`, `RoleId`, `CompanyId`, `Token`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('06b13d08-affe-11ea-a173-c8f7501047dc', 'Test', 'User', 'test@mail.com', '12345', '277455212001', 3, '32071848-affe-11ea-a173-c8f7501047dc', '9c22a98d159581a7ab95e008769278df', '2020-06-16 20:20:15', 'sys', '2020-08-27 20:44:58', 'sys', 1),
('83a7313f-b000-11ea-a173-c8f7501047dc', 'Brian', 'Hough', 'supplier@mail.com', '12345', '277854221001', 3, 'a93ebe5e-b000-11ea-a173-c8f7501047dc', '3de34be8c96f56a355a8eaccc38ff266', '2020-06-16 20:38:04', 'sys', '2020-08-27 20:44:50', 'sys', 2),
('bc43d2a2-b09b-11ea-a173-c8f7501047dc', 'Beki', 'Khumalo', 'driver@mail.com', '12345', '277456652215', 6, '32071848-affe-11ea-a173-c8f7501047dc', '04c5440597be2d45809625168fd5e65f', '2020-06-17 15:09:11', '06b13d08-affe-11ea-a173-c8f7501047dc', '2020-06-17 15:09:11', '06b13d08-affe-11ea-a173-c8f7501047dc', 1),
('fc193bea-affe-11ea-a173-c8f7501047dc', 'Nelly', 'Rema', 'customer@mail.com', '12345', '27745215442', 5, NULL, '5cbea219d0bfb441560b56a04a875ae7', '2020-06-16 20:27:07', 'sys', '2020-06-16 20:27:07', 'sys', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressId`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`BillingId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyId`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ImageId`);

--
-- Indexes for table `orderdeliveries`
--
ALTER TABLE `orderdeliveries`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`OrderProductId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderNo`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`StatusId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductId`);

--
-- Indexes for table `productproperty`
--
ALTER TABLE `productproperty`
  ADD PRIMARY KEY (`ProductpropertyId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`StatusId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `StatusId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2020 at 10:05 AM
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
  `AddressLine1` varchar(50) NOT NULL,
  `AddressLine2` varchar(50) NOT NULL,
  `AddressLine3` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
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

INSERT INTO `address` (`AddressId`, `UserId`, `AddressLine1`, `AddressLine2`, `AddressLine3`, `City`, `PostalCode`, `CreateDate`, `CrateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('4df9f570-9cd5-11ea-809b-48f17f8d4d88', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', 'The Willaim', 'Unit 510', 'Black 56', 'Fourways', '1245', '2020-05-23 11:10:53', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', '2020-05-23 12:11:52', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', 1);

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
(2, 'residential', '2020-01-27 23:29:56', 'residential', '2020-05-24 17:33:51', '8217b572-3c7d-11ea-8876-c8f7501047dc', 2),
(20, 'Commercial and institutional', '2020-01-27 23:29:41', 'test', '2020-01-27 23:29:41', 'test', 1),
(21, 'Industrial', '2020-01-27 23:29:42', 'test', '2020-01-27 23:29:42', 'test', 1),
(22, 'Highway', '2020-01-27 23:29:44', 'test', '2020-05-24 17:34:01', '8217b572-3c7d-11ea-8876-c8f7501047dc', 2),
(23, 'Building', '2020-01-27 23:29:46', 'test', '2020-01-27 23:29:46', 'test', 1),
(25, 'Heavy', '2020-01-27 23:29:49', 'test', '2020-05-24 17:33:58', '8217b572-3c7d-11ea-8876-c8f7501047dc', 2),
(26, 'News Coms', '2020-02-02 18:42:06', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-02 18:42:06', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1),
(27, 'Better', '2020-02-02 18:42:46', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-02 18:42:46', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1);

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
  `CompanyAddress` varchar(225) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `measurement`
--

CREATE TABLE `measurement` (
  `MeasurementId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UnitOfMeasurement` varchar(20) NOT NULL,
  `Type` varchar(30) DEFAULT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement`
--

INSERT INTO `measurement` (`MeasurementId`, `Name`, `UnitOfMeasurement`, `Type`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(1, 'Compressive strength', 'test', 'Text', '2020-01-27 23:00:04', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-25 06:40:31', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1),
(2, 'Casting date', 'test', 'Date', '2020-01-27 23:00:48', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-25 07:39:13', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1),
(3, 'Truck arrival time', 'test', NULL, '2020-01-27 23:00:55', 'test', '2020-01-27 23:00:55', 'test', 1),
(4, 'cubic yards needed', 'test', NULL, '2020-01-27 23:02:03', 'test', '2020-01-27 23:02:03', 'test', 1),
(5, 'Mix design number', 'test', NULL, '2020-01-27 23:02:31', 'test', '2020-01-27 23:02:31', 'test', 1),
(6, 'Compressive strength', 'Mpa', NULL, '2020-01-27 23:02:54', 'test', '2020-01-27 23:02:54', 'test', 1),
(7, 'Maximum size coarse aggregate', 'Mpa', NULL, '2020-01-27 23:04:24', 'test', '2020-01-27 23:04:24', 'test', 1),
(8, 'fly ash', 'kg', NULL, '2020-01-27 23:04:25', 'test', '2020-01-27 23:04:25', 'test', 1),
(9, 'air Entrainment', 'kg', NULL, '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1),
(10, 'retardant', 'mpa', NULL, '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1),
(11, 'Supermerplasticizer', 'kg', NULL, '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1),
(12, 'Slump', 'mm', NULL, '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdeliveries`
--

CREATE TABLE `orderdeliveries` (
  `Id` int(11) NOT NULL,
  `OrderId` varchar(225) NOT NULL,
  `UserId` varchar(225) NOT NULL,
  `DeliveryStartDateTime` datetime DEFAULT NULL,
  `DeliveryEndDateTime` datetime DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `OrderId` varchar(225) NOT NULL,
  `UserId` varchar(225) NOT NULL,
  `ProjectCode` int(225) NOT NULL,
  `OrderNumber` varchar(225) NOT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `TruckArrivalTime` varchar(10) DEFAULT NULL,
  `Directions` varchar(225) DEFAULT NULL,
  `SpecialInstructions` varchar(225) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` int(11) DEFAULT NULL,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordermeasurement`
--

CREATE TABLE `ordermeasurement` (
  `OrderId` int(11) NOT NULL,
  `MeasurementId` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `Id` int(11) NOT NULL,
  `OrderId` varchar(225) NOT NULL,
  `ProductId` varchar(225) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `TotalPrice` decimal(10,0) NOT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrdersId` varchar(225) NOT NULL,
  `OrderId` int(10) NOT NULL,
  `CompanyId` varchar(225) NOT NULL,
  `ParntersId` varchar(225) DEFAULT NULL,
  `OrderType` varchar(100) NOT NULL,
  `Total` varchar(10) NOT NULL,
  `Paid` varchar(10) DEFAULT '0.00',
  `Due` varchar(10) DEFAULT NULL,
  `ExpectedDate` text,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `order_options`
--

CREATE TABLE `order_options` (
  `Id` int(10) NOT NULL,
  `OrderId` varchar(225) NOT NULL,
  `ProductId` varchar(225) DEFAULT NULL,
  `OrderProductId` varchar(225) NOT NULL,
  `OptionId` varchar(225) NOT NULL,
  `ValueId` int(10) NOT NULL,
  `OptionValue` varchar(300) NOT NULL,
  `OptionName` varchar(200) DEFAULT NULL,
  `ValuePrice` decimal(10,0) NOT NULL,
  `ValueIdQty` int(10) NOT NULL,
  `CompanyId` varchar(225) NOT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `Id` varchar(225) NOT NULL,
  `OrderId` varchar(225) NOT NULL,
  `ProductId` varchar(225) NOT NULL,
  `CompanyId` varchar(225) DEFAULT NULL,
  `ProductName` text,
  `UnitPrice` varchar(10) DEFAULT NULL,
  `Quantity` varchar(225) NOT NULL,
  `subTotal` varchar(10) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductId` varchar(225) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `ProductCode` varchar(225) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `CategoryId` varchar(225) DEFAULT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productmeasurements`
--

CREATE TABLE `productmeasurements` (
  `Id` int(11) NOT NULL,
  `MeasurementId` int(11) NOT NULL,
  `ProductId` varchar(225) NOT NULL,
  `Value` varchar(10) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `StatusId` int(11) NOT NULL,
  `Description` varchar(25) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `IsActive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`StatusId`, `Description`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `IsActive`) VALUES
(1, 'Pending', '2020-02-19 20:58:17', 'sys', '2020-02-19 20:58:17', 'sys', 1),
(2, 'Accepted', '2020-02-19 21:01:27', 'sys', '2020-02-19 21:01:27', 'sys', 1),
(3, 'In Progress', '2020-02-19 21:01:27', 'sys', '2020-02-19 21:01:27', 'sys', 1),
(4, 'On its way', '2020-02-19 21:01:27', 'sys', '2020-02-19 21:01:27', 'sys', 1),
(5, 'Completed', '2020-02-19 21:01:27', 'sys', '2020-02-19 21:01:27', 'sys', 1),
(6, 'Cancelled', '2020-02-19 21:01:27', 'sys', '2020-02-19 21:01:27', 'sys', 1),
(7, 'Declined by Customer', '2020-02-19 21:01:27', 'sys', '2020-02-19 21:01:27', 'sys', 1),
(8, 'Declined by supplier', '2020-02-19 21:01:27', 'sys', '2020-02-19 21:01:27', 'sys', 1),
(9, 'Awaiting Activation', '2020-05-25 18:36:02', 'system', '2020-05-25 18:36:02', 'system', 1);

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
  `Cellphone` varchar(15) NOT NULL,
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
('45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Bernard', 'Parker', 'bparke@mail.com', '12345', '07455221122', 5, NULL, '2ee85b09c6f7bcabf27a4fbdadda494b', '2020-05-25 22:28:20', 'sys', '2020-05-25 22:28:20', 'sys', 9),
('53657b41-9eb6-11ea-88a2-c8f7501047dc', 'Christopher', 'news', 'cnews@mail.com', '12345', '07455221122', 5, NULL, '64da22684a7c5d90b2fc3f9aae4477be', '2020-05-25 20:34:10', 'sys', '2020-05-25 20:34:10', 'sys', 1),
('53702e1e-9eb3-11ea-88a2-c8f7501047dc', 'Ember', 'Doe', 'ember@mail.com', '12345', '07455221122', 5, NULL, NULL, '2020-05-25 20:12:42', 'sys', '2020-05-25 20:12:42', 'sys', 9),
('69da8ac3-9eab-11ea-88a2-c8f7501047dc', 'Themba', 'Driver', 'driver@mail.com', '12345', '07455221122', 6, NULL, NULL, '2020-05-25 19:16:03', 'sys', '2020-05-25 19:16:03', 'sys', 9),
('7896a757-9eab-11ea-88a2-c8f7501047dc', 'Randol', 'Customer', 'customer@mail.com', '12345', '07455221122', 5, NULL, NULL, '2020-05-25 19:16:28', 'sys', '2020-05-25 19:16:28', 'sys', 9),
('8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'John', 'Doe', 'test@mail.com', '12345', '07455221122', 1, NULL, 'f65087b948b4a79baa80b1470b809dea', '2020-05-25 19:16:58', 'sys', '2020-05-25 19:16:58', 'sys', 1),
('f14d63f5-9eb7-11ea-88a2-c8f7501047dc', 'Bernard', 'Parker', 'bparker@mail.com', '12345', '07455221122', 5, NULL, '8df666792a0e2c5956bc3cff4585813d', '2020-05-25 20:45:45', 'sys', '2020-05-25 20:45:45', 'sys', 1),
('f24670e7-9ec6-11ea-88a2-c8f7501047dc', 'Bernard', 'Parker', 'bpark@mail.com', '12345', '07455221122', 5, NULL, '720d11a15dd346dc10deb04cac4854dd', '2020-05-25 22:33:09', 'sys', '2020-05-25 22:33:09', 'sys', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressId`);

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
-- Indexes for table `measurement`
--
ALTER TABLE `measurement`
  ADD PRIMARY KEY (`MeasurementId`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`StatusId`);

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
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `measurement`
--
ALTER TABLE `measurement`
  MODIFY `MeasurementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `StatusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

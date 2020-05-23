-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2020 at 12:05 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

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
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressId`, `UserId`, `AddressLine1`, `AddressLine2`, `AddressLine3`, `City`, `PostalCode`, `CreateDate`, `CrateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('4df9f570-9cd5-11ea-809b-48f17f8d4d88', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', 'sddsadsa', 'sddsadsa', 'sddsadsa', 'sddsadsa', '1245', '2020-05-23 11:10:53', 'sddsadsa', '2020-05-23 11:10:53', 'sddsadsa', 0);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `Id` int(11) NOT NULL,
  `url` varchar(225) DEFAULT NULL,
  `OtherId` varchar(225) DEFAULT NULL,
  `CreateDate` datetime DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT current_timestamp(),
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
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryId`, `CategoryName`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(2, 'residential', '2020-01-27 23:29:56', 'residential', '2020-01-27 23:29:56', 'test', 1),
(20, 'Commercial and institutional', '2020-01-27 23:29:41', 'test', '2020-01-27 23:29:41', 'test', 1),
(21, 'Industrial', '2020-01-27 23:29:42', 'test', '2020-01-27 23:29:42', 'test', 1),
(22, 'Highway', '2020-01-27 23:29:44', 'test', '2020-01-27 23:29:44', 'test', 1),
(23, 'Building', '2020-01-27 23:29:46', 'test', '2020-01-27 23:29:46', 'test', 1),
(25, 'Heavy', '2020-01-27 23:29:49', 'test', '2020-01-27 23:29:49', 'test', 1),
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
  `CreateDate` datetime DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT current_timestamp(),
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
  `CreateDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
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
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
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
  `CreateDate` datetime DEFAULT current_timestamp(),
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
  `CreateDate` datetime DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT current_timestamp(),
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
  `CreateDate` datetime DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `StatusId` int(11) NOT NULL,
  `Description` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `IsActive` tinyint(1) NOT NULL
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
  `CreateDate` datetime DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT current_timestamp(),
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
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime DEFAULT current_timestamp(),
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
  `CreateDate` datetime DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT current_timestamp(),
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
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
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
(4, 'Assistant', '2020-02-08 21:39:07', 'sys', '2020-02-08 21:39:07', 'sys', 1);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `StatusId` int(11) NOT NULL,
  `Description` varchar(25) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
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
(8, 'Declined by supplier', '2020-02-19 21:01:27', 'sys', '2020-02-19 21:01:27', 'sys', 1);

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
  `Gender` varchar(15) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `RoleId` int(10) NOT NULL,
  `UserType` varchar(30) DEFAULT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `Cellphone`, `Gender`, `DOB`, `RoleId`, `UserType`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('0d9678af-4ab0-11ea-b387-c8f7501047dc', 'test', 'user', 'Engineer@mail.com', '12345', 'na', NULL, NULL, 2, NULL, '2020-02-08 22:17:32', 'sys', '2020-02-08 22:17:32', 'sys', 1),
('1b5b7944-4ab3-11ea-b387-c8f7501047dc', 'Becker', 'News', 'becker@mail.com', '12345', 'na', NULL, NULL, 3, NULL, '2020-02-08 22:39:24', 'sys', '2020-02-08 22:39:24', 'sys', 1),
('36e8d88f-4ab3-11ea-b387-c8f7501047dc', 'Steve', 'Nkosi', 'steven@mail.com', '12345', 'na', NULL, NULL, 2, NULL, '2020-02-08 22:40:10', 'sys', '2020-02-08 22:40:10', 'sys', 1),
('5cea9755-4aaf-11ea-b387-c8f7501047dc', 'test', 'user', 'signup@mail.com', '12345', 'na', NULL, NULL, 3, NULL, '2020-02-08 22:12:36', 'sys', '2020-02-08 22:12:36', 'sys', 1),
('5f544790-9cdc-11ea-809b-48f17f8d4d88', 'Jane', 'Smith', 'Jane.Engineer@mail.com', '12345', 'na', NULL, NULL, 2, 'Engineer', '2020-05-23 12:01:29', 'sys', '2020-05-23 12:01:29', 'sys', 1),
('8118d997-4b3d-11ea-ad8f-c8f7501047dc', 'minister', 'Government', 'mini@mail.com', '12345', 'na', NULL, NULL, 3, NULL, '2020-02-09 15:10:11', 'sys', '2020-02-09 15:10:11', 'sys', 1),
('8217b572-3c7d-11ea-8876-c8f7501047dc', 'test', 'user', 'test@mail.com', '12345', '071455588774', NULL, NULL, 1, NULL, '2020-01-21 20:40:33', 'sys', '2020-01-21 20:40:33', 'sys', 1),
('b579c478-4b3d-11ea-ad8f-c8f7501047dc', 'Sir', 'Mngadi', 'sir@mail.com', '12345', 'n55', NULL, NULL, 2, NULL, '2020-02-09 15:11:39', 'sys', '2020-02-09 15:11:39', 'sys', 1),
('de662467-9c4a-11ea-84a4-48f17f8d4d88', 'sipho', 'thule', 'sipho@mail.com', 'newpass', 'na', 'Male', '1992-06-22 18:39:56', 3, 'Customer', '2020-05-22 18:39:56', 'sys', '2020-05-23 11:29:27', 'sys', 1);

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
  MODIFY `Id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `StatusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

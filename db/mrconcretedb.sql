-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2020 at 08:12 PM
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
('4df9f570-9cd5-11ea-809b-48f17f8d4d29', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Physical Address', 'Randburg', 'Unit 813', 'Black 56', 'Randburg', 'Gauteng', '1245', '2020-05-23 11:10:53', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', '2020-05-23 12:11:52', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', 1),
('4df9f570-9cd5-11ea-809b-48f17f8d4d77', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Physical Address', 'Braamfontein Gate', 'Unit 813', 'Black 56', 'Braamfontein', 'Gauteng', '1245', '2020-05-23 11:10:53', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', '2020-05-23 12:11:52', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', 1),
('4df9f570-9cd5-11ea-809b-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Postal Address', 'The Willaim', 'Unit 510', 'Black 56', 'Fourways', 'Gauteng', '1245', '2020-05-23 11:10:53', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', '2020-05-23 12:11:52', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', 1);

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
(2, 'residential', '2020-01-27 23:29:56', 'residential', '2020-05-29 06:26:15', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
(20, 'Commercial and institutional', '2020-01-27 23:29:41', 'test', '2020-01-27 23:29:41', 'test', 1),
(21, 'Industrial', '2020-01-27 23:29:42', 'test', '2020-01-27 23:29:42', 'test', 1),
(22, 'Highway', '2020-01-27 23:29:44', 'test', '2020-05-29 06:26:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 2),
(23, 'Building', '2020-01-27 23:29:46', 'test', '2020-01-27 23:29:46', 'test', 1),
(25, 'Heavy', '2020-01-27 23:29:49', 'test', '2020-05-29 06:26:21', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
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
  `IsDeleted` tinyint(1) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyId`, `CompanyName`, `CompanyPhone`, `CompanyEmail`, `ParentId`, `CompanyType`, `CompanyAddress`, `City`, `Province`, `PostalCode`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `IsDeleted`, `StatusId`) VALUES
('09c6bc58-1fe4-486f-ba18-3830592466f5', 'Test Company', '07466585421', 'test@company.co.za', '', 'HeadQuarters', 'Sandton 1 Press Street', 'Sandton', 'Gauteng', '2190', '2020-05-30 15:03:52', 'sys', '2020-05-30 15:03:52', 'sys', 0, 1),
('132a953b-a342-11ea-a04d-c8f7501047dc', 'Siya CO', '745785452121', '', NULL, 'HeadQuarter', 'EC', 'Bhisho', 'Gauteng', '450122', '2020-05-31 15:24:37', 'c0f051f1-a341-11ea-a04d-c8f7501047dc', '2020-05-31 15:24:37', 'c0f051f1-a341-11ea-a04d-c8f7501047dc', 0, 1),
('384d1113-a276-11ea-a04d-c8f7501047dc', 'Construction Wise', '07466585421', 'wise@construction.co.za', '', 'HeadQuarters', 'Umbilo Devenport', 'Durban', 'Gauteng', '2190', '2020-05-30 15:05:22', 'sys', '2020-05-30 15:05:22', 'sys', 0, 1);

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
('3179c6ed-a7d0-11ea-ab68-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1591432321iio.jpg', '2020-06-06 10:32:01', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:01', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('3d97b360-a7d0-11ea-ab68-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'removed-6d1036c3-a167-11ea-8012-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1591432341iio.jpg', '2020-06-06 10:32:21', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:51', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 2),
('4370ba7e-a7d0-11ea-ab68-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1591432351iio.jpg', '2020-06-06 10:32:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('4dc93b1d-a7d0-11ea-ab68-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1591432368iio.jpg', '2020-06-06 10:32:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('569e539a-a7d0-11ea-ab68-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '50c4d519-a0f4-11ea-9dc0-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1591432383iio.jpg', '2020-06-06 10:33:03', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:33:03', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1);

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
('0819d84d-a308-11ea-9ed4-48f17f8d4d88', '08194416-a308-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 08:29:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:29:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('0b2f5ef0-a30a-11ea-9ed4-48f17f8d4d88', '0b2e9bf3-a30a-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 08:43:32', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:43:32', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('0beb916f-a301-11ea-9ed4-48f17f8d4d88', '0beade1d-a301-11ea-9ed4-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '2', 'each', '2020-05-31 07:39:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 07:39:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('0bebd505-a301-11ea-9ed4-48f17f8d4d88', '0beade1d-a301-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '1', 'each', '2020-05-31 07:39:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 07:39:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('0fbb58a4-a30a-11ea-9ed4-48f17f8d4d88', '0fba9c48-a30a-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 08:43:39', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:43:39', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('1ad0a672-a7de-11ea-ab68-48f17f8d4d88', '1acfeefd-a7de-11ea-ab68-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '1', 'day(s)', '2020-06-06 12:11:36', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 12:11:36', '81de5b36-d170-11e9-b97c-48f17f8d4d88', 1),
('1d670d54-a30a-11ea-9ed4-48f17f8d4d88', '1d6645f3-a30a-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 08:44:02', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:44:02', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('21f8145a-a359-11ea-a04d-c8f7501047dc', '21f74b9b-a359-11ea-a04d-c8f7501047dc', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '5', 'day(s)', '2020-05-31 18:09:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 18:09:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('23d9c693-a2c3-11ea-a7b2-48f17f8d4d88', '23d903b0-a2c3-11ea-a7b2-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('23da0d18-a2c3-11ea-a7b2-48f17f8d4d88', '23d903b0-a2c3-11ea-a7b2-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '3', 'each', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('23da50bf-a2c3-11ea-a7b2-48f17f8d4d88', '23d903b0-a2c3-11ea-a7b2-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '2', '', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('242edd96-a7e5-11ea-ab68-48f17f8d4d88', '242e3882-a7e5-11ea-ab68-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '2', 'day(s)', '2020-06-06 13:01:58', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 13:01:58', '', 1),
('242f2718-a7e5-11ea-ab68-48f17f8d4d88', '242e3882-a7e5-11ea-ab68-48f17f8d4d88', '804f69cc-a0d9-11ea-9dc0-48f17f8d4d88', 'Ceillin board', '12.2', '1', 'Metre', '2020-06-06 13:01:58', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 13:01:58', '', 1),
('242f8d1d-a7e5-11ea-ab68-48f17f8d4d88', '242e3882-a7e5-11ea-ab68-48f17f8d4d88', '1fe9cfc2-a0d9-11ea-9dc0-48f17f8d4d88', 'Cemente  50kg', '100', '1', '', '2020-06-06 13:01:58', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 13:01:58', '', 1),
('2baf4597-a2be-11ea-a7b2-48f17f8d4d88', '2baefb04-a2be-11ea-a7b2-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '3', 'each', '2020-05-30 23:40:24', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:40:24', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('2baf9d46-a2be-11ea-a7b2-48f17f8d4d88', '2baefb04-a2be-11ea-a7b2-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-30 23:40:24', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:40:24', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('2c6ab09b-a31d-11ea-8323-48f17f8d4d88', '2c69de2d-a31d-11ea-8323-48f17f8d4d88', 'c6d0a57e-a0ed-11ea-9dc0-48f17f8d4d88', 'Wooded board', '120', '3', 'M', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('2c6b2e2b-a31d-11ea-8323-48f17f8d4d88', '2c69de2d-a31d-11ea-8323-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('3fa25fb4-a2bd-11ea-a7b2-48f17f8d4d88', '3fa126dc-a2bd-11ea-a7b2-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-30 23:33:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:33:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('3fa33301-a2bd-11ea-a7b2-48f17f8d4d88', '3fa126dc-a2bd-11ea-a7b2-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-30 23:33:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:33:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('43b7741b-a8bf-11ea-b510-48f17f8d4d88', '43b70d62-a8bf-11ea-b510-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '2', 'day(s)', '2020-06-07 15:03:21', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-07 15:03:21', '', 1),
('44fe8a88-a317-11ea-9ed4-48f17f8d4d88', '44fdb801-a317-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('44ff2098-a317-11ea-9ed4-48f17f8d4d88', '44fdb801-a317-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('499a4fa0-a30b-11ea-9ed4-48f17f8d4d88', '49999360-a30b-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 08:52:26', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:52:26', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('5f6efc5e-a7de-11ea-ab68-48f17f8d4d88', '5f6dc776-a7de-11ea-ab68-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '2', 'day(s)', '2020-06-06 12:13:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 12:13:31', '81de5b36-d170-11e9-b97c-48f17f8d4d88', 1),
('6033cf08-a313-11ea-9ed4-48f17f8d4d88', '6033184d-a313-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('60343d5c-a313-11ea-9ed4-48f17f8d4d88', '6033184d-a313-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('6034a691-a313-11ea-9ed4-48f17f8d4d88', '6033184d-a313-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('6034fe3c-a313-11ea-9ed4-48f17f8d4d88', '6033184d-a313-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '1', 'each', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('665a0db8-a309-11ea-9ed4-48f17f8d4d88', '665961c7-a309-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 08:38:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:38:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('774be3c2-a30a-11ea-9ed4-48f17f8d4d88', '774b2d51-a30a-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 08:46:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:46:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('77890739-a7d5-11ea-ab68-48f17f8d4d88', '77886acd-a7d5-11ea-ab68-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '2', 'day(s)', '2020-06-06 11:09:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 11:09:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('894d6747-a30b-11ea-9ed4-48f17f8d4d88', '894cbb8a-a30b-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 08:54:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:54:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('894dc719-a30b-11ea-9ed4-48f17f8d4d88', '894cbb8a-a30b-11ea-9ed4-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '3', 'each', '2020-05-31 08:54:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:54:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('8f653356-a8bf-11ea-b510-48f17f8d4d88', '8f646795-a8bf-11ea-b510-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '2', 'day(s)', '2020-06-07 15:05:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-07 15:05:28', '', 1),
('8f65a69d-a8bf-11ea-b510-48f17f8d4d88', '8f646795-a8bf-11ea-b510-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '1', 'each', '2020-06-07 15:05:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-07 15:05:28', '', 1),
('957b7aca-a31a-11ea-8323-48f17f8d4d88', '957b2d9b-a31a-11ea-8323-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 10:41:56', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:41:56', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('957c0586-a31a-11ea-8323-48f17f8d4d88', '957b2d9b-a31a-11ea-8323-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 10:41:56', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:41:56', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('9a643f77-a30a-11ea-9ed4-48f17f8d4d88', '9a6375bc-a30a-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 08:47:32', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:47:32', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b204f8fe-a314-11ea-9ed4-48f17f8d4d88', 'b204523b-a314-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '2', '', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b2053979-a314-11ea-9ed4-48f17f8d4d88', 'b204523b-a314-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b2057eed-a314-11ea-9ed4-48f17f8d4d88', 'b204523b-a314-11ea-9ed4-48f17f8d4d88', '804f69cc-a0d9-11ea-9dc0-48f17f8d4d88', 'Ceillin board', '12.2', '3', 'Metre', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b205b8a4-a314-11ea-9ed4-48f17f8d4d88', 'b204523b-a314-11ea-9ed4-48f17f8d4d88', '804f69cc-a0d9-11ea-9dc0-48f17f8d4d88', 'Ceillin board', '12.2', '1', 'Metre', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b4b96604-a307-11ea-9ed4-48f17f8d4d88', 'b4b8a13b-a307-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 08:26:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:26:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b6aebac0-a314-11ea-9ed4-48f17f8d4d88', 'b6ae10d2-a314-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '2', '', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b6af1df6-a314-11ea-9ed4-48f17f8d4d88', 'b6ae10d2-a314-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b6af5e2e-a314-11ea-9ed4-48f17f8d4d88', 'b6ae10d2-a314-11ea-9ed4-48f17f8d4d88', '804f69cc-a0d9-11ea-9dc0-48f17f8d4d88', 'Ceillin board', '12.2', '3', 'Metre', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b6af9be0-a314-11ea-9ed4-48f17f8d4d88', 'b6ae10d2-a314-11ea-9ed4-48f17f8d4d88', '804f69cc-a0d9-11ea-9dc0-48f17f8d4d88', 'Ceillin board', '12.2', '1', 'Metre', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('bb0d207d-a7e4-11ea-ab68-48f17f8d4d88', 'bb0ca456-a7e4-11ea-ab68-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '1', 'each', '2020-06-06 12:59:02', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 12:59:02', '81de5b36-d170-11e9-b97c-48f17f8d4d88', 1),
('be41562f-a30b-11ea-9ed4-48f17f8d4d88', 'be40b124-a30b-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 08:55:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:55:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('be41beed-a30b-11ea-9ed4-48f17f8d4d88', 'be40b124-a30b-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 08:55:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:55:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('beed58a7-a312-11ea-9ed4-48f17f8d4d88', 'beec9895-a312-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('beedb0d2-a312-11ea-9ed4-48f17f8d4d88', 'beec9895-a312-11ea-9ed4-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '2', 'each', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('c4440bdf-a7d1-11ea-ab68-48f17f8d4d88', 'c44372f6-a7d1-11ea-ab68-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '2', 'each', '2020-06-06 10:43:17', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:43:17', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('c4444f63-a7d1-11ea-ab68-48f17f8d4d88', 'c44372f6-a7d1-11ea-ab68-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '1', 'day(s)', '2020-06-06 10:43:17', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:43:17', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('d3c50929-a300-11ea-9ed4-48f17f8d4d88', 'd3c4bdfe-a300-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 07:37:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 07:37:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('d3c5773f-a300-11ea-9ed4-48f17f8d4d88', 'd3c4bdfe-a300-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '1', 'each', '2020-05-31 07:37:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 07:37:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ddfdb2af-a359-11ea-a04d-c8f7501047dc', 'ddfccfe8-a359-11ea-a04d-c8f7501047dc', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '20', 'x', '2020-05-31 18:14:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 18:14:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ddfe4bfd-a359-11ea-a04d-c8f7501047dc', 'ddfccfe8-a359-11ea-a04d-c8f7501047dc', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '1', 'day(s)', '2020-05-31 18:14:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 18:14:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('deba2bcd-a308-11ea-9ed4-48f17f8d4d88', 'deb995c3-a308-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 08:35:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:35:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e150304f-a31d-11ea-8323-48f17f8d4d88', 'e14eeda9-a31d-11ea-8323-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e15143ab-a31d-11ea-8323-48f17f8d4d88', 'e14eeda9-a31d-11ea-8323-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e1523146-a31d-11ea-8323-48f17f8d4d88', 'e14eeda9-a31d-11ea-8323-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e4c1ca8e-a31d-11ea-8323-48f17f8d4d88', 'e4c1237c-a31d-11ea-8323-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e4c23305-a31d-11ea-8323-48f17f8d4d88', 'e4c1237c-a31d-11ea-8323-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e4c272bc-a31d-11ea-8323-48f17f8d4d88', 'e4c1237c-a31d-11ea-8323-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ec495d76-a30c-11ea-9ed4-48f17f8d4d88', 'ec489c73-a30c-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 09:04:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:04:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ec49b1c1-a30c-11ea-9ed4-48f17f8d4d88', 'ec489c73-a30c-11ea-9ed4-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '2', 'each', '2020-05-31 09:04:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:04:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('fa5fba87-a7e4-11ea-ab68-48f17f8d4d88', 'fa5f5441-a7e4-11ea-ab68-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Truck Rental', '1000', '2', 'day(s)', '2020-06-06 13:00:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 13:00:48', '', 1),
('fa600fec-a7e4-11ea-ab68-48f17f8d4d88', 'fa5f5441-a7e4-11ea-ab68-48f17f8d4d88', '804f69cc-a0d9-11ea-9dc0-48f17f8d4d88', 'Ceillin board', '12.2', '1', 'Metre', '2020-06-06 13:00:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 13:00:48', '', 1),
('fa607815-a7e4-11ea-ab68-48f17f8d4d88', 'fa5f5441-a7e4-11ea-ab68-48f17f8d4d88', '1fe9cfc2-a0d9-11ea-9dc0-48f17f8d4d88', 'Cemente  50kg', '100', '1', '', '2020-06-06 13:00:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 13:00:48', '', 1),
('fabc93a4-a30b-11ea-9ed4-48f17f8d4d88', 'fabbdef9-a30b-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 08:57:23', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:57:23', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('fabcea96-a30b-11ea-9ed4-48f17f8d4d88', 'fabbdef9-a30b-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 08:57:23', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:57:23', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('fe7ba8d3-a306-11ea-9ed4-48f17f8d4d88', 'fe7aed41-a306-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 08:21:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:21:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('fe7c05a3-a306-11ea-9ed4-48f17f8d4d88', 'fe7aed41-a306-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 08:21:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:21:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('fe7c643b-a306-11ea-9ed4-48f17f8d4d88', 'fe7aed41-a306-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 08:21:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:21:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1);

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
('beec9895-a312-11ea-9ed4-48f17f8d4d88', 1, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-05', '13:45', 'Hoff Events', '', '515', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('6033184d-a313-11ea-9ed4-48f17f8d4d88', 2, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-28', '09:53', 'Hoff Events', '', '4294.6', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b204523b-a314-11ea-9ed4-48f17f8d4d88', 3, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', NULL, NULL, NULL, '', '289.8', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('b6ae10d2-a314-11ea-9ed4-48f17f8d4d88', 4, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-20', '13:04', '2/20/2020', '', '289.8', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:59:54', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('44fdb801-a317-11ea-9ed4-48f17f8d4d88', 5, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-14', '13:18', 'Strength', '', '3300', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('957b2d9b-a31a-11ea-8323-48f17f8d4d88', 6, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-05', '15:41', 'Hoff Events', '', '3300', '2020-05-31 10:41:56', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:41:56', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('2c69de2d-a31d-11ea-8323-48f17f8d4d88', 7, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-07', '13:00', 'Hoff Events', '', '504.6', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e14eeda9-a31d-11ea-8323-48f17f8d4d88', 8, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-21', NULL, 'Hoff Events', '', '3444.6', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e4c1237c-a31d-11ea-8323-48f17f8d4d88', 9, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-21', '11:09', 'Hoff Events', '', '3444.6', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('21f74b9b-a359-11ea-a04d-c8f7501047dc', 10, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-06-01', '20:10', '', 'News Deck', '5000', '2020-05-31 18:09:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 18:09:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ddfccfe8-a359-11ea-a04d-c8f7501047dc', 11, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-02', '21:14', '', 'News', '1150', '2020-05-31 18:14:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 18:14:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('c44372f6-a7d1-11ea-ab68-48f17f8d4d88', 12, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-06-23', '14:46', '2/20/2020', '', '1015', '2020-06-06 10:43:17', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:43:17', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('77886acd-a7d5-11ea-ab68-48f17f8d4d88', 13, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '', '', '', '', '2000', '2020-06-06 11:09:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 11:09:46', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('1acfeefd-a7de-11ea-ab68-48f17f8d4d88', 14, '', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '', '', '', '', '', '1000', '2020-06-06 12:11:36', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 12:11:36', '81de5b36-d170-11e9-b97c-48f17f8d4d88', 1),
('5f6dc776-a7de-11ea-ab68-48f17f8d4d88', 15, '', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '', '', '', '', '', '2000', '2020-06-06 12:13:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 12:13:31', '81de5b36-d170-11e9-b97c-48f17f8d4d88', 1),
('bb0ca456-a7e4-11ea-ab68-48f17f8d4d88', 16, '', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '', '', '', '', '', '388.1', '2020-06-06 12:59:02', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 12:59:02', '81de5b36-d170-11e9-b97c-48f17f8d4d88', 1),
('fa5f5441-a7e4-11ea-ab68-48f17f8d4d88', 17, '', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '', '', '', '', '', '6124.4', '2020-06-06 13:00:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 13:00:48', '', 1),
('242e3882-a7e5-11ea-ab68-48f17f8d4d88', 18, '', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '', '', '', '', '', '6124.4', '2020-06-06 13:01:58', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 13:01:58', '', 1),
('43b70d62-a8bf-11ea-b510-48f17f8d4d88', 19, '', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '', '', '', '', '', '4000', '2020-06-07 15:03:21', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-07 15:03:21', '', 1),
('8f646795-a8bf-11ea-b510-48f17f8d4d88', 20, '', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '', '2020-06-18', '20:08', 'each', 'wwqwq', '7700', '2020-06-07 15:05:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-07 15:05:28', '', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `productproperty`
--

CREATE TABLE `productproperty` (
  `ProductpropertyId` varchar(225) NOT NULL,
  `ProductId` varchar(225) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Code` varchar(250) NOT NULL,
  `Value` varchar(500) NOT NULL,
  `Units` varchar(100) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productproperty`
--

INSERT INTO `productproperty` (`ProductpropertyId`, `ProductId`, `Name`, `Code`, `Value`, `Units`, `CreateDate`, `CrateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('012ad0a1-a0e5-11ea-9dc0-48f17f8d4d88', '012a43a4-a0e5-11ea-9dc0-48f17f8d4d88', 'Strength', 'WT', 'AA5TT6', 'kph', '2020-05-28 15:13:21', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 15:13:21', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('340cf1ac-a342-11ea-a04d-c8f7501047dc', '340c60e0-a342-11ea-a04d-c8f7501047dc', '4000', '', '150', '', '2020-05-31 15:25:32', 'c0f051f1-a341-11ea-a04d-c8f7501047dc', '2020-05-31 15:25:46', 'c0f051f1-a341-11ea-a04d-c8f7501047dc', 1),
('3e9469b8-a1ce-11ea-bf54-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'sAS', '', 'SAsA', '', '2020-05-29 19:02:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:25:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 3),
('50c57f54-a0f4-11ea-9dc0-48f17f8d4d88', '50c4d519-a0f4-11ea-9dc0-48f17f8d4d88', 'Property 1', '', '', '', '2020-05-28 17:02:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('50c5cebd-a0f4-11ea-9dc0-48f17f8d4d88', '50c4d519-a0f4-11ea-9dc0-48f17f8d4d88', 'Property 2', '', '', '', '2020-05-28 17:02:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('50f45914-a098-11ea-94de-48f17f8d4d88', '50f4054b-a098-11ea-94de-48f17f8d4d88', 'Wood Type', 'WT', 'AA5TT6', '', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('50f4a768-a098-11ea-94de-48f17f8d4d88', '50f4054b-a098-11ea-94de-48f17f8d4d88', 'Wood Type', 'WT', 'AA5TT6', '', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('6d108842-a167-11ea-8012-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', '', '', '', '', '2020-05-29 06:46:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:52', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('6d10c5ee-a167-11ea-8012-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', '', '', '', '', '2020-05-29 06:46:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:52', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('861204d7-a1d1-11ea-bf54-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'qwq', '', 'eewe', '', '2020-05-29 19:26:25', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:26:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 3),
('86124b76-a1d1-11ea-bf54-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'ewqewqe', '', 'ewqewqe', '', '2020-05-29 19:26:25', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:26:32', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 3),
('c6d10559-a0ed-11ea-9dc0-48f17f8d4d88', 'c6d0a57e-a0ed-11ea-9dc0-48f17f8d4d88', 'Weigth', 'WT', '200kg', '', '2020-05-28 16:16:09', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:16:09', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('c6d15161-a0ed-11ea-9dc0-48f17f8d4d88', 'c6d0a57e-a0ed-11ea-9dc0-48f17f8d4d88', 'Width', 'WT', '1000m', '', '2020-05-28 16:16:09', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:16:09', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('cd3a740d-a1cb-11ea-bf54-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Mass Uplaod', '', '5510', '', '2020-05-29 18:45:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:14', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('cd3aae04-a1cb-11ea-bf54-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Strength', '', '100', '', '2020-05-29 18:45:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:14', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('cfbec0a4-a1d1-11ea-bf54-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Mental', '', 'Steel', '', '2020-05-29 19:28:29', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 21:36:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('d77fca94-a0e7-11ea-9dc0-48f17f8d4d88', 'd77f199a-a0e7-11ea-9dc0-48f17f8d4d88', 'Wood Type', 'WT', 'AA5TT6', '', '2020-05-28 15:33:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 15:33:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('df8521f2-a31a-11ea-8323-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'T', '', '88', '', '2020-05-31 10:44:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:14', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ea604a5f-a0f0-11ea-9dc0-48f17f8d4d88', 'ea5fd052-a0f0-11ea-9dc0-48f17f8d4d88', 'Property 1', '', '2094', '', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ea60beaf-a0f0-11ea-9dc0-48f17f8d4d88', 'ea5fd052-a0f0-11ea-9dc0-48f17f8d4d88', 'Property 2', '', 'Nails', '', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ecb7cb17-a0f4-11ea-9dc0-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'Mass Uplaod', '', '5510556', '', '2020-05-28 17:07:19', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ecb81179-a0f4-11ea-9dc0-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'Strength', '', '50000kpw', '', '2020-05-28 17:07:19', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-06-06 10:32:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('f5339f80-a0e4-11ea-9dc0-48f17f8d4d88', 'f532d991-a0e4-11ea-9dc0-48f17f8d4d88', 'Strength', 'WT', 'AA5TT6', 'kg', '2020-05-28 15:13:01', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 15:13:01', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('fc65247d-a0e4-11ea-9dc0-48f17f8d4d88', 'fc64a281-a0e4-11ea-9dc0-48f17f8d4d88', 'Strength', 'WT', 'AA5TT6', 'kg', '2020-05-28 15:13:13', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 15:13:13', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1);

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
('8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'John', 'Doe', 'test@mail.com', '12345', '07455221122', 3, '09c6bc58-1fe4-486f-ba18-3830592466f5', '09c6bc58-1fe4-486f-ba18-3830592466f5', '2020-05-25 19:16:58', 'sys', '2020-05-25 19:16:58', 'sys', 1),
('98bfc418-a099-11ea-94de-48f17f8d4d88', 'Ndumiso', 'Mthembu', 'mrnnmth3mu@gmail.com', '12345', '842529472', 5, NULL, 'a78af979672532bb4a40f70d5fdd19ac', '2020-05-28 06:13:34', 'sys', '2020-05-28 06:13:34', 'sys', 1),
('c0f051f1-a341-11ea-a04d-c8f7501047dc', 'Siya', 'Ncwana', 'siya@mail.com', '12345', '74658850154', 5, '132a953b-a342-11ea-a04d-c8f7501047dc', 'aeb05489f8db9450afbc01ab7399bd67', '2020-05-31 15:22:19', 'sys', '2020-05-31 15:24:37', 'sys', 9),
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
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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

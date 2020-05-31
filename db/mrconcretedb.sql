-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2020 at 11:06 AM
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
('4df9f570-9cd5-11ea-809b-48f17f8d4d88', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', 'The Willaim', 'Unit 510', 'Black 56', 'Fourways', '1245', '2020-05-23 11:10:53', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', '2020-05-23 12:11:52', 'de662467-9c4a-11ea-84a4-48f17f8d4d88', 1);

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
  `SubscriptionDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CancellationDate` date DEFAULT NULL,
  `CancellationReason` varchar(225) DEFAULT NULL,
  `IsProcessed` tinyint(1) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
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
  `ParentId` varchar(225) DEFAULT NULL,
  `CompanyType` varchar(50) DEFAULT NULL,
  `CompanyAddress` varchar(225) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyId`, `CompanyName`, `CompanyPhone`, `CompanyEmail`, `ParentId`, `CompanyType`, `CompanyAddress`, `City`, `PostalCode`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `IsDeleted`, `StatusId`) VALUES
('09c6bc58-1fe4-486f-ba18-3830592466f5', 'Test Company', '07466585421', 'test@company.co.za', '', 'HeadQuarters', 'Sandton 1 Press Street', 'Sandton', '2190', '2020-05-30 15:03:52', 'sys', '2020-05-30 15:03:52', 'sys', 0, 1),
('384d1113-a276-11ea-a04d-c8f7501047dc', 'Construction Wise', '07466585421', 'wise@construction.co.za', '', 'HeadQuarters', 'Umbilo Devenport', 'Durban', '2190', '2020-05-30 15:05:22', 'sys', '2020-05-30 15:05:22', 'sys', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `ImageId` varchar(225) NOT NULL,
  `CompanyId` varchar(225) NOT NULL,
  `OtherId` varchar(225) NOT NULL,
  `Url` text NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`ImageId`, `CompanyId`, `OtherId`, `Url`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('13e5efcb-a2be-11ea-a7b2-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590874784iio.jpg', '2020-05-30 23:39:44', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:39:44', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('41ae8e42-a2a6-11ea-a7b2-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590864553iio.jpg', '2020-05-30 20:49:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 20:49:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('5bfa97f7-a1c8-11ea-bf54-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'removed-ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590769249iio.jpg', '2020-05-29 18:20:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 2),
('6d1105ce-a167-11ea-8012-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'removed-6d1036c3-a167-11ea-8012-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590724264mrk.jpg', '2020-05-29 06:46:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:39:41', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 2),
('d5eff58a-a1d1-11ea-bf54-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590773319iio.jpg', '2020-05-29 19:28:39', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:28:39', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ecb84b0c-a0f4-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'removed-removed-ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590678434mrk.jpg', '2020-05-28 17:07:19', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 18:28:52', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 2),
('ecb89922-a0f4-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'removed-removed-ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590678437mrk.jpg', '2020-05-28 17:07:19', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 18:28:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 2),
('ed5efcc5-a31a-11ea-8323-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'removed-cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590914663iio.jpg', '2020-05-31 10:44:23', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:44:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 2),
('ee3140ac-a2bd-11ea-a7b2-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590874721iio.jpg', '2020-05-30 23:38:41', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:38:41', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('f1c057d4-a1c8-11ea-bf54-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'removed-ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'http://localhost:8200/mr-concrete-api/api/upload/uploads/1590769500iio.jpg', '2020-05-29 18:25:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:38:39', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 2);

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
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
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
('1d670d54-a30a-11ea-9ed4-48f17f8d4d88', '1d6645f3-a30a-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 08:44:02', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:44:02', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('23d9c693-a2c3-11ea-a7b2-48f17f8d4d88', '23d903b0-a2c3-11ea-a7b2-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('23da0d18-a2c3-11ea-a7b2-48f17f8d4d88', '23d903b0-a2c3-11ea-a7b2-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '3', 'each', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('23da50bf-a2c3-11ea-a7b2-48f17f8d4d88', '23d903b0-a2c3-11ea-a7b2-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '2', '', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 00:15:59', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('2baf4597-a2be-11ea-a7b2-48f17f8d4d88', '2baefb04-a2be-11ea-a7b2-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '3', 'each', '2020-05-30 23:40:24', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:40:24', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('2baf9d46-a2be-11ea-a7b2-48f17f8d4d88', '2baefb04-a2be-11ea-a7b2-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-30 23:40:24', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:40:24', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('2c6ab09b-a31d-11ea-8323-48f17f8d4d88', '2c69de2d-a31d-11ea-8323-48f17f8d4d88', 'c6d0a57e-a0ed-11ea-9dc0-48f17f8d4d88', 'Wooded board', '120', '3', 'M', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('2c6b2e2b-a31d-11ea-8323-48f17f8d4d88', '2c69de2d-a31d-11ea-8323-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:00:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('3fa25fb4-a2bd-11ea-a7b2-48f17f8d4d88', '3fa126dc-a2bd-11ea-a7b2-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-30 23:33:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:33:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('3fa33301-a2bd-11ea-a7b2-48f17f8d4d88', '3fa126dc-a2bd-11ea-a7b2-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-30 23:33:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:33:48', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('44fe8a88-a317-11ea-9ed4-48f17f8d4d88', '44fdb801-a317-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('44ff2098-a317-11ea-9ed4-48f17f8d4d88', '44fdb801-a317-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:18:12', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('499a4fa0-a30b-11ea-9ed4-48f17f8d4d88', '49999360-a30b-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 08:52:26', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:52:26', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('6033cf08-a313-11ea-9ed4-48f17f8d4d88', '6033184d-a313-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('60343d5c-a313-11ea-9ed4-48f17f8d4d88', '6033184d-a313-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('6034a691-a313-11ea-9ed4-48f17f8d4d88', '6033184d-a313-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('6034fe3c-a313-11ea-9ed4-48f17f8d4d88', '6033184d-a313-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '1', 'each', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:50:20', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('665a0db8-a309-11ea-9ed4-48f17f8d4d88', '665961c7-a309-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 08:38:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:38:55', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('774be3c2-a30a-11ea-9ed4-48f17f8d4d88', '774b2d51-a30a-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 08:46:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:46:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('894d6747-a30b-11ea-9ed4-48f17f8d4d88', '894cbb8a-a30b-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 08:54:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:54:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('894dc719-a30b-11ea-9ed4-48f17f8d4d88', '894cbb8a-a30b-11ea-9ed4-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '3', 'each', '2020-05-31 08:54:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:54:13', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
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
('be41562f-a30b-11ea-9ed4-48f17f8d4d88', 'be40b124-a30b-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 08:55:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:55:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('be41beed-a30b-11ea-9ed4-48f17f8d4d88', 'be40b124-a30b-11ea-9ed4-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 08:55:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:55:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('beed58a7-a312-11ea-9ed4-48f17f8d4d88', 'beec9895-a312-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '2', 'each', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('beedb0d2-a312-11ea-9ed4-48f17f8d4d88', 'beec9895-a312-11ea-9ed4-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '2', 'each', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:45:49', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('d3c50929-a300-11ea-9ed4-48f17f8d4d88', 'd3c4bdfe-a300-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 07:37:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 07:37:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('d3c5773f-a300-11ea-9ed4-48f17f8d4d88', 'd3c4bdfe-a300-11ea-9ed4-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '1', 'each', '2020-05-31 07:37:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 07:37:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('deba2bcd-a308-11ea-9ed4-48f17f8d4d88', 'deb995c3-a308-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 08:35:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 08:35:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e150304f-a31d-11ea-8323-48f17f8d4d88', 'e14eeda9-a31d-11ea-8323-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e15143ab-a31d-11ea-8323-48f17f8d4d88', 'e14eeda9-a31d-11ea-8323-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e1523146-a31d-11ea-8323-48f17f8d4d88', 'e14eeda9-a31d-11ea-8323-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e4c1ca8e-a31d-11ea-8323-48f17f8d4d88', 'e4c1237c-a31d-11ea-8323-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'BOSCH Cordless Glue Gun', '850', '3', 'each', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e4c23305-a31d-11ea-8323-48f17f8d4d88', 'e4c1237c-a31d-11ea-8323-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Tuftex Fluted Nails (25mm)', '48.2', '3', '', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('e4c272bc-a31d-11ea-8323-48f17f8d4d88', 'e4c1237c-a31d-11ea-8323-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '3', 'each', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ec495d76-a30c-11ea-9ed4-48f17f8d4d88', 'ec489c73-a30c-11ea-9ed4-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Newden Varnish - Light Oak (500ml)', '250', '1', 'each', '2020-05-31 09:04:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:04:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ec49b1c1-a30c-11ea-9ed4-48f17f8d4d88', 'ec489c73-a30c-11ea-9ed4-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', 'Hand Power Driller', '7.5', '2', 'each', '2020-05-31 09:04:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 09:04:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
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
  `DeliveryAddress` text DEFAULT NULL,
  `SpecialInstructions` text DEFAULT NULL,
  `Total` varchar(225) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
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
('e4c1237c-a31d-11ea-8323-48f17f8d4d88', 9, '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'na', '2020-05-21', '11:09', 'Hoff Events', '', '3444.6', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 11:05:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1);

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
  `UserId` varchar(225) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `ShortDescription` varchar(300) NOT NULL,
  `Description` text NOT NULL,
  `ProductCode` varchar(225) NOT NULL,
  `Price` varchar(10) NOT NULL,
  `Quantity` decimal(10,0) NOT NULL DEFAULT 0,
  `Units` varchar(100) NOT NULL DEFAULT 'each',
  `CategoryId` varchar(225) DEFAULT NULL,
  `CreateDate` datetime DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) DEFAULT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductId`, `UserId`, `ProductName`, `ShortDescription`, `Description`, `ProductCode`, `Price`, `Quantity`, `Units`, `CategoryId`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('012a43a4-a0e5-11ea-9dc0-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Cement 50kg', '', '', 'CN55', '100.50', '500', 'meter', '1', '2020-05-28 15:13:21', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 15:13:21', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('1fe9cfc2-a0d9-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Cemente  50kg', '', '', '', '100', '100', '', '23', '2020-05-28 13:48:19', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:29:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Tuftex Fluted Nails (25mm)', '', '', '25520', '48.2', '100', '', '21', '2020-05-28 13:49:33', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 21:36:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('50c4d519-a0f4-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Ponal Wood Glue 2 Litre', '', '', '324324', '250', '323', 'each', '2', '2020-05-28 17:02:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:36:58', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('50f4054b-a098-11ea-94de-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Ceiling board', '', '', 'CN55', '12.50', '150', 'meter', '1', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('5e5db9cf-a097-11ea-94de-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Ceiling board', '', '', 'CN55', '12.50', '150', 'meter', '1', '2020-05-28 05:57:37', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 05:57:37', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('63db9d4f-a0b9-11ea-b662-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Cement 50kg', '', '', 'CN55', '100.50', '500', 'meter', '1', '2020-05-28 10:01:09', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 10:01:09', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('6d1036c3-a167-11ea-8012-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Hand Power Driller', '', '', '', '7.5', '100', 'each', '2', '2020-05-29 06:46:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:39:52', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('71ba246f-a096-11ea-94de-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Ceiling board', 'Ceiling board', '', 'CN55', '12.50', '150', 'meter', '1', '2020-05-28 05:51:00', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 05:51:00', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('804f69cc-a0d9-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Ceillin board', '', '', '', '12.2', '5000', 'Metre', '', '2020-05-28 13:51:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 13:51:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('87b44a62-a096-11ea-94de-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Ceiling board', '', '', 'CN55', '12.50', '150', 'meter', '1', '2020-05-28 05:51:37', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 05:51:37', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('b58f9ee2-a095-11ea-94de-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Ceiling board', '', '', 'CN55', '12.50', '150', 'meter', '1', '2020-05-28 05:45:44', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 05:45:44', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('c6d0a57e-a0ed-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Wooded board', '', '', '', '120', '100000', 'M', '', '2020-05-28 16:16:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:16:08', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'Newden Varnish - Light Oak (500ml)', '', '', '', '250', '100', 'each', '21', '2020-05-29 18:45:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:44:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('d77f199a-a0e7-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'ee', 'ew', '', '', '232', '323', '', '', '2020-05-28 15:33:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 15:33:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ea5fd052-a0f0-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'test', '', '', '', '122', '21', '', '', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 'BOSCH Cordless Glue Gun', '', '', '', '850', '100', 'each', '', '2020-05-28 17:07:19', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:38:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('f532d991-a0e4-11ea-9dc0-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Cement 50kg', '', '', 'CN55', '100.50', '500', 'meter', '1', '2020-05-28 15:13:01', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 15:13:01', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('fc64a281-a0e4-11ea-9dc0-48f17f8d4d88', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 'Cement 50kg', '', '', 'CN55', '100.50', '500', 'meter', '1', '2020-05-28 15:13:13', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 15:13:13', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1);

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
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productproperty`
--

INSERT INTO `productproperty` (`ProductpropertyId`, `ProductId`, `Name`, `Code`, `Value`, `Units`, `CreateDate`, `CrateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('012ad0a1-a0e5-11ea-9dc0-48f17f8d4d88', '012a43a4-a0e5-11ea-9dc0-48f17f8d4d88', 'Strength', 'WT', 'AA5TT6', 'kph', '2020-05-28 15:13:21', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 15:13:21', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('3e9469b8-a1ce-11ea-bf54-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'sAS', '', 'SAsA', '', '2020-05-29 19:02:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:25:07', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 3),
('50c57f54-a0f4-11ea-9dc0-48f17f8d4d88', '50c4d519-a0f4-11ea-9dc0-48f17f8d4d88', 'Property 1', '', '', '', '2020-05-28 17:02:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:36:58', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('50c5cebd-a0f4-11ea-9dc0-48f17f8d4d88', '50c4d519-a0f4-11ea-9dc0-48f17f8d4d88', 'Property 2', '', '', '', '2020-05-28 17:02:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:36:58', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('50f45914-a098-11ea-94de-48f17f8d4d88', '50f4054b-a098-11ea-94de-48f17f8d4d88', 'Wood Type', 'WT', 'AA5TT6', '', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('50f4a768-a098-11ea-94de-48f17f8d4d88', '50f4054b-a098-11ea-94de-48f17f8d4d88', 'Wood Type', 'WT', 'AA5TT6', '', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', '2020-05-28 06:04:24', '45e50a75-9ec6-11ea-88a2-c8f7501047dc', 1),
('6d108842-a167-11ea-8012-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', '', '', '', '', '2020-05-29 06:46:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:39:52', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('6d10c5ee-a167-11ea-8012-48f17f8d4d88', '6d1036c3-a167-11ea-8012-48f17f8d4d88', '', '', '', '', '2020-05-29 06:46:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:39:52', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('861204d7-a1d1-11ea-bf54-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'qwq', '', 'eewe', '', '2020-05-29 19:26:25', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:26:31', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 3),
('86124b76-a1d1-11ea-bf54-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'ewqewqe', '', 'ewqewqe', '', '2020-05-29 19:26:25', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-29 19:26:32', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 3),
('c6d10559-a0ed-11ea-9dc0-48f17f8d4d88', 'c6d0a57e-a0ed-11ea-9dc0-48f17f8d4d88', 'Weigth', 'WT', '200kg', '', '2020-05-28 16:16:09', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:16:09', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('c6d15161-a0ed-11ea-9dc0-48f17f8d4d88', 'c6d0a57e-a0ed-11ea-9dc0-48f17f8d4d88', 'Width', 'WT', '1000m', '', '2020-05-28 16:16:09', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:16:09', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('cd3a740d-a1cb-11ea-bf54-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Mass Uplaod', '', '5510', '', '2020-05-29 18:45:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:44:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('cd3aae04-a1cb-11ea-bf54-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'Strength', '', '100', '', '2020-05-29 18:45:28', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:44:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('cfbec0a4-a1d1-11ea-bf54-48f17f8d4d88', '4c86de27-a0d9-11ea-9dc0-48f17f8d4d88', 'Mental', '', 'Steel', '', '2020-05-29 19:28:29', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 21:36:57', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('d77fca94-a0e7-11ea-9dc0-48f17f8d4d88', 'd77f199a-a0e7-11ea-9dc0-48f17f8d4d88', 'Wood Type', 'WT', 'AA5TT6', '', '2020-05-28 15:33:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 15:33:40', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('df8521f2-a31a-11ea-8323-48f17f8d4d88', 'cd3a2d7f-a1cb-11ea-bf54-48f17f8d4d88', 'T', '', '88', '', '2020-05-31 10:44:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-31 10:44:00', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ea604a5f-a0f0-11ea-9dc0-48f17f8d4d88', 'ea5fd052-a0f0-11ea-9dc0-48f17f8d4d88', 'Property 1', '', '2094', '', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ea60beaf-a0f0-11ea-9dc0-48f17f8d4d88', 'ea5fd052-a0f0-11ea-9dc0-48f17f8d4d88', 'Property 2', '', 'Nails', '', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-28 16:38:37', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ecb7cb17-a0f4-11ea-9dc0-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'Mass Uplaod', '', '5510556', '', '2020-05-28 17:07:19', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:38:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
('ecb81179-a0f4-11ea-9dc0-48f17f8d4d88', 'ecb6d1cf-a0f4-11ea-9dc0-48f17f8d4d88', 'Strength', '', '50000kpw', '', '2020-05-28 17:07:19', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', '2020-05-30 23:38:42', '8a4b9921-9eab-11ea-88a2-c8f7501047dc', 1),
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
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
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
  MODIFY `OrderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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

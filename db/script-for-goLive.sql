-- Scripts for role

CREATE TABLE `role` (
  `Id` int(5) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 

INSERT INTO `role` (`Id`, `RoleName`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(1, 'Admin', '2020-01-21 20:41:37', 'sys', '2020-01-21 20:41:37', 'sys', 1),
(2, 'Engineer', '2020-01-21 20:41:37', 'sys', '2020-01-21 20:41:37', 'sys', 1),
(3, 'Supplier', '2020-02-08 17:22:50', 'sys', '2020-02-08 17:22:50', 'sys', 1),
(4, 'Assistant', '2020-02-08 21:39:07', 'sys', '2020-02-08 21:39:07', 'sys', 1),
(5, 'Customer', '2020-05-25 18:46:37', 'sys', '2020-05-25 18:46:37', 'sys', 1),
(6, 'Driver', '2020-05-25 18:59:29', 'sys', '2020-05-25 18:59:29', 'sys', 1);




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

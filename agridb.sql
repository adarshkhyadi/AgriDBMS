-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2019 at 12:16 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agridb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user1` (IN `Fid` VARCHAR(255), IN `Fname` VARCHAR(255), IN `Frate` VARCHAR(255), IN `Firmname` VARCHAR(255), IN `cid` VARCHAR(255))  BEGIN
 insert into login_table (Fid,Fname,Frate,Firmname,cid) VALUES (Fid,Fname,Frate,Firmname,cid);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user2` (IN `Eid` VARCHAR(255), IN `Ename` VARCHAR(255), IN `Edescription` VARCHAR(255), IN `cid` VARCHAR(255))  BEGIN
 insert into login_table (Eid,Ename,Edescription,cid) VALUES (Eid,Ename,Edescription,cid);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_users` (IN `cid` VARCHAR(255), IN `cname` VARCHAR(255), IN `cmonth` VARCHAR(255), IN `ctype` VARCHAR(255), IN `cdescription` VARCHAR(255), IN `stype` VARCHAR(255))  BEGIN
 insert into login_table (cid,cname,cmonth,ctype,cdescription,stype) VALUES (cid,cname,cmonth,ctype,cdescription,stype);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `id` int(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`id`, `firstname`, `lastname`, `username`, `password`) VALUES
(1, 'abcd', 'xyz', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `crops`
--

CREATE TABLE `crops` (
  `cid` varchar(255) NOT NULL,
  `cname` varchar(255) NOT NULL,
  `cmonth` varchar(255) NOT NULL,
  `ctype` varchar(255) NOT NULL,
  `cdescription` varchar(255) NOT NULL,
  `stype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crops`
--

INSERT INTO `crops` (`cid`, `cname`, `cmonth`, `ctype`, `cdescription`, `stype`) VALUES
('1', 'wheat', 'june-Oct', 'Rabi', 'Wheat (species of Triticum) is a cereal grain. People eat it most often in the form of bread. It is a kind of grass whose fruit is a \"head of wheat\" with edible seeds', 'Loam'),
('2', 'Cotton', 'oct-nov', 'Khariff', 'Cotton is one of the most important fiber and cash crop of India and plays a dominant role in the industrial and agricultural economy.', 'Sandy'),
('3', 'Jute', 'oct-jan', 'Zaid', 'Jute requires 160-200 cm of rainfall weekly with extra needed during the sowing period. River basins or alluvial or loamy soils are best for jute cultivation', 'Clay/Sandy');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `Eid` varchar(255) NOT NULL,
  `Ename` varchar(255) NOT NULL,
  `Edescription` varchar(255) NOT NULL,
  `cid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`Eid`, `Ename`, `Edescription`, `cid`) VALUES
('100', 'salaki', 'Blade Material	Mild Steel\nHandle Material	Wooden', '2'),
('101', 'tractor', 'A tractor is a piece of farm equipment that is used to perform many jobs on the farm.  Some of these jobs are plowing, mowing, and harvesting crops.', '1');

-- --------------------------------------------------------

--
-- Table structure for table `fertilizers`
--

CREATE TABLE `fertilizers` (
  `Fid` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Frate` varchar(255) NOT NULL,
  `Firmname` varchar(255) NOT NULL,
  `cid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fertilizers`
--

INSERT INTO `fertilizers` (`Fid`, `Fname`, `Frate`, `Firmname`, `cid`) VALUES
('200', 'Boric Acid', '500.55', 'SPIC', '1');

-- --------------------------------------------------------

--
-- Table structure for table `login_table`
--

CREATE TABLE `login_table` (
  `id` int(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_table`
--

INSERT INTO `login_table` (`id`, `firstname`, `lastname`, `username`, `password`) VALUES
(1, 'abcdef', 'wxyz', 'user', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `crops`
--
ALTER TABLE `crops`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `fertilizers`
--
ALTER TABLE `fertilizers`
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `login_table`
--
ALTER TABLE `login_table`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `crops` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fertilizers`
--
ALTER TABLE `fertilizers`
  ADD CONSTRAINT `fertilizers_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `crops` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

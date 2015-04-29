-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2015 at 03:05 AM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `campus_map`;
use `campus_map`;

GRANT ALL ON `campus_map`.* to 'mapuser'@'localhost' identified by 'MinerMapper15!';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `campus_map`
--

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `ID` char(10) NOT NULL,
  `name` char(30) DEFAULT NULL,
  `floorCount` smallint(6) DEFAULT NULL,
  `defFloor` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `coordinates`
--

CREATE TABLE IF NOT EXISTS `coordinates` (
  `roomFlag` tinyint(1) DEFAULT NULL,
  `outdoorFlag` tinyint(1) DEFAULT NULL,
  `buildingID` char(10) NOT NULL,
  `roomID` char(10) NOT NULL,
  `latitude` float(15,15) NOT NULL,
  `longitude` float(15,15) NOT NULL,
  `pointOrder` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `ID` char(10) NOT NULL,
  `name` char(30) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `section` char(1) DEFAULT NULL,
  `instructor` char(30) NOT NULL,
  `roomID` char(10) NOT NULL,
  `days` binary(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE IF NOT EXISTS `instructors` (
  `fName` char(30) DEFAULT NULL,
  `lName` char(30) DEFAULT NULL,
  `dept` char(30) DEFAULT NULL,
  `office` char(5) DEFAULT NULL,
  `email` char(20) NOT NULL DEFAULT '',
  `phone` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `ID` char(10) NOT NULL,
  `buildingID` char (10) NOT NULL, 
  `number` char(5) NOT NULL,
  `floor` smallint(6) DEFAULT NULL,
  `seatCount` smallint(6) DEFAULT NULL,
  `leafletID` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `coordinates`
--
ALTER TABLE `coordinates`
  ADD PRIMARY KEY (`pointOrder`,`roomID`);
  
 
--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`ID`);
--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`ID`),
  ADD CONSTRAINT `room_1` FOREIGN KEY (`buildingID`) REFERENCES `buildings` (`ID`);

ALTER TABLE `coordinates`
  ADD CONSTRAINT `coordinates_ibfk_1` FOREIGN KEY (`buildingID`) REFERENCES `buildings` (`ID`),
  ADD CONSTRAINT `coordinates_ibfk_2` FOREIGN KEY (`roomID`) REFERENCES `rooms` (`ID`);

ALTER TABLE `events`
  ADD CONSTRAINT `event_1` FOREIGN KEY (`roomID`) REFERENCES `rooms` (`ID`),
  ADD CONSTRAINT `event_2` FOREIGN KEY (`instructor`) REFERENCES `instructors` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

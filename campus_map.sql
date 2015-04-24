-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2015 at 12:25 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

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

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`ID`, `name`, `floorCount`, `defFloor`) VALUES
('rolla', 'Rolla Building', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coordinates`
--

CREATE TABLE IF NOT EXISTS `coordinates` (
  `roomFlag` tinyint(1) DEFAULT NULL,
  `outdoorFlag` tinyint(1) DEFAULT NULL,
  `buildingID` char(10) NOT NULL,
  `roomID` char(10) NOT NULL,
  `latitude` float(10,5) NOT NULL,
  `longitude` float(10,5) NOT NULL,
  `pointOrder` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coordinates`
--

INSERT INTO `coordinates` (`roomFlag`, `outdoorFlag`, `buildingID`, `roomID`, `latitude`, `longitude`, `pointOrder`) VALUES
(1, 0, 'rolla', 'rG3', 37.95346, -91.77413, 3),
(1, 0, 'rolla', 'rG4', 37.95346, -91.77413, 3),
(1, 0, 'rolla', 'rG3', 37.95346, -91.77411, 2),
(1, 0, 'rolla', 'rG4', 37.95346, -91.77411, 2),
(1, 0, 'rolla', 'rG2', 37.95347, -91.77419, 3),
(1, 0, 'rolla', 'rG2', 37.95347, -91.77414, 2),
(1, 0, 'rolla', 'rG3', 37.95347, -91.77414, 5),
(1, 0, 'rolla', 'rG4', 37.95347, -91.77414, 5),
(1, 0, 'rolla', 'rG3', 37.95347, -91.77413, 4),
(1, 0, 'rolla', 'rG4', 37.95347, -91.77413, 4),
(1, 0, 'rolla', 'rG2', 37.95350, -91.77419, 0),
(1, 0, 'rolla', 'rG2', 37.95350, -91.77414, 1),
(1, 0, 'rolla', 'rG1', 37.95351, -91.77419, 5),
(1, 0, 'rolla', 'rG1', 37.95351, -91.77416, 2),
(1, 0, 'rolla', 'rGCR1', 37.95351, -91.77416, 4),
(1, 0, 'rolla', 'rGCR1', 37.95351, -91.77414, 3),
(1, 0, 'rolla', 'rgvt1', 37.95352, -91.77425, 6),
(1, 0, 'rolla', 'rgvt1', 37.95352, -91.77423, 3),
(1, 0, 'rolla', 'rgvt1', 37.95352, -91.77421, 4),
(1, 0, 'rolla', 'rG1', 37.95352, -91.77419, 0),
(1, 0, 'rolla', 'rG1', 37.95352, -91.77416, 1),
(1, 0, 'rolla', 'rG3', 37.95352, -91.77414, 0),
(1, 0, 'rolla', 'rG4', 37.95352, -91.77414, 0),
(1, 0, 'rolla', 'rG3', 37.95352, -91.77411, 1),
(1, 0, 'rolla', 'rG4', 37.95352, -91.77411, 1),
(1, 0, 'rolla', 'rGST2', 37.95352, -91.77401, 7),
(1, 0, 'rolla', 'rGST2', 37.95352, -91.77396, 6),
(1, 0, 'rolla', 'rGEV1', 37.95353, -91.77422, 5),
(1, 0, 'rolla', 'rGEV1', 37.95353, -91.77421, 4),
(1, 0, 'rolla', 'rGCR1', 37.95353, -91.77419, 6),
(1, 0, 'rolla', 'rGCR1', 37.95353, -91.77416, 5),
(1, 0, 'rolla', 'rGCR1', 37.95353, -91.77414, 2),
(1, 0, 'rolla', 'rGCR1', 37.95353, -91.77402, 1),
(1, 0, 'rolla', 'rGST2', 37.95353, -91.77399, 4),
(1, 0, 'rolla', 'rGST2', 37.95353, -91.77396, 5),
(1, 0, 'rolla', 'rGEV1', 37.95354, -91.77422, 6),
(1, 0, 'rolla', 'rgvt1', 37.95354, -91.77422, 2),
(1, 0, 'rolla', 'rGEV1', 37.95354, -91.77421, 3),
(1, 0, 'rolla', 'rGEV1', 37.95354, -91.77420, 2),
(1, 0, 'rolla', 'rG7', 37.95354, -91.77417, 5),
(1, 0, 'rolla', 'rG7', 37.95354, -91.77412, 4),
(1, 0, 'rolla', 'rGCR1', 37.95354, -91.77402, 0),
(1, 0, 'rolla', 'rGST2', 37.95354, -91.77399, 3),
(1, 0, 'rolla', 'rGST2', 37.95354, -91.77396, 2),
(1, 0, 'rolla', 'rgst1', 37.95355, -91.77425, 3),
(1, 0, 'rolla', 'rgvt1', 37.95355, -91.77425, 0),
(1, 0, 'rolla', 'rgst1', 37.95355, -91.77424, 2),
(1, 0, 'rolla', 'rGEV1', 37.95355, -91.77422, 0),
(1, 0, 'rolla', 'rgvt1', 37.95355, -91.77422, 1),
(1, 0, 'rolla', 'rGEV1', 37.95355, -91.77420, 1),
(1, 0, 'rolla', 'rGCR1', 37.95355, -91.77417, 9),
(1, 0, 'rolla', 'rG7A', 37.95355, -91.77411, 3),
(1, 0, 'rolla', 'rG7A', 37.95355, -91.77410, 2),
(1, 0, 'rolla', 'rG5', 37.95355, -91.77409, 5),
(1, 0, 'rolla', 'rG5', 37.95355, -91.77402, 4),
(1, 0, 'rolla', 'rG5A', 37.95355, -91.77401, 3),
(1, 0, 'rolla', 'rGST2', 37.95355, -91.77401, 0),
(1, 0, 'rolla', 'rGST2', 37.95355, -91.77396, 1),
(1, 0, 'rolla', 'rG5A', 37.95355, -91.77395, 2),
(1, 0, 'rolla', 'rgst1', 37.95356, -91.77425, 0),
(1, 0, 'rolla', 'rgjc1', 37.95356, -91.77423, 3),
(1, 0, 'rolla', 'rgst1', 37.95356, -91.77423, 1),
(1, 0, 'rolla', 'rgjc1', 37.95356, -91.77419, 2),
(1, 0, 'rolla', 'rG7', 37.95356, -91.77412, 3),
(1, 0, 'rolla', 'rG7', 37.95356, -91.77411, 2),
(1, 0, 'rolla', 'rG7A', 37.95356, -91.77411, 0),
(1, 0, 'rolla', 'rG5', 37.95356, -91.77410, 7),
(1, 0, 'rolla', 'rG7A', 37.95356, -91.77410, 1),
(1, 0, 'rolla', 'rG5', 37.95356, -91.77409, 6),
(1, 0, 'rolla', 'rgjc1', 37.95357, -91.77423, 0),
(1, 0, 'rolla', 'rgjc1', 37.95357, -91.77419, 1),
(1, 0, 'rolla', 'rG7', 37.95358, -91.77416, 0),
(1, 0, 'rolla', 'rGMT', 37.95358, -91.77416, 3),
(1, 0, 'rolla', 'rG7', 37.95358, -91.77411, 1),
(1, 0, 'rolla', 'rGMT', 37.95358, -91.77411, 2),
(1, 0, 'rolla', 'rg8', 37.95359, -91.77426, 3),
(1, 0, 'rolla', 'rg8', 37.95359, -91.77421, 2),
(1, 0, 'rolla', 'rG5A', 37.95359, -91.77401, 0),
(1, 0, 'rolla', 'rG5A', 37.95359, -91.77395, 1),
(1, 0, 'rolla', 'rGMT', 37.95361, -91.77417, 0),
(1, 0, 'rolla', 'rGwt', 37.95361, -91.77417, 5),
(1, 0, 'rolla', 'rGMT', 37.95361, -91.77411, 1),
(1, 0, 'rolla', 'rGwt', 37.95361, -91.77411, 4),
(1, 0, 'rolla', 'rg8', 37.95363, -91.77426, 0),
(1, 0, 'rolla', 'rg8', 37.95363, -91.77421, 1),
(1, 0, 'rolla', 'rGCR1', 37.95363, -91.77419, 7),
(1, 0, 'rolla', 'rGCR1', 37.95363, -91.77417, 8),
(1, 0, 'rolla', 'rGwt', 37.95363, -91.77416, 0),
(1, 0, 'rolla', 'rGwt', 37.95363, -91.77413, 1),
(1, 0, 'rolla', 'rG5', 37.95363, -91.77408, 2),
(1, 0, 'rolla', 'rG5', 37.95363, -91.77402, 3),
(1, 0, 'rolla', 'rGwt', 37.95364, -91.77413, 2),
(1, 0, 'rolla', 'rGwt', 37.95364, -91.77411, 3),
(1, 0, 'rolla', 'rG5', 37.95364, -91.77410, 0),
(1, 0, 'rolla', 'rG5', 37.95364, -91.77408, 1);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
`ID` smallint(6) NOT NULL,
  `name` char(30) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `section` char(1) DEFAULT NULL,
  `instructor` char(30) NOT NULL,
  `room` char(10) NOT NULL,
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
  `email` char(20) DEFAULT NULL,
  `phone` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `ID` char(10) NOT NULL,
  `number` char(5) NOT NULL,
  `floor` smallint(6) DEFAULT NULL,
  `seatCount` smallint(6) DEFAULT NULL,
  `leafletID` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`ID`, `number`, `floor`, `seatCount`, `leafletID`) VALUES
('rG1', 'G1', 1, 0, 0),
('rG2', 'G2', 1, 0, 0),
('rG3', 'G3', 1, 0, 0),
('rG4', 'G4', 1, 0, 0),
('rG5', 'G5', 1, 0, 0),
('rG5A', 'G5A', 1, 0, 0),
('rG7', 'G7', 1, 0, 0),
('rG7A', 'G7A', 1, 0, 0),
('rg8', ' g8', 1, 0, 0),
('rGCR1', 'GCR1', 1, 0, 0),
('rGEV1', 'GEV1', 1, 0, 0),
('rgjc1', 'gjc1', 1, 0, 0),
('rGMT', 'GMT', 1, 0, 0),
('rgst1', ' gst1', 1, 0, 0),
('rGST2', 'GST2', 1, 0, 0),
('rgvt1', 'gvt1', 1, 0, 0),
('rGwt', 'Gwt', 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `coordinates`
--
ALTER TABLE `coordinates`
 ADD PRIMARY KEY (`latitude`,`longitude`,`roomID`), ADD KEY `buildingID` (`buildingID`), ADD KEY `roomID` (`roomID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`ID`), ADD KEY `instructor` (`instructor`), ADD KEY `room` (`room`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
 ADD PRIMARY KEY (`email`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `coordinates`
--
ALTER TABLE `coordinates`
ADD CONSTRAINT `coordinates_ibfk_1` FOREIGN KEY (`buildingID`) REFERENCES `buildings` (`ID`),
ADD CONSTRAINT `coordinates_ibfk_2` FOREIGN KEY (`roomID`) REFERENCES `rooms` (`ID`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`instructor`) REFERENCES `instructors` (`email`),
ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`room`) REFERENCES `rooms` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
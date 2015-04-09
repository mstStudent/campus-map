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
(1, 0, 'rolla', 'G3', 37.95346, -91.77413, 3),
(1, 0, 'rolla', 'G4', 37.95346, -91.77413, 3),
(1, 0, 'rolla', 'G3', 37.95346, -91.77411, 2),
(1, 0, 'rolla', 'G4', 37.95346, -91.77411, 2),
(1, 0, 'rolla', 'G2', 37.95347, -91.77419, 3),
(1, 0, 'rolla', 'G2', 37.95347, -91.77414, 2),
(1, 0, 'rolla', 'G3', 37.95347, -91.77414, 5),
(1, 0, 'rolla', 'G4', 37.95347, -91.77414, 5),
(1, 0, 'rolla', 'G3', 37.95347, -91.77413, 4),
(1, 0, 'rolla', 'G4', 37.95347, -91.77413, 4),
(1, 0, 'rolla', 'G2', 37.95350, -91.77419, 0),
(1, 0, 'rolla', 'G2', 37.95350, -91.77414, 1),
(1, 0, 'rolla', 'G1', 37.95351, -91.77419, 5),
(1, 0, 'rolla', 'G1', 37.95351, -91.77416, 2),
(1, 0, 'rolla', 'GCR1', 37.95351, -91.77416, 4),
(1, 0, 'rolla', 'GCR1', 37.95351, -91.77414, 3),
(1, 0, 'rolla', 'gvt1', 37.95352, -91.77425, 6),
(1, 0, 'rolla', 'gvt1', 37.95352, -91.77423, 3),
(1, 0, 'rolla', 'gvt1', 37.95352, -91.77421, 4),
(1, 0, 'rolla', 'G1', 37.95352, -91.77419, 0),
(1, 0, 'rolla', 'G1', 37.95352, -91.77416, 1),
(1, 0, 'rolla', 'G3', 37.95352, -91.77414, 0),
(1, 0, 'rolla', 'G4', 37.95352, -91.77414, 0),
(1, 0, 'rolla', 'G3', 37.95352, -91.77411, 1),
(1, 0, 'rolla', 'G4', 37.95352, -91.77411, 1),
(1, 0, 'rolla', 'GST2', 37.95352, -91.77401, 7),
(1, 0, 'rolla', 'GST2', 37.95352, -91.77396, 6),
(1, 0, 'rolla', 'GEV1', 37.95353, -91.77422, 5),
(1, 0, 'rolla', 'GEV1', 37.95353, -91.77421, 4),
(1, 0, 'rolla', 'GCR1', 37.95353, -91.77419, 6),
(1, 0, 'rolla', 'GCR1', 37.95353, -91.77416, 5),
(1, 0, 'rolla', 'GCR1', 37.95353, -91.77414, 2),
(1, 0, 'rolla', 'GCR1', 37.95353, -91.77402, 1),
(1, 0, 'rolla', 'GST2', 37.95353, -91.77399, 4),
(1, 0, 'rolla', 'GST2', 37.95353, -91.77396, 5),
(1, 0, 'rolla', 'GEV1', 37.95354, -91.77422, 6),
(1, 0, 'rolla', 'gvt1', 37.95354, -91.77422, 2),
(1, 0, 'rolla', 'GEV1', 37.95354, -91.77421, 3),
(1, 0, 'rolla', 'GEV1', 37.95354, -91.77420, 2),
(1, 0, 'rolla', 'G7', 37.95354, -91.77417, 5),
(1, 0, 'rolla', 'G7', 37.95354, -91.77412, 4),
(1, 0, 'rolla', 'GCR1', 37.95354, -91.77402, 0),
(1, 0, 'rolla', 'GST2', 37.95354, -91.77399, 3),
(1, 0, 'rolla', 'GST2', 37.95354, -91.77396, 2),
(1, 0, 'rolla', 'gst1', 37.95355, -91.77425, 3),
(1, 0, 'rolla', 'gvt1', 37.95355, -91.77425, 0),
(1, 0, 'rolla', 'gst1', 37.95355, -91.77424, 2),
(1, 0, 'rolla', 'GEV1', 37.95355, -91.77422, 0),
(1, 0, 'rolla', 'gvt1', 37.95355, -91.77422, 1),
(1, 0, 'rolla', 'GEV1', 37.95355, -91.77420, 1),
(1, 0, 'rolla', 'GCR1', 37.95355, -91.77417, 9),
(1, 0, 'rolla', 'G7A', 37.95355, -91.77411, 3),
(1, 0, 'rolla', 'G7A', 37.95355, -91.77410, 2),
(1, 0, 'rolla', 'G5', 37.95355, -91.77409, 5),
(1, 0, 'rolla', 'G5', 37.95355, -91.77402, 4),
(1, 0, 'rolla', 'G5A', 37.95355, -91.77401, 3),
(1, 0, 'rolla', 'GST2', 37.95355, -91.77401, 0),
(1, 0, 'rolla', 'GST2', 37.95355, -91.77396, 1),
(1, 0, 'rolla', 'G5A', 37.95355, -91.77395, 2),
(1, 0, 'rolla', 'gst1', 37.95356, -91.77425, 0),
(1, 0, 'rolla', 'gjc1', 37.95356, -91.77423, 3),
(1, 0, 'rolla', 'gst1', 37.95356, -91.77423, 1),
(1, 0, 'rolla', 'gjc1', 37.95356, -91.77419, 2),
(1, 0, 'rolla', 'G7', 37.95356, -91.77412, 3),
(1, 0, 'rolla', 'G7', 37.95356, -91.77411, 2),
(1, 0, 'rolla', 'G7A', 37.95356, -91.77411, 0),
(1, 0, 'rolla', 'G5', 37.95356, -91.77410, 7),
(1, 0, 'rolla', 'G7A', 37.95356, -91.77410, 1),
(1, 0, 'rolla', 'G5', 37.95356, -91.77409, 6),
(1, 0, 'rolla', 'gjc1', 37.95357, -91.77423, 0),
(1, 0, 'rolla', 'gjc1', 37.95357, -91.77419, 1),
(1, 0, 'rolla', 'G7', 37.95358, -91.77416, 0),
(1, 0, 'rolla', 'GMT', 37.95358, -91.77416, 3),
(1, 0, 'rolla', 'G7', 37.95358, -91.77411, 1),
(1, 0, 'rolla', 'GMT', 37.95358, -91.77411, 2),
(1, 0, 'rolla', 'g8', 37.95359, -91.77426, 3),
(1, 0, 'rolla', 'g8', 37.95359, -91.77421, 2),
(1, 0, 'rolla', 'G5A', 37.95359, -91.77401, 0),
(1, 0, 'rolla', 'G5A', 37.95359, -91.77395, 1),
(1, 0, 'rolla', 'GMT', 37.95361, -91.77417, 0),
(1, 0, 'rolla', 'Gwt', 37.95361, -91.77417, 5),
(1, 0, 'rolla', 'GMT', 37.95361, -91.77411, 1),
(1, 0, 'rolla', 'Gwt', 37.95361, -91.77411, 4),
(1, 0, 'rolla', 'g8', 37.95363, -91.77426, 0),
(1, 0, 'rolla', 'g8', 37.95363, -91.77421, 1),
(1, 0, 'rolla', 'GCR1', 37.95363, -91.77419, 7),
(1, 0, 'rolla', 'GCR1', 37.95363, -91.77417, 8),
(1, 0, 'rolla', 'Gwt', 37.95363, -91.77416, 0),
(1, 0, 'rolla', 'Gwt', 37.95363, -91.77413, 1),
(1, 0, 'rolla', 'G5', 37.95363, -91.77408, 2),
(1, 0, 'rolla', 'G5', 37.95363, -91.77402, 3),
(1, 0, 'rolla', 'Gwt', 37.95364, -91.77413, 2),
(1, 0, 'rolla', 'Gwt', 37.95364, -91.77411, 3),
(1, 0, 'rolla', 'G5', 37.95364, -91.77410, 0),
(1, 0, 'rolla', 'G5', 37.95364, -91.77408, 1);

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
  `ID` char(30) NOT NULL,
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
('G1', 'G1', 1, 0, 0),
('G2', 'G2', 1, 0, 0),
('G3', 'G3', 1, 0, 0),
('G4', 'G4', 1, 0, 0),
('G5', 'G5', 1, 0, 0),
('G5A', 'G5A', 1, 0, 0),
('G7', 'G7', 1, 0, 0),
('G7A', 'G7A', 1, 0, 0),
('g8', ' g8', 1, 0, 0),
('GCR1', 'GCR1', 1, 0, 0),
('GEV1', 'GEV1', 1, 0, 0),
('gjc1', 'gjc1', 1, 0, 0),
('GMT', 'GMT', 1, 0, 0),
('gst1', ' gst1', 1, 0, 0),
('GST2', 'GST2', 1, 0, 0),
('gvt1', 'gvt1', 1, 0, 0),
('Gwt', 'Gwt', 1, 0, 0);

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
 ADD PRIMARY KEY (`ID`);

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
ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`instructor`) REFERENCES `instructors` (`ID`),
ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`room`) REFERENCES `rooms` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE DATABASE IF NOT EXISTS `campus_map`;
use `campus_map`; 

CREATE TABLE IF NOT EXISTS Buildings
(
	ID CHAR(10) NOT NULL,
	name CHARACTER(30),
	floorCount SMALLINT,
	defFloor SMALLINT,
	PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Rooms
(
	ID CHAR(10) NOT NULL,
	number CHARACTER(5) NOT NULL,
	floor SMALLINT,
	seatCount SMALLINT,
	leafletID  SMALLINT,
	PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Instructors
(
	ID CHAR(30) NOT NULL,
	fName CHARACTER(30),
	lName CHARACTER(30),
	dept CHARACTER(30),
	office CHARACTER(5) REFERENCES Rooms(number),
	email CHARACTER(20),
	phone CHARACTER(15),
	PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Coordinates
(
	roomFlag BOOLEAN,
	outdoorFlag BOOLEAN,
	buildingID CHARACTER(10) NOT NULL,
	roomID CHARACTER(10) NOT NULL,
	latitude FLOAT(10,5) NOT NULL,
	longitude FLOAT(10,5) NOT NULL,
	PRIMARY KEY (latitude, longitude,roomID),
	FOREIGN KEY (buildingID) REFERENCES Buildings(ID),
	FOREIGN KEY (roomID) REFERENCES Rooms(ID)
);

CREATE TABLE IF NOT EXISTS Events
(
	ID SMALLINT NOT NULL AUTO_INCREMENT,
	name CHARACTER(30),
	startDate DATE,
	endDate DATE,
	startTime TIME,
	endTime TIME,
	section CHARACTER(1),
	instructor char(30) NOT NULL,
	room char(10) NOT NULL,
	days BINARY(7),
	PRIMARY KEY (ID),
	FOREIGN KEY (instructor) REFERENCES Instructors(ID),
	FOREIGN KEY (room) REFERENCES Rooms(ID)
);
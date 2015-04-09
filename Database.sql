CREATE DATABASE IF NOT EXISTS `campus_map`;
use `campus_map`; 

CREATE TABLE IF NOT EXISTS Buildings
(
	ID SMALLINT NOT NULL AUTO_INCREMENT,
	name CHARACTER(30),
	floorCount SMALLINT,
	defFloor SMALLINT,
	PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Rooms
(
	ID SMALLINT NOT NULL AUTO_INCREMENT,
	number CHARACTER(5) NOT NULL,
	floor SMALLINT,
	seatCount SMALLINT,
	FOREIGN KEY (buildingID) REFERENCES Buildings(ID),
	leafletID  SMALLINT,
	PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Instructors
(
	ID SMALLINT NOT NULL AUTO_INCREMENT,
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
	buildingID SMALLINT NOT NULL,
	roomID SMALLINT NOT NULL,
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
	instructor SMALLINT NOT NULL,
	room SMALLINT NOT NULL,
	days BINARY(7),
	PRIMARY KEY (ID),
	FOREIGN KEY (instructor) REFERENCES Instructors(ID),
	FOREIGN KEY (room) REFERENCES Rooms(ID)
);

#Creating a Database MoviesTonight

CREATE Database `MoviesTonight`;

# Using this Database to start Creating tables.alter

USE `MoviesTonight`;

# Creating Tables for the Database
#Creating THEATER Table
Create Table `THEATER` (
`TID` int(11) Not Null auto_increment,
`Name`varchar(255) default Null,
Location varchar(255) default Null,
Phone varchar(12) default Null,
primary key(TID)
);

#Creating SHOW Table
Create Table `SHOW` (
SID int(11) Not Null auto_increment,
`ShowTime` Time,
MovieID int(11) default Null,
TheaterID int(11) default Null,
primary Key(SID)
);

#Creating MOVIE Table
Create Table `Movie` (
`MID` int(11) Not Null auto_increment,
Movie_Title varchar(60) Default Null,
Rating varchar(5) Default Null,
Primary Key (`MID`)
);

#Creating CREDIT Table
Create Table `CREDIT` ( 
`CID` int(11) Not Null auto_increment,
CCode char(1) default Null,
Primary Key (`CID`)
);

#Creating ARTIST Table
Create Table `ARTIST` ( 
`AID` int(11) Not Null auto_increment,
`Name`varchar(255) Default Null,
Primary Key (`AID`)
);

#Showing Tables
SHOW Tables;

#Adding the Column ArtistID to the Credit Table
ALTER TABLE `CREDIT`
ADD  column `ArtistID` int(11) default Null;

#Adding the Column CreditID to the Credit Table
ALTER Table `CREDIT`
ADD column `CreditID` int(11) default Null;


#  Adding FK TheaterID to the table SHOW from THEATER
ALTER TABLE `SHOW`
ADD foreign key (`TheaterID`) references `Theater`(`TID`);

#  Adding FK MovieID to the table SHOW from MOVIE
ALTER TABLE `SHOW`
ADD foreign key (`MovieID`) references `Movie`(`MID`);

#  Adding FK CREDITID to the table CREDIT from MOVIE
ALTER TABLE `CREDIT`
ADD foreign key (`CreditID`) references `Movie`(`MID`);

#  Adding FK CREDITID1 to the table CREDIT from ARTIST
ALTER TABLE `CREDIT`
ADD foreign key (`ArtistID`) references `ARTIST`(`AID`);












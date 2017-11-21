#Creating the Database for the Movies Tonight
#If exists drop table 

CREATE database `MoviesTonight`;
USE `MoviesTonight`;


# Creating Tables for the Database
Create Table `THEATER` (
TID int(11) Not Null auto_increment,
`Name`varchar(20) default Null,
Location varchar(50) default Null,
Phone int(11) default Null,
primary key(TID)
);


Create Table `SHOW` (
SID int(11) Not Null auto_increment,
`ShowTime` Time,
MovieID int(11) default Null,
TheaterID int(11) default Null,
primary Key(SID)
);

Create Table `Movie` (
`MID` int(11) Not Null auto_increment,
Movie_Title varchar(20) Default Null,
Rating char(20) Default Null,
Primary Key (`MID`)
);


Create Table `ARTIST` ( 
`AID` int(11) Not Null auto_increment,
`Name`char(20) Default Null,
Primary Key (`AID`)
);





Create Table `CREDIT` ( 
`CID` int(11) Not Null auto_increment,
CCode Char(20) default Null,
Primary Key (`CID`)
);

Show Tables;
Describe THEATER;

#  Adding FK RoleCode to the table SHOW from THEATER
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
ADD foreign key (`CreditID1`) references `ARTIST`(`AID`);









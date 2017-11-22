#Using the Database MoviesTonight after running the Datasheet Query
Use `moviestonight`;

#Inserting Into Movie Table the contents from Datasheet 
INSERT INTO Movie(Movie_Title,Rating)
SELECT DISTINCT MTitle,Rating
FROM DATASHEET;

#Inserting Into Theater Table the contents from Datasheet  
INSERT INTO Theater(`Name`,Location,Phone)
SELECT DISTINCT `TName`,Location,Phone
FROM DATASHEET;

#Inserting into Artist Table the contents from Datasheet 
INSERT INTO Artist(`Name`)
SELECT DISTINCT CName
FROM DATASHEET;

#Inserting into Show from Datasheet using the Join Statements (Foreign Keys : Weak Entities)
INSERT INTO `Show`(ShowTime,MovieID,TheaterID)
SELECT DISTINCT ShowTime, movie.`MID`, theater.`TID`
FROM movie JOIN DATASHEET ON (DATASHEET.MTitle = movie.Movie_Title)
			JOIN Theater ON (Theater.`Name` = DATASHEET.TName);

#Inserting into Credit from Datasheet using the Join statements (Foreign Keys : Weak Entities)           
INSERT INTO `Credit`(CCode,CreditID,ArtistID)           
SELECT DISTINCT CCode,movie.`MID`,Artist.`AID`
FROM Movie JOIN DATASHEET ON (DATASHEET.MTitle=movie.Movie_Title)
			JOIN Artist ON (DATASHEET.CName = Artist.`Name`);
            
#Identifying the duplicate values in the original Soource file DATASHEET            
SELECT MTitle,Tname,ShowTime,CCode,CName,Count(1) as CNT 
FROM DATASHEET
Group BY MTitle,Tname,ShowTime,CCode,CName
Having Count(1) > 1 
;
     
# Dropping the DATASHEET Table
Drop Table DATASHEET;
       

DROP DATABASE if exists summerys_cinemate;
CREATE DATABASE summerys_cinemate;
USE summerys_cinemate;

CREATE TABLE Genres (
	genreID int(11) primary key not null auto_increment,
	genre varchar(25) not null
);

CREATE TABLE Actions (
	actionID int(11) primary key not null auto_increment,
    action_ varchar(25) not null
);

CREATE TABLE Movies (
	movieID int(11) primary key not null auto_increment,
	title varchar(100) not null,
    director varchar (50) not null,
    image varchar(100) not null default '',
    year_ int(5) not null,
    description varchar(200) not null
);

CREATE TABLE Movies_Genre(
	moviegenreID int(11) primary key not null auto_increment,
    movieID int(11) not null,
    genreID int(11) not null,
    FOREIGN KEY fk1(movieID) REFERENCES Movies (movieID),
    FOREIGN KEY fk2(genreID) REFERENCES Genres (genreID)
);


CREATE TABLE Writers(
	writerID int(11) primary key not null auto_increment,
    writer varchar (50) not null
);

CREATE TABLE Movies_Writer(
	moviewriterID int(11) primary key not null auto_increment,
    movieID int(11) not null,
    writerID int (11) not null,
    FOREIGN KEY fk1(movieID) REFERENCES Movies(movieID),
    FOREIGN KEY fk2(writerID) REFERENCES Writers(writerID)
);

CREATE TABLE Actors(
	actorID int(11) primary key not null auto_increment,
    fname varchar (50) not null,
    lname varchar (50) not null,
    image varchar (100) not null default ''
);

CREATE TABLE Users(
	userID int(11) primary key not null auto_increment,
    username varchar(50) not null,
    password_  varchar(50) not null,
    fname varchar (50) not null,
    lname varchar (50) not null,
    image varchar (100) not null default ''
);

CREATE TABLE Movies_Actor(
	movieactorID  int(11) primary key not null auto_increment,
    movieID int(11) not null,
    actorID int(11) not null,
	FOREIGN KEY fk1(movieID) REFERENCES movies(movieID),
    FOREIGN KEY fk2(actorID) REFERENCES actors(actorID)
);

CREATE TABLE UserFollowing(
	UserFollowingID int(11) primary key not null auto_increment,
    userID int(11) not null,
    followingUserID int(11) not null,
    FOREIGN KEY fk1(userID) REFERENCES Users(userID),
    FOREIGN KEY fk2(followingUserID) REFERENCES Users(userID)
);

CREATE TABLE FeedEvent(
	FeedEventID int(11) primary key not null auto_increment,
    userID int(11) not null,
    movieID int(11) not null,
    actionID int(11) not null,
	rating float(53) not null,
	FOREIGN KEY fk1(userID) REFERENCES Users(userID),
    FOREIGN KEY fk2(movieID) REFERENCES Movies(movieID),
    FOREIGN KEY fk3(actionID) REFERENCES Actions(actionID)
);

INSERT INTO Genres (genre) VALUES 
('Animated'), ('Drama'), ('Action'), ('Comedy'), ('Romance'),('Triller');

INSERT INTO Actions (action_)  VALUES 
('Watched'), ('Liked'), ('Disliked'), ('Rated');

INSERT INTO Movies (title, director, image, year_, description) VALUES 
('Big', 'Penny Marshall', 'http://www.imdb.com/title/tt0094737/mediaviewer/rm3897482752', '1988', 'After wishing to be made big, a teenage boy wakes the next morning to find himself mysteriously in the body of an adult.'),
('biG', 'Penny Marshall', 'http://www.imdb.com/title/tt0094737/mediaviewer/rm3897482752', '1988', 'After wishing to be made big, a teenage boy wakes the next morning to find himself mysteriously in the body of an adult.'),
('How to Train Your Dragon', 'Dean DeBlois', '', '2010', 'A hapless young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and learns there may be more to the creatures than he assumed.'),
('12 Years a Slave', 'Steve McQueen', '', '2013', 'In the antebellum United States, Solomon Northup, a free black man from upstate New York, is abducted and sold into slavery.'),
('Sleepless In Seattle', 'Nora Ephron','', '1993', 'A recently widowed mans son calls a radio talk-show in an attempt to find his father a partner.' ),
('Shutter Island', 'Martin Scorsese','', '2010', 'a U.S. marshal investigates the disappearance of a murderess who escaped from a hospital for the criminally insane.'),
('Monty Python and the Holy Grail', 'Terry Gilliam','', '1975', 'King Arthur and his knights embark on a low-budget search for the Grail, encountering many, very silly obstacles.' ),
('Dirty Rotten Scoundrels',  'Frank Oz','', '1988', 'Two con men try to settle their rivalry by betting on who can swindle a young American heiress out of $50,000 first.');

INSERT INTO Movies_Genre(movieID, genreID) VALUES 
(1,5), (2,5), (3,1), (4,2), (5,6), (6,2), (7,2), (8,5);

INSERT INTO Writers (writer) VALUES 
('Gary Ross'), ('Anne Spielberg'), ('Dean DeBlois'), ('William Davies'), ('Chris Sanders'),
('Solomon Northup'), ('John Ridley'), ('Nora Ephron'), ('Jeff Arch'), ('Laeta Kalogridis'),
('Dennis Lehane'), ('Graham Chapman'), ('John Cleese'), ('Eric Idle'), ('Terry Gilliam'),
('Dale Launer'), ('Stanley Shapiro'), ('Paul Henning');

INSERT INTO Movies_Writer(movieID, writerID) VALUES 
(1, 1), (1, 2), (2, 1),(2, 2), (3, 3), (3, 4), (3, 5), (4, 6), (4, 7), (5, 8), (5, 9), (6, 10), 
(6, 11), (7, 12), (7, 13), (7, 14),(7, 15), (8, 16), (8, 17), (8, 18);

INSERT INTO Actors (fname, lname, image) VALUES
('Tom', 'Hanks', ''), ('Elizabeth', 'Perkins' , ''), ('Gerard', 'Butler' , ''), ('Jay', 'Baruchel' , ''), ('Chiwetel', 'Ejiofor' , ''),
('Michael', 'Fassbender' , ''), ('Meg', 'Ryan', ''), ('Emily', 'Mortimer', ''), ('Mark', 'Ruffalo', ''), ('Graham', 'Chapman', ''),
('John', 'Cleese', ''), ('Eric', 'Idle', ''), ('Steve', 'Martin', ''), ('Michael', 'Caine', ''), ('Glenne', 'Headly', '');

INSERT INTO Movies_Actor(movieID, actorID) VALUES
(1,1), (1,2), (2,1), (2,2), (3,3), (3,4), (4,5), (4,6), (5,1), (5,7), (6,8),
(6,9), (7,10), (7,11), (7,12), (8,13), (8,14), (8,15);


INSERT INTO Users(username, password_, fname, lname, image) VALUES
('tester', 'test', 'Testy', 'Tester' , ''),
('jmiller', 'jmiller', 'Jeffery', 'Miller', ''),
('knguyen', 'knguyen', 'Kien', 'Nguyen', 'http://www-scf.usc.edu/~csci201/images/kien_nguyen.jpg'),
('mshindler', 'mshindler', 'Michael', 'Shindler', ''),
('acote', 'acote', 'Aaron', 'Cote',''),
('jeff', 'jeff', 'NotJeff', 'NotJeff',''),
('summer', 'summer', 'Summer', 'Seo',''),
('jeff1', 'jeff1', 'Jeff', 'NotJeff',''),
('dkempe', 'dkempe', 'David', 'Kempe',''),
('atu', 'atu', 'Antony', 'Tu','');


INSERT INTO UserFollowing(userID, followingUserID) VALUES
(1,2), (1,9), (3,1), (3,2),(4,5),(4,9), (5,4),(5,3),(6,4),(6,3),(6,8),(7,1), (7,2),(8,4),
(8,5),(9,1),(9,2),(9,3),(9,4), (9,5),(9,6),(10,1),(10,2),(10,3);

INSERT INTO FeedEvent(userID, movieID, actionID, rating) VALUES
(1, 8, 2, -1), (1, 6, 4, 3.0), (2, 8, 4, 3.0), (3, 7, 2, -1), (5, 3, 1, -1), (1, 5, 4, 5.0), (2, 3, 4, 5.0), (3, 1, 2, -1), (4, 4, 3, -1);


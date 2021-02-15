CREATE DATABASE Movies

-- Directors (Id, DirectorName, Notes)
CREATE TABLE Directors
(
Id INT PRIMARY KEY IDENTITY, 
DirectorName VARCHAR (60) NOT NULL,
Notes VARCHAR (MAX) NULL
)

-- Genres (Id, GenreName, Notes)

CREATE TABLE Genres
(
Id INT PRIMARY KEY IDENTITY, 
GenreName VARCHAR (60) NOT NULL,
Notes VARCHAR (MAX) NULL
)

-- Categories (Id, CategoryName, Notes)
CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY, 
Categories VARCHAR (200) NOT NULL,
Notes VARCHAR (MAX) NULL
)




INSERT INTO Directors (DirectorName, Notes) VALUES
('Stamat','good'),
('Pesho','excellent'),
('Dimitrichko','great'),
('Stamat','very good'),
('Gosho','poor')

INSERT INTO Genres (GenreName, Notes) VALUES
('Drama','Love story'),
('Horror','Zombie'),
('Thriller','Mistery'),
('Action','Karate'),
('Comedy','Family')

INSERT INTO Categories (Categories, Notes) VALUES
('+18',NULL),
('+12',NULL),
('0',NULL),
('+15',NULL),
('+6',NULL)


-- Movies (Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
CREATE TABLE Movies
(
Id INT PRIMARY KEY IDENTITY, 
Title VARCHAR (200) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear DATETIME NOT NULL,
Lenght INT NOT NULL,
GenreId INT NOT NULL,
CategoryId INT NOT NULL, 
Rating INT NOT NULL, 
Notes VARCHAR (MAX) NULL
)
ALTER TABLE Movies
ADD FOREIGN KEY (DirectorId) REFERENCES Directors(Id)
ALTER TABLE Movies
ADD FOREIGN KEY (GenreId) REFERENCES Genres(Id)
ALTER TABLE Movies 
ADD FOREIGN KEY (CategoryID) REFERENCES Categories(Id)

INSERT INTO Movies(Title, DirectorId, CopyrightYear, Lenght, GenreId, CategoryId, Rating, Notes) VALUES
('What a movie',3, 2019-12-09, 234, 5, 4, 7, 'Amazing'),
('Walking death',5, 2007-12-09, 234, 2, 2, 6, 'Amazing'),
('Zombie attacks',4, 1978-12-09, 234, 2, 2, 10, 'Amazing'),
('Love is...',2, 1944-12-09, 234, 5, 3, 1, 'Amazing'),
('Strike the goverment',3, 2006-12-09, 234, 5, 3, 10, 'Amazing')
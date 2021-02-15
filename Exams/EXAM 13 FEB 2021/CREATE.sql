CREATE DATABASE Bitbucket

CREATE TABLE Users
(
Id INT PRIMARY KEY IDENTITY,
Username VARCHAR (30) NOT NULL,
Password VARCHAR (30) NOT NULL,
Email  VARCHAR (50)NOT NULL
)

CREATE TABLE Repositories
(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR (50) NOT NULL
)

CREATE TABLE RepositoriesContributors
(
RepositoryId INT FOREIGN KEY REFERENCES Repositories(Id) NOT NULL,
ContributorId INT FOREIGN KEY REFERENCES Users(Id) NOT NULL,
CONSTRAINT Repositories_Contributors PRIMARY KEY (RepositoryId,ContributorId)
)

CREATE TABLE Issues
(
Id INT PRIMARY KEY IDENTITY,
Title VARCHAR (MAX) NOT NULL,
IssueStatus CHAR(6) NOT NULL,
RepositoryId INT FOREIGN KEY REFERENCES Repositories(Id) NOT NULL,
AssigneeId INT FOREIGN KEY REFERENCES Users(Id) NOT NULL
)

CREATE TABLE Commits
(
Id INT PRIMARY KEY IDENTITY,
Message VARCHAR (MAX) NOT NULL,
IssueId INT FOREIGN KEY REFERENCES Issues(Id),
RepositoryId INT FOREIGN KEY REFERENCES Repositories (Id) NOT NULL,
ContributorId INT FOREIGN KEY REFERENCES Users(Id) NOT NULL
)

CREATE TABLE Files
(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR (100) NOT NULL,
Size DECIMAL (18,2) NOT NULL,
ParentId INT REFERENCES Files(Id),
CommitId INT FOREIGN KEY REFERENCES Commits(Id) NOT NULL
)

-- PROBLEM 2. INSERT

INSERT INTO Files (Name,Size,ParentId,CommitId) VALUES
('Trade.idk',2598.0,1,1),
('menu.net',9238.31,2,2),
('Administrate.soshy',1246.93,3,3),
('Controller.php',7353.15,4,4),
('Find.java',9957.86,5,5),
('Controller.json',14034.87,3,6),
('Operate.xix',7662.92,	7,7)

INSERT INTO Issues (Title,IssueStatus,RepositoryId,AssigneeId) VALUES
('Critical Problem with HomeController.cs file','open',	1, 4),
('Typo fix in Judge.html','open', 4, 3),
('Implement documentation for UsersService.cs','closed', 8, 2),
('Unreachable code in Index.cs','open',	9, 8)


-- PROBLEM 3. UPDATE

UPDATE Issues SET IssueStatus = 'closed'
WHERE AssigneeId = 6


-- PROBLEM 4. DELETE 
-- Delete repository "Softuni-Teamwork" in repository contributors and issues.

DELETE FROM Issues
WHERE RepositoryId = (SELECT Repositories.Id FROM Repositories WHERE Name = 'Softuni-Teamwork')
DELETE FROM RepositoriesContributors
where RepositoryId = (select Repositories.Id from Repositories where Name = 'Softuni-Teamwork')

DROP DATABASE Bitbucket
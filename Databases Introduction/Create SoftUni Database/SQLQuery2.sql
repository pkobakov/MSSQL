
CREATE TABLE Towns 
(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR (20) NOT NULL
)

INSERT INTO Towns VALUES 
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

CREATE TABLE Addresses 
(
Id INT PRIMARY KEY IDENTITY,
AddressText VARCHAR(70)NOT NULL, 
TownId INT NOT NULL
)

INSERT INTO Addresses VALUES
('Vitoshka', 1),
('Bulgaria', 2),
('Varna', 3),
('Yavorov', 4)

CREATE TABLE Departments
(
Id INT PRIMARY KEY IDENTITY,
[Name]  VARCHAR (50) NOT NULL
)
INSERT INTO Departments VALUES 
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')


CREATE TABLE Employees
(
Id INT PRIMARY KEY IDENTITY,
FirstName VARCHAR (20) NOT NULL,
MiddleName VARCHAR (20) NOT NULL,
LastName VARCHAR (20) NOT NULL,
JobTitle VARCHAR (20) NOT NULL,
DepartmentId INT NOT NULL,
HireDate DATETIME NOT NULL,
Salary DECIMAL (15,2) NOT NULL,
AddressId INT NOT NULL
)

INSERT INTO Employees VALUES
('Ivan','Ivanov','Ivanov','.NET Developer', 4,'2013/02/01',3500.00,1),
('Petar',' Petrov',' Petrov', 'Senior Engineer', 1, '2004/04/02',4000.00, 3),
('Maria',' Petrova','Ivanova','Intern', 5, '2016/08/28',525.25, 2),
('Georgi',' Teziev',' Ivanov','CEO', 2, '2007/12/09', 3000.00, 1),
('Peter','Pan',' Pan','Intern', 3, '2016/08/28', 599.88, 4)

SELECT* FROM Towns
SELECT* FROM Departments
SELECT* FROM Employees


SELECT [Name] FROM Towns ORDER BY [Name]
SELECT [Name] FROM Departments ORDER BY [Name]
SELECT  FirstName, LastName, JobTitle, Salary FROM Employees ORDER BY Salary DESC 

UPDATE Employees SET Salary = Salary*1.1
SELECT Salary FROM Employees



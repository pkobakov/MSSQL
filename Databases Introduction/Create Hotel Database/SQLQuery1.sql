CREATE DATABASE Hotel
CREATE TABLE Employees
(
Id INT PRIMARY KEY IDENTITY,
FirstName VARCHAR (10) NULL,
LastName VARCHAR (10) NULL,
Title VARCHAR (20) NOT NULL,
Notes VARCHAR (MAX) NULL
)

CREATE TABLE Customers
(
AccountNumber INT PRIMARY KEY,
FirstName VARCHAR (20) NULL,
LastName VARCHAR (20) NULL,
PhoneNumber VARCHAR (10) NULL,
EmergencyName VARCHAR (10) NULL,
EmergencyNumber VARCHAR (10) NULL, 
Notes VARCHAR (MAX) NULL)

CREATE TABLE RoomStatus 
(

RoomStatus VARCHAR (20) NULL,
Notes VARCHAR (50) NULL
)

CREATE TABLE RoomTypes 
(

RoomType VARCHAR (30) ,
Notes VARCHAR (100) NULL
)

CREATE TABLE BedTypes 
(
BedType VARCHAR (15),
Notes VARCHAR (20) NULL
)

CREATE TABLE Rooms
(
RoomNumber INT PRIMARY KEY, 
RoomType VARCHAR (20) NOT NULL , 
BedType VARCHAR (20) NOT NULL, 
Rate INT NULL, 
RoomStatus BIT NOT NULL, 
Notes VARCHAR (100) NULL
)

CREATE TABLE Payments 
(
Id INT PRIMARY KEY, 
EmployeeId INT NOT NULL, 
PaymentDate DATETIME NOT NULL, 
AccountNumber INT NOT NULL, 
FirstDateOccupied DATETIME NOT NULL, 
LastDateOccupied DATETIME NOT NULL, 
TotalDays INT NOT NULL, 
AmountCharged DECIMAL (15,2) NOT NULL, 
TaxRate INT NULL, 
TaxAmount INT NULL, 
PaymentTotal DECIMAL (15,2), 
Notes VARCHAR (MAX) NULL
)

CREATE TABLE Occupancies
(
Id INT PRIMARY KEY, 
EmployeeId INT NOT NULL, 
DateOccupied DATETIME NOT NULL, 
AccountNumber INT NOT NULL, 
RoomNumber INT NOT NULL, 
RateApplied INT NULL, 
PhoneCharge DECIMAL (10,2) NULL, 
Notes VARCHAR (MAX) NOT NULL
)

-- Id, FirstName, LastName, Title, Notes
INSERT INTO Employees VALUES
('PEPE', 'PEPE', 'KOKO', NULL),
('MIMI', 'MIMI', 'KAKA', NULL),
('DIDI', 'DIDI', 'KUKU', NULL)


-- AccountNumber, FirstName, LastName, 
-- PhoneNumber, EmergencyName, EmergencyNumber, Notes
INSERT INTO Customers VALUES
(1, 'PESHO', 'PESHOV', '0888554433', NULL, NULL,NULL),
(2, 'GOGO', 'GOGOV', '0888335588' , NULL, NULL,NULL),
(3, 'DIMO', 'DIMOV', '0878667744', NULL, NULL, NULL)


-- RoomStatus, Notes
INSERT INTO RoomStatus VALUES
('CLEAN', 'YES'),
('VACANT', 'YES'),
('BOOKED', 'NO')


-- RoomType, Notes
INSERT INTO RoomTypes VALUES
('LUX', NULL),
('SEA VIEW', NULL),
('GARDEN VIEW', NULL)


-- BedType, Notes
INSERT INTO BedTypes VALUES
('DOUBLE', 'DELUX'),
('SINGLE', 'STANDART'),
('APARTMENT', 'DELUX')


-- RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes
INSERT INTO Rooms VALUES
(1, 'DELUX', 'SINGLE', NULL, 1, NULL),
(2, 'STANDART', 'SINGLE', NULL, 0, NULL),
(3, 'STANDART', 'SINGLE', NULL, 1, NULL)


-- Id, EmployeeId, PaymentDate, AccountNumber, 
-- FirstDateOccupied, LastDateOccupied, TotalDays,
-- AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes
INSERT INTO Payments VALUES
(1,1, '2021/12/04', 1, '2021/12/12', '2021/12/23',  11, 343, NULL, NULL, NULL, NULL ),
(2,2, '2021/12/04', 1, '2021/12/12', '2021/12/23',  11, 343, NULL, NULL, NULL, NULL ),
(3,3,'2021/12/04', 1, '2021/12/12', '2021/12/23',  11, 343, NULL, NULL, NULL, NULL )


-- Id, EmployeeId, DateOccupied, AccountNumber, 
-- RoomNumber, RateApplied, PhoneCharge, Notes
INSERT INTO Occupancies VALUES
(1,1, '2021/03/22', 12, 123, NULL, 34.6, 'YES'), 
(2,2,'2021/03/22', 12, 123, NULL, 34.6, 'YES'), 
(3,3,'2021/03/22', 12, 123, NULL, 34.6, 'YES')



DELETE FROM BedTypes
DELETE FROM Customers
DELETE FROM Employees
DELETE FROM Occupancies
DELETE FROM Payments
DELETE FROM Rooms
DELETE FROM RoomStatus
DELETE FROM RoomTypes

UPDATE Payments SET TaxRate = TaxRate*0.97
SELECT TaxRate FROM Payments

DELETE FROM Occupancies
CREATE DATABASE CarRental
-- Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY, 
CategoryName VARCHAR (50) NOT NULL,
DailyRate DECIMAL NULL,
WeeklyRate DECIMAL NOT NULL,
MonthlyRate DECIMAL NOT NULL,
WeekendRate DECIMAL NOT NULL
)
-- Cars (Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
CREATE TABLE Cars
(Id INT PRIMARY KEY IDENTITY,
 PlateNumber INT NOT NULL,
 Manufacturer VARCHAR (40) NOT NULL,
 Model VARCHAR (40) NOT NULL, 
 CarYear INT NOT NULL,
 CategoryId INT NOT NULL, 
 Doors INT NOT NULL,
 Picture VARCHAR(MAX) NULL,
 Condition VARCHAR (20) NOT NULL,
 Available CHAR NOT NULL
)

ALTER TABLE Cars 
ADD FOREIGN KEY (CategoryId) REFERENCES Categories(Id)

-- Employees (Id, FirstName, LastName, Title, Notes)
CREATE TABLE Employees
(
Id INT PRIMARY KEY IDENTITY,
FirstName VARCHAR (20) NULL, 
LastName VARCHAR (20) NULL,
Title VARCHAR (20) NULL, 
Notes VARCHAR (MAX) NULL
)

-- Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
CREATE TABLE Customers
(
Id INT PRIMARY KEY IDENTITY,
DriverLicenceNumber VARCHAR (50)  NULL, 
FullName VARCHAR (60) NULL,
[Address] VARCHAR (80) NULL,
City VARCHAR (80) NULL,
ZIPCode INT NULL,
Notes VARCHAR (MAX) NULL
)
-- RentalOrders (Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
CREATE TABLE RentalOrders
(
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT NOT NULL, 
CustomerId INT NOT NULL,
CarId INT NOT NULL,
TankLevel VARCHAR (80) NULL,
KilometrageStart INT NOT NULL,
KilometrageEnd INT NOT NULL,
TotalKilometrage INT NOT NULL
)

ALTER TABLE RentalOrders
ADD FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
ALTER TABLE RentalOrders
ADD FOREIGN KEY (CustomerId)REFERENCES Customers(Id)
ALTER TABLE RentalOrders
ADD FOREIGN KEY (CarId)REFERENCES Cars(Id)



INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
   ('Minivan', 45, 350, 1200, 50),
   ('Car', 25, 145, 800, 30),
   ('PickUp', 40, 250, 990, 80)


INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) VALUES
 (5555, 'Opel', 'Corsa',  2019, 2, 3, 'image', 'top', 'y'),
   (7777, 'Mercedes', '500 SEL', 2018, 2, 5, 'image', 'top', 'n'),
   (8888, 'Lada','Niva', 1998, 3, 4, NULL, 'bad', 'y')

INSERT INTO Employees (FirstName, LastName, Title, Notes) VALUES
('Pesho', 'Lekov', 'Manager', 'Very smart'),
('Dimitrichko', 'Ivanov', 'Driver', 'Lasy'),
('Gosho', 'Goshev', 'IT specialist', 'Computers Monster')

INSERT INTO Customers (DriverLicenceNumber, FullName, [Address], City, ZIPCode, Notes) VALUES
('111111', 'Gosho Goshev', 'Ul. Alen Mak', 'Svoge', 1204, 'Businessman'),
('2222222', 'Ivan Ivanov', 'bul. Bulgaria','Sofia', 1302, 'Teacher'),
('666666', 'Petkan Draganov', 'Lyulin 6', 'Sofia', 1675, 'Manager')

DROP TABLE RentalOrders --StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes

CREATE TABLE RentalOrders
(
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT NOT NULL, 
CustomerId INT NOT NULL,
CarId INT NOT NULL,
TankLevel VARCHAR (80) NULL,
KilometrageStart INT NOT NULL,
KilometrageEnd INT NOT NULL,
TotalKilometrage INT NOT NULL,
StartDate DATETIME NOT NULL,
EndDate DATETIME NOT NULL,
TotalDays INT NOT NULL,
RateApplied VARCHAR (30) NULL,
TaxRate INT NOT NULL,
OrderStatus VARCHAR (30),
Notes VARCHAR (MAX)
)

INSERT INTO RentalOrders 
(EmployeeId,CustomerId, CarId, TankLevel,
KilometrageStart, KilometrageEnd, TotalKilometrage,
StartDate, EndDate, TotalDays, RateApplied, 
TaxRate, OrderStatus, Notes) VALUES
(1, 2, 1,'full', 123,143,20,2021/12/09, 2021/12/13, 4, NULL,45, 'completed', NULL ),
(2, 3, 2, 'empty', 900, 1200,300, 2021/06/12, 2021/06/16, 4,NULL, 35, NULL, NULL ),
(3, 1 , 3, 'full', 450, 650, 200, 2021/08/12, 2021/08/24, 12, NULL,50, 'pending', NULL )






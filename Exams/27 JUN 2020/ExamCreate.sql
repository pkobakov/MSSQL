CREATE DATABASE WMS

--PROBLEM 1.DDL

CREATE TABLE Clients
(
ClientId INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Phone NVARCHAR(12) NOT NULL CHECK(LEN(Phone) = 12)
)

CREATE TABLE Mechanics
(
MechanicId INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Address VARCHAR (MAX) NOT NULL
)

CREATE TABLE Models
(

ModelId INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) UNIQUE NOT NULL

)


CREATE TABLE Jobs
(
JobId INT PRIMARY KEY IDENTITY,
ModelId INT FOREIGN KEY REFERENCES Models(ModelId) ,
[Status] VARCHAR(11) DEFAULT 'Pending' CHECK(Status IN ('Pending','In Progress','Finished')) NOT NULL,
ClientId INT FOREIGN KEY REFERENCES Clients(ClientId),
MechanicId INT FOREIGN KEY REFERENCES Mechanics (MechanicId),
IssueDate DATE NOT NULL,
FinishDate DATE
)

CREATE TABLE Orders
(
OrderId INT PRIMARY KEY IDENTITY,
JobId INT FOREIGN KEY REFERENCES Jobs(JobId), 
IssueDate DATE,
Delivered BIT DEFAULT 0
)

CREATE TABLE Vendors
(
VendorId INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) UNIQUE NOT NULL
)
CREATE TABLE Parts
(
PartId INT PRIMARY KEY IDENTITY,
SerialNumber VARCHAR(50) UNIQUE NOT NULL,
Description  VARCHAR(MAX),
Price DECIMAL(6,2) CHECK (Price>0 AND Price<=9999.99),
VendorId INT FOREIGN KEY REFERENCES Vendors(VendorId), 
StockQty INT DEFAULT 0 CHECK(StockQty >= 0)
)

CREATE TABLE OrderParts
(
OrderId INT FOREIGN KEY REFERENCES Orders(OrderId),
PartId INT FOREIGN KEY REFERENCES Parts(PartId),
Quantity INT DEFAULT 1 CHECK (Quantity > 0), 
CONSTRAINT PK_OrderPart PRIMARY KEY (OrderId, PartId)
)

CREATE TABLE PartsNeeded
(
JobId INT FOREIGN KEY REFERENCES Jobs(JobId),
PartId INT FOREIGN KEY REFERENCES Parts (PartId),
Quantity INT DEFAULT 1 CHECK (Quantity > 0),
CONSTRAINT PK_JobParts PRIMARY  KEY (JobId, PartId)
)

-- PROBLEM 2. INSERT

INSERT INTO Clients (FirstName, LastName, Phone) VALUES
('Teri','Ennaco	','570-889-5187'),
('Merlyn','Lawler','201-588-7810'),
('Georgene','Montezuma','925-615-5185'),
('Jettie', 'Mconnell', '908-802-3564'),
('Lemuel', 'Latzke', '631-748-6479'),
('Melodie',  'Knipp', '805-690-1682'),
('Candida','Corbley', '908-275-8357')

INSERT INTO Parts (SerialNumber, Description, Price, VendorId) VALUES
('WP8182119','Door Boot Seal',117.86, 2),
('W10780048','Suspension Rod',42.81, 1),
('W10841140','Silicone Adhesive', 6.77, 4),
('WPY055980','High Temperature Adhesive',13.94, 3)


-- PROBLEM 3. UPDATE

-- Assign all Pending jobs to the mechanic Ryan Harnos 
-- (look up his ID manually, there is no need to use table joins) and change their status to 'In Progress'.

SELECT *FROM Jobs WHERE MechanicId =3
SELECT *FROM Mechanics WHERE FirstName = 'Ryan'

UPDATE Jobs SET MechanicId  = 3, Status = 'In Progress'
WHERE Status = 'Pending'

-- PROBLEM 4. DELETE
-- Cancel Order with ID 19 – delete the order from the database and all associated entries from the mapping table.

DELETE FROM OrderParts where OrderId = 19
DELETE FROM Orders WHERE OrderId = 19


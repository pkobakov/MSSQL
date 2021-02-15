CREATE DATABASE WMS

CREATE TABLE Clients
(
    ClientId  INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50)                      NOT NULL,
    LastName  VARCHAR(50)                      NOT NULL,
    Phone     CHAR(12) CHECK (LEN(Phone) = 12) NOT NULL

)

CREATE TABLE Mechanics
(
    MechanicId INT PRIMARY KEY IDENTITY,
    FirstName  VARCHAR(50)  NOT NULL,
    LastName   VARCHAR(50)  NOT NULL,
    Address    VARCHAR(MAX) NOT NULL
)

CREATE TABLE Models
(
    ModelId INT PRIMARY KEY  IDENTITY ,
    Name VARCHAR(50) UNIQUE NOT NULL ,
)

CREATE TABLE Jobs
(
    JobId INT PRIMARY KEY IDENTITY ,
    ModelId INT NOT NULL FOREIGN KEY REFERENCES Models(ModelId)  ,
    Status VARCHAR(11) DEFAULT 'Pending'
        CHECK (Status IN ('Pending','In Progress','Finished')) NOT NULL ,
    ClientId INT NOT NULL FOREIGN KEY REFERENCES Clients(ClientId)  ,
    MechanicId INT FOREIGN KEY REFERENCES Mechanics(MechanicId),
    IssueDate DATE NOT NULL ,
    FinishDate DATE
)

CREATE TABLE Orders
(
    OrderId INT PRIMARY KEY IDENTITY ,
    JobId INT NOT NULL FOREIGN KEY REFERENCES Jobs(JobId),
    IssueDate DATE,
    Delivered BIT DEFAULT 0
)

CREATE TABLE Vendors
(
    VendorId INT PRIMARY KEY IDENTITY ,
    Name VARCHAR(50) UNIQUE  NOT NULL
)
CREATE TABLE Parts
(
    PartId INT PRIMARY KEY IDENTITY ,
    SerialNumber VARCHAR(50) UNIQUE NOT NULL ,
    Description VARCHAR(MAX),
    Price DECIMAL(6,2) NOT NULL CHECK (Price>0 AND Price<=9999.99),
    VendorId INT NOT NULL FOREIGN KEY REFERENCES Vendors(VendorId),
    StockQty INT DEFAULT 0, CHECK (StockQty>=0)
)

CREATE TABLE OrderParts
(
    OrderId INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderId),
    PartId INT NOT NULL FOREIGN KEY REFERENCES Parts(PartId),
    Quantity INT DEFAULT 1, CHECK (Quantity>0),
CONSTRAINT PK_OrderParts PRIMARY KEY (OrderId,PartId)
)

CREATE TABLE PartsNeeded
    (
        JobId INT NOT NULL FOREIGN KEY REFERENCES Jobs(JobId),
        PartId INT NOT NULL FOREIGN KEY REFERENCES Parts(PartId),
        Quantity INT DEFAULT 1, CHECK (Quantity>0),
        CONSTRAINT PK_JobsParts PRIMARY KEY (JobId,PartId)
)

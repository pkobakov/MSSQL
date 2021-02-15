CREATE TABLE Manufacturers
-- ManufacturerID, Name, EstablishedOn
(   
ManufacturerID INT IDENTITY PRIMARY KEY,
[Name] NVARCHAR(20) NOT NULL,
EstablishedOn DATE NOT NULL
)

CREATE TABLE Models
(   
ModelID INT PRIMARY KEY IDENTITY (101,1),
[Name] NVARCHAR(50) NOT NULL,
ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers VALUES
('Tesla', '01/01/2003'),
('Lada', '01/05/1966'),
('BMW', '07/03/1916')

INSERT INTO Models VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)
CREATE TABLE People
(
  Id INT PRIMARY KEY IDENTITY, 
  [Name] NVARCHAR (200) NOT NULL,
  [Picture] VARCHAR(MAX) NULL,
  Height DECIMAL (10,2) NULL,
  [Weight] DECIMAL (10,2) NULL,
  Gender CHAR NOT NULL,
  Birthdate DATE NOT NULL,
  Biography TEXT NULL

)
INSERT INTO People (Name, Picture, Height, Weight,Gender, Birthdate, Biography ) VALUES
('Petar', 'https://ichef.bbci.co.uk/news/976/cpsprodpb/41CF/production/_109474861_angrycat-index-getty3-3.jpg', 193, 95.6, 'f','1974-12-09' , 'TEXT'),
('Misho', 'https://ichef.bbci.co.uk/news/976/cpsprodpb/41CF/production/_109474861_angrycat-index-getty3-3.jpg',177, 98, 'f','1974-05-18', 'TEXT' ),
('Sasho', 'https://ichef.bbci.co.uk/news/976/cpsprodpb/41CF/production/_109474861_angrycat-index-getty3-3.jpg', 187, 93, 'f','1974-06-09', 'TEXT' ),
('Georgi', 'https://ichef.bbci.co.uk/news/976/cpsprodpb/41CF/production/_109474861_angrycat-index-getty3-3.jpg',201, 110, 'f','1974-12-12', 'TEXT' ),
('Alex', 'https://ichef.bbci.co.uk/news/976/cpsprodpb/41CF/production/_109474861_angrycat-index-getty3-3.jpg', 188, 88, 'f','1974-08-22', 'TEXT' )

SELECT* FROM People
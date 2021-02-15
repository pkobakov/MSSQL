CREATE TABLE Users
(
Id BIGINT PRIMARY KEY IDENTITY,
Username VARCHAR (30) NOT NULL,
[Password] VARCHAR (26) NOT NULL,
ProfilePicture VARCHAR(MAX) ,
LastLoginTime DATETIME,
IsDeleted BIT
)
INSERT INTO Users (Username,Password,ProfilePicture, LastLoginTime, IsDeleted) VALUES
('ivanov', 'hahaha', 'https://upload.wikimedia.org/wikipedia/commons/7/77/Avatar_cat.png', '2021-12-11', 0),
('petrov', 'hohoho', 'https://upload.wikimedia.org/wikipedia/commons/7/77/Avatar_cat.png', '2021-12-14', 0),
('popov', 'hehehe', 'https://upload.wikimedia.org/wikipedia/commons/7/77/Avatar_cat.png', '2021-12-17', 0),
('toshev', 'hahuhu', 'https://upload.wikimedia.org/wikipedia/commons/7/77/Avatar_cat.png', '2021-12-20', 0),
('markov', 'hihaha', 'https://upload.wikimedia.org/wikipedia/commons/7/77/Avatar_cat.png', '2021-12-15', 0)
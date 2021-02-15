-- EXAM 21 JUN 2020
-- QUERYING

-- PROBLEM 5. EEE-Mails

SELECT Accounts.FirstName, Accounts.LastName,  
FORMAT (Accounts.BirthDate, 'MM-dd-yyyy') BirthDate,
Cities.Name,Accounts.Email FROM Accounts
JOIN Cities ON Cities.Id = Accounts.CityId
WHERE Accounts.Email LIKE 'e%'
ORDER BY Cities.Name

-- PROBLEM 6. City Statistics
-- Select all cities with the count of hotels in them.
-- Order them by the hotel count (descending), 
-- then by city name. Do not include cities, 
-- which have no hotels in them.

SELECT Cities.Name City, COUNT(Hotels.Id) Hotels FROM Cities
JOIN Hotels ON Hotels.CityId = Cities.Id
GROUP BY Cities.Name 
ORDER BY Hotels DESC, Cities.Name

-- PROBLEM 7.
-- Find the longest and shortest trip for each account, in days. 
-- Filter the results to accounts with no middle name and trips,
-- which are not cancelled (CancelDate is null).
-- Order the results by Longest Trip days (descending),
-- then by Shortest Trip (ascending).

SELECT Accounts.Id,
Accounts.FirstName,
Accounts.LastName, 
MAX(DATEDIFF(DAY, ArrivalDate, ReturnDate)) Longest, 
MIN(DATEDIFF(DAY, ArrivalDate, ReturnDate)) Shortest 
FROM Accounts
JOIN AccountsTrips ON Accounts.Id = AccountsTrips.AccountId
JOIN Trips ON Trips.Id = AccountsTrips.TripId
WHERE Accounts.MiddleName  IS NULL AND Trips.CancelDate IS NULL
GROUP BY Accounts.Id, Accounts.FirstName, Accounts.LastName
ORDER BY Longest DESC, Shortest

-- PROBLEM 8. Metropolis
-- Find the top 10 cities,
-- which have the most registered accounts in them.
-- Order them by the count of accounts (descending).

SELECT TOP(10)
Cities.Id Id, Cities.Name [Name], 
Cities.CountryCode Country,
COUNT(Accounts.Id) Accounts
FROM Cities
JOIN Accounts ON Accounts.CityId = Cities.Id
GROUP BY Cities.Id, Cities.Name, Cities.CountryCode
ORDER BY Accounts DESC
  
SELECT TOP(10) C.Id,C.Name,
       C.CountryCode AS COUNTRY,
       COUNT(A.Id) AS Accounts
FROM Cities AS C
JOIN Accounts A on C.Id = A.CityId
GROUP BY C.Id, C.Name,C.CountryCode
ORDER BY Accounts DESC

-- PROBLEM 9. Romantic Getaways
-- Find all accounts,
-- which have had one or more trips to a hotel in their hometown.
-- Order them by the trips count (descending), then by Account ID.

SELECT Accounts.Id, Accounts.Email, Cities.Name, 
COUNT(Trips.Id) Trips FROM Accounts
JOIN AccountsTrips ON AccountsTrips.AccountId = Accounts.Id
JOIN Trips ON AccountsTrips.TripId = Trips.Id
JOIN Rooms ON Rooms.Id = Trips.RoomId
JOIN Hotels ON Hotels.Id = Rooms.HotelId
JOIN Cities ON Cities.Id = Hotels.CityId 

WHERE Accounts.CityId = Hotels.CityId 
GROUP BY Accounts.Id, Accounts.Email, Cities.Name
ORDER BY Trips DESC, Accounts.Id

-- PROBLEM 10. GDPR Violation
-- Trip ID
-- Account Full Name
-- From – Account hometown
-- To – Hotel city
-- Duration – the duration between the arrival date and return date in days. 
-- If a trip is cancelled, the value is “Canceled

SELECT Trips.Id TripId, CONCAT( Accounts.FirstName,' ', Accounts.LastName) FullName,
Cities.Name [From], C2.Name [To], 
CASE
WHEN Trips.CancelDate IS NULL 
THEN CAST(DATEDIFF(DAY, Trips.ArrivalDate, Trips.ReturnDate) AS VARCHAR (10))+' '+'days'
ELSE 'Canceled'
END Duration
FROM Trips
FULL JOIN AccountsTrips ON AccountsTrips.TripId = Trips.Id
JOIN Accounts ON AccountsTrips.AccountId = Accounts.Id
JOIN Cities ON Accounts.CityId = Cities.Id
JOIN Rooms ON Rooms.Id = Trips.RoomId
JOIN Hotels ON Hotels.Id = Rooms.HotelId
JOIN Cities AS C2 ON C2.Id = Hotels.CityId
ORDER BY FullName, Trips.Id

-- PROBLEM 11. Available Room
GO
CREATE FUNCTION udf_GetAvailableRoom (@HotelId INT, @Date DATE, @People INT)
 RETURNS NVARCHAR(200)
AS
BEGIN
      DECLARE @ROOMID INT = (SELECT TOP (1) r.Id
                           FROM Trips AS t
                                    JOIN Rooms AS r ON t.RoomId = r.Id
                                    JOIN Hotels AS h ON r.HotelId = h.Id
                           WHERE h.Id = @HotelId
                             AND @Date NOT BETWEEN t.ArrivalDate AND t.ReturnDate
                             AND t.CancelDate IS NULL
                             AND r.Beds >= @People
                             AND YEAR(@Date) = YEAR(t.ArrivalDate)
                           ORDER BY r.Price DESC)

    IF (@ROOMID IS NULL)
        RETURN 'No rooms available'


    DECLARE @ROOMTYPE NVARCHAR(20) = (SELECT Type
                                      FROM Rooms
                                      WHERE Id = @ROOMID)
    DECLARE @BEDS INT = (SELECT Beds
                                      FROM Rooms
                                      WHERE Id = @ROOMID)
    DECLARE @ROOMPRICE DECIMAL(18,2)= (SELECT Price
        FROM Rooms
        WHERE Id=@ROOMID)
    DECLARE @HOTELBASERATE DECIMAL(5,2)= (SELECT BaseRate
        FROM Hotels
        WHERE Id=@HotelId)

    DECLARE @TOTALPRICE DECIMAL(18,2)= (@HOTELBASERATE + @ROOMPRICE) * @People

    RETURN 'Room ' + CAST(@ROOMID AS NVARCHAR(3)) +': ' + @ROOMTYPE+
           ' (' + CAST(@BEDS AS NVARCHAR(2)) +' beds) - $' + CAST(@TOTALPRICE AS NVARCHAR(20))
END
CREATE VIEW  v_UserWithCountries AS
SELECT
CONCAT(costumer.FirstName, ' ', costumer.LastName) CustomerName,
costumer.Age Age,
costumer.Gender Gender,
country.Name CountryName
FROM Customers AS costumer
JOIN Countries AS country ON costumer.CountryId = country.Id

SELECT TOP 5 * FROM v_UserWithCountries
ORDER BY Age
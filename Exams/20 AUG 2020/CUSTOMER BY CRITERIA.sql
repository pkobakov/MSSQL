SELECT FirstName, Age,PhoneNumber 
FROM Customers  
WHERE (Age >= 21 AND FirstName LIKE '%an%') 
OR 
(PhoneNumber LIKE '%38'AND CountryId != 
(SELECT Id FROM Countries
WHERE Name = 'Greece'))
ORDER BY FirstName, Age DESC


SELECT FirstName, Age, PhoneNumber
FROM Customers 
WHERE (Age>=21 AND FirstName LIKE '%an%')
OR
(PhoneNumber  LIKE '%38' AND CountryId!=(SELECT Id FROM Countries WHERE  Name = 'Greece' ))
ORDER BY FirstName, Age DESC

SELECT cust.FirstName, cust.Age, cust.PhoneNumber
FROM Customers AS cust
JOIN Countries AS country ON cust.CountryId = country.Id
WHERE (cust.Age>=21 AND cust.FirstName LIKE '%an%') OR
(cust.PhoneNumber LIKE '%38' AND country.Name != 'Greece')
ORDER BY cust.FirstName, cust.Age DESC


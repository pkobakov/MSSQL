SELECT FirstName, LastName, country.Name Country
FROM Customers AS customers
JOIN Countries AS country ON country.Id = customers.CountryId
WHERE country.Name = 'Albania'

SELECT COUNT(customers.Id) Albanians
FROM Customers AS customers
JOIN Countries AS country ON country.Id = customers.CountryId
WHERE country.Name = 'Albania'
GROUP BY country.Name

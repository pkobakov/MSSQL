SELECT c.FirstName + ' ' + c.LastName CustomerName, c.PhoneNumber, c.Gender FROM Customers AS c
LEFT JOIN Feedbacks AS f ON c.Id = f.CustomerId
WHERE f.Id IS NULL
ORDER BY c.Id

SELECT concat(C.FirstName,' ', C.LastName) AS CustomerName,
       C.PhoneNumber ,
       c.Gender
FROM Customers AS C
         LEFT JOIN Feedbacks F on C.Id = F.CustomerId
WHERE F.Id IS NULL
ORDER BY C.Id
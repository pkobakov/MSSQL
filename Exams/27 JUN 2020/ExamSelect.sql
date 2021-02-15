-- PROBLEM 5. Mechanic Assignments

SELECT CONCAT(FirstName,' ',LastName) Mechanich, j.Status Status, j.IssueDate IssueDate
FROM Mechanics AS m
JOIN Jobs AS j ON m.MechanicId = j.MechanicId
ORDER BY m.MechanicId, j.IssueDate, j.JobId

-- PROBLEM 6. Current Clients
DECLARE @CurrentDay DATE = '04/24/2017'
SELECT CONCAT(Clients.FirstName,' ', Clients.LastName) Client, DATEDIFF(DAY, Jobs.IssueDate, @CurrentDay) [Days going], Jobs.Status Status
FROM  Clients 
INNER JOIn Jobs ON Clients.ClientId = Jobs.ClientId
WHERE Jobs.Status NOT LIKE 'Finished'
ORDER BY [Days going] DESC, Clients.ClientId  

-- PROBLEM 7. Mechanic Performance

SELECT AVG (DATEDIFF(DAY, J.IssueDate, J.FinishDate)) [Average Days]
FROM Jobs AS J
LEFT JOIN Mechanics AS M ON  J.MechanicId = M.MechanicId
ORDER BY M.MechanicId


SELECT CONCAT(Mechanics.FirstName, ' ', Mechanics.LastName) Mechanic, AVG(DATEDIFF(DAY, Jobs.IssueDate, Jobs.FinishDate)) [Average days] 
FROM Mechanics
JOIN Jobs ON Mechanics.MechanicId = Jobs.MechanicId
GROUP BY Mechanics.MechanicId,CONCAT(Mechanics.FirstName, ' ', Mechanics.LastName) 
ORDER BY Mechanics.MechanicId

--PROBLEM 8. Available Mechanics

SELECT CONCAT(Mechanics.FirstName,' ', Mechanics.LastName) Available  FROM Mechanics
LEFT JOIN Jobs ON Mechanics.MechanicId = Jobs.MechanicId
WHERE Jobs. JobId IS NULL 
OR
(SELECT COUNT(JobId) FROM Jobs
WHERE Status <> 'Finished' 
AND MechanicId = Mechanics.MechanicId
GROUP BY MechanicId, Status) 
IS NULL
GROUP BY Mechanics.MechanicId,Mechanics.FirstName,Mechanics.LastName
ORDER BY Mechanics.MechanicId

-- PROBLEM 9. Past Expenses

SELECT Jobs.JobId JobId, ISNULL(SUM (OrderParts.Quantity*Parts.Price),0)[Total cost] FROM Jobs
LEFT JOIN Orders ON Orders.JobId = Jobs.JobId
LEFT JOIN OrderParts ON Orders.OrderId = OrderParts.OrderId
LEFT JOIN Parts ON Parts.PartId = OrderParts.PartId
WHERE Jobs.Status = 'Finished'
GROUP BY Jobs.JobId
ORDER BY [Total cost] DESC, Jobs.JobId

--PROBLEM 10. Missing Parts 
SELECT 
Parts.PartId PartId,
Parts.Description [Description],
PartsNeeded.Quantity [Required],
Parts.StockQty [In Stock ],
IIF (Orders.Delivered = 0, OrderParts.Quantity,0) Ordered
FROM Parts
LEFT JOIN PartsNeeded ON PartsNeeded.PartId = Parts.PartId
LEFT JOIN OrderParts ON OrderParts.PartId = PartsNeeded.PartId
LEFT JOIN Jobs ON Jobs.JobId = PartsNeeded.JobId
LEFT JOIN Orders ON Orders.JobId = Jobs.JobId
WHERE Jobs.Status <> 'Finished' 
AND 
Parts.StockQty + IIF (Orders.Delivered = 0, OrderParts.Quantity,0) < PartsNeeded.Quantity
ORDER BY Parts.PartId
GO

-- PROBLEM 12. Past Expenses
CREATE FUNCTION udf_GetCost (@JobId INT)
RETURNS DECIMAL (15,2)

BEGIN
DECLARE @Result DECIMAL (15,2) 
SET @Result = (SELECT SUM (Parts.Price*OrderParts.Quantity) AS Result 
FROM Jobs
JOIN Orders ON Orders.JobId = Jobs.JobId
JOIN OrderParts ON OrderParts.OrderId = Orders.OrderId
JOIN Parts ON Parts.PartId = OrderParts.PartId
WHERE Jobs.JobId = @JobId
GROUP BY Jobs.JobId)
IF (@JobId IS NULL)
SET @Result = 0
RETURN @Result
END
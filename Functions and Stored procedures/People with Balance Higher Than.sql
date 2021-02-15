CREATE PROC usp_GetHoldersWithBalanceHigherThan (@inputBalance DECIMAL(18,4)) 
AS
SELECT FirstName, LastName FROM AccountHolders AS ach
JOIN Accounts AS acc ON ach.Id = acc.AccountHolderId
GROUP BY FirstName, LastName
HAVING SUM(Balance)> @inputBalance
ORDER BY FirstName, LastName

EXEC usp_GetHoldersWithBalanceHigherThan 
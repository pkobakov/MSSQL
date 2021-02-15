CREATE PROC usp_CalculateFutureValueForAccount (@AccountID INT, @interesRate FLOAT)
AS
SELECT 
ac.Id, 
ah.FirstName, 
ah.LastName, 
ac.Balance CurrentBalance,
dbo.ufn_CalculateFutureValue(ac.Balance, @interesRate, 5) 
FROM AccountHolders AS ah
JOIN Accounts AS ac ON ah.Id = ac.AccountHolderId
WHERE ac.Id = @AccountID


EXEC usp_CalculateFutureValueForAccount 1, 0.1
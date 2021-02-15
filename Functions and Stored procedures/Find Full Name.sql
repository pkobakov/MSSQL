CREATE PROC usp_GetHoldersFullName 
AS 
SELECT FirstName + ' '+ LastName FullName FROM AccountHolders

EXEC usp_GetHoldersFullName
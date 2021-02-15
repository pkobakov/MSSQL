CREATE PROC usp_GetTownsStartingWith (@INPUT_CHAR NVARCHAR(50))
AS
SELECT 
[Name] FROM Towns
WHERE [Name]  LIKE @INPUT_CHAR +'%'

EXEC usp_GetTownsStartingWith 'b'
CREATE PROC usp_EmployeesBySalaryLevel(@SalaryLevel VARCHAR (20))
AS
SELECT FirstName, LastName 
FROM Employees
WHERE dbo.ufn_GetSalaryLevel(Salary) = @SalaryLevel

EXEC usp_EmployeesBySalaryLevel 'High'
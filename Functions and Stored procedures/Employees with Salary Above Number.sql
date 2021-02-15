CREATE PROC usp_GetEmployeesSalaryAboveNumber (@INPUT_SALARY DECIMAL(18,4))
AS
SELECT FirstName, LastName FROM Employees
WHERE Salary >= @INPUT_SALARY

EXEC usp_GetEmployeesSalaryAboveNumber 48100
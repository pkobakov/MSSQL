SELECT FirstName, LastName, FirstName+'.'+LastName+'@softuni.bg' AS [Full Email Addresses] FROM Employees
SELECT * FROM Employees WHERE (JobTitle = 'Sales Representative') 
SELECT FirstName, LastName, JobTitle FROM Employees WHERE Salary BETWEEN 20000 AND 30000
SELECT FirstName+' '+MiddleName+' '+LastName AS [Full Name]FROM Employees 
WHERE Salary IN (25000,14000,12500,23600)
SELECT FirstName, LastName FROM Employees WHERE ManagerID IS NULL

--first name, last name and salary 
SELECT FirstName, LastName , Salary FROM Employees WHERE Salary > 50000 ORDER BY Salary DESC
SELECT TOP 5 FirstName, LastName FROM Employees ORDER BY Salary DESC 
SELECT FirstName, LastName FROM Employees WHERE DepartmentID != 4

--First by salary in decreasing order
--Then by first name alphabetically
--Then by last name descending
--Then by middle name alphabetically
SELECT * FROM Employees 
ORDER BY Salary DESC, FirstName, LastName DESC, MiddleName
GO
CREATE VIEW V_EmployeesSalaries AS
SELECT FirstName, LastName, Salary FROM Employees 
GO
CREATE VIEW V_EmployeeNameJobTitle AS
SELECT FirstName 
       + ' '
       + ISNULL (MiddleName, '')
	   + ' '
	   + LastName AS [Full Name], JobTitle FROM Employees

GO
SELECT DISTINCT JobTitle FROM Employees	

SELECT TOP 10 * FROM Projects ORDER BY StartDate, [Name] 

SELECT TOP 7 FirstName, LastName, HireDate FROM Employees ORDER BY HireDate DESC

-- Engineering, Tool Design, Marketing or Information Services 

SELECT * FROM Departments WHERE [Name] IN ('Engineering','Tool Design','Marketing','Information Services' ) 

UPDATE Employees SET Salary*=1.12 WHERE DepartmentID IN (1,2,4,11)
SELECT Salary FROM Employees
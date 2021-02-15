SELECT Id, Message, RepositoryId, ContributorId FROM Commits
ORDER BY Id, Message, RepositoryId, ContributorId

--  Front-end

SELECT Id, Name, Size FROM Files
WHERE Size > 1000 AND Name LIKE '%html%'
ORDER BY Size DESC, Id, Name

-- Issue Assignment

SELECT Issues.Id, CONCAT(Users.Username, ' : ', Issues.Title) FROM Issues
JOIN Users ON Users.Id = Issues.AssigneeId
ORDER BY Issues.Id DESC, Users.Id 

-- Single Files

SELECT Files.Id, Files. Name, Files.ParentId, CONCAT(Files.Size, 'KB') Size  FROM Files 
WHERE ParentId IS NOT NULL

ORDER BY Id, Name, Size DESC

SELECT Files.Id, Files. Name, Files.ParentId, CONCAT(Files.Size, 'KB') Size  FROM Files 
RIGHT JOIN Files B ON Files.Id = Files.Id
where B.ParentId is null


-- Commits in Repositories
-- Select the top 5 repositories in terms of count of commits. 
-- Order them by commits count (descending), repository id (ascending) then by repository name (ascending).

SELECT TOP(5) Repositories.Id, Repositories.Name, COUNT( Commits.Id) Commits FROM Repositories
JOIN RepositoriesContributors ON Repositories.Id = RepositoriesContributors.RepositoryId
JOIN Commits ON Repositories.Id = Commits.RepositoryId
GROUP BY Repositories.Id, Repositories.Name
ORDER BY  COUNT(Commits.Id) DESC, Repositories.Id, Repositories.Name
GO
-- ALL USER COMMITS

CREATE FUNCTION udf_AllUserCommits(@username VARCHAR (50)) 
RETURNS INT
AS
BEGIN 
DECLARE @Result INT =  (SELECT COUNT(Commits.Id) FROM Commits
JOIN Users ON Users.Id = Commits.ContributorId
WHERE Username = @username) 
RETURN @Result
END
GO
SELECT dbo.udf_AllUserCommits ('UnderSinduxrein')

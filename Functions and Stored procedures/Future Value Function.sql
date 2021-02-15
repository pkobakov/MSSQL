CREATE FUNCTION ufn_CalculateFutureValue 
(@Sum DECIMAL(15,2), @YearlyInteresRate FLOAT, @Years INT )
RETURNS DECIMAL (15,4)
BEGIN 
  DECLARE @Result DECIMAL (15,4) =( @Sum * POWER((1+@YearlyInteresRate), @Years))
  RETURN @Result
END

SELECT dbo.ufn_CalculateFutureValue (1000, 0.1, 5) 
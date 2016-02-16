Use APlanner
Go

exec RegisterStudent
  	12121241,
	'aaaa',
	'Cool',
    'Man',
    'Password',
	'CS',
	2015;
go


DECLARE @return_status bit;
EXEC UserLogin 'aaasa','Password', @return_status output;

SELECT 'Return Status' = @return_status;
GO

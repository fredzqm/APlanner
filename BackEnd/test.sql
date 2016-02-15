Use APlanner
Go

exec RegisterStudent
  	1224241,
	'wewe',
	'Cool',
    'Man',
    'Password',
	'CS',
	2015;
go


DECLARE @return_status int;
EXEC @return_status = UserLogin
	'wewe',
	'Password'
SELECT 'Return Status' = @return_status;
GO
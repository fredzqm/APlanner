Use APlanner
Go

exec RegisterStudent
  	1223523,
	'afefe',
	'Cool',
    'Man',
    'Password',
	'CS',
	2015;cv

DECLARE @return_status int;
EXEC @return_status = UserLogin
	'Cool',
	'qwerty'
SELECT 'Return Status' = @return_status;
GO
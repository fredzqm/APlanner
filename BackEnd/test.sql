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


Declare @SUserID varchar(9);
Set @SUserID = dbo.UserNameToID('dingy2');
exec EnrollStudent  @SUserID, 1;
Set @SUserID = dbo.UserNameToID('karryc');
exec EnrollStudent  @SUserID , 1 ;
Go

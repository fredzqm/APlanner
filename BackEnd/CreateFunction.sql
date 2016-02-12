use APlanner;
go

IF OBJECT_ID('friendAlready', 'FN') IS NOT NULL
    DROP Function friendAlready;
GO
Create Function friendAlready(@req varchar(9), @acc varchar(9))
returns bit
As
begin
	if( exists (select * from Friend f where (@req = Requester and @acc = Accepter)
						or (@acc = Requester and @req = Accepter) ) )
		return 1;
	return 0;
end
Go

IF OBJECT_ID('enrollAlready', 'FN') IS NOT NULL
    DROP Function enrollAlready;
GO
Create Function enrollAlready(@sect int, @user varchar(9))
returns bit
As
begin
	if exists (select * from Enroll where (@sect = SectID and @user = SUserID) ) 
		return 1;
	return 0;
end
Go

IF OBJECT_ID('hasStarted', 'FN') IS NOT NULL
    DROP Function hasStarted;
GO
Create Function hasStarted(@TermID int)
returns bit
As
begin
	if (select Start_date from Term where TermID = @TermID) > GETDATE( )
		return 1;
	return 0;
end
Go

IF OBJECT_ID('getCourseID', 'FN') IS NOT NULL
    DROP Function getCourseID;
GO
Create Function getCourseID(@SectID int)
returns int
As
begin
	return (select CourseID from Section where SectID = @SectID );
end
Go


------
IF OBJECT_ID('find_ID', 'FN') IS NOT NULL
    DROP Function find_ID;
GO
-- create function find_ID ()


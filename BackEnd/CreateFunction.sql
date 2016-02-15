use APlanner;
go


IF OBJECT_ID('UserNameToID', 'FN') IS NOT NULL
    DROP Function UserNameToID;
GO
Create Function UserNameToID(@UserName varchar(12))
returns varchar(9)
As
begin
	return (select UserID from People where UserName = @UserName);
end
Go

IF OBJECT_ID('CourseDpNumToCourseID', 'FN') IS NOT NULL
    DROP Function CourseDpNumToCourseID;
GO
Create Function CourseDpNumToCourseID(@CourseDP varchar(5), @CourseNum smallint)
returns int
As
begin
	return (select CourseID from Course where SectID = @SectID );
end
Go

IF OBJECT_ID('SectIDToCourseID', 'FN') IS NOT NULL
    DROP Function SectIDToCourseID;
GO
Create Function SectIDToCourseID(@SectID int)
returns int
As
begin
	return (select CourseID from Section where SectID = @SectID );
end
Go


IF OBJECT_ID('TermCourseToSectID', 'FN') IS NOT NULL
    DROP Function TermCourseToSectID;
GO
Create Function TermCourseToSectID(@TermID int, @CourseID smallint, @SectNum tinyint)
returns int
As
begin
	return (select SectID from Section where TermID = @TermID 
			and CourseID = @CourseID and SectNum = @SectNum);
end
Go


IF OBJECT_ID('isFriend', 'FN') IS NOT NULL
    DROP Function isFriend;
GO
Create Function isFriend(@req varchar(9), @acc varchar(9))
returns bit
As
begin
	if( exists (select * from Friend f where (@req = Requester and @acc = Accepter)
						or (@acc = Requester and @req = Accepter) ) )
		return 1;
	return 0;
end
Go

IF OBJECT_ID('hasEnrolled', 'FN') IS NOT NULL
    DROP Function hasEnrolled;
GO
Create Function hasEnrolled(@sect int, @user varchar(9))
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

------
IF OBJECT_ID('find_ID', 'FN') IS NOT NULL
    DROP Function find_ID;
GO
-- create function find_ID ()


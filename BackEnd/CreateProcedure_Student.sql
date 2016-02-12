Use [APlanner];
Go

IF OBJECT_ID('RegisterProfessor', 'P') IS NOT NULL
    DROP Proc RegisterProfessor;
GO
Create Procedure RegisterProfessor
  	@UserID varchar(9),
	@UserName varchar(12),
	@FName varchar(30),
    @LName varchar(30),
    @Password char(20),
	@Department varchar(5),
	@Office varchar(6)
AS
begin
	if  LEN(@Password) < 6
		return 2;  -- password shorter than 7!
	INSERT INTO [People] ([UserID], [UserName] ,[FName] ,[LName] ,[type] ,[Password])
		 VALUES (@UserID, @UserName , @FName,  @LName, 'P', HASHBYTES('SHA1', @Password));
    return 0;
	INSERT INTO [Professor] ( [PUserID], [DepartID] ,[Office])
		 VALUES (@UserID,  @Department,  @Office )
    return 0;
end
GO

IF OBJECT_ID('EnrollStudent', 'P') IS NOT NULL
    DROP Proc EnrollStudent;
GO
Create Procedure EnrollStudent
	@UserID varchar(10),
	@SectID tinyint,
	@T datetime,
	@Rating tinyint

AS
	begin
		declare @SectionID int;
		insert into Enroll values(@SectID,@UserID,@T,@Rating);
	end
go

IF OBJECT_ID('UnEnrollStudent', 'P') IS NOT NULL
    DROP Proc UnEnrollStudent;
GO
Create Procedure UnEnrollStudent
	@UserID varchar(10),
	@SectID tinyint
AS
	begin
		Delete From Enroll where SectID=@SectID and SUserID=@UserID
	end
go


IF OBJECT_ID('AddToWaitlist', 'P') IS NOT NULL
    DROP Proc AddToWaitlist;
GO
Create Procedure AddToWaitlist
	@SectID int,
	@UserID varchar(9)
AS
	begin
		insert into Waitlist (SectID , SUserID , time)
			values(@SectID,@UserID,CURRENT_TIMESTAMP);
	end
go

IF OBJECT_ID('UnWaitlist', 'P') IS NOT NULL
    DROP Proc UnWaitlist;
GO

Create Procedure UnWaitlist
	@SectID int,
	@SUserID varchar(9)
AS
	begin
		delete From Waitlist where(SectID=@SectID and SUserID=@SUserID);
	end
go




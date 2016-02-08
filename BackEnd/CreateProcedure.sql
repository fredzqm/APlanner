Use [APlanner];
Go

IF OBJECT_ID('Register', 'P') IS NOT NULL
    DROP Proc Register;
GO
Create Procedure Register
  	@UserID varchar(9),
	@FName varchar(30),
    @LName varchar(30),
	@SorP char(1),
    @Password char(20)
AS
begin
	if  LEN(@Password) < 6
		return 2;  -- password shorter than 7!
	INSERT INTO [People] ([UserID] ,[FName] ,[LName] ,[SOP] ,[Password])
		 VALUES (@UserID,  @FName,  @LName, @SorP, HASHBYTES('SHA1', @Password));
    return 0;
end
Go

IF OBJECT_ID('UserLogin', 'P') IS NOT NULL
    DROP Proc UserLogin;
GO
Create Procedure UserLogin
	@UserID varchar(30),
    @Password char(20)
AS
begin
	if ( HASHBYTES('SHA1', @Password)  <> (Select Password from People where UserID = @UserID)) begin
		return 1;
	end
	return 0;
end
GO

IF OBJECT_ID('ChangePassword', 'P') IS NOT NULL
    DROP Proc ChangePassword;
GO
Create Procedure ChangePassword
  	@UserID varchar(30),
    @OldPassword char(20),
    @NewPassword char(20),
	@success bit output
AS
begin
	Declare @login bit;
	Exec UserLogin @UserID , @login output;
	if @login == 0
		return 1;  -- fail to login
	if  LEN(@Password) < 6
		return 2;  -- password shorter than 7!
	UPDATE People
		SET Password = HASHBYTES('SHA1', @NewPassword) 
		where UserID = @UserID;
	return 0; // success
end
Go

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

IF OBJECT_ID('DeleteStudent', 'P') IS NOT NULL
    DROP Proc DeleteStudent;
GO
Create Procedure DeleteStudent
	@UserID varchar(10),
	@SectID tinyint
AS
	begin
		declare @SectionID int;
		Delete From Enroll where @SectID=SectID and @UserID=Enroll
	end
go


IF OBJECT_ID('InsertMessage', 'P') IS NOT NULL
    DROP Proc InsertMessage;
GO
Create Procedure InsertMessage
	@UserName1 varchar(10),
	@UserName2 varchar(10),
	@Text text
AS
	begin
		insert(@UserName1,@UserName2,@Text);
	end
go


IF OBJECT_ID('EnrollWaitlist', 'P') IS NOT NULL
    DROP Proc EnrollWaitlist;
GO
Create Procedure EnrollWaitlist
	@SectID int,
	@UserN varchar(9),
	@T datetime,
	@Rating tinyint
AS
	begin
		declare @UserID varchar(9);
		set @UserID=(select SUserID From Student where UserName=@UserN)
		insert into Waitlist values(@SectID,@UserID,@T,@Rateing);
	end
go

IF OBJECT_ID('DeleteWaitlist', 'P') IS NOT NULL
    DROP Proc DeleteWaitlist;
GO

Create Procedure DeleteWaitlist
	@SectID int,
	@UserN varchar(9),
	@T datetime,
	@Rating tinyint
AS
	begin
		declare @UserID varchar(9);
		set @UserID=(select SUserID From Student where UserName=@UserN)
		delete From Waitlist where(@SectID=SectID and @UserID=@UserN);
	end
go


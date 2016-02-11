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
	if @login = 0
		return 1;  -- fail to login
	if  LEN(@NewPassword) < 6
		return 2;  -- password shorter than 7!
	UPDATE People
		SET Password = HASHBYTES('SHA1', @NewPassword) 
		where UserID = @UserID;
	return 0; -- success
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


IF OBJECT_ID('InsertMessage', 'P') IS NOT NULL
    DROP Proc InsertMessage;
GO
Create Procedure InsertMessage
	@sender varchar(10),
	@reciever varchar(10),
	@Text text
AS
	begin
		insert into Mess ([Sender],[Receiver],[Content],[T])
			values(@sender,@reciever,@Text, CURRENT_TIMESTAMP);
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
		insert into Waitlist (SectID , SUserID , T)
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


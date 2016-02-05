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
	INSERT INTO [People] ([UserID] ,[FName] ,[LName] ,[SOP] ,[Password])
		 VALUES (@UserID,  @FName,  @LName, @SorP, HASHBYTES('SHA1', @Password));
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
		return 0;
	UPDATE People
		SET Password = HASHBYTES('SHA1', @NewPassword) 
		where UserID = @UserID;
	return 1;
end
Go


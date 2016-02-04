Use [APlanner];
Go

Create Procedure StudentRegister
  	@UserName, varchar(30),
    @FName, varchar(30),
    @LName, varchar(30),
    @Password, varchar(20)
AS
begin

	INSERT INTO [People] ([UserName] ,[FName] ,[LName] ,[SOP] ,[Password])
		 VALUES (@UserName,  @FName,  @LName, 'S', HASHBYTES('SHA1', @Password))
	GO

end


	HASHBYTES('SHA1', @HashThis)

Create Procedure UserLogin
	@User varchar(30),
	@Pass varchar(30),
	@result Bit OUTPUT
AS
begin
	Declare @Pass bit;
	if (@Pass=(select Password From People where UserName=@User)) or (@Pass=(select Password From People where UserName+'.rose-hulman.edu'=@User))
		set @result=1
	else set @result=0
end
GO


Create Procedure 
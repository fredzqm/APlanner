Use APlanner
Go

Create Procedure UserLogin
	@User varchar(15),
	@Pass varchar(30),
	@result Bit OUTPUT
AS
	if (@Pass=(select Password From People where UserID=@User))
		set @result=1
	else set @result=0
GO

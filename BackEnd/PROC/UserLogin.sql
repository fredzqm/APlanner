Use APlanner
Go

Create Procedure UserLogin
	@User varchar(30),
	@Pass varchar(30),
	@result Bit OUTPUT
AS
	if (@Pass=(select Password From People where UserName=@User)) or (@Pass=(select Password From People where UserName+'.rose-hulman.edu'=@User))
		set @result=1
	else set @result=0
GO

Use [APlanner];
Go

IF OBJECT_ID('RegisterStudent', 'P') IS NOT NULL
    DROP Proc RegisterStudent;
GO
Create Procedure RegisterStudent
  	@UserID varchar(9),
	@UserName varchar(12),
	@FName varchar(30),
    @LName varchar(30),
    @Password char(20),
	@Major varchar(12),
	@Year smallint
AS
begin
	if  LEN(@Password) < 6
		return 2;  -- password shorter than 7!
	INSERT INTO [People] ([UserID], [UserName] ,[FName] ,[LName] ,[type] ,[Password])
		 VALUES (@UserID, @UserName , @FName,  @LName, 'S', HASHBYTES('SHA1', @Password));
    return 0;
	INSERT INTO [Student] ([SUserID], [Major] ,[Year])
		 VALUES (@UserID,  @Major,  @Year);
    return 0;
end
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


IF OBJECT_ID('UserLogin', 'P') IS NOT NULL
    DROP Proc UserLogin;
GO
Create Procedure UserLogin
	@UserID varchar(9),
    @Password char(20)
AS
begin
	if ( HASHBYTES('SHA1', @Password)  <> (Select Password from People where UserID = @UserID)) begin
		return 1; -- fail
	end
	return 0; -- success
end
GO

IF OBJECT_ID('ChangePassword', 'P') IS NOT NULL
    DROP Proc ChangePassword;
GO
Create Procedure ChangePassword
  	@UserID varchar(9),
    @OldPassword char(20),
    @NewPassword char(20),
	@success tinyint output
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

IF OBJECT_ID('SendFriendRequest', 'P') IS NOT NULL
    DROP Proc SendFriendRequest;
GO
Create Procedure SendFriendRequest
  	@from varchar(9),
    @to char(9)
AS
BEGIN
	IF dbo.friendAlready(@from, @to) = 0 begin
		raiserror( 'Already be friend!' , 3,  2);
		rollback;
	end
	Insert into [FriendRequest] (Requester, Accepter)
		values (@from, @to)
END
Go

IF OBJECT_ID('ResponseFriendRequest', 'P') IS NOT NULL
    DROP Proc ResponseFriendRequest;
GO
Create Procedure ResponseFriendRequest
  	@from varchar(9),
    @to char(9),
	@response bit
AS
BEGIN
	IF not exists(select * from FriendRequest 
		where Requester = @from and Accepter = @to ) begin
		raiserror( 'Already be friend!' , 3,  2);
		rollback;
	end
	if @response = 1 begin
		insert into Friend(Requester, Accepter)
			values(@from , @to);
	end
	delete from FriendRequest 
		where Requester = @from and Accepter = @to 
END
Go


IF OBJECT_ID('SendMessage', 'P') IS NOT NULL
    DROP Proc SendMessage;
GO
Create Procedure SendMessage
	@sender varchar(9),
	@reciever varchar(9),
	@Text text
AS
	begin
		insert into Mess ([Sender],[Receiver],[Content],[T])
			values(@sender,@reciever,@Text, CURRENT_TIMESTAMP);
	end
go

Use [APlanner]
go

IF OBJECT_ID('UpdateEnrollNumInsert') IS NOT NULL
    DROP TRIGGER UpdateEnrollNumInsert;
GO
CREATE TRIGGER UpdateEnrollNumInsert ON  [Enroll]
   AFTER INSERT
AS 
BEGIN
	Declare @Num int;
	set @Num=(select Count(*) From inserted);
	Declare @Sec int;
	set @Sec=(select SectID From Section where Section.SectID=inserted.SectID);
END
GO

IF OBJECT_ID('UpdateEnrollNumDelete') IS NOT NULL
    DROP TRIGGER UpdateEnrollNumDelete;
GO
CREATE TRIGGER UpdateEnrollNumDelete ON  [Enroll]
   AFTER DELETE
AS 
BEGIN                                                                                                     ggggggggg
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	IF (SELECT COUNT(*) FROM Deleted) > 1 begin
		print 'cannot unenroll many students at the same time';
		rollback;
	end
	if (SELECT COUNT(*) FROM Deleted) > 1
		SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO

IF OBJECT_ID('UpdateEnrollNumUpdate') IS NOT NULL
    DROP TRIGGER UpdateEnrollNumUpdate;
GO
CREATE TRIGGER UpdateEnrollNumUpdate ON  [Enroll]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO

IF OBJECT_ID('UpdateWaitlistNumUpdate') IS NOT NULL
    DROP TRIGGER UpdateWaitlistNumUpdate;
GO
CREATE TRIGGER UpdateWaitlistNumUpdate ON  [Waitlist]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO

IF OBJECT_ID('UpdateWaitlistNumDelete') IS NOT NULL
    DROP TRIGGER UpdateWaitlistNumDelete;
GO
CREATE TRIGGER UpdateWaitlistNumDelete ON  [Waitlist]
   AFTER UPDATE
AS 
BEGIN
	IF (SELECT COUNT(*) FROM Deleted) > 1 begin
		print 'cannot add many students to the waitlist at the same time';
		rollback;
	end
END
GO

IF OBJECT_ID('Request') IS NOT NULL
    DROP TRIGGER Request;
GO
CREATE TRIGGER Request ON  [FriendRequest]
   Instead of Insert
AS 
BEGIN
	Declare @Num int;
	set @Num=(select count(*) from FriendRequest, inserted
	where (inserted.Requester=FriendRequest.Requester) and (inserted.Accepter=FriendRequest.Accepter))
	IF @Num > 0 begin
		print 'Already be friend!';
		rollback;
	end
	else begin
		Insert into [FriendRequest]
				Select I.Accepter, I.Requester, I.time From inserted I
		end
END
GO



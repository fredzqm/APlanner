Use [APlanner]
go

IF OBJECT_ID('UpdateEnrollNumInsert', 'TR') IS NOT NULL
    DROP TRIGGER UpdateEnrollNumInsert;
GO
CREATE TRIGGER UpdateEnrollNumInsert ON  [Enroll]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO

IF OBJECT_ID('UpdateEnrollNumDelete', 'TR') IS NOT NULL
    DROP TRIGGER UpdateEnrollNumDelete;
GO
CREATE TRIGGER UpdateEnrollNumDelete ON  [Enroll]
   AFTER DELETE
AS 
BEGIN
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

IF OBJECT_ID('UpdateEnrollNumUpdate', 'TR') IS NOT NULL
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
Use [APlanner]

CREATE TRIGGER UpdateEnrollNum ON  [Enroll]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO

CREATE TRIGGER UpdateEnrollNum ON  [Enroll]
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	IF (SELECT COUNT(*) FROM Deleted) > 1 begin
		print 'cannot unenroll many students at the same time';
		rollback;
	end
	if (SELECT COUNT(*) FROM Deleted) 
	 
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO

CREATE TRIGGER UpdateEnrollNum ON  [Enroll]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO
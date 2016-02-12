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
	if (select count(distinct SectID) from inserted) > 1 begin
		raiserror('You cannot enroll students to different section at the same time' , 2, 2);
		rollback;
	end
	set @Num=(select Count(*) From inserted);
	Update Section
	   SET EnrollNum = EnrollNum + @Num
	   WHERE Section.SectID = (Select SectID from inserted )
END
GO

IF OBJECT_ID('UpdateEnrollNumDelete') IS NOT NULL
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
	Update Section
	   SET EnrollNum = EnrollNum - 1
	   WHERE Section.SectID = (Select SectID from inserted )
END
GO


IF OBJECT_ID('CourseDelete') IS NOT NULL
    DROP TRIGGER Request;
GO
CREATE TRIGGER CourseDelete ON  Course
	instead of delete
AS 
BEGIN
	if (select count(*) from deleted) > 1 begin
		raiserror('Cannot delete more than one course at a time', 10, 3);
	end
	Declare @CourseID smallint;
	Set @CourseID = (select CourseID from deleted);
	if exists (select * from Section where CourseID = @CourseID) begin
		delete from Section
			Where CourseID = @CourseID and dbo.hasStarted(TermID) = 0;
		rollback;
	end
	delete from Prerequisite 
		where Prerequisite = @CourseID or Requisite = @CourseID;
	
	--- TODO:
END
GO
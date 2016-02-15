Use [APlanner];
Go

IF OBJECT_ID('EnrollStudent', 'P') IS NOT NULL
    DROP Proc EnrollStudent;
GO
Create Procedure EnrollStudent
	@SUserID varchar(10),
	@SectID tinyint
AS
	begin
		Delete From WaitList where SectID=@SectID and SUserID=@SUserID;
		insert into Enroll(SectID, SUserID, Time)
			values(@SectID,@SUserID,CURRENT_TIMESTAMP);
	end
go

IF OBJECT_ID('UnEnrollStudent', 'P') IS NOT NULL
    DROP Proc UnEnrollStudent;
GO
Create Procedure UnEnrollStudent
	@SUserID varchar(10),
	@SectID tinyint
AS
	begin
		Delete From WaitList where SectID=@SectID and SUserID=@SUserID
		Delete From Enroll where SectID=@SectID and SUserID=@SUserID
	end
go


IF OBJECT_ID('AddToWaitlist', 'P') IS NOT NULL
    DROP Proc AddToWaitlist;
GO
Create Procedure AddToWaitlist
	@SectID int,
	@SUserID varchar(9)
AS
	begin
		if (dbo.hasEnrolled(@SectID, @SUserID) = 1) begin
			raiserror('already enrolled' , 10 , 7);
			rollback;
		end
		insert into Waitlist (SectID , SUserID , time)
			values(@SectID,@SUserID,CURRENT_TIMESTAMP);
	end
go

IF OBJECT_ID('RateSection', 'P') IS NOT NULL
    DROP Proc RateSection;
GO
Create Procedure RateSection
	@SUserID varchar(10),
	@SectID tinyint,
	@Rating tinyint
AS
	begin
		declare @SectionID int;
		Delete From WaitList where SectID=@SectID and SUserID=@SUserID;
		insert into Enroll values(@SectID,@SUserID,CURRENT_TIMESTAMP,@Rating);
	end
go


IF OBJECT_ID('CreatePlan', 'P') IS NOT NULL
    DROP Proc CreatePlan;
GO
Create Procedure CreatePlan
	@SUserID varchar(10),
	@TermID tinyint,
	@PID int output
AS
	insert into SPlan([SUserID],[TermID])
		values(@SUserID, @TermID)
	Set @PID = @@IDENTITY;
go



IF OBJECT_ID('AddCourseToPlan', 'P') IS NOT NULL
    DROP Proc AddCourseToPlan;
GO
Create Procedure AddCourseToPlan
	@PID int,
	@CourseID smallint
AS
begin
	Declare @schedules Table(ScheID int);
	insert into @schedules (ScheID)
		select ScheID from Schedule
			where PID = @PID;
	
	Declare @sections Table(SectID int);
	insert into @sections (SectID)
		select SectID from Section
			where CourseID = @CourseID and SectNum = 0; 
			--- section 0 represent a section not yet set  
	if exists (select top 1 * from @sections) begin
		raiserror('This course is not offered this term', 5, 2);
		rollback;
	end
	
	
	--- insert section0 to schedules.
	insert into Has(SectID, ScheID)
		(select SectID, ScheID from @sections, @schedules);

	insert into Contain(CourseID, PID)
		values(@CourseID, @PID);
	
end
go



IF OBJECT_ID('RemoveCourseToPlan', 'P') IS NOT NULL
    DROP Proc RemoveCourseToPlan;
GO
Create Procedure RemoveCourseToPlan
	@PID int,
	@CourseID smallint
AS
begin
	delete from Contain
		where CourseID= @CourseID and PID= @PID
	
	Declare @schedules Table(ScheID int);
	insert into @schedules (ScheID)
		select ScheID from Schedule
			where PID = @PID;
	
	Declare @sections Table(SectID int);
	insert into @sections (SectID)
		select SectID from Section
			where CourseID = @CourseID;

	delete from Has
		where exists( select * from @sections s where SectID = s.SectID) 
			and exists( select * from @schedules s where ScheID = s.ScheID)
end
go


IF OBJECT_ID('UpdateSectNum', 'P') IS NOT NULL
    DROP Proc UpdateSectNum;
GO
Create Procedure UpdateSectNum
	@ScheID int,
	@SectID int
AS
begin
	
	update Has
		Set ScheID = @ScheID
		where ScheID = @ScheID and dbo.getCourseID(SectID) = dbo.getCourseID(@SectID)

end
go
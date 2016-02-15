Use [APlanner];
Go

IF OBJECT_ID('AddCourse', 'P') IS NOT NULL
    DROP Proc AddCourse;
GO
Create Procedure AddCourse
	@CourseDP varchar(5),
	@CourseNum smallint,
	@CourseName varchar(50),
	@Description text,
	@Credit tinyint
AS
	begin
		insert into Course(CourseDP, CourseName, CourseNum, Description, Credit)
			values (@CourseDP, @CourseName, @CourseNum, @Description, @Credit)
	end
go

IF OBJECT_ID('WillOfferCourse', 'P') IS NOT NULL
    DROP Proc WillOfferCourse;
GO
Create Procedure WillOfferCourse
	@TermID int,
	@CourseID smallint
AS
	begin
		if not exists( select * from Section where TermID = @TermID and CourseID = @CourseID and SectNum = 0) begin
			insert into Section(TermID, CourseID, SectNum)
				values (@TermID, @CourseID, 0)
			--- 0 SectNum just represents that this course will be offered
		end
	end
go

IF OBJECT_ID('WillNotOfferCourse', 'P') IS NOT NULL
    DROP Proc WillNotOfferCourse;
GO
Create Procedure WillNotOfferCourse
	@TermID int,
	@CourseID smallint
AS
	begin
		if exists( select * from Section where TermID = @TermID and CourseID = @CourseID and SectNum = 0) begin
			delete from Section
				where TermID = @TermID and CourseID = @CourseID
			--- 0 SectNum just represents that this course will be offered
		end
	end
go

IF OBJECT_ID('CreateSection', 'P') IS NOT NULL
    DROP Proc CreateSection;
GO
Create Procedure CreateSection
	@TermID int,
	@CourseDP varchar(5),
	@CourseNum smallint,
	@SectNum tinyint,
	@PUserID varchar(9),
	@Capacity int
AS
	begin
		insert into [Section]
		     ([TermID],[CourseID],[SectNum],[PUserID],[Capacity])
		VALUES(@TermID, dbo.CourseDpNumToCourseID(@CourseDP, @CourseNum), @SectNum, @PUserID, @Capacity)
	end
go

IF OBJECT_ID('addSectionMeetTime', 'P') IS NOT NULL
    DROP Proc addSectionMeetTime;
GO
Create Procedure addSectionMeetTime
	@SectID int,
	@Classroom varchar(7),
	@Period tinyint,

AS
	begin
		insert into [STime]
           ([SectID], [Classroom], [Period])
		VALUES
           ([@SectID], [@Classroom], [@Period])
	end
go


IF OBJECT_ID('RemoveSection', 'P') IS NOT NULL
    DROP Proc RemoveSection;
GO
Create Procedure RemoveSection
	@PUserID varchar(9),
	@SectID int
AS
	begin
		delete from [Section]
			where SectID = @SectID and PUserID = @PUserID;
	end
go

IF OBJECT_ID('AddMeetTime', 'P') IS NOT NULL
    DROP Proc AddMeetTime;
GO
Create Procedure AddMeetTime
	@PUserID varchar(9),
	@SectID int,
	@Period tinyint,
	@Classroom varchar(7) = 'TBA'
AS
	begin
		insert into STime(SectID, Period, Classroom)
			values(@SectID, @Period, @Classroom)
	end
go

IF OBJECT_ID('AddSection', 'P') IS NOT NULL
    DROP Proc AddSection;
GO
Create Procedure AddSection
	@TermID int,
	@CourseID smallint,
	@SectNum tinyint,
	@PUserID varchar(9),
	@EnrollNum tinyint,
	@Capacity int
AS
	begin
		insert into Section(TermID, CourseID, SectNum, PUserID, EnrollNum, Capacity)
			values(@TermID, @CourseID, @SectNum, @PUserID, @EnrollNum, @Capacity)
	end
go

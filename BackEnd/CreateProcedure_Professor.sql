Use [APlanner];
Go

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
	@CourseID smallint,
	@SectNum tinyint,
	@PUserID varchar(9),
	@Capacity int
AS
	begin
		insert into [Section]
           ([TermID],[CourseID],,[SectNum],[PUserID],[Capacity])
		VALUES
           (@TermID, @CourseID, @SectNum, @PUserID, @Capacity)
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
Use AScore
GO

Create Table Contain (
	CourseID int,
	PID int,
	
	Primary key(CourseID, PID),
	Foreign key(CourseID) references Course(CourseID),
	Foreign key(PID) references SPlan(PID)
);

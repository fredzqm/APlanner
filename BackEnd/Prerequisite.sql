Use AScore
GO

Create Table Prerequisite (
	CourseIDL int,
	CourseIDH int,

	Primary key(CourseIDL, CourseIDH),
	Foreign key(CourseIDL) references Course(CourseID),
	Foreign key(CourseIDH) references Course(CourseID)
);

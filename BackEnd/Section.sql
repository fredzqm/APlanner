Use AScore
GO

Create Table Section (
	SectID int,
	TermID int,
	CourseID int,
	SectNum int,
	PUserID varchar(9),
	Capacity int,

	Primary key(SectID),
	Foreign key(TermID) references Term(TermID),
	Foreign key(CourseID) references Course(CourseID),
	Foreign key(PUserID) references Professor(PUserID),
);

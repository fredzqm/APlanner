Use AScore
GO

Create Table STime (
	SectID int,
	Classroom varchar(7),
	Period int,
	TermID int,

	Primary key(Period, Classroom, TermID, SectID),
	Foreign key(TermID) references Term(TermID),
	Foreign key(SectID) references Section(SectID)
);

Use AScore
GO

Create Table Has (
	SectID int,
	ScheID int,

	Primary key(ScheID,SectID),
	Foreign key(SectID) references Section(SectID),
	Foreign key(ScheID) references Schedule(ScheID)
);

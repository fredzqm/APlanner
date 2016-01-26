Use AScore
GO

Create Table Enroll (
	SectID int,
	SUserID varchar(9),
	T datetime,
	S varchar(8),
	Rating tinyint,

	Primary key(SectID, SUserID),
	Foreign key(SUserID) references Student(SUserID),
	Foreign key(SectID) references Section(SectID)
);

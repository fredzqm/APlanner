Use AScore
GO

Create Table Schedule (
	ScheID int,
	PID int,
	Probability int,
	Pri int,
	PublicOrPrivate varchar(7),
	
	Primary key(ScheID),
	Foreign key(PID) references SPlan(PID)
);

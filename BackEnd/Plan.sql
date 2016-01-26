Use AScore
GO

Create Table SPlan (
	PID int primary key,
	SUserID varchar(9),
	TermID int,
	Probability int,
	
	Foreign key(SUserID) references Student(SUserID),
	Foreign key(TermID) references Term(TermID)
);

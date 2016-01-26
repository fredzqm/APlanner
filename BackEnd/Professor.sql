Use AScore
GO

Create Table Professor (
	PUserID varchar(9) primary key,
	Department varchar(5),
	
	Foreign key(PUserID) references People(UserID)
);

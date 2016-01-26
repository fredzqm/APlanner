Use AScore
GO

Create Table Student (
	SUserID varchar(9) primary key,
	Major varchar(12),
	YR int,
	
	Foreign key(SUserID) references People(UserID)
);

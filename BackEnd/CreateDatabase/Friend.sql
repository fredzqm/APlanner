Use AScore
GO

Create Table Friend (
	Requester varchar(9),
	Accepter varchar(9),
	St varchar(10),

	Primary key(Requester, Accepter),
	Foreign key(Requester) references People(UserID),
	Foreign key(Accepter) references People(UserID)
);

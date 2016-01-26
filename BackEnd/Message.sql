Use AScore
GO

Create Table Mess (
	MessID varchar(5),
	Sender varchar(9),
	Receiver varchar(9),
	Content text,
	T datetime,

	Primary key(MessID, Sender, Receiver),
	Foreign key(Sender) references People(UserID),
	Foreign key(Receiver) references People(UserID)
);

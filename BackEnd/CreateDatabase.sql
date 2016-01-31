USE master
GO

IF DB_ID ('APlanner') IS NOT NULL
	Drop database [APlanner];
GO

CREATE DATABASE APlanner;
GO

USE APlanner
GO

Create Table People (
	UserID varchar(9) primary key,
	UserName varchar(30),
	FName varchar(30),
	LName varchar(30),
	SOP char(1),
	Password varchar(20)
);


Create Table Friend (
	Requester varchar(9),
	Accepter varchar(9),
	St varchar(10),

	Primary key(Requester, Accepter),
	Foreign key(Requester) references People(UserID),
	Foreign key(Accepter) references People(UserID)
);

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


Create Table Professor (
	PUserID varchar(9) primary key,
	Department varchar(5),

	Foreign key(PUserID) references People(UserID)
);


Create Table Student (
	SUserID varchar(9) primary key,
	Major varchar(12),
	YR int,
	
	Foreign key(SUserID) references People(UserID)
);


Create Table Term (
	TermID int primary key,
	Start_Date date not null,
	End_Date date not null
);


Create Table SPlan (
	PID int primary key,
	SUserID varchar(9),
	TermID int,
	Probability int,
	
	Foreign key(SUserID) references Student(SUserID),
	Foreign key(TermID) references Term(TermID)
);


Create Table Course (
	CourseID int  primary key not null,
	CName varchar(12),
	Descrip text,
	Credict int not null,
);


Create Table Contain (
	CourseID int,
	PID int,
	
	Primary key(CourseID, PID),
	Foreign key(CourseID) references Course(CourseID),
	Foreign key(PID) references SPlan(PID)
);

Create Table Prerequisite (
	CourseIDL int,
	CourseIDH int,

	Primary key(CourseIDL, CourseIDH),
	Foreign key(CourseIDL) references Course(CourseID),
	Foreign key(CourseIDH) references Course(CourseID)
);


Create Table Schedule (
	ScheID int,
	PID int,
	Probability int,
	Pri int,
	PublicOrPrivate varchar(7),
	
	Primary key(ScheID),
	Foreign key(PID) references SPlan(PID)
);


Create Table Section (
	SectID int,
	TermID int,
	CourseID int,
	SectNum tinyint,
	PUserID varchar(9),
	Capacity int,

	Primary key(SectID),
	Foreign key(TermID) references Term(TermID),
	Foreign key(CourseID) references Course(CourseID),
	Foreign key(PUserID) references Professor(PUserID),
);

Create Table Has (
	SectID int,
	ScheID int,

	Primary key(ScheID, SectID),
	Foreign key(SectID) references Section(SectID),
	Foreign key(ScheID) references Schedule(ScheID)
);

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

Create Table STime (
	SectID int,
	Classroom varchar(7),
	Period int,
	TermID int,

	Primary key(Period, Classroom, TermID, SectID),
	Foreign key(TermID) references Term(TermID),
	Foreign key(SectID) references Section(SectID)
);

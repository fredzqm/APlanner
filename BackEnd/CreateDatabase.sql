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
	UserID varchar(9),
	UserName varchar(12),
	FName varchar(30) not null,
	LName varchar(30) not null,
	type char(1),
	Password char(20) not null,

	Primary key(UserID),
	Constraint PeopleType Check ( type = 'S' or type = 'P' )
)
Go 

Create Table Friend (
	Requester varchar(9) not null,
	Accepter varchar(9) not null,
	time date,
	Primary key(Requester, Accepter),
	Foreign key(Requester) references People(UserID)
		on update cascade on delete cascade,
	Foreign key(Accepter) references People(UserID),
	Constraint Friend_Different check (Requester <> Accepter),
	Constraint Friend_Exist Check ( Requester <> null or  Accepter <> null )
)
Go

Create Function friendAlready(@req varchar(9), @acc varchar(9))
returns bit
As
begin
	if( exists (select * from Friend f where (@req = Requester and @acc = Accepter)
						or (@acc = Requester and @req = Accepter) ) )
		return 1;
	return 0;
end
Go

Create Table FriendRequest (
	Requester varchar(9) not null,
	Accepter varchar(9) not null,
	time date,
	
	Primary key(Requester, Accepter),
	Foreign key(Requester) references People(UserID),
	Foreign key(Accepter) references People(UserID),
	constraint ResquestToNonFriend Check (
		dbo.friendAlready(Requester, Accepter) = 0
	)
);
Go

Create Table Message (
	MessID int IDENTITY (1,1),
	Sender varchar(9),
	Receiver varchar(9),
	Content text not null,
	time datetime,

	Primary key(MessID, Sender, Receiver),
	Foreign key(Sender) references People(UserID)
		on update cascade,
	Foreign key(Receiver) references People(UserID),
	Constraint MessOwner Check ( Sender <> null or  Receiver <> null )
);
Go

Create Table Department(
	DepartID varchar(5) primary key,
	DepartNAME varchar(50) not null
);
Go

Create Table Professor (
	PUserID varchar(9) primary key,
	DepartID varchar(5),
	Office varchar(6),
	Foreign key(PUserID) references People(UserID)
		on update cascade on delete cascade,
	Foreign key(DepartID) references Department(DepartID)
		on update cascade on delete set null
)
Go

Create Table Student (
	SUserID varchar(9) primary key,
	Major varchar(12) DEFAULT 'Undeclared',
	Year tinyint,
	
	Foreign key(SUserID) references People(UserID)
		on update cascade on delete cascade
)
Go

Create Table Term (
	TermID int primary key,
	Start_date date not null,
	End_date date not null
)
Go

Create Table SPlan (
	PID int primary key IDENTITY (1,1),
	SUserID varchar(9) not null,
	TermID int  not null,
	Priority tinyint,
	Probability float,
	
	Foreign key(SUserID) references Student(SUserID)
		on update cascade on delete cascade,
	Foreign key(TermID) references Term(TermID)
		on update cascade on delete cascade
)
Go

Create Table Course (
	CourseID smallint identity(1, 1),
	CourseDP varchar(5) not null,
	CourseName varchar(50),
	CourseNum smallint,
	Description text default '',
	Credit tinyint,

	Primary key(CourseID),
	Foreign key(CourseDP) references Department(DepartID)
		on update cascade on delete cascade
)
Go

Create Table Contain (
	CourseID smallint not null,
	PID int not null,
	
	Primary key(CourseID, PID),
	Foreign key(CourseID) references Course(CourseID)
		on update cascade on delete cascade,
	Foreign key(PID) references SPlan(PID)
		on update cascade on delete cascade
)
Go

Create Table Prerequisite (
	Prerequisite smallint not null,
	Requisite smallint not null,

	Primary key(Prerequisite, Requisite),
	Foreign key(Prerequisite) references Course(CourseID),
	Foreign key(Requisite) references Course(CourseID)
		on update cascade on delete cascade,
)
Go

Create Table Schedule (
	ScheID int IDENTITY (1,1),
	PID int,
	Probability float,
	Priority tinyint,
	PublicOrPrivate bit not null,
	
	Primary key(ScheID),
	Foreign key(PID) references SPlan(PID)
		on update cascade on delete set null
)
Go

Create Table Section (
	SectID int IDENTITY (1,1),
	TermID int not null,
	CourseID smallint not null,
	SectNum tinyint not null,
	PUserID varchar(9),
	EnrollNum tinyint,
	Capacity int,

	Primary key(SectID),
	Foreign key(TermID) references Term(TermID)
		on update cascade on delete cascade,
	Foreign key(CourseID) references Course(CourseID),
	Foreign key(PUserID) references Professor(PUserID),
)
Go

Create Table Has (
	SectID int not null,
	ScheID int not null,

	Primary key(ScheID, SectID),
	Foreign key(SectID) references Section(SectID),
	Foreign key(ScheID) references Schedule(ScheID)
		on update cascade on delete cascade
)
Go

Create Table Enroll (
	SectID int not null,
	SUserID varchar(9) not null,
	Time datetime not null,
	Rating tinyint default null,

	Primary key(SectID, SUserID),
	Foreign key(SUserID) references Student(SUserID),
	Foreign key(SectID) references Section(SectID)
		on update cascade on delete cascade
)
Go

Create Function enrollAlready(@sect int, @user varchar(9))
returns bit
As
begin
	if exists (select * from Enroll where (@sect = SectID and @user = SUserID) ) 
		return 1;
	return 0;
end
Go

Create Table WaitList (
	SectID int not null,
	SUserID varchar(9) not null,
	Time datetime not null,

	Primary key(SectID, SUserID),
	Foreign key(SUserID) references Student(SUserID)
		on update cascade on delete cascade,
	Foreign key(SectID) references Section(SectID)
		on update cascade on delete cascade,
	constraint waitListNotEnrolledStudent Check (dbo. enrollAlready(SectID, SUserID) = 0)
)

Go

Create Table STime (
	SectID int not null,
	Classroom varchar(7) default 'TBA',
	Period tinyint not null,
	TermID int not null,

	Primary key(Period, Classroom, TermID, SectID),
	Foreign key(TermID) references Term(TermID),
	Foreign key(SectID) references Section(SectID)
		on update cascade on delete cascade
);
Go

--- Go  a stored procedure for setting permissions
Create proc ProvideOwnerPermit
	@user varchar(20)
As
begin
	--- set authority
	EXECUTE( 'CREATE USER ['+@user+'] FOR LOGIN ['+@user+'] WITH DEFAULT_SCHEMA=[dbo] ' );
	EXECUTE( 'ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO ['+@user+'] ' );
	EXECUTE( 'ALTER ROLE [db_owner] ADD MEMBER ['+@user+'] ' );

	--- set permissions
	EXECUTE( 'GRANT ALTER TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY APPLICATION ROLE TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY ASSEMBLY TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY ASYMMETRIC KEY TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY CERTIFICATE TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY CONTRACT TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY DATABASE AUDIT TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY DATABASE DDL TRIGGER TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY DATABASE EVENT NOTIFICATION TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY DATASPACE TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY FULLTEXT CATALOG TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY MESSAGE TYPE TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY REMOTE SERVICE BINDING TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY ROLE TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY ROUTE TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY SCHEMA TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY SERVICE TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY SYMMETRIC KEY TO ['+@user+']' );
	EXECUTE( 'GRANT ALTER ANY USER TO ['+@user+']' );
	EXECUTE( 'GRANT AUTHENTICATE TO ['+@user+']' );
	EXECUTE( 'GRANT BACKUP DATABASE TO ['+@user+']' );
	EXECUTE( 'GRANT BACKUP LOG TO ['+@user+']' );
	EXECUTE( 'GRANT CHECKPOINT TO ['+@user+']' );
	EXECUTE( 'GRANT CONNECT TO ['+@user+']' );
	EXECUTE( 'GRANT CONNECT REPLICATION TO ['+@user+']' );
	EXECUTE( 'GRANT CONTROL TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE AGGREGATE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE ASSEMBLY TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE ASYMMETRIC KEY TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE CERTIFICATE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE CONTRACT TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE DATABASE DDL EVENT NOTIFICATION TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE DEFAULT TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE FULLTEXT CATALOG TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE FUNCTION TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE MESSAGE TYPE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE PROCEDURE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE QUEUE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE REMOTE SERVICE BINDING TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE ROLE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE ROUTE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE RULE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE SCHEMA TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE SERVICE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE SYMMETRIC KEY TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE SYNONYM TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE TABLE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE TYPE TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE VIEW TO ['+@user+']' );
	EXECUTE( 'GRANT CREATE XML SCHEMA COLLECTION TO ['+@user+']' );
	EXECUTE( 'GRANT DELETE TO ['+@user+']' );
	EXECUTE( 'GRANT EXECUTE TO ['+@user+']' );
	EXECUTE( 'GRANT INSERT TO ['+@user+']' );
	EXECUTE( 'GRANT REFERENCES TO ['+@user+']' );
	EXECUTE( 'GRANT SELECT TO ['+@user+']' );
	EXECUTE( 'GRANT SHOWPLAN TO ['+@user+']' );
	EXECUTE( 'GRANT SUBSCRIBE QUERY NOTIFICATIONS TO ['+@user+']' );
	EXECUTE( 'GRANT TAKE OWNERSHIP TO ['+@user+']' );
	EXECUTE( 'GRANT UPDATE TO ['+@user+']' );
	EXECUTE( 'GRANT VIEW DATABASE STATE TO ['+@user+']' );
	EXECUTE( 'GRANT VIEW DEFINITION TO ['+@user+']' );
end
Go


USE [APlanner]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [dbo]
GO


if not Exists ( select * from sys.databases where name = 'APlanner' and suser_sname(owner_sid) = 'zhangq2')
begin
	Exec ProvideOwnerPermit 'zhangq2';	---- this table is created by dingy2, add zhangq2 as woner
end
Go

if not Exists ( select * from sys.databases where name = 'APlanner' and suser_sname(owner_sid) = 'dingy2')
begin
	Exec ProvideOwnerPermit 'dingy2';	---- this table is created by dingy2, add zhangq2 as woner
end
Go

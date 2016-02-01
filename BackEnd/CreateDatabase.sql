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

Create Table Department(
	DepartID varchar(5) primary key,
	DepartNAME varchar(50)
);

Create Table Professor (
	PUserID varchar(9) primary key,
	DepartID varchar(5),

	Foreign key(PUserID) references People(UserID),
	Foreign key(DepartID) references Department(DepartID)
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
	PID int primary key IDENTITY (1,1),
	SUserID varchar(9),
	TermID int,
	Priority tinyint Unique,
	Probability int,
	
	Foreign key(SUserID) references Student(SUserID),
	Foreign key(TermID) references Term(TermID)
);


Create Table Course (
	CourseID smallint,
	CourseDP varchar(5),
	CourseNum smallint,
	Descrip text,
	Credit tinyint not null,

	Primary key(CourseID),
	Foreign key(CourseDP) references Department(DepartID)
);


Create Table Contain (
	CourseID smallint,
	PID int,
	
	Primary key(CourseID, PID),
	Foreign key(CourseID) references Course(CourseID),
	Foreign key(PID) references SPlan(PID)
);

Create Table Prerequisite (
	CourseIDL smallint,
	CourseIDH smallint,

	Primary key(CourseIDL, CourseIDH),
	Foreign key(CourseIDL) references Course(CourseID),
	Foreign key(CourseIDH) references Course(CourseID)
);


Create Table Schedule (
	ScheID int IDENTITY (1,1),
	PID int,
	Probability int,
	Priority tinyint Unique,
	PublicOrPrivate varchar(7),
	
	Primary key(ScheID),
	Foreign key(PID) references SPlan(PID)
);


Create Table Section (
	SectID int,
	TermID int,
	CourseID smallint,
	SectNum tinyint,
	PUserID varchar(9),
	EnrollNum tinyint,
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
	St ENUM('enroll', 'waitlist'),
	Rating tinyint,

	Primary key(SectID, SUserID),
	Foreign key(SUserID) references Student(SUserID),
	Foreign key(SectID) references Section(SectID)
);

Create Table STime (
	SectID int,
	Classroom varchar(7),
	Period tinyint,
	TermID int,

	Primary key(Period, Classroom, TermID, SectID),
	Foreign key(TermID) references Term(TermID),
	Foreign key(SectID) references Section(SectID)
);
Go

--- create a stored procedure for setting permissions
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

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
	Probability int,
	
	Foreign key(SUserID) references Student(SUserID),
	Foreign key(TermID) references Term(TermID)
);


Create Table Course (
	CourseID smallint,
	CourseDP varchar(5),
	CourseNum smallint,
	Descrip text,
	Credict tinyint not null,

	Primary key(CourseID),
	Foreign key(CourseDP) references Department(DepartID)
);


Create Table Contain (
	CourseID smallint,
	CourseDP varchar(5),
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
	Pri int,
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
	EnrollNum int,
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
	Period tinyint,
	TermID int,

	Primary key(Period, Classroom, TermID, SectID),
	Foreign key(TermID) references Term(TermID),
	Foreign key(SectID) references Section(SectID)
);

--- set authority

USE [APlanner]
GO
CREATE USER [zhangq2] FOR LOGIN [zhangq2] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [APlanner]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [zhangq2]
GO
USE [APlanner]
GO
ALTER ROLE [db_owner] ADD MEMBER [zhangq2]
GO

--- set permissions

use [APlanner]
GO
GRANT ALTER TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY APPLICATION ROLE TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY ASSEMBLY TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY ASYMMETRIC KEY TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY CERTIFICATE TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY CONTRACT TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY DATABASE AUDIT TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY DATABASE DDL TRIGGER TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY DATABASE EVENT NOTIFICATION TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY DATASPACE TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY FULLTEXT CATALOG TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY MESSAGE TYPE TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY REMOTE SERVICE BINDING TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY ROLE TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY ROUTE TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY SCHEMA TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY SERVICE TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY SYMMETRIC KEY TO [zhangq2]
GO
use [APlanner]
GO
GRANT ALTER ANY USER TO [zhangq2]
GO
use [APlanner]
GO
GRANT AUTHENTICATE TO [zhangq2]
GO
use [APlanner]
GO
GRANT BACKUP DATABASE TO [zhangq2]
GO
use [APlanner]
GO
GRANT BACKUP LOG TO [zhangq2]
GO
use [APlanner]
GO
GRANT CHECKPOINT TO [zhangq2]
GO
use [APlanner]
GO
GRANT CONNECT TO [zhangq2]
GO
use [APlanner]
GO
GRANT CONNECT REPLICATION TO [zhangq2]
GO
use [APlanner]
GO
GRANT CONTROL TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE AGGREGATE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE ASSEMBLY TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE ASYMMETRIC KEY TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE CERTIFICATE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE CONTRACT TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE DATABASE DDL EVENT NOTIFICATION TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE DEFAULT TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE FULLTEXT CATALOG TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE FUNCTION TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE MESSAGE TYPE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE PROCEDURE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE QUEUE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE REMOTE SERVICE BINDING TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE ROLE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE ROUTE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE RULE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE SCHEMA TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE SERVICE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE SYMMETRIC KEY TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE SYNONYM TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE TABLE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE TYPE TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE VIEW TO [zhangq2]
GO
use [APlanner]
GO
GRANT CREATE XML SCHEMA COLLECTION TO [zhangq2]
GO
use [APlanner]
GO
GRANT DELETE TO [zhangq2]
GO
use [APlanner]
GO
GRANT EXECUTE TO [zhangq2]
GO
use [APlanner]
GO
GRANT INSERT TO [zhangq2]
GO
use [APlanner]
GO
GRANT REFERENCES TO [zhangq2]
GO
use [APlanner]
GO
GRANT SELECT TO [zhangq2]
GO
use [APlanner]
GO
GRANT SHOWPLAN TO [zhangq2]
GO
use [APlanner]
GO
GRANT SUBSCRIBE QUERY NOTIFICATIONS TO [zhangq2]
GO
use [APlanner]
GO
GRANT TAKE OWNERSHIP TO [zhangq2]
GO
use [APlanner]
GO
GRANT UPDATE TO [zhangq2]
GO
use [APlanner]
GO
GRANT VIEW DATABASE STATE TO [zhangq2]
GO
use [APlanner]
GO
GRANT VIEW DEFINITION TO [zhangq2]
GO


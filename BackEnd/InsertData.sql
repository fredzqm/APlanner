use APlanner
GO

--- DISABLE TRIGGER { [ schema_name . ] trigger_name [ ,...n ] | ALL }
--- ON { object_name | DATABASE | ALL SERVER };
Disable trigger UpdateEnrollNumDelete ON  Enroll;
Go
Disable TRIGGER CourseDelete ON  Course
Go

Delete From STime;
Go
Delete From WaitList;
Go
Delete From Enroll;
Go
Delete From Has;
Go
Delete From Section;
Go
Delete From Schedule;
Go
Delete From Prerequisite;
Go
Delete From Contain;
Go
Delete From Course;
Go
Delete From SPlan;
Go
Delete From Term;
Go
Delete From Student;
Go
Delete From Professor;
Go
Delete From Department;
Go
Delete From Message;
Go
Delete From FriendRequest;
Go
Delete From Friend;
Go
Delete From People;
Go

enable TRIGGER CourseDelete ON  Course
Go
enable trigger UpdateEnrollNumDelete ON  [Enroll];
Go


Insert into Department (DepartID, DepartNAME)
	values('CSSE', 'Computer Science and Software Engineering'), 
		('ECE', 'Electrical and Computer Engineering'), 
		('CHEM', 'Chemistry'), 
		('MA', 'Mathematics'), 
		('PH', 'Physics');
Go


exec  RegisterStudent '80120574', 'dingy2', 'Mercury', 'Ding','pskeidjnsrkk203','CS', 2 ;
Go
exec  RegisterStudent '80120575', 'whitec', 'Crystal', 'White', 'skenskesdf3203','BE', 2 ;
Go
exec  RegisterStudent '80120576', 'katrinap', 'Perry', 'Katrina','pskeidjnsrkk203','CHEM', 2 ;
Go
exec  RegisterStudent '80120577', 'zhangq2', 'Fred', 'Zhang','pskeidjnsrkk203','SE', 3 ;
Go
exec  RegisterStudent '80120573', 'karryc', 'Crystal', 'Karry', 'skenskesdf3203','CPE', 4 ;
Go

--- Create Procedure RegisterProfessor
---   	@UserID varchar(9),
--- 	@UserName varchar(12),
--- 	@FName varchar(30),
---     @LName varchar(30),
---     @Password char(20),
--- 	@Deartment varchar(5),
--- 	@Office varchar(6)

exec RegisterProfessor '80120001', 'mutchler', '', 'Mutchler', 'skenskesdf3203','CSSE', 'C203' ;
Go
exec RegisterProfessor '80120002', 'galluzzi', '', 'galluzzi', 'skenskesdf3wqe203','CSSE', 'D203' ;
Go
exec RegisterProfessor '80120003', 'taylormt', '', 'taylormt', 'skenskesdf3203','CSSE', 'F203' ;
Go
exec RegisterProfessor '80120004', 'mellor', '', 'mellor', 'skenskesdf3203','CSSE', 'C203' ;
Go
exec RegisterProfessor '80120005', 'holden', '', 'Holden', 'skenskesdf3wqe203','MA', 'D203' ;
Go
exec RegisterProfessor '80120006', 'isaia', '', 'isaia', 'skenskesdf3203','MA', 'F203' ;
Go
exec RegisterProfessor '80120007', 'bryan', '', 'bryan', 'skenskesdf3wqe203','MA', 'D203' ;
Go
exec RegisterProfessor '80120008', 'langley', '', 'langley', 'skenskesdf3203','MA', 'F203' ;
Go
exec RegisterProfessor '80120009', 'kirtley', '', 'kirtley', 'skenskesdf3203','PH', 'F203' ;
Go
exec RegisterProfessor '80120010', 'joshi', '', 'joshi', 'skenskesdf3203','PH', 'F203' ;
Go


exec AddCourse 'CSSE',120,'Intro to Software Development','', 4 ;
Go
exec AddCourse 'CSSE',220,'Object-Oriented Software Dvlpm','', 4 ;
Go
exec AddCourse 'CSSE',230,'Data Struct & Algorithm Anlys','', 4 ;
Go
exec AddCourse 'CSSE',332,'Operating Systems','', 4 ;
Go
exec AddCourse 'CSSE',232,'Computer Architecture I','', 4 ;
Go
exec AddCourse 'CSSE',333,'Intro to Database Systems','', 4 ;
Go
exec AddCourse 'CSSE',374,'Software Design','', 4 ;
Go
exec AddCourse 'CSSE',375,'Software Constr & Evolution','', 4 ;
Go
exec AddCourse 'CSSE',403,'Programming Language Paradigms','', 4 ;
Go
exec AddCourse 'CSSE',442,'Computer Security','', 4 ;
Go
exec AddCourse 'CSSE',463,'Image Recognition','', 4 ;
Go
exec AddCourse 'ECE',230,'Introduction to Microcontroller','', 4 ;
Go
exec AddCourse 'ECE',160,'Engineering Practice','', 4 ;
Go
exec AddCourse 'ECE',203,'DC circuit','', 4 ;
Go
exec AddCourse 'ECE',204,'AC circuit','', 4 ;
Go
exec AddCourse 'MA',112,'Calculus II','', 5 ;
Go
exec AddCourse 'MA',113,'Calculus III','', 5 ;
Go
exec AddCourse 'MA',190,'Contemporary Mathematical Prob','', 4 ;
Go
exec AddCourse 'MA',211,'Differential Equations','', 4 ;
Go
exec AddCourse 'MA',212,'Matr Alg & Sys of Diff Equ -Y1','', 4 ;
Go
exec AddCourse 'MA',223,'Engineering Statistics I','', 4 ;
Go
exec AddCourse 'MA',330,'Vector Calculus','', 4 ;
Go
exec AddCourse 'MA',375,'Discrete & Comb Algebra II','', 4 ;
Go
exec AddCourse 'MA',376,'Abstract Algebra','', 4 ;
Go
exec AddCourse 'PH',112,'Physics II','', 4 ;
Go
exec AddCourse 'PH',113,'Physics III','', 4 ;
Go






Insert into Term ([TermID] ,[Start_Date] ,[End_Date])
	Values 
	(201510,'8-28-2015','02-26-2016'),
	(201520,'11-23-2015','02-26-2016'),
	(201530,'03-07-2016','05-27-2016');
Go


exec CreateSection 201510,'CSSE',120,1,80120001,24;
Go
exec CreateSection 201510,'CSSE',120,2,80120001,24;
Go
exec CreateSection 201510,'CSSE',120,3,80120001,24;
Go
exec CreateSection 201510,'CSSE',220,1,80120002,24;
Go
exec CreateSection 201510,'CSSE',220,2,80120002,24;
Go
exec CreateSection 201510,'CSSE',220,3,80120002,24;
Go
exec CreateSection 201510,'CSSE',230,1,80120003,24;
Go
exec CreateSection 201510,'CSSE',230,2,80120003,24;
Go
exec CreateSection 201510,'CSSE',230,3,80120003,24;
Go

exec CreateSection 201510,'ECE',230,1,80120004,24;
Go
exec CreateSection 201510,'ECE',230,2,80120004,24;
Go
exec CreateSection 201510,'ECE',230,3,80120004,24;
Go
exec CreateSection 201510,'ECE',160,1,80120001,24;
Go
exec CreateSection 201510,'ECE',160,2,80120001,24;
Go
exec CreateSection 201510,'ECE',160,3,80120001,24;
Go
exec CreateSection 201510,'ECE',203,1,80120002,24;
Go
exec CreateSection 201510,'ECE',203,2,80120002,24;
Go
exec CreateSection 201510,'ECE',203,3,80120002,24;
Go

exec CreateSection 201510,'ECE',204,1,80120003,24;
Go
exec CreateSection 201510,'ECE',204,2,80120003,24;
Go
exec CreateSection 201510,'ECE',204,3,80120003,24;
Go
exec CreateSection 201510,'CSSE',232,1,80120004,24;
Go
exec CreateSection 201510,'CSSE',232,2,80120004,24;
Go
exec CreateSection 201510,'CSSE',232,3,80120004,24;
Go
exec CreateSection 201510,'MA',330,1,80120001,24;
Go
exec CreateSection 201510,'MA',330,2,80120001,24;
Go
exec CreateSection 201510,'MA',330,3,80120001,24;
Go

exec CreateSection 201510,'MA',113,1,80120002,24;
Go
exec CreateSection 201510,'MA',113,2,80120002,24;
Go
exec CreateSection 201510,'MA',113,3,80120002,24;
Go
exec CreateSection 201510,'MA',112,1,80120003,24;
Go
exec CreateSection 201510,'MA',112,2,80120003,24;
Go
exec CreateSection 201510,'MA',112,3,80120003,24;
Go


exec CreateSection 201510,'MA',212,1,80120005,24;
Go
exec CreateSection 201510,'MA',212,2,80120005,24;
Go
exec CreateSection 201510,'MA',212,3,80120005,24;
Go
exec CreateSection 201510,'MA',211,1,80120006,24;
Go
exec CreateSection 201510,'MA',211,2,80120006,24;
Go
exec CreateSection 201510,'MA',211,3,80120006,24;
Go
exec CreateSection 201510,'CSSE',374,1,80120007,24;
Go
exec CreateSection 201510,'CSSE',374,2,80120007,24;
Go
exec CreateSection 201510,'CSSE',374,3,80120007,24;
Go

exec CreateSection 201510,'CSSE',333,1,80120008,24;
Go
exec CreateSection 201510,'CSSE',333,2,80120008,24;
Go
exec CreateSection 201510,'CSSE',333,3,80120008,24;
Go
exec CreateSection 201510,'CSSE',442,1,80120005,24;
Go
exec CreateSection 201510,'CSSE',442,2,80120005,24;
Go
exec CreateSection 201510,'CSSE',442,3,80120005,24;
Go
exec CreateSection 201510,'CSSE',463,1,80120006,24;
Go
exec CreateSection 201510,'CSSE',463,2,80120006,24;
Go
exec CreateSection 201510,'CSSE',463,3,80120006,24;
Go

exec CreateSection 201510,'CSSE',375,1,80120007,24;
Go
exec CreateSection 201510,'CSSE',375,2,80120007,24;
Go
exec CreateSection 201510,'CSSE',375,3,80120007,24;
Go
exec CreateSection 201510,'CSSE',463,1,80120008,24;
Go
exec CreateSection 201510,'CSSE',463,2,80120008,24;
Go
exec CreateSection 201510,'CSSE',463,3,80120008,24;
Go
exec CreateSection 201510,'CSSE',463,1,80120005,24;
Go
exec CreateSection 201510,'CSSE',463,2,80120005,24;
Go
exec CreateSection 201510,'CSSE',463,3,80120005,24;
Go

exec EnrollStudent '80120574', 1 ;
Go
exec EnrollStudent '80120575', 1 ;
Go
exec EnrollStudent '80120576', 1 ;
Go

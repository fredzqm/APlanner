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
		('PH', 'Physics'),
		('RH','Rhetoric and humanities');
Go


exec  RegisterStudent '80120574', 'dingy2', 'Mercury', 'Ding','pskeidjnsrkk203','CS', 2 ;
exec  RegisterStudent '80120575', 'whitec', 'Crystal', 'White', 'skenskesdf3203','BE', 2 ;
exec  RegisterStudent '80120576', 'katrinap', 'Perry', 'Katrina','pskeidjnsrkk203','CHEM', 2 ;
exec  RegisterStudent '80120577', 'zhangq2', 'Fred', 'Zhang','pskeidjnsrkk203','SE', 3 ;
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
exec RegisterProfessor '80120002', 'galluzzi', '', 'galluzzi', 'skenskesdf3wqe203','CSSE', 'D203' ;
exec RegisterProfessor '80120003', 'taylormt', '', 'taylormt', 'skenskesdf3203','CSSE', 'F203' ;
exec RegisterProfessor '80120004', 'mellor', '', 'mellor', 'skenskesdf3203','CSSE', 'C203' ;
exec RegisterProfessor '80120005', 'holden', '', 'Holden', 'skenskesdf3wqe203','MA', 'D203' ;
exec RegisterProfessor '80120006', 'isaia', '', 'isaia', 'skenskesdf3203','MA', 'F203' ;
exec RegisterProfessor '80120007', 'bryan', '', 'bryan', 'skenskesdf3wqe203','MA', 'D203' ;
exec RegisterProfessor '80120008', 'langley', '', 'langley', 'skenskesdf3203','MA', 'F203' ;
exec RegisterProfessor '80120009', 'kirtley', '', 'kirtley', 'skenskesdf3203','PH', 'F203' ;
exec RegisterProfessor '80120010', 'joshi', '', 'joshi', 'skenskesdf3203','PH', 'F203' ;
Go

exec AddCourse 'CSSE',120,'Intro to Software Development','', 4 ;
exec AddCourse 'CSSE',220,'Object-Oriented Software Dvlpm','', 4 ;
exec AddCourse 'CSSE',230,'Data Struct & Algorithm Anlys','', 4 ;
exec AddCourse 'CSSE',332,'Operating Systems','', 4 ;
exec AddCourse 'CSSE',232,'Computer Architecture I','', 4 ;
exec AddCourse 'CSSE',333,'Intro to Database Systems','', 4 ;
exec AddCourse 'CSSE',374,'Software Design','', 4 ;
exec AddCourse 'CSSE',375,'Software Constr & Evolution','', 4 ;
exec AddCourse 'CSSE',403,'Programming Language Paradigms','', 4 ;
exec AddCourse 'CSSE',442,'Computer Security','', 4 ;
exec AddCourse 'CSSE',463,'Image Recognition','', 4 ;
exec AddCourse 'ECE',230,'Introduction to Microcontroller','', 4 ;
exec AddCourse 'ECE',160,'Engineering Practice','', 4 ;
exec AddCourse 'ECE',203,'DC circuit','', 4 ;
exec AddCourse 'ECE',204,'AC circuit','', 4 ;
exec AddCourse 'ECE',332,'Computer Architecture II','', 4 ;
exec AddCourse 'MA',112,'Calculus II','', 5 ;
exec AddCourse 'MA',113,'Calculus III','', 5 ;
exec AddCourse 'MA',190,'Contemporary Mathematical Prob','', 4 ;
exec AddCourse 'MA',211,'Differential Equations','', 4 ;
exec AddCourse 'MA',212,'Matr Alg & Sys of Diff Equ -Y1','', 4 ;
exec AddCourse 'MA',223,'Engineering Statistics I','', 4 ;
exec AddCourse 'MA',275,'Discrete Mathematics I','', 4 ;
exec AddCourse 'MA',276,'Discrete Mathematics II','', 4 ;
exec AddCourse 'MA',330,'Vector Calculus','', 4 ;
exec AddCourse 'MA',375,'Discrete & Comb Algebra II','', 4 ;
exec AddCourse 'MA',376,'Abstract Algebra','', 4 ;
exec AddCourse 'PH',112,'Physics II','', 4 ;
exec AddCourse 'PH',113,'Physics III','', 4 ;
exec AddCourse 'RH',330,'Technical Communication','', 4 ;
Go

Insert into Term ([TermID] ,[Start_Date] ,[End_Date])
	Values 
	(201510,'8-28-2015','02-26-2016'),
	(201520,'11-23-2015','02-26-2016'),
	(201530,'03-07-2016','05-27-2016');
Go

exec CreateSection 201510,'CSSE',120,1,80120001,24;
exec CreateSection 201510,'CSSE',120,2,80120001,24;
exec CreateSection 201510,'CSSE',120,3,80120001,24;
exec CreateSection 201510,'CSSE',220,1,80120002,24;
exec CreateSection 201510,'CSSE',220,2,80120002,24;
exec CreateSection 201510,'CSSE',220,3,80120002,24;
exec CreateSection 201510,'CSSE',230,1,80120003,24;
exec CreateSection 201510,'CSSE',230,2,80120003,24;
exec CreateSection 201510,'CSSE',230,3,80120003,24;
exec CreateSection 201510,'CSSE',232,1,80120004,24;
exec CreateSection 201510,'CSSE',232,2,80120004,24;
exec CreateSection 201510,'CSSE',232,3,80120004,24;
exec CreateSection 201510,'ECE',230,1,80120004,24;
exec CreateSection 201510,'ECE',230,2,80120004,24;
exec CreateSection 201510,'ECE',230,3,80120004,24;
exec CreateSection 201510,'ECE',160,1,80120001,24;
exec CreateSection 201510,'ECE',160,2,80120001,24;
exec CreateSection 201510,'ECE',160,3,80120001,24;
exec CreateSection 201510,'ECE',203,1,80120002,24;
exec CreateSection 201510,'ECE',203,2,80120002,24;
exec CreateSection 201510,'ECE',203,3,80120002,24;
exec CreateSection 201510,'ECE',204,1,80120003,24;
exec CreateSection 201510,'ECE',204,2,80120003,24;
exec CreateSection 201510,'ECE',204,3,80120003,24;
exec CreateSection 201510,'ECE',332,1,80120005,24;
exec CreateSection 201510,'ECE',332,2,80120005,24;
exec CreateSection 201510,'ECE',332,3,80120005,24;
exec CreateSection 201510,'MA',330,1,80120001,24;
exec CreateSection 201510,'MA',330,2,80120001,24;
exec CreateSection 201510,'MA',330,3,80120001,24;
exec CreateSection 201510,'MA',113,1,80120002,24;
exec CreateSection 201510,'MA',113,2,80120002,24;
exec CreateSection 201510,'MA',113,3,80120002,24;
exec CreateSection 201510,'MA',112,1,80120003,24;
exec CreateSection 201510,'MA',112,2,80120003,24;
exec CreateSection 201510,'MA',112,3,80120003,24;
exec CreateSection 201510,'MA',212,1,80120005,24;
exec CreateSection 201510,'MA',212,2,80120005,24;
exec CreateSection 201510,'MA',212,3,80120005,24;
exec CreateSection 201510,'MA',211,1,80120006,24;
exec CreateSection 201510,'MA',211,2,80120006,24;
exec CreateSection 201510,'MA',211,3,80120006,24;
exec CreateSection 201510,'CSSE',374,1,80120007,24;
exec CreateSection 201510,'CSSE',374,2,80120007,24;
exec CreateSection 201510,'CSSE',374,3,80120007,24;
exec CreateSection 201510,'CSSE',333,1,80120008,24;
exec CreateSection 201510,'CSSE',333,2,80120008,24;
exec CreateSection 201510,'CSSE',333,3,80120008,24;
exec CreateSection 201510,'CSSE',442,1,80120005,24;
exec CreateSection 201510,'CSSE',442,2,80120005,24;
exec CreateSection 201510,'CSSE',442,3,80120005,24;
exec CreateSection 201510,'CSSE',463,1,80120006,24;
exec CreateSection 201510,'CSSE',463,2,80120006,24;
exec CreateSection 201510,'CSSE',463,3,80120006,24;
exec CreateSection 201510,'CSSE',375,1,80120007,24;
exec CreateSection 201510,'CSSE',375,2,80120007,24;
exec CreateSection 201510,'CSSE',375,3,80120007,24;
exec CreateSection 201510,'CSSE',332,1,80120005,24;
exec CreateSection 201510,'CSSE',332,2,80120005,24;
exec CreateSection 201510,'CSSE',332,3,80120005,24;
exec CreateSection 201510,'MA',375,1,80120007,24;
exec CreateSection 201510,'MA',375,2,80120007,24;
exec CreateSection 201510,'MA',375,3,80120007,24;
exec CreateSection 201510,'MA',275,1,80120008,24;
exec CreateSection 201510,'MA',275,2,80120008,24;
exec CreateSection 201510,'MA',275,3,80120008,24;
exec CreateSection 201510,'RH',330,1,80120008,24;
exec CreateSection 201510,'RH',330,2,80120008,24;
exec CreateSection 201510,'RH',330,3,80120008,24;
exec CreateSection 201510,'RH',330,4,80120008,24;

exec CreateSection 201520,'CSSE',120,1,80120001,24;
exec CreateSection 201520,'CSSE',120,2,80120001,24;
exec CreateSection 201520,'CSSE',120,3,80120001,24;
exec CreateSection 201520,'CSSE',220,1,80120002,24;
exec CreateSection 201520,'CSSE',220,2,80120002,24;
exec CreateSection 201520,'CSSE',220,3,80120002,24;
exec CreateSection 201520,'CSSE',230,1,80120003,24;
exec CreateSection 201520,'CSSE',230,2,80120003,24;
exec CreateSection 201520,'CSSE',230,3,80120003,24;
exec CreateSection 201520,'ECE',230,1,80120004,24;
exec CreateSection 201520,'ECE',230,2,80120004,24;
exec CreateSection 201520,'ECE',230,3,80120004,24;
exec CreateSection 201520,'ECE',230,4,80120008,24;
exec CreateSection 201520,'ECE',160,1,80120001,24;
exec CreateSection 201520,'ECE',160,2,80120001,24;
exec CreateSection 201520,'ECE',160,3,80120001,24;
exec CreateSection 201520,'ECE',203,1,80120002,24;
exec CreateSection 201520,'ECE',203,2,80120002,24;
exec CreateSection 201520,'ECE',203,3,80120002,24;
exec CreateSection 201520,'ECE',204,1,80120003,24;
exec CreateSection 201520,'ECE',204,2,80120003,24;
exec CreateSection 201520,'ECE',204,3,80120003,24;
exec CreateSection 201520,'ECE',332,1,80120005,24;
exec CreateSection 201520,'ECE',332,2,80120005,24;
exec CreateSection 201520,'ECE',332,3,80120005,24;
exec CreateSection 201520,'MA',330,1,80120001,24;
exec CreateSection 201520,'MA',330,2,80120001,24;
exec CreateSection 201520,'MA',330,3,80120001,24;
exec CreateSection 201520,'MA',113,1,80120002,24;
exec CreateSection 201520,'MA',113,2,80120002,24;
exec CreateSection 201520,'MA',113,3,80120002,24;
exec CreateSection 201520,'MA',112,1,80120003,24;
exec CreateSection 201520,'MA',112,2,80120003,24;
exec CreateSection 201520,'MA',112,3,80120003,24;
exec CreateSection 201520,'MA',212,1,80120005,24;
exec CreateSection 201520,'MA',212,2,80120005,24;
exec CreateSection 201520,'MA',212,3,80120005,24;
exec CreateSection 201520,'MA',211,1,80120006,24;
exec CreateSection 201520,'MA',211,2,80120006,24;
exec CreateSection 201520,'MA',211,3,80120006,24;
exec CreateSection 201520,'CSSE',374,1,80120007,24;
exec CreateSection 201520,'CSSE',374,2,80120007,24;
exec CreateSection 201520,'CSSE',374,3,80120007,24;
exec CreateSection 201520,'CSSE',333,1,80120008,24;
exec CreateSection 201520,'CSSE',333,2,80120008,24;
exec CreateSection 201520,'CSSE',333,3,80120008,24;
exec CreateSection 201520,'CSSE',442,1,80120005,24;
exec CreateSection 201520,'CSSE',442,2,80120005,24;
exec CreateSection 201520,'CSSE',442,3,80120005,24;
exec CreateSection 201520,'CSSE',463,1,80120006,24;
exec CreateSection 201520,'CSSE',463,2,80120006,24;
exec CreateSection 201520,'CSSE',463,3,80120006,24;
exec CreateSection 201520,'CSSE',375,1,80120007,24;
exec CreateSection 201520,'CSSE',375,2,80120007,24;
exec CreateSection 201520,'CSSE',375,3,80120007,24;
exec CreateSection 201520,'CSSE',332,1,80120005,24;
exec CreateSection 201520,'CSSE',332,2,80120005,24;
exec CreateSection 201520,'CSSE',332,3,80120005,24;
exec CreateSection 201520,'MA',275,1,80120008,24;
exec CreateSection 201520,'MA',275,2,80120008,24;
exec CreateSection 201520,'MA',275,3,80120008,24;
exec CreateSection 201520,'RH',330,1,80120008,24;
exec CreateSection 201520,'RH',330,2,80120008,24;
exec CreateSection 201520,'RH',330,3,80120008,24;
exec CreateSection 201520,'RH',330,4,80120008,24;

Declare @SUserID varchar(9);
Set @SUserID = dbo.UserNameToID('dingy2');
Declare @SectID int;
Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('ECE', 332), 1) ;
exec EnrollStudent  @SUserID , @SectID;
Set @SUserID = dbo.UserNameToID('zhangq2');
exec EnrollStudent  @SUserID , @SectID;
Set @SUserID = dbo.UserNameToID('karryc');
exec EnrollStudent  @SUserID , @SectID;
Go

Declare @SectID int;
Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('ECE', 332), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,01,1,'C115'),
		(@SectID,01,2,'C115'),
		(@SectID,01,3,'C115'),
		(@SectID,01,4,'C115'),
		(@SectID,01,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('CSSE', 230), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,02,1,'C115'),
		(@SectID,02,2,'C115'),
		(@SectID,02,3,'C115'),
		(@SectID,02,4,'C115'),
		(@SectID,02,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('CSSE', 230), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,03,1,'C115'),
		(@SectID,03,2,'C115'),
		(@SectID,03,3,'C115'),
		(@SectID,03,4,'C115'),
		(@SectID,03,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('MA', 375), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,01,1,'D115'),
		(@SectID,01,2,'D115'),
		(@SectID,01,3,'D115'),
		(@SectID,01,4,'D115'),
		(@SectID,01,5,'D115');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('CSSE', 332), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,02,1,'D115'),
		(@SectID,02,2,'D115'),
		(@SectID,02,3,'D115'),
		(@SectID,02,4,'D115'),
		(@SectID,02,5,'D115');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('ECE', 230), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,06,1,'C115'),
		(@SectID,06,2,'C115'),
		(@SectID,06,4,'C115'),
		(@SectID,04,5,'C115'),
		(@SectID,05,5,'C115'),
		(@SectID,06,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('CSSE', 230), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,02,1,'C115'),
		(@SectID,02,2,'C115'),
		(@SectID,02,3,'C115'),
		(@SectID,02,4,'C115'),
		(@SectID,02,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('CSSE', 333), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,09,1,'O259'),
		(@SectID,10,1,'O259'),
		(@SectID,09,2,'O259'),
		(@SectID,10,2,'O259'),
		(@SectID,09,4,'O259'),
		(@SectID,10,4,'O259');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('CSSE', 332), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,07,1,'G308'),
		(@SectID,07,2,'G308'),
		(@SectID,05,3,'O259'),
		(@SectID,06,3,'O259'),
		(@SectID,07,3,'O259'),
		(@SectID,07,4,'G308');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('RH', 330), 4) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,08,1,'M105'),
		(@SectID,08,2,'M105'),
		(@SectID,08,4,'M105'),
		(@SectID,08,5,'M105');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('RH', 330), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,07,1,'M105'),
		(@SectID,07,2,'M105'),
		(@SectID,07,4,'M105'),
		(@SectID,07,5,'M105');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('ECE', 332), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,01,1,'C115'),
		(@SectID,01,2,'C115'),
		(@SectID,01,3,'C115'),
		(@SectID,01,4,'C115'),
		(@SectID,01,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('CSSE', 332), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,03,1,'C115'),
		(@SectID,03,2,'C115'),
		(@SectID,03,3,'C115'),
		(@SectID,03,4,'C115'),
		(@SectID,03,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('MA', 375), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,01,1,'G315'),
		(@SectID,01,2,'G315'),
		(@SectID,01,3,'G315'),
		(@SectID,01,4,'G315'),
		(@SectID,01,5,'G315');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('CSSE', 332), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,02,1,'G315'),
		(@SectID,02,2,'G315'),
		(@SectID,02,3,'G315'),
		(@SectID,02,4,'G315'),
		(@SectID,02,5,'G315');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('ECE', 230), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,06,1,'D115'),
		(@SectID,06,2,'D115'),
		(@SectID,06,4,'D115'),
		(@SectID,04,5,'D115'),
		(@SectID,05,5,'D115'),
		(@SectID,06,5,'D115');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('CSSE', 333), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,09,1,'O257'),
		(@SectID,10,1,'O257'),
		(@SectID,09,2,'O257'),
		(@SectID,10,2,'O257'),
		(@SectID,09,4,'O257'),
		(@SectID,10,4,'O257');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('CSSE', 332), 3) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,07,1,'G308'),
		(@SectID,07,2,'G308'),
		(@SectID,05,3,'O257'),
		(@SectID,06,3,'O257'),
		(@SectID,07,3,'O257'),
		(@SectID,07,4,'G308');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('RH', 330), 4) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,08,1,'M105'),
		(@SectID,08,2,'M105'),
		(@SectID,08,4,'M105'),
		(@SectID,08,5,'M105');

Set @SectID = dbo.TermCourseToSectID(201510, dbo.CourseDpNumToCourseID('RH', 330), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,07,1,'M105'),
		(@SectID,07,2,'M105'),
		(@SectID,07,4,'M105'),
		(@SectID,07,5,'M105');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('ECE', 332), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,01,1,'C115'),
		(@SectID,01,2,'C115'),
		(@SectID,01,3,'C115'),
		(@SectID,01,4,'C115'),
		(@SectID,01,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('CSSE', 230), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,02,1,'C115'),
		(@SectID,02,2,'C115'),
		(@SectID,02,3,'C115'),
		(@SectID,02,4,'C115'),
		(@SectID,02,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('CSSE', 333), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,03,1,'C115'),
		(@SectID,03,2,'C115'),
		(@SectID,03,3,'C115'),
		(@SectID,03,4,'C115'),
		(@SectID,03,5,'C115');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('MA', 275), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,01,1,'D115'),
		(@SectID,01,2,'D115'),
		(@SectID,01,3,'D115'),
		(@SectID,01,4,'D115'),
		(@SectID,01,5,'D115');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('CSSE', 332), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,02,1,'D115'),
		(@SectID,02,2,'D115'),
		(@SectID,02,3,'D115'),
		(@SectID,02,4,'D115'),
		(@SectID,02,5,'D115');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('ECE', 230), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,06,1,'D115'),
		(@SectID,06,2,'D115'),
		(@SectID,06,4,'D115'),
		(@SectID,04,5,'D115'),
		(@SectID,05,5,'D115'),
		(@SectID,06,5,'D115');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('CSSE', 333), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,09,1,'O269'),
		(@SectID,10,1,'O269'),
		(@SectID,09,2,'O269'),
		(@SectID,10,2,'O269'),
		(@SectID,09,4,'O269'),
		(@SectID,10,4,'O269');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('CSSE', 332), 2) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,07,1,'G203'),
		(@SectID,07,2,'G203'),
		(@SectID,05,3,'O269'),
		(@SectID,06,3,'O269'),
		(@SectID,07,4,'G203');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('RH', 330), 4) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,05,1,'M105'),
		(@SectID,05,2,'M105'),
		(@SectID,05,4,'M105'),
		(@SectID,05,5,'M105');

Set @SectID = dbo.TermCourseToSectID(201520, dbo.CourseDpNumToCourseID('RH', 330), 1) ;
insert into STime(SectID, Period, Weekday, Classroom)
	values(@SectID,06,1,'M105'),
		(@SectID,06,2,'M105'),
		(@SectID,06,4,'M105'),
		(@SectID,06,5,'M105');


-- exec EnrollStudent '80120574', 1 ;
-- Go
-- exec EnrollStudent '80120575', 1 ;
-- Go
-- exec EnrollStudent '80120576', 1 ;
-- Go

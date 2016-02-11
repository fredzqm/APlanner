use APlanner
GO

Delete from Department;
Insert into Department (DepartID, DepartNAME)
	values('CSSE', 'Computer Science and Software Engineering'), 
		('ECE', 'Electrical and Computer Engineering'), 
		('CHEM', 'Chemistry'), 
		('MA', 'Mathematics'), 
		('BIO', 'Biology');
Go


Delete from People;
Delete from Student;
Delete from Professor;
--- RegisterStudent
---   	@UserID varchar(9),
--- 	@UserName varchar(12),
--- 	@FName varchar(30),
---     @LName varchar(30),
---     @Password char(20),
--- 	@Major varchar(12),
--- 	@Year tinyint;
exec  RegisterStudent '80120574', 'dingy2', 'Mercury', 'Ding','pskeidjnsrkk203','CS', 2 ;
exec  RegisterStudent '80120575', 'whitec', 'Crystal', 'White', 'skenskesdf3203','BE', 2 ;
exec  RegisterStudent '80120576', 'katrinap', 'Perry', 'Katrina','pskeidjnsrkk203','CHEM', 2 ;
exec  RegisterStudent '80120577', 'zhangq2', 'Fred', 'Zhang','pskeidjnsrkk203','SE', 3 ;
exec  RegisterStudent '80120573', 'karryc', 'Crystal', 'Karry', 'skenskesdf3203','CPE', 4 ;

--- Create Procedure RegisterProfessor
---   	@UserID varchar(9),
--- 	@UserName varchar(12),
--- 	@FName varchar(30),
---     @LName varchar(30),
---     @Password char(20),
--- 	@Deartment varchar(5),
--- 	@Office varchar(6)

RegisterProfessor '80120578', 'greenk', 'Kate', 'Green', 'skenskesdf3203','ECE', C203 ;

Delete from Course;
Insert into Course ([CourseNum], [CourseDP] , [CourseName] , [Credit])
	Values 
	(304, 'CSSE','PLC', 4),
	(111, 'CHEM','General Chemistry', 4),
	(232, 'CSSE','Computer Architecture', 4),
	(333, 'CSSE','Database', 4),
	(112, 'MA','CalculusII', 5),
	(111, 'MA','CalculusI', 5);

Delete from Term;
Insert into Term ([TermID] ,[Start_Date] ,[End_Date])
	Values 
	(1,'03-07-2016','05-27-2016');

Delete from Section;
Insert into Section ([SectID] ,[TermID] ,[CourseID] ,[SectNum] ,[PUserID] ,[EnrollNum] ,[Capacity])
	Values 
	(3295,1,123,1,'801200005',1,24),
	(3296,1,123,2,'801200005',0,24),
	(3297,1,123,3,'801200005',0,24);

Delete from STime;
Insert into STime ([SectID] ,[Classroom] ,[Period] ,[TermID])
	Values 
	(3295,'M105',1,1);

Delete from Enroll;
Insert into Enroll ([SectID], [SUserID], [time], [Rating])
	values
	(3295, '801200000', '02-01-2016', 1),
	(3295, '801200001', '02-01-2016', 1);

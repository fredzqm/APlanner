use APlanner
GO

Delete from Section;
Delete from Student;
Delete from Course;
Delete from People;
Delete from Professor;
Delete from Department;
Delete from Term;


Insert into Department (DepartID, DepartNAME)
	values('CSSE', 'Computer Science and Software Engineering'), 
		('ECE', 'Electrical and Computer Engineering'), 
		('CHEM', 'Chemistry'), 
		('MA', 'Mathematics'), 
		('PH', 'Physics');
Go


exec  RegisterStudent '80120574', 'dingy2', 'Mercury', 'Ding','pskeidjnsrkk203','CS', 2018 ;
Go
exec  RegisterStudent '80120575', 'whitec', 'Crystal', 'White', 'skenskesdf3203','BE', 2018 ;
Go
exec  RegisterStudent '80120576', 'katrinap', 'Perry', 'Katrina','pskeidjnsrkk203','CHEM', 2018 ;
Go
exec  RegisterStudent '80120577', 'zhangq2', 'Fred', 'Zhang','pskeidjnsrkk203','SE', 2018 ;
Go
exec  RegisterStudent '80120573', 'karryc', 'Crystal', 'Karry', 'skenskesdf3203','CPE', 2018 ;
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


exec AddCourse 'CSSE','Intro to Software Development',120,'', 4 ;
Go
exec AddCourse 'CSSE','Object-Oriented Software Dvlpm',220,'', 4 ;
Go
exec AddCourse 'CSSE','Data Struct & Algorithm Anlys',230,'', 4 ;
Go
exec AddCourse 'CSSE','Operating Systems',332,'', 4 ;
Go
exec AddCourse 'CSSE','Computer Architecture I',232,'', 4 ;
Go
exec AddCourse 'CSSE','Intro to Database Systems',333,'', 4 ;
Go
exec AddCourse 'CSSE','Software Design',374,'', 4 ;
Go
exec AddCourse 'CSSE','Software Constr & Evolution',375,'', 4 ;
Go
exec AddCourse 'CSSE','Programming Language Paradigms',403,'', 4 ;
Go
exec AddCourse 'CSSE','Computer Security',442,'', 4 ;
Go
exec AddCourse 'CSSE','Image Recognition',463,'', 4 ;
Go

exec AddCourse 'MA','Calculus II',112,'', 5 ;
Go
exec AddCourse 'MA','Calculus III',113,'', 5 ;
Go
exec AddCourse 'MA','Contemporary Mathematical Prob',190,'', 4 ;
Go
exec AddCourse 'MA','Differential Equations',211,'', 4 ;
Go
exec AddCourse 'MA','Matr Alg & Sys of Diff Equ -Y1',212,'', 4 ;
Go
exec AddCourse 'MA','Engineering Statistics I',223,'', 4 ;
Go
exec AddCourse 'MA','Vector Calculus',330,'', 4 ;
Go
exec AddCourse 'MA','Discrete & Comb Algebra II',375,'', 4 ;
Go
exec AddCourse 'MA','Abstract Algebra',376,'', 4 ;
Go
exec AddCourse 'PH','Physics II',112,'', 4 ;
Go
exec AddCourse 'PH','Physics III',113,'', 4 ;
Go






Insert into Term ([TermID] ,[Start_Date] ,[End_Date])
	Values 
	(201510,'8-28-2015','02-26-2016'),
	(201520,'11-23-2015','02-26-2016'),
	(201530,'03-07-2016','05-27-2016');
Go

exec CreateSection 201510,1,1,'80120001',24;
Go
exec CreateSection 201510,1,2,'80120001',24;
Go
exec CreateSection 201510,1,3,'80120001',24;
Go
exec CreateSection 201510,2,1,'80120002',24;
Go
exec CreateSection 201510,2,2,'80120002',24;
Go
exec CreateSection 201510,2,3,'80120002',24;
Go
exec CreateSection 201510,3,1,'80120003',24;
Go
exec CreateSection 201510,3,2,'80120003',24;
Go
exec CreateSection 201510,3,3,'80120003',24;
Go

exec CreateSection 201510,4,1,'80120004',24;
Go
exec CreateSection 201510,4,2,'80120004',24;
Go
exec CreateSection 201510,4,3,'80120004',24;
Go
exec CreateSection 201510,5,1,'80120001',24;
Go
exec CreateSection 201510,5,2,'80120001',24;
Go
exec CreateSection 201510,5,3,'80120001',24;
Go
exec CreateSection 201510,6,1,'80120002',24;
Go
exec CreateSection 201510,6,2,'80120002',24;
Go
exec CreateSection 201510,6,3,'80120002',24;
Go

exec CreateSection 201510,7,1,'80120003',24;
Go
exec CreateSection 201510,7,2,'80120003',24;
Go
exec CreateSection 201510,7,3,'80120003',24;
Go
exec CreateSection 201510,8,1,'80120004',24;
Go
exec CreateSection 201510,8,2,'80120004',24;
Go
exec CreateSection 201510,8,3,'80120004',24;
Go
exec CreateSection 201510,9,1,'80120001',24;
Go
exec CreateSection 201510,9,2,'80120001',24;
Go
exec CreateSection 201510,9,3,'80120001',24;
Go

exec CreateSection 201510,10,1,'80120002',24;
Go
exec CreateSection 201510,10,2,'80120002',24;
Go
exec CreateSection 201510,10,3,'80120002',24;
Go
exec CreateSection 201510,11,1,'80120003',24;
Go
exec CreateSection 201510,11,2,'80120003',24;
Go
exec CreateSection 201510,11,3,'80120003',24;
Go


exec CreateSection 201510,12,1,'80120005',24;
Go
exec CreateSection 201510,12,2,'80120005',24;
Go
exec CreateSection 201510,12,3,'80120005',24;
Go
exec CreateSection 201510,13,1,'80120006',24;
Go
exec CreateSection 201510,13,2,'80120006',24;
Go
exec CreateSection 201510,13,3,'80120006',24;
Go
exec CreateSection 201510,14,1,'80120007',24;
Go
exec CreateSection 201510,14,2,'80120007',24;
Go
exec CreateSection 201510,14,3,'80120007',24;
Go

exec CreateSection 201510,15,1,'80120008',24;
Go
exec CreateSection 201510,15,2,'80120008',24;
Go
exec CreateSection 201510,15,3,'80120008',24;
Go
exec CreateSection 201510,16,1,'80120005',24;
Go
exec CreateSection 201510,16,2,'80120005',24;
Go
exec CreateSection 201510,16,3,'80120005',24;
Go
exec CreateSection 201510,17,1,'80120006',24;
Go
exec CreateSection 201510,17,2,'80120006',24;
Go
exec CreateSection 201510,17,3,'80120006',24;
Go

exec CreateSection 201510,18,1,'80120007',24;
Go
exec CreateSection 201510,18,2,'80120007',24;
Go
exec CreateSection 201510,18,3,'80120007',24;
Go
exec CreateSection 201510,19,1,'80120008',24;
Go
exec CreateSection 201510,19,2,'80120008',24;
Go
exec CreateSection 201510,19,3,'80120008',24;
Go
exec CreateSection 201510,20,1,'80120005',24;
Go
exec CreateSection 201510,20,2,'80120005',24;
Go
exec CreateSection 201510,20,3,'80120005',24;
Go

exec EnrollStudent '80120574', 1 ;
Go
exec EnrollStudent '80120575', 1 ;
Go
exec EnrollStudent '80120576', 1 ;
Go

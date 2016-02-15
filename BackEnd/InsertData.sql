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

exec AddMeetTime '80120001',1,01,1,'C115';
exec AddMeetTime '80120001',1,01,2,'C115';
exec AddMeetTime '80120001',1,01,3,'C115';
exec AddMeetTime '80120001',1,01,4,'C115';
exec AddMeetTime '80120001',1,01,5,'C115';

exec AddMeetTime '80120001',2,02,1,'C115';
exec AddMeetTime '80120001',2,02,2,'C115';
exec AddMeetTime '80120001',2,02,3,'C115';
exec AddMeetTime '80120001',2,02,4,'C115';
exec AddMeetTime '80120001',2,02,5,'C115';

exec AddMeetTime '80120001',3,03,1,'C115';
exec AddMeetTime '80120001',3,03,2,'C115';
exec AddMeetTime '80120001',3,03,3,'C115';
exec AddMeetTime '80120001',3,03,4,'C115';
exec AddMeetTime '80120001',3,03,5,'C115';

exec AddMeetTime '80120002',4,01,1,'D115';
exec AddMeetTime '80120002',4,01,2,'D115';
exec AddMeetTime '80120002',4,01,3,'D115';
exec AddMeetTime '80120002',4,01,4,'D115';
exec AddMeetTime '80120002',4,01,5,'D115';

exec AddMeetTime '80120002',5,02,1,'D115';
exec AddMeetTime '80120002',5,02,2,'D115';
exec AddMeetTime '80120002',5,02,3,'D115';
exec AddMeetTime '80120002',5,02,4,'D115';
exec AddMeetTime '80120002',5,02,5,'D115';

exec AddMeetTime '80120002',6,03,1,'D115';
exec AddMeetTime '80120002',6,03,2,'D115';
exec AddMeetTime '80120002',6,03,3,'D115';
exec AddMeetTime '80120002',6,03,4,'D115';
exec AddMeetTime '80120002',6,03,5,'D115';

exec AddMeetTime '80120003',7,04,1,'D115';
exec AddMeetTime '80120003',7,04,2,'D115';
exec AddMeetTime '80120003',7,04,3,'D115';
exec AddMeetTime '80120003',7,04,4,'D115';
exec AddMeetTime '80120003',7,04,5,'D115';

exec AddMeetTime '80120003',8,05,1,'D115';
exec AddMeetTime '80120003',8,05,2,'D115';
exec AddMeetTime '80120003',8,05,3,'D115';
exec AddMeetTime '80120003',8,05,4,'D115';
exec AddMeetTime '80120003',8,05,5,'D115';

exec AddMeetTime '80120003',9,06,1,'D115';
exec AddMeetTime '80120003',9,06,2,'D115';
exec AddMeetTime '80120003',9,06,3,'D115';
exec AddMeetTime '80120003',9,06,4,'D115';
exec AddMeetTime '80120003',9,06,5,'D115';

exec AddMeetTime '80120004',10,04,1,'C103';
exec AddMeetTime '80120004',10,04,2,'C103';
exec AddMeetTime '80120004',10,04,3,'C103';
exec AddMeetTime '80120004',10,04,4,'C103';
exec AddMeetTime '80120004',10,04,5,'C103';

exec AddMeetTime '80120004',11,05,1,'C103';
exec AddMeetTime '80120004',11,05,2,'C103';
exec AddMeetTime '80120004',11,05,3,'C103';
exec AddMeetTime '80120004',11,05,4,'C103';
exec AddMeetTime '80120004',11,05,5,'C103';

exec AddMeetTime '80120004',12,06,1,'C103';
exec AddMeetTime '80120004',12,06,2,'C103';
exec AddMeetTime '80120004',12,06,3,'C103';
exec AddMeetTime '80120004',12,06,4,'C103';
exec AddMeetTime '80120004',12,06,5,'C103';

exec AddMeetTime '80120005',13,04,1,'C209';
exec AddMeetTime '80120005',13,04,2,'C209';
exec AddMeetTime '80120005',13,04,3,'C209';
exec AddMeetTime '80120005',13,04,4,'C209';
exec AddMeetTime '80120005',13,04,5,'C209';

exec AddMeetTime '80120005',14,05,1,'C209';
exec AddMeetTime '80120005',14,05,2,'C209';
exec AddMeetTime '80120005',14,05,3,'C209';
exec AddMeetTime '80120005',14,05,4,'C209';
exec AddMeetTime '80120005',14,05,5,'C209';

exec AddMeetTime '80120005',15,06,1,'C209';
exec AddMeetTime '80120005',15,06,2,'C209';
exec AddMeetTime '80120005',15,06,3,'C209';
exec AddMeetTime '80120005',15,06,4,'C209';
exec AddMeetTime '80120005',15,06,5,'C209';

exec AddMeetTime '80120006',16,07,1,'C209';
exec AddMeetTime '80120006',16,07,2,'C209';
exec AddMeetTime '80120006',16,07,3,'C209';
exec AddMeetTime '80120006',16,07,4,'C209';
exec AddMeetTime '80120006',16,07,5,'C209';

exec AddMeetTime '80120006',17,08,1,'C209';
exec AddMeetTime '80120006',17,08,2,'C209';
exec AddMeetTime '80120006',17,08,3,'C209';
exec AddMeetTime '80120006',17,08,4,'C209';
exec AddMeetTime '80120006',17,08,5,'C209';

exec AddMeetTime '80120006',18,09,1,'C209';
exec AddMeetTime '80120006',18,09,2,'C209';
exec AddMeetTime '80120006',18,09,3,'C209';
exec AddMeetTime '80120006',18,09,4,'C209';
exec AddMeetTime '80120006',18,09,5,'C209';

exec AddMeetTime '80120007',19,08,1,'E202';
exec AddMeetTime '80120007',19,08,2,'E202';
exec AddMeetTime '80120007',19,08,3,'E202';
exec AddMeetTime '80120007',19,08,4,'E202';
exec AddMeetTime '80120007',19,08,5,'E202';

exec AddMeetTime '80120007',20,09,1,'E202';
exec AddMeetTime '80120007',20,09,2,'E202';
exec AddMeetTime '80120007',20,09,3,'E202';
exec AddMeetTime '80120007',20,09,4,'E202';
exec AddMeetTime '80120007',20,09,5,'E202';

exec AddMeetTime '80120007',21,10,1,'E202';
exec AddMeetTime '80120007',21,10,2,'E202';
exec AddMeetTime '80120007',21,10,3,'E202';
exec AddMeetTime '80120007',21,10,4,'E202';
exec AddMeetTime '80120007',21,10,5,'E202';

exec AddMeetTime '80120007',19,08,1,'E202';
exec AddMeetTime '80120007',19,08,2,'E202';
exec AddMeetTime '80120007',19,08,3,'E202';
exec AddMeetTime '80120007',19,08,4,'E202';
exec AddMeetTime '80120007',19,08,5,'E202';

exec AddMeetTime '80120007',20,09,1,'E202';
exec AddMeetTime '80120007',20,09,2,'E202';
exec AddMeetTime '80120007',20,09,3,'E202';
exec AddMeetTime '80120007',20,09,4,'E202';
exec AddMeetTime '80120007',20,09,5,'E202';

exec AddMeetTime '80120007',21,10,1,'E202';
exec AddMeetTime '80120007',21,10,2,'E202';
exec AddMeetTime '80120007',21,10,3,'E202';
exec AddMeetTime '80120007',21,10,4,'E202';
exec AddMeetTime '80120007',21,10,5,'E202';


exec EnrollStudent '80120574', 1 ;
Go
exec EnrollStudent '80120575', 1 ;
Go
exec EnrollStudent '80120576', 1 ;
Go

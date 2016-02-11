use APlanner
GO
Delete from People;
Insert into People ([UserID], [FName], [LName] , [type] , [Password])
	Values 
	('dingy2', 'Mercury', 'Ding', 'S','pskeidjnsrkk203'),
	('whitec', 'Crystal', 'White','S', 'skenskesdf3203'),
	('katrinap', 'Perry', 'Katrina', 'S','pskeidjnsrkk203'),
	('greenk', 'Kate', 'Green','S', 'skenskesdf3203'),
	('zhangq2', 'Fred', 'Zhang', 'S','pskeidjnsrkk203'),
	('karryc', 'Crystal', 'Karry','P', 'skenskesdf3203');

Delete from Student;
Insert into Student ([SUserID], [Major] ,[Year])
	Values 
	('dingy2', 'CS',2),
	('whitec', 'BE',2),
	('katrinap', 'CHEM',2),
	('zhangq2', 'SE',2),
	('karryc', 'CPE',2);

Delete from Department;
Insert into Department (DepartID, DepartNAME)
	values('CSSE', 'Computer Science and Software Engineering'), 
		('ECE', 'Electrical and Computer Engineering'), 
		('CHEM', 'Chemistry'), 
		('MA', 'Mathematics'), 
		('BIO', 'Biology');
Go

Delete from Professor;
Insert into Professor ([PUserID], [DepartID])
	Values 
	('greenk', 'CSSE');

Delete from Course;
Insert into Course ([CourseNum], [CourseDP] , [CourseName] , [Credit])
	Values 
	(304, 'CSSE','PLC', 4),
	(111, 'CHEM','General Chemistry', 4),
	(232, 'CSSE','Computer Architecture', 4),
	(333, 'CSSE','Database', 4),
	(112, 'MA','CalculusII', 5),
	(111, 'MA','CalculusI', 5);

Delete from Course;
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

use APlanner
GO


Insert into People ([UserID] ,[UserName] ,[FName] ,[LName] ,[SOP] ,[Password])
Values 
('801200000', 'dingy2', 'Mercury', 'Ding', 'S','pskeidjnsrkk203'),
('801200001', 'whitec', 'Crystal', 'White','S', 'skenskesdf3203'),
('801200002', 'katrinap', 'Perry', 'Katrina', 'S','pskeidjnsrkk203'),
('801200003', 'greenk', 'Kate', 'Green','S', 'skenskesdf3203'),
('801200004', 'zhangq2', 'Fred', 'Zhang', 'S','pskeidjnsrkk203'),
('801200005', 'karryc', 'Crystal', 'Karry','P', 'skenskesdf3203');

Insert into Student ([SUserID], [Major] ,[YR])
Values 
('801200000', 'CS',2),
('801200001', 'BE',2),
('801200002', 'CHEM',2),
('801200003', 'SE',2),
('801200004', 'CPE',2);

Insert into Professor ([PUserID], [DepartID])
Values 
('801200005', 'CS');

Insert into Course ([CourseID] ,[CourseDP] ,[CourseNum] ,[Descrip] ,[Credit])
Values 
(304, 'CSSE','PLC', 4),
(111, 'CHEM','General Chemistry', 4),
(232, 'CSSE232','Computer Architecture', 4),
(3292, 'CSSE333','Database', 4),
(3333, 'MA112','CalculusII', 5),
(3335, 'MA111','CalculusI', 5);

Insert into Term ([TermID] ,[Start_Date] ,[End_Date])
Values 
(1,'03-07-2016','05-27-2016');

Insert into Section ([SectID] ,[TermID] ,[CourseID] ,[SectNum] ,[PUserID] ,[EnrollNum] ,[Capacity])
Values 
(3295,1,123,1,'801200005',1,24),
(3296,1,123,2,'801200005',0,24),
(3297,1,123,3,'801200005',0,24);

Insert into STime ([SectID] ,[Classroom] ,[Period] ,[TermID])
Values 
(3295,'M105',1,1);

USE [APlanner]
GO

Insert into Enroll ([SectID], [SUserID], [T], [S], [Rating])
values
(3295, '801200000', '02-01-2016', 'Register', 1),
(3295, '801200001', '02-01-2016', 'Waitlist', 1);

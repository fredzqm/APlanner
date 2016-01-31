USE [APlanner]

Create View SectionView  AS
	Select c.CourseID AS [Course Name] , s.SectNum AS [Section Number], p.Lname AS [Instructor], Course.Descrip, Credict
	From Course c, Section s, People p
	where c.CourseID = s.CourseID AND 



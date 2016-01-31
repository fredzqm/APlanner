USE [APlanner]

Create View [Section]  AS
	Select CourseID , CName, Section.SectNum AS [Course], FName+' '+LName AS [Instructor], Course.Descrip, Credict
	From Course c, Section s
	where c.CourseID = s.CourseID;



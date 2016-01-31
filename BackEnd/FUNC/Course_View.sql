use APlanner
GO

Create Function Course_View (@c int) 
	returns table
	AS
		return
			Select CourseDP+' '+CourseNum+' '+Section.SectNum AS [Course], FName+' '+LName AS [Instructor], Course.Descrip, Credict
			From Course, People, Section
			where (Course.CourseID=@c) and (Section.CourseID=Course.CourseID) and (People.UserID=Section.PUserID)
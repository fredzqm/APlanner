use APlanner
GO

Create Function Person_View (@c int) 
	returns table
	AS
		return
			Select UserName, FName+' '+LName AS Name, People.SOP, Course.Descrip, Course.Credict
			From People, Course, Enroll
			where (UserID=@c) and (Enroll.SUserID=People.UserID) and 
				(Enroll.SectID=(select SectID From Section where Section.CourseID=course.CourseID))
Use [APlanner]
Go

IF OBJECT_ID('ProfessorView', 'V') IS NOT NULL
    DROP VIEW ProfessorView;
GO
Create View ProfessorView  As
	Select p.PUserID, u.FName+' '+ u.LName As [ProfName] , 
		 p.DepartID As [DepartMent]
	From People u, Professor p
	where u.UserID = p.PUserID;
Go

IF OBJECT_ID('StudentView', 'V') IS NOT NULL
    DROP VIEW StudentView;
GO
Create View StudentView  AS
	Select s.SUserID, u.FName+' '+ u.LName As [StudName] , 
		s.Major , s.Year As Year
	From People u , Student s
	where u.UserID = s.SUserID;
Go

IF OBJECT_ID('SectionView', 'V') IS NOT NULL
    DROP VIEW SectionView;
GO
Create View SectionView  As
	Select s.SectID, s.CourseID+'-'+s.SectNum AS [Section], s.TermID, 
		p.ProfName, c.Credit, s.EnrollNum
	From Course c, Section s, ProfessorView p
	where s.CourseID = c.CourseID AND s.PUserID = p.PUserID;
Go

IF OBJECT_ID('PlanView', 'V') IS NOT NULL
    DROP VIEW PlanView;
GO

Create View PlanView As
	Select p.PID, s.SUserID, s.StudName, p.TermID, p.Probability, SUM(c.Credit) As [Credits]
	From SPlan p, StudentView s, Contain l, Course c
	where  p.SUserID = s.SUserID AND p.PID = l.PID 
		AND l.CourseID = c.CourseID
	Group By p.PID, s.SUserID, s.StudName, p.TermID, p.Probability
Go

IF OBJECT_ID('ScheduleView', 'V') IS NOT NULL
    DROP VIEW ScheduleView;
GO
Create View SchedulePublicView As
	Select p.SUserID, p.StudName, p.TermID, p.Probability * s.Probability As [Probability], p.Credits
	From Schedule s, PlanView p
	where  s.PID = p.PID AND s.PublicOrPrivate = 1;
Go
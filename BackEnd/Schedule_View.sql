use APlanner
GO

Create Function Schedule_View (@c int) 
	returns table
	AS
		return
			Select UserName, FName+' '+LName AS [Name], Schedule.Probability, Pri, PublicOrPrivate
			From People, Schedule,SPlan
			where (SPlan.PID=Schedule.PID) and (Schedule.ScheID=@c) and (SPlan.SUserID=People.UserID)
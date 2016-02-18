using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using APlanner.Database;

namespace APlanner.Models
{
    public class ScheduleDisplay
    {
        private ICollection<STime> sTimes;
        private Schedule schedule;

        public CellDisplay[,] cells { set; get; }

        public ScheduleDisplay()
        {
            cells = new CellDisplay[5, 10];
        }

        public ScheduleDisplay(ICollection<STime> sTimes)
        {
            cells = new CellDisplay[5, 10];
            foreach (var t in sTimes)
            {
                cells[t.Weekday - 1, t.Period - 1] = new CellDisplay(t);
            }
            this.sTimes = sTimes;
        }

        public ScheduleDisplay(Schedule schedule)
        {
            cells = new CellDisplay[5, 10];
            //this.schedule = schedule;
            foreach (Section s in schedule.Sections)
            {
                foreach (STime t in s.STimes)
                {
                    cells[t.Weekday - 1, t.Period - 1] = new CellDisplay(t);
                }
            }
        }
    }

    public class CellDisplay
    {
        private STime t;

        public string text { get; set; }

        public CellDisplay(STime t)
        {
            this.t = t;
            Course c = t.Section.Course;
            text = "" + c.Department.DepartID + c.CourseNum + "-" + t.Section.SectNum + " at " + t.Classroom;
        }

    }

    public class CourseAddedToPlan {

        public short Course { get; set; }

        public int PID { get; set; }
    }

    public class SectionAddedToSchedule
    {

        public int Section { get; set; }

        public int ScheID { get; set; }
    }

}
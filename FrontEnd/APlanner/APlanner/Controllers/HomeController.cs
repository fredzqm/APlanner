using APlanner.Database;
using APlanner.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace APlanner.Controllers
{
    public class HomeController : Controller
    {
        private APlannerEntities db = new APlannerEntities();

        public ActionResult Index()
        {
            ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID");

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult ResultCourse([Bind(Include = "TermID,search")] SearchView s)
        {
            ViewBag.Message = "The result page";

            Course course = db.Courses.Where(st => ( (st.Department.DepartID + st.CourseNum) == s.search)).First();

            ScheduleDisplay display = new ScheduleDisplay();
            //student.Enrolls
            foreach (Section e in course.Sections)
            {
                if (e.TermID == s.TermID)
                    display.addTimes(e.STimes);
            }
            ViewBag.scheduleDisplay = display;
            return View();
        }

        [HttpPost]
        public ActionResult ResultStudent([Bind(Include = "TermID,search")] SearchView s)
        {
            ViewBag.Message = "The result page";
            Student student = db.People.Where( st => (st.UserName == s.search)).First().Student ;

            ScheduleDisplay display = new ScheduleDisplay();
            //student.Enrolls
            foreach(Enroll e in student.Enrolls)
            {
                if (e.Section.Term.TermID == s.TermID)
                    display.addTimes(e.Section.STimes);
            }

            ViewBag.scheduleDisplay = display;
            return View();
        }
    }
}
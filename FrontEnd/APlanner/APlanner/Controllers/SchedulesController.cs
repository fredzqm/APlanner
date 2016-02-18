using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using APlanner.Database;
using APlanner.Models;

namespace APlanner.Controllers
{
    public class SchedulesController : Controller
    {
        private APlannerEntities db = new APlannerEntities();

        // GET: Schedules
        public ActionResult Index()
        {
            var schedules = db.Schedules.Include(s => s.SPlan);

            return View(schedules.ToList());
        }

        // GET: Schedules/Details/5
        public ActionResult Details(int? id)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Schedule schedule = db.Schedules.Find(id);
                if (schedule == null)
                {
                    return HttpNotFound();
                }
                var sections = schedule.Sections;
                ViewBag.Sections = sections;
                ViewBag.Section = new SelectList(db.Sections, "SectID", "Display");
                ViewBag.id = id;
                //return View(sPlan);
                ScheduleDisplay display = new ScheduleDisplay(schedule);
                ViewBag.scheduleDisplay = display;
                return View(schedule);
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult Details([Bind(Include = "Section,ScheID")] SectionAddedToSchedule s)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                Schedule schedule = db.Schedules.Find(s.ScheID);
                if (schedule == null)
                {
                    return HttpNotFound();
                }
                //Course addedCourse = db.Courses.Where(s => (s.Department.DepartID + s.CourseNum == c.Course)).First() ;
                Section addedSection = db.Sections.Find(s.Section);
                schedule.Sections.Add(addedSection);
                db.SaveChanges();
                var sections = schedule.Sections;
                ViewBag.Sections = sections;
                ViewBag.Section = new SelectList(db.Sections, "SectID", "Display");
                ViewBag.id = s.ScheID;
                ScheduleDisplay display = new ScheduleDisplay(schedule);
                ViewBag.scheduleDisplay = display;
                return View(schedule);
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Schedules/Create
        public ActionResult Create()
        {
            ViewBag.PID = new SelectList(db.SPlans, "PID", "SUserID");
            return View();
        }

        // POST: Schedules/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ScheID,PID,Probability,Priority,PublicOrPrivate")] Schedule schedule)
        {
            if (ModelState.IsValid)
            {
                db.Schedules.Add(schedule);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PID = new SelectList(db.SPlans, "PID", "SUserID", schedule.PID);
            return View(schedule);
        }

        // GET: Schedules/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Schedule schedule = db.Schedules.Find(id);
            if (schedule == null)
            {
                return HttpNotFound();
            }
            ViewBag.PID = new SelectList(db.SPlans, "PID", "SUserID", schedule.PID);
            return View(schedule);
        }

        // POST: Schedules/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ScheID,PID,Probability,Priority,PublicOrPrivate")] Schedule schedule)
        {
            if (ModelState.IsValid)
            {
                db.Entry(schedule).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PID = new SelectList(db.SPlans, "PID", "SUserID", schedule.PID);
            return View(schedule);
        }

        // GET: Schedules/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Schedule schedule = db.Schedules.Find(id);
            if (schedule == null)
            {
                return HttpNotFound();
            }
            return View(schedule);
        }

        // POST: Schedules/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Schedule schedule = db.Schedules.Find(id);
            db.Schedules.Remove(schedule);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

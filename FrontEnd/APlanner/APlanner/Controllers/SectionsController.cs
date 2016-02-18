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
    public class SectionsController : Controller
    {
        private APlannerEntities db = new APlannerEntities();

        // GET: Sections
        public ActionResult Index()
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                var sections = db.Sections.Where(s => s.Enrolls.Where(e => e.SUserID == user.UserID).Count(o => true) > 0 ).Include(s => s.Course).Include(s => s.Professor).Include(s => s.Term);
                return View(sections.ToList());
            }
            else if (user != null && user.type == "P")
            {
                var sections = db.Sections.Where(s => s.PUserID == user.UserID).Include(s => s.Course).Include(s => s.Professor).Include(s => s.Term);
                return View(sections.ToList());
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Sections/Details/5
        public ActionResult Details(int? id)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Section section = db.Sections.Find(id);
                if (section == null)
                {
                    return HttpNotFound();
                }
                ScheduleDisplay display = new ScheduleDisplay(section.STimes);
                ViewBag.scheduleDisplay = display;
                return View(section);
            } else if (user != null && user.type == "P")
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Section section = db.Sections.Find(id);
                if (section == null)
                {
                    return HttpNotFound();
                }
                ScheduleDisplay display = new ScheduleDisplay(section.STimes);
                ViewBag.scheduleDisplay = display;
                ViewBag.id = id;
                return View(section);
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult Details([Bind(Include = "SectID,Classroom,Period,WeekDay")] STime addedTime)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "P")
            {
                //Course addedCourse = db.Courses.Where(s => (s.Department.DepartID + s.CourseNum == c.Course)).First() ;
                db.STimes.Add(addedTime);
                db.SaveChanges();
                Section section = db.Sections.Find(addedTime.SectID);
                if (section == null)
                {
                    return HttpNotFound();
                }
                ScheduleDisplay display = new ScheduleDisplay(section.STimes);
                ViewBag.scheduleDisplay = display;
                ViewBag.id = addedTime.SectID;
                return View(section);
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Sections/Create
        public ActionResult Create()
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "P")
            {
                ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Display");
                ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID");
                return View();
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Sections/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SectID,TermID,CourseID,SectNum,EnrollNum,Capacity")] Section section)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "P")
            {
                if (ModelState.IsValid)
                {
                    section.PUserID = user.UserID;
                    section.EnrollNum = 0;
                    db.Sections.Add(section);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseDP", section.CourseID);
                ViewBag.PUserID = new SelectList(db.Professors, "PUserID", "DepartID", section.PUserID);
                ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID", section.TermID);
                return View(section);
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Sections/Edit/5
        public ActionResult Edit(int? id)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "P")
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Section section = db.Sections.Find(id);
                if (section == null)
                {
                    return HttpNotFound();
                }
                ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseDP", section.CourseID);
                ViewBag.PUserID = new SelectList(db.Professors, "PUserID", "DepartID", section.PUserID);
                ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID", section.TermID);
                return View(section);
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Sections/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SectID,TermID,CourseID,SectNum,PUserID,EnrollNum,Capacity")] Section section)
        {
            var user = (Session["User"] as Person);
            if(user != null && user.type == "P")
            {
                if (ModelState.IsValid)
                {
                    db.Entry(section).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseDP", section.CourseID);
                ViewBag.PUserID = new SelectList(db.Professors, "PUserID", "DepartID", section.PUserID);
                ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID", section.TermID);
                return View(section);
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Sections/Delete/5
        public ActionResult Delete(int? id)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "P")
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Section section = db.Sections.Find(id);
                if (section == null)
                {
                    return HttpNotFound();
                }
                return View(section);
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Sections/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Section section = db.Sections.Find(id);
            db.Sections.Remove(section);
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

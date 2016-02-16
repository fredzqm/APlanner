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
            var sections = db.Sections.Include(s => s.Course).Include(s => s.Professor).Include(s => s.Term);
            return View(sections.ToList());
        }

        // GET: Sections/Details/5
        public ActionResult Details(int? id)
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
        }

        // GET: Sections/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseDP");
            ViewBag.PUserID = new SelectList(db.Professors, "PUserID", "DepartID");
            ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID");
            return View();
        }

        // POST: Sections/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SectID,TermID,CourseID,SectNum,PUserID,EnrollNum,Capacity")] Section section)
        {
            if (ModelState.IsValid)
            {
                db.Sections.Add(section);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseDP", section.CourseID);
            ViewBag.PUserID = new SelectList(db.Professors, "PUserID", "DepartID", section.PUserID);
            ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID", section.TermID);
            return View(section);
        }

        // GET: Sections/Edit/5
        public ActionResult Edit(int? id)
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

        // POST: Sections/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SectID,TermID,CourseID,SectNum,PUserID,EnrollNum,Capacity")] Section section)
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

        // GET: Sections/Delete/5
        public ActionResult Delete(int? id)
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

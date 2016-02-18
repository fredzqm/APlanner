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
    public class SPlansController : Controller
    {
        private APlannerEntities db = new APlannerEntities();

        // GET: SPlans
        public ActionResult Index()
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                var sPlans = db.SPlans.Include(s => s.Student).Include(s => s.Term)
                    .Where(s => s.SUserID == user.UserID);
                return View(sPlans.ToList());
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: SPlans/Details/5
        public ActionResult Details(int? id)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                SPlan sPlan = db.SPlans.Find(id);
                if (sPlan == null)
                {
                    return HttpNotFound();
                }
                var courses = sPlan.Courses;
                ViewBag.Courses = courses;
                ViewBag.Course = new SelectList(db.Courses, "CourseID", "Display");
                ViewBag.id = id;
                return View(sPlan);
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult Details([Bind(Include = "Course,PID")] CourseAddedToPlan c)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                SPlan sPlan = db.SPlans.Find(c.PID);
                if (sPlan == null)
                {
                    return HttpNotFound();  
                }
                //Course addedCourse = db.Courses.Where(s => (s.Department.DepartID + s.CourseNum == c.Course)).First() ;
                Course addedCourse = db.Courses.Find(c.Course);
                sPlan.Courses.Add(addedCourse);
                db.SaveChanges();
                var courses = sPlan.Courses;
                ViewBag.Courses = courses;
                ViewBag.Course = new SelectList(db.Courses, "CourseID", "Display");
                ViewBag.id = c.PID;
                return View(sPlan);
            }
            return RedirectToAction("Index", "Home");
        }
        // GET: SPlans/Create
        public ActionResult Create()
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                //ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major");
                ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID");
                return View();
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: SPlans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PID,SUserID,TermID,Priority,Probability")] SPlan sPlan)
        {
            if (ModelState.IsValid)
            {
                sPlan.SUserID = (Session["User"] as Person).UserID;
                db.SPlans.Add(sPlan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major", sPlan.SUserID);
            ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID", sPlan.TermID);
            return View(sPlan);
        }

        // GET: SPlans/Edit/5
        public ActionResult Edit(int? id)
        {
            var user = (Session["User"] as Person);
            if (user != null && user.type == "S")
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                SPlan sPlan = db.SPlans.Find(id);
                if (sPlan == null)
                {
                    return HttpNotFound();
                }
                ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major", sPlan.SUserID);
                ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID", sPlan.TermID);
                return View(sPlan);
            }
            return RedirectToAction("Index", "Home");            
        }

        // POST: SPlans/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PID,SUserID,TermID,Priority,Probability")] SPlan sPlan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sPlan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major", sPlan.SUserID);
            ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID", sPlan.TermID);
            return View(sPlan);
        }

        // GET: SPlans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SPlan sPlan = db.SPlans.Find(id);
            if (sPlan == null)
            {
                return HttpNotFound();
            }
            return View(sPlan);
        }

        // POST: SPlans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SPlan sPlan = db.SPlans.Find(id);
            db.SPlans.Remove(sPlan);
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

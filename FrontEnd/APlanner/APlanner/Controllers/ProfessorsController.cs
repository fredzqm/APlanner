using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using APlanner.Database;

namespace APlanner.Controllers
{
    public class ProfessorsController : Controller
    {
        private APlannerEntities db = new APlannerEntities();

        // GET: Professors
        public ActionResult Index()
        {
            var professors = db.Professors.Include(p => p.Department).Include(p => p.Person);
            return View(professors.ToList());
        }

        // GET: Professors/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Professor professor = db.Professors.Find(id);
            if (professor == null)
            {
                return HttpNotFound();
            }
            return View(professor);
        }

        // GET: Professors/Create
        public ActionResult Create()
        {
            ViewBag.DepartID = new SelectList(db.Departments, "DepartID", "DepartNAME");
            ViewBag.PUserID = new SelectList(db.People, "UserID", "UserName");
            return View();
        }

        // POST: Professors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PUserID,DepartID,Office")] Professor professor)
        {
            if (ModelState.IsValid)
            {
                db.Professors.Add(professor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DepartID = new SelectList(db.Departments, "DepartID", "DepartNAME", professor.DepartID);
            ViewBag.PUserID = new SelectList(db.People, "UserID", "UserName", professor.PUserID);
            return View(professor);
        }

        // GET: Professors/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Professor professor = db.Professors.Find(id);
            if (professor == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartID = new SelectList(db.Departments, "DepartID", "DepartNAME", professor.DepartID);
            ViewBag.PUserID = new SelectList(db.People, "UserID", "UserName", professor.PUserID);
            return View(professor);
        }

        // POST: Professors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PUserID,DepartID,Office")] Professor professor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(professor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DepartID = new SelectList(db.Departments, "DepartID", "DepartNAME", professor.DepartID);
            ViewBag.PUserID = new SelectList(db.People, "UserID", "UserName", professor.PUserID);
            return View(professor);
        }

        // GET: Professors/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Professor professor = db.Professors.Find(id);
            if (professor == null)
            {
                return HttpNotFound();
            }
            return View(professor);
        }

        // POST: Professors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Professor professor = db.Professors.Find(id);
            db.Professors.Remove(professor);
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

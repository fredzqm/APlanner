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
    public class EnrollController : Controller
    {
        private APlannerEntities db = new APlannerEntities();

        // GET: Enroll
        public ActionResult Index()
        {
            var enrolls = db.Enrolls.Include(e => e.Section).Include(e => e.Student);
            return View(enrolls.ToList());
        }

        // GET: Enroll/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enroll enroll = db.Enrolls.Find(id);
            if (enroll == null)
            {
                return HttpNotFound();
            }
            return View(enroll);
        }

        // GET: Enroll/Create
        public ActionResult Create()
        {
            ViewBag.SectID = new SelectList(db.Sections, "SectID", "PUserID");
            ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major");
            return View();
        }

        // POST: Enroll/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SectID,SUserID,T,S,Rating")] Enroll enroll)
        {
            if (ModelState.IsValid)
            {
                db.Enrolls.Add(enroll);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SectID = new SelectList(db.Sections, "SectID", "PUserID", enroll.SectID);
            ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major", enroll.SUserID);
            return View(enroll);
        }

        // GET: Enroll/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enroll enroll = db.Enrolls.Find(id);
            if (enroll == null)
            {
                return HttpNotFound();
            }
            ViewBag.SectID = new SelectList(db.Sections, "SectID", "PUserID", enroll.SectID);
            ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major", enroll.SUserID);
            return View(enroll);
        }

        // POST: Enroll/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SectID,SUserID,T,S,Rating")] Enroll enroll)
        {
            if (ModelState.IsValid)
            {
                db.Entry(enroll).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SectID = new SelectList(db.Sections, "SectID", "PUserID", enroll.SectID);
            ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major", enroll.SUserID);
            return View(enroll);
        }

        // GET: Enroll/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enroll enroll = db.Enrolls.Find(id);
            if (enroll == null)
            {
                return HttpNotFound();
            }
            return View(enroll);
        }

        // POST: Enroll/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Enroll enroll = db.Enrolls.Find(id);
            db.Enrolls.Remove(enroll);
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

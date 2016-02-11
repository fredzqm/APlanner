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
    public class SPlansController : Controller
    {
        private APlannerEntities db = new APlannerEntities();

        // GET: SPlans
        public ActionResult Index()
        {
            var sPlans = db.SPlans.Include(s => s.Student).Include(s => s.Term);
            return View(sPlans.ToList());
        }

        // GET: SPlans/Details/5
        public ActionResult Details(int? id)
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

        // GET: SPlans/Create
        public ActionResult Create()
        {
            ViewBag.SUserID = new SelectList(db.Students, "SUserID", "Major");
            ViewBag.TermID = new SelectList(db.Terms, "TermID", "TermID");
            return View();
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

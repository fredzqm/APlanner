using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace APlanner.Controllers
{
    public class ScheduleController : Controller
    {
        // GET: Schedule
        public ActionResult Index()
        {
            return View();
        }

        // GET: Schedule/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Schedule/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Schedule/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Schedule/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Schedule/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Schedule/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Schedule/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Source()
        {
            return Content("{\"success\":1,\"result\":[{\"length\":4,\"id\":1,\"title\":\"Activity Fair\",\"url\":\"#\",\"class\":\"event-info\",\"start\":\"1441195200000\",\"end\":\"1441198800000\"},{\"length\":5,\"id\":2,\"title\":\"Welcome Party\",\"url\":\"events_a.php?a=Welcome_Party\",\"class\":\"event-info\",\"start\":\"1442080800000\",\"end\":\"1442091600000\"},{\"length\":5,\"id\":3,\"title\":\"Career Affair\",\"url\":\"#\",\"class\":\"event-important\",\"start\":\"1442408400000\",\"end\":\"1442433600000\"},{\"length\":5,\"id\":4,\"title\":\"Homecoming\",\"url\":\"#\",\"class\":\"event-important\",\"start\":\"1442671200000\",\"end\":\"1442692800000\"},{\"length\":5,\"id\":5,\"title\":\"Mid-Autumn Festival\",\"url\":\"events_a.php?a=Mid-Autumn_Festival\",\"class\":\"event-special\",\"start\":\"1443308400000\",\"end\":\"1443315600000\"},{\"length\":4,\"id\":6,\"title\":\"Day of Service\",\"url\":\"#\",\"class\":\"event-info\",\"start\":\"1445688000000\",\"end\":\"1445691600000\"},{\"length\":4,\"id\":7,\"title\":\"Diwali\",\"url\":\"events_a.php?a=Diwali\",\"class\":\"event-special\",\"start\":\"1446926400000\",\"end\":\"1446930000000\"},{\"length\":5,\"id\":13,\"title\":\"Professional Workshop\",\"url\":\"events_a.php?a=Professional_Workshop\",\"class\":\"event-important\",\"start\":\"1452716400000\",\"end\":\"1452719400000\"},{\"length\":4,\"id\":14,\"title\":\"Lunar New Year\",\"url\":\"events_a.php?a=Lunar_New_Year\",\"class\":\"event-special\",\"start\":\"1455897600000\",\"end\":\"1455901200000\"}]}");
        }

    }
}

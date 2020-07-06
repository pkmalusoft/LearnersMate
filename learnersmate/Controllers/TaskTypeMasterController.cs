using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using learnersmate.Models;
using learnersmate.Context;
using learnersmate.Filters;
namespace learnersmate.Controllers
{
    [SessionCheck]
    public class TaskTypeController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /TaskType/
        public ActionResult Index()
        {
            return View(db.TaskTypes.ToList());
        }

        // GET: /TaskType/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskType tasktypemaster = db.TaskTypes.Find(id);
            if (tasktypemaster == null)
            {
                return HttpNotFound();
            }
            return View(tasktypemaster);
        }

        // GET: /TaskType/Create
        [SessionCreate]
        public ActionResult Create()
        {
            return View();
        }

        // POST: /TaskType/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="TaskTypeID,Name")] TaskType tasktypemaster)
        {
            if (ModelState.IsValid)
            {
                db.TaskTypes.Add(tasktypemaster);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tasktypemaster);
        }

        // GET: /TaskType/Edit/5
      
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskType tasktypemaster = db.TaskTypes.Find(id);
            if (tasktypemaster == null)
            {
                return HttpNotFound();
            }
            return View(tasktypemaster);
        }

        // POST: /TaskType/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="TaskTypeID,Name")] TaskType tasktypemaster)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tasktypemaster).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tasktypemaster);
        }

        // GET: /TaskType/Delete/5
        [SessionDelete]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskType tasktypemaster = db.TaskTypes.Find(id);
            if (tasktypemaster == null)
            {
                return HttpNotFound();
            }
            return View(tasktypemaster);
        }

        // POST: /TaskType/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaskType tasktypemaster = db.TaskTypes.Find(id);
            db.TaskTypes.Remove(tasktypemaster);
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

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
    public class TaskPriorityController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /TaskPriority/
        public ActionResult Index()
        {
            return View(db.TaskPrioritys.ToList());
        }

        // GET: /TaskPriority/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskPriority taskprioritymaster = db.TaskPrioritys.Find(id);
            if (taskprioritymaster == null)
            {
                return HttpNotFound();
            }
            return View(taskprioritymaster);
        }

        // GET: /TaskPriority/Create
        [SessionCreate]
        public ActionResult Create()
        {
            return View();
        }

        // POST: /TaskPriority/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="TaskPriorityID,Name")] TaskPriority taskprioritymaster)
        {
            if (ModelState.IsValid)
            {
                db.TaskPrioritys.Add(taskprioritymaster);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(taskprioritymaster);
        }

        // GET: /TaskPriority/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskPriority taskprioritymaster = db.TaskPrioritys.Find(id);
            if (taskprioritymaster == null)
            {
                return HttpNotFound();
            }
            return View(taskprioritymaster);
        }

        // POST: /TaskPriority/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="TaskPriorityID,Name")] TaskPriority taskprioritymaster)
        {
            if (ModelState.IsValid)
            {
                db.Entry(taskprioritymaster).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(taskprioritymaster);
        }

        // GET: /TaskPriority/Delete/5
        [SessionDelete]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskPriority taskprioritymaster = db.TaskPrioritys.Find(id);
            if (taskprioritymaster == null)
            {
                return HttpNotFound();
            }
            return View(taskprioritymaster);
        }

        // POST: /TaskPriority/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaskPriority taskprioritymaster = db.TaskPrioritys.Find(id);
            db.TaskPrioritys.Remove(taskprioritymaster);
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

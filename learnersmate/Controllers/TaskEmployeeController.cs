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
    public class TaskEmployeeController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /TaskEmployee/
        public ActionResult Index()
        {
            var taskemployees = db.TaskEmployees.Include(t => t.CurrentEmployee).Include(t => t.CurrentTaskList);
            return View(taskemployees.ToList());
        }
        public ActionResult _ListFor(int? id)
        {
            var taskemployees = db.TaskEmployees.Include(t => t.CurrentEmployee).Include(t => t.CurrentTaskList).Where(t => t.TaskListID == id);
            //ViewBag.EmployeeIDList = "";
            //string eidlist = "";
            //int cnt =1;
            //foreach (TaskEmployee te in taskemployees.ToList())
            //{
            //    eidlist += cnt + ",";
            //    cnt += 1;
            //}
            //ViewBag.EmployeeIDList = "";
            return PartialView(taskemployees.ToList());
        }

        // GET: /TaskEmployee/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskEmployee taskemployee = db.TaskEmployees.Find(id);
            if (taskemployee == null)
            {
                return HttpNotFound();
            }
            return View(taskemployee);
        }

        // GET: /TaskEmployee/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "Name");
            ViewBag.TaskListID = new SelectList(db.TaskLists, "TaskListID", "Name");
            return View();
        }

        // POST: /TaskEmployee/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="TaskEmployeeID,TaskListID,EmployeeID")] TaskEmployee taskemployee)
        {
            if (ModelState.IsValid)
            {
                db.TaskEmployees.Add(taskemployee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "Name", taskemployee.EmployeeID);
            ViewBag.TaskListID = new SelectList(db.TaskLists, "TaskListID", "Name", taskemployee.TaskListID);
            return View(taskemployee);
        }

        // GET: /TaskEmployee/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskEmployee taskemployee = db.TaskEmployees.Find(id);
            if (taskemployee == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "Name", taskemployee.EmployeeID);
            ViewBag.TaskListID = new SelectList(db.TaskLists, "TaskListID", "Name", taskemployee.TaskListID);
            return View(taskemployee);
        }

        // POST: /TaskEmployee/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="TaskEmployeeID,TaskListID,EmployeeID")] TaskEmployee taskemployee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(taskemployee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "Name", taskemployee.EmployeeID);
            ViewBag.TaskListID = new SelectList(db.TaskLists, "TaskListID", "Name", taskemployee.TaskListID);
            return View(taskemployee);
        }

        // GET: /TaskEmployee/Delete/5
        [SessionDelete]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskEmployee taskemployee = db.TaskEmployees.Find(id);
            if (taskemployee == null)
            {
                return HttpNotFound();
            }
            return View(taskemployee);
        }

        // POST: /TaskEmployee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaskEmployee taskemployee = db.TaskEmployees.Find(id);
            db.TaskEmployees.Remove(taskemployee);
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

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
using Microsoft.Owin.Security;

namespace learnersmate.Controllers
{
    [SessionCheck]
    public class TaskListController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /TaskList/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var tasklists = db.TaskLists.Include(t => t.CurrentTaskPriority).Include(t => t.CurrentTaskType).Include(t => t.CurrentTaskStatus).OrderByDescending(t => t.TaskListID);
            return View(tasklists.ToList());
        }
        public ActionResult IndexMaintenance()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var tasklists = db.TaskLists.Include(t => t.CurrentTaskPriority).Include(t => t.CurrentTaskType).Include(t => t.CurrentTaskStatus).Where(t => t.TaskTypeID == 2).OrderByDescending(t => t.TaskListID);
            return View(tasklists.ToList());
        }
        public ActionResult IndexGeneral()
        {

            var tasklists = db.TaskLists.Include(t => t.CurrentTaskPriority).Include(t => t.CurrentTaskType).Include(t => t.CurrentTaskStatus).Where(t => t.TaskTypeID == 1).OrderByDescending(t => t.TaskListID).ToList();
            int employeeid = int.Parse(Session["UserID"].ToString());
            var taskemployee = db.TaskEmployees.Where(t => t.EmployeeID == employeeid).ToList();
            foreach (TaskEmployee te in taskemployee)
            {
                tasklists = tasklists.Where(t => t.TaskListID == te.TaskListID).ToList();
            }            
            return View(tasklists.ToList());
        }
        public ActionResult _Create()
        {
            ViewBag.EmployeeID = new MultiSelectList(db.Employees.Where(e => e.EmployeeID > 1).OrderByDescending(e => e.Name), "EmployeeID", "Name");
            ViewBag.TaskPriorityID = new SelectList(db.TaskPrioritys, "TaskPriorityID", "Name");
            ViewBag.TaskTypeID = new SelectList(db.TaskTypes, "TaskTypeID", "Name");
            return PartialView();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult _Create([Bind(Include = "TaskListID,Name,ListDetail,TaskTypeID,TaskPriorityID,TaskStatusID,ListDate")] TaskList tasklist, string[] EmployeeID)
        {
            tasklist.ListDate = DateTime.Now;
            tasklist.TaskStatusID = 1;
            ViewBag.Message = "";
            ViewBag.Error = "Error";                           
                try
                {
                    db.TaskLists.Add(tasklist);
                    db.SaveChanges();
                    

                    foreach (string eid in EmployeeID)
                    {
                        TaskEmployee taskemployee = new TaskEmployee();
                        taskemployee.TaskListID = tasklist.TaskListID;
                        taskemployee.EmployeeID = int.Parse(eid);
                        db.TaskEmployees.Add(taskemployee);
                        db.SaveChanges();
                    }

                    ViewBag.Error = "";
                    ViewBag.Message = "Created Successfully, Please click REFRESH button to view";
                   
                }
                catch { }

            ViewBag.EmployeeID = new MultiSelectList(db.Employees.Where(e => e.EmployeeID > 1).OrderByDescending(e => e.Name), "EmployeeID", "Name");
            ViewBag.TaskPriorityID = new SelectList(db.TaskPrioritys, "TaskPriorityID", "Name", tasklist.TaskPriorityID);
            ViewBag.TaskTypeID = new SelectList(db.TaskTypes, "TaskTypeID", "Name", tasklist.TaskTypeID);
            return PartialView();           
        }

        public ActionResult _ChangePriorityOpen(string idlist)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            try
            {
                if (idlist != null && idlist != "")
                {
                    string[] words = idlist.Split(',');
                    foreach (string line in words)
                    {
                        TaskList tasklist = db.TaskLists.Find(int.Parse(line));
                        tasklist.TaskStatusID = 1;
                        db.Entry(tasklist).State = EntityState.Modified;
                        db.SaveChanges();

                        Session["err"] = "";
                        Session["msg"] = "Modified Successfully";
                    }

                }
              
            }
            catch { }
            return Json("", JsonRequestBehavior.AllowGet);
        }
        public ActionResult _ChangePriorityHold(string idlist)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            try
            {
                if (idlist != null && idlist != "")
                {
                    string[] words = idlist.Split(',');
                    foreach (string line in words)
                    {
                        TaskList tasklist = db.TaskLists.Find(int.Parse(line));
                        tasklist.TaskStatusID = 2;
                        db.Entry(tasklist).State = EntityState.Modified;
                        db.SaveChanges();

                        Session["err"] = "";
                        Session["msg"] = "Modified Successfully";

                    }

                }
               
            }
            catch { }
            return Json("", JsonRequestBehavior.AllowGet);
        }
        public ActionResult _ChangePriorityClose(string idlist)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            try
            {
                if (idlist != null && idlist != "")
                {
                    string[] words = idlist.Split(',');
                    foreach (string line in words)
                    {
                        TaskList tasklist = db.TaskLists.Find(int.Parse(line));
                        tasklist.TaskStatusID = 3;
                        db.Entry(tasklist).State = EntityState.Modified;
                        db.SaveChanges();

                        Session["err"] = "";
                        Session["msg"] = "Modified Successfully";

                    }

                }
               
            }
            catch { }
            return Json("", JsonRequestBehavior.AllowGet);
        }
        // GET: /TaskList/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskList tasklist = db.TaskLists.Find(id);
            if (tasklist == null)
            {
                return HttpNotFound();
            }
            return View(tasklist);
        }

        // GET: /TaskList/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskList tasklist = db.TaskLists.Find(id);
            if (tasklist == null)
            {
                return HttpNotFound();
            }

            var taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID);
           
            List<int> idList = new List<int>();
            foreach (TaskEmployee te in taskemployeeList)
            {               
                idList.Add(te.EmployeeID);
            }
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.EmployeeID = new MultiSelectList(db.Employees.Where(e => e.EmployeeID > 1).OrderBy(e => e.Name), "EmployeeID", "Name", idList);
            ViewBag.TaskStatusID = new SelectList(db.TaskStatuss, "TaskStatusID", "Name", tasklist.TaskStatusID);
            ViewBag.TaskPriorityID = new SelectList(db.TaskPrioritys, "TaskPriorityID", "Name", tasklist.TaskPriorityID);
            ViewBag.TaskTypeID = new SelectList(db.TaskTypes, "TaskTypeID", "Name", tasklist.TaskTypeID);
            return View(tasklist);
        }
      
        // POST: /TaskList/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TaskListID,Name,ListDetail,TaskTypeID,TaskPriorityID,TaskStatusID,ListDate")] TaskList tasklist, string[] EmployeeID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            List<int> idList = new List<int>();
            try
            {
                db.Entry(tasklist).State = EntityState.Modified;
                db.SaveChanges();

                var taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID).ToList();

                foreach (TaskEmployee te in taskemployeeList)
                {
                    db.TaskEmployees.Remove(te);
                    db.SaveChanges();
                }
                foreach (string eid in EmployeeID)
                {                    
                    TaskEmployee taskemployee = new TaskEmployee();
                    taskemployee.TaskListID = tasklist.TaskListID;
                    taskemployee.EmployeeID = int.Parse(eid);
                    db.TaskEmployees.Add(taskemployee);
                    db.SaveChanges();
                }

                taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID).ToList();
               
                foreach (TaskEmployee te in taskemployeeList)
                {
                    idList.Add(te.EmployeeID);
                }

                Session["msg"] = "Modified Successfully";
                Session["err"] = "";
            }
            catch { }

            ViewBag.EmployeeID = new MultiSelectList(db.Employees.Where(e => e.EmployeeID > 1).OrderBy(e => e.Name), "EmployeeID", "Name", idList);
            ViewBag.TaskStatusID = new SelectList(db.TaskStatuss, "TaskStatusID", "Name", tasklist.TaskStatusID);
            ViewBag.TaskPriorityID = new SelectList(db.TaskPrioritys, "TaskPriorityID", "Name", tasklist.TaskPriorityID);
            ViewBag.TaskTypeID = new SelectList(db.TaskTypes, "TaskTypeID", "Name", tasklist.TaskTypeID);          
                      
            return RedirectToAction("Edit","TaskList", new {id=tasklist.TaskListID});
        }
        public ActionResult EditGeneral(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskList tasklist = db.TaskLists.Find(id);
            if (tasklist == null)
            {
                return HttpNotFound();
            }

            var taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID);

            List<int> idList = new List<int>();
            foreach (TaskEmployee te in taskemployeeList)
            {
                idList.Add(te.EmployeeID);
            }
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.EmployeeID = new MultiSelectList(db.Employees.Where(e => e.EmployeeID > 1).OrderBy(e => e.Name), "EmployeeID", "Name", idList);
            ViewBag.TaskStatusID = new SelectList(db.TaskStatuss, "TaskStatusID", "Name", tasklist.TaskStatusID);
            ViewBag.TaskPriorityID = new SelectList(db.TaskPrioritys, "TaskPriorityID", "Name", tasklist.TaskPriorityID);
            ViewBag.TaskTypeID = new SelectList(db.TaskTypes, "TaskTypeID", "Name", tasklist.TaskTypeID);
            return View(tasklist);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditGeneral([Bind(Include = "TaskListID,Name,ListDetail,TaskTypeID,TaskPriorityID,TaskStatusID,ListDate")] TaskList tasklist, string[] EmployeeID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            List<int> idList = new List<int>();
            try
            {
                db.Entry(tasklist).State = EntityState.Modified;
                db.SaveChanges();

                var taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID).ToList();

                foreach (TaskEmployee te in taskemployeeList)
                {
                    db.TaskEmployees.Remove(te);
                    db.SaveChanges();
                }
                foreach (string eid in EmployeeID)
                {
                    TaskEmployee taskemployee = new TaskEmployee();
                    taskemployee.TaskListID = tasklist.TaskListID;
                    taskemployee.EmployeeID = int.Parse(eid);
                    db.TaskEmployees.Add(taskemployee);
                    db.SaveChanges();
                }

                taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID).ToList();

                foreach (TaskEmployee te in taskemployeeList)
                {
                    idList.Add(te.EmployeeID);
                }

                Session["msg"] = "Modified Successfully";
                Session["err"] = "";
            }
            catch { }

            ViewBag.EmployeeID = new MultiSelectList(db.Employees.Where(e => e.EmployeeID > 1).OrderBy(e => e.Name), "EmployeeID", "Name", idList);
            ViewBag.TaskStatusID = new SelectList(db.TaskStatuss, "TaskStatusID", "Name", tasklist.TaskStatusID);
            ViewBag.TaskPriorityID = new SelectList(db.TaskPrioritys, "TaskPriorityID", "Name", tasklist.TaskPriorityID);
            ViewBag.TaskTypeID = new SelectList(db.TaskTypes, "TaskTypeID", "Name", tasklist.TaskTypeID);

            return RedirectToAction("EditGeneral", "TaskList", new { id = tasklist.TaskListID });
        }
        public ActionResult EditMaintenance(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskList tasklist = db.TaskLists.Find(id);
            if (tasklist == null)
            {
                return HttpNotFound();
            }

            var taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID);

            List<int> idList = new List<int>();
            foreach (TaskEmployee te in taskemployeeList)
            {
                idList.Add(te.EmployeeID);
            }
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.EmployeeID = new MultiSelectList(db.Employees.Where(e => e.EmployeeID > 1).OrderBy(e => e.Name), "EmployeeID", "Name", idList);
            ViewBag.TaskStatusID = new SelectList(db.TaskStatuss, "TaskStatusID", "Name", tasklist.TaskStatusID);
            ViewBag.TaskPriorityID = new SelectList(db.TaskPrioritys, "TaskPriorityID", "Name", tasklist.TaskPriorityID);
            ViewBag.TaskTypeID = new SelectList(db.TaskTypes, "TaskTypeID", "Name", tasklist.TaskTypeID);
            return View(tasklist);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMaintenance([Bind(Include = "TaskListID,Name,ListDetail,TaskTypeID,TaskPriorityID,TaskStatusID,ListDate")] TaskList tasklist, string[] EmployeeID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            List<int> idList = new List<int>();
            try
            {
                db.Entry(tasklist).State = EntityState.Modified;
                db.SaveChanges();

                var taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID).ToList();

                foreach (TaskEmployee te in taskemployeeList)
                {
                    db.TaskEmployees.Remove(te);
                    db.SaveChanges();
                }
                foreach (string eid in EmployeeID)
                {
                    TaskEmployee taskemployee = new TaskEmployee();
                    taskemployee.TaskListID = tasklist.TaskListID;
                    taskemployee.EmployeeID = int.Parse(eid);
                    db.TaskEmployees.Add(taskemployee);
                    db.SaveChanges();
                }

                taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == tasklist.TaskListID).ToList();

                foreach (TaskEmployee te in taskemployeeList)
                {
                    idList.Add(te.EmployeeID);
                }

                Session["msg"] = "Modified Successfully";
                Session["err"] = "";
            }
            catch { }

            ViewBag.EmployeeID = new MultiSelectList(db.Employees.Where(e => e.EmployeeID > 1).OrderBy(e => e.Name), "EmployeeID", "Name", idList);
            ViewBag.TaskStatusID = new SelectList(db.TaskStatuss, "TaskStatusID", "Name", tasklist.TaskStatusID);
            ViewBag.TaskPriorityID = new SelectList(db.TaskPrioritys, "TaskPriorityID", "Name", tasklist.TaskPriorityID);
            ViewBag.TaskTypeID = new SelectList(db.TaskTypes, "TaskTypeID", "Name", tasklist.TaskTypeID);

            return RedirectToAction("EditMaintenance", "TaskList", new { id = tasklist.TaskListID });
        }
        // GET: /TaskList/Delete/5
        [SessionDelete]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaskList tasklist = db.TaskLists.Find(id);
            if (tasklist == null)
            {
                return HttpNotFound();
            }
            return View(tasklist);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            try
            {
                var taskemployeeList = db.TaskEmployees.Where(t => t.TaskListID == id).ToList();
                foreach (TaskEmployee te in taskemployeeList)
                {                    
                    db.TaskEmployees.Remove(te);
                    db.SaveChanges();
                }
                TaskList tasklist = db.TaskLists.Find(id);
                db.TaskLists.Remove(tasklist);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";
                
            }
            catch{}
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

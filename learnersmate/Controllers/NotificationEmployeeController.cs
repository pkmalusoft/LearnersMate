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
    public class NotificationEmployeeController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var notifications= db.Notifications.Include(t => t.CurrentNotificationType).Where(t => t.NotificationTypeID == 5).OrderByDescending(t => t.NotificationID).ToList();           
            return View(notifications);
        }

        [SessionCreate]
        public ActionResult Create()
        {      
            Notification n = new Notification();
            n.NotifiedDate = DateTime.Now;
            n.NotificationTypeID = 5;
            ViewBag.EmployeeID = new MultiSelectList(db.Employees.OrderByDescending(e => e.Name), "EmployeeID", "Name");
            return PartialView(n);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] EmployeeID)
        {                 
            ViewBag.Message = "";
            ViewBag.Error = "Error";            
            try
                {
                db.Notifications.Add(notification);
                db.SaveChanges();                
                              
                foreach (string eid in EmployeeID)
                {
                    NotificationEmployee notificationemployee = new NotificationEmployee();
                    notificationemployee.NotificationID = notification.NotificationID;
                    notificationemployee.EmployeeID = int.Parse(eid);
                    db.NotificationEmployees.Add(notificationemployee);
                    db.SaveChanges();
                }
               
                ViewBag.Error = "";
                ViewBag.Message = "Created Successfully, Please click REFRESH button to view";    
                
                }
                catch { }
            var notificationemployeeList = db.NotificationEmployees.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationEmployee te in notificationemployeeList)
            {
                idList.Add(te.EmployeeID);
            }
            ViewBag.EmployeeID = new MultiSelectList(db.Employees.OrderByDescending(e => e.Name), "EmployeeID", "Name", idList);
            return PartialView(notification);           
        }
        
		[SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notification notification = db.Notifications.Find(id);
            if (notification == null)
            {
                return HttpNotFound();
            }
            var notificationemployeeList = db.NotificationEmployees.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationEmployee te in notificationemployeeList)
            {
                idList.Add(te.EmployeeID);
            }
            ViewBag.EmployeeID = new MultiSelectList(db.Employees.OrderByDescending(e => e.Name), "EmployeeID", "Name", idList);
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
			ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");                    
            return View(notification);
        }      
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] EmployeeID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            List<int> idList = new List<int>();
            var notificationemployeeList = db.NotificationEmployees.Where(t => t.NotificationID == notification.NotificationID).ToList();
            try
            {
                db.Entry(notification).State = EntityState.Modified;
                db.SaveChanges();

                
                foreach (NotificationEmployee te in notificationemployeeList)
                {
                    db.NotificationEmployees.Remove(te);
                    db.SaveChanges();
                }
                foreach (string eid in EmployeeID)
                {
                    NotificationEmployee notificationemployee = new NotificationEmployee();
                    notificationemployee.NotificationID = notification.NotificationID;
                    notificationemployee.EmployeeID = int.Parse(eid);
                    db.NotificationEmployees.Add(notificationemployee);
                    db.SaveChanges();
                }         
                
                Session["msg"] = "Modified Successfully";
                Session["err"] = "";

                return RedirectToAction("Index");
            }
            catch { }
            
            foreach (NotificationEmployee te in notificationemployeeList)
            {
                idList.Add(te.EmployeeID);
            }
            ViewBag.EmployeeID = new MultiSelectList(db.Employees.OrderByDescending(e => e.Name), "EmployeeID", "Name", idList);
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");
            return View(notification);
        }
        
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {

            Session["err"] = "Error";
            Session["msg"] = "";
            try { 
            Notification notification = db.Notifications.Find(id);
            var notificationemployeeList = db.NotificationEmployees.Where(t => t.NotificationID == id).ToList();
            foreach (NotificationEmployee te in notificationemployeeList)
            {
                db.NotificationEmployees.Remove(te);
                db.SaveChanges();
            }
            db.Notifications.Remove(notification);
            db.SaveChanges();

            Session["err"] = "";
            Session["msg"] = "Deleted Successfully";
                
            }
            catch{}           
            return RedirectToAction("Index");
        }
        public ActionResult ListFor(int? id)
        {
            var notificationemployees = db.NotificationEmployees.Include(t => t.CurrentEmployee).Include(t => t.CurrentNotification).Where(t => t.NotificationID == id).ToList();           
            return PartialView(notificationemployees);
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

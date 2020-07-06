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
    public class NotificationStudentController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var notifications= db.Notifications.Include(t => t.CurrentNotificationType).Where(t => t.NotificationTypeID == 4).OrderByDescending(t => t.NotificationID).ToList();           
            return View(notifications);
        }

        [SessionCreate]
        public ActionResult Create()
        {      
            Notification n = new Notification();
            n.NotifiedDate = DateTime.Now;
            n.NotificationTypeID = 4;
            ViewBag.StudentID = new MultiSelectList(db.Students.OrderByDescending(e => e.Name), "StudentID", "Name");
            return PartialView(n);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] StudentID)
        {                 
            ViewBag.Message = "";
            ViewBag.Error = "Error";            
            try
                {
                db.Notifications.Add(notification);
                db.SaveChanges();                
                              
                foreach (string eid in StudentID)
                {
                    NotificationStudent notificationstudent = new NotificationStudent();
                    notificationstudent.NotificationID = notification.NotificationID;
                    notificationstudent.StudentID = int.Parse(eid);
                    db.NotificationStudents.Add(notificationstudent);
                    db.SaveChanges();
                }
               
                ViewBag.Error = "";
                ViewBag.Message = "Created Successfully, Please click REFRESH button to view";    
                
                }
                catch { }
            var notificationstudentList = db.NotificationStudents.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationStudent te in notificationstudentList)
            {
                idList.Add(te.StudentID);
            }
            ViewBag.StudentID = new MultiSelectList(db.Students.OrderByDescending(e => e.Name), "StudentID", "Name", idList);
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
            var notificationstudentList = db.NotificationStudents.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationStudent te in notificationstudentList)
            {
                idList.Add(te.StudentID);
            }
            ViewBag.StudentID = new MultiSelectList(db.Students.OrderByDescending(e => e.Name), "StudentID", "Name", idList);
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
			ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");                    
            return View(notification);
        }      
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] StudentID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            List<int> idList = new List<int>();
            var notificationstudentList = db.NotificationStudents.Where(t => t.NotificationID == notification.NotificationID).ToList();
            try
            {
                db.Entry(notification).State = EntityState.Modified;
                db.SaveChanges();

                
                foreach (NotificationStudent te in notificationstudentList)
                {
                    db.NotificationStudents.Remove(te);
                    db.SaveChanges();
                }
                foreach (string eid in StudentID)
                {
                    NotificationStudent notificationstudent = new NotificationStudent();
                    notificationstudent.NotificationID = notification.NotificationID;
                    notificationstudent.StudentID = int.Parse(eid);
                    db.NotificationStudents.Add(notificationstudent);
                    db.SaveChanges();
                }         
                
                Session["msg"] = "Modified Successfully";
                Session["err"] = "";

                return RedirectToAction("Index");
            }
            catch { }
            
            foreach (NotificationStudent te in notificationstudentList)
            {
                idList.Add(te.StudentID);
            }
            ViewBag.StudentID = new MultiSelectList(db.Students.OrderByDescending(e => e.Name), "StudentID", "Name", idList);
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
            var notificationstudentList = db.NotificationStudents.Where(t => t.NotificationID == id).ToList();
            foreach (NotificationStudent te in notificationstudentList)
            {
                db.NotificationStudents.Remove(te);
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
            var notificationstudents = db.NotificationStudents.Include(t => t.CurrentStudent).Include(t => t.CurrentNotification).Where(t => t.NotificationID == id).ToList();           
            return PartialView(notificationstudents);
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

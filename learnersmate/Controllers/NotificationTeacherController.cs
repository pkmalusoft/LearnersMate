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
    public class NotificationTeacherController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var notifications= db.Notifications.Include(t => t.CurrentNotificationType).Where(t => t.NotificationTypeID == 2).OrderByDescending(t => t.NotificationID).ToList();           
            return View(notifications);
        }

        [SessionCreate]
        public ActionResult Create()
        {      
            Notification n = new Notification();
            n.NotifiedDate = DateTime.Now;
            n.NotificationTypeID = 2;
            ViewBag.TeacherID = new MultiSelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name");
            return PartialView(n);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] TeacherID)
        {                 
            ViewBag.Message = "";
            ViewBag.Error = "Error";            
            try
                {
                db.Notifications.Add(notification);
                db.SaveChanges();                
                              
                foreach (string eid in TeacherID)
                {
                    NotificationTeacher notificationteacher = new NotificationTeacher();
                    notificationteacher.NotificationID = notification.NotificationID;
                    notificationteacher.TeacherID = int.Parse(eid);
                    db.NotificationTeachers.Add(notificationteacher);
                    db.SaveChanges();
                }
               
                ViewBag.Error = "";
                ViewBag.Message = "Created Successfully, Please click REFRESH button to view";    
                
                }
                catch { }
            var notificationteacherList = db.NotificationTeachers.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationTeacher te in notificationteacherList)
            {
                idList.Add(te.TeacherID);
            }
            ViewBag.TeacherID = new MultiSelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name", idList);
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
            var notificationteacherList = db.NotificationTeachers.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationTeacher te in notificationteacherList)
            {
                idList.Add(te.TeacherID);
            }
            ViewBag.TeacherID = new MultiSelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name", idList);
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
			ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");                    
            return View(notification);
        }      
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] TeacherID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            List<int> idList = new List<int>();
            var notificationteacherList = db.NotificationTeachers.Where(t => t.NotificationID == notification.NotificationID).ToList();
            try
            {
                db.Entry(notification).State = EntityState.Modified;
                db.SaveChanges();

                
                foreach (NotificationTeacher te in notificationteacherList)
                {
                    db.NotificationTeachers.Remove(te);
                    db.SaveChanges();
                }
                foreach (string eid in TeacherID)
                {
                    NotificationTeacher notificationteacher = new NotificationTeacher();
                    notificationteacher.NotificationID = notification.NotificationID;
                    notificationteacher.TeacherID = int.Parse(eid);
                    db.NotificationTeachers.Add(notificationteacher);
                    db.SaveChanges();
                }         
                
                Session["msg"] = "Modified Successfully";
                Session["err"] = "";

                return RedirectToAction("Index");
            }
            catch { }
            
            foreach (NotificationTeacher te in notificationteacherList)
            {
                idList.Add(te.TeacherID);
            }
            ViewBag.TeacherID = new MultiSelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name", idList);
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
            var notificationteacherList = db.NotificationTeachers.Where(t => t.NotificationID == id).ToList();
            foreach (NotificationTeacher te in notificationteacherList)
            {
                db.NotificationTeachers.Remove(te);
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
            var notificationteachers = db.NotificationTeachers.Include(t => t.CurrentTeacher).Include(t => t.CurrentNotification).Where(t => t.NotificationID == id).ToList();           
            return PartialView(notificationteachers);
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

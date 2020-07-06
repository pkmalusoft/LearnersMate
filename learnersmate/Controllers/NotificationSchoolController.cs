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
    public class NotificationSchoolController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var notifications= db.Notifications.Include(t => t.CurrentNotificationType).Where(t => t.NotificationTypeID == 1).OrderByDescending(t => t.NotificationID).ToList();           
            return View(notifications);
        }

        [SessionCreate]
        public ActionResult Create()
        {      
            Notification n = new Notification();
            n.NotifiedDate = DateTime.Now;
            n.NotificationTypeID = 1;
            ViewBag.SchoolID = new MultiSelectList(db.Schools.OrderByDescending(e => e.Name), "SchoolID", "Name");
            return PartialView(n);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] SchoolID)
        {                 
            ViewBag.Message = "";
            ViewBag.Error = "Error";            
            try
                {
                db.Notifications.Add(notification);
                db.SaveChanges();                
                              
                foreach (string eid in SchoolID)
                {
                    NotificationSchool notificationschool = new NotificationSchool();
                    notificationschool.NotificationID = notification.NotificationID;
                    notificationschool.SchoolID = int.Parse(eid);
                    db.NotificationSchools.Add(notificationschool);
                    db.SaveChanges();
                }
               
                ViewBag.Error = "";
                ViewBag.Message = "Created Successfully, Please click REFRESH button to view";    
                
                }
                catch { }
            var notificationschoolList = db.NotificationSchools.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationSchool te in notificationschoolList)
            {
                idList.Add(te.SchoolID);
            }
            ViewBag.SchoolID = new MultiSelectList(db.Schools.OrderByDescending(e => e.Name), "SchoolID", "Name", idList);
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
            var notificationschoolList = db.NotificationSchools.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationSchool te in notificationschoolList)
            {
                idList.Add(te.SchoolID);
            }
            ViewBag.SchoolID = new MultiSelectList(db.Schools.OrderByDescending(e => e.Name), "SchoolID", "Name", idList);
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
			ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");                    
            return View(notification);
        }      
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] SchoolID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            List<int> idList = new List<int>();
            var notificationschoolList = db.NotificationSchools.Where(t => t.NotificationID == notification.NotificationID).ToList();
            try
            {
                db.Entry(notification).State = EntityState.Modified;
                db.SaveChanges();

                
                foreach (NotificationSchool te in notificationschoolList)
                {
                    db.NotificationSchools.Remove(te);
                    db.SaveChanges();
                }
                foreach (string eid in SchoolID)
                {
                    NotificationSchool notificationschool = new NotificationSchool();
                    notificationschool.NotificationID = notification.NotificationID;
                    notificationschool.SchoolID = int.Parse(eid);
                    db.NotificationSchools.Add(notificationschool);
                    db.SaveChanges();
                }         
                
                Session["msg"] = "Modified Successfully";
                Session["err"] = "";

                return RedirectToAction("Index");
            }
            catch { }
            
            foreach (NotificationSchool te in notificationschoolList)
            {
                idList.Add(te.SchoolID);
            }
            ViewBag.SchoolID = new MultiSelectList(db.Schools.OrderByDescending(e => e.Name), "SchoolID", "Name", idList);
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
            var notificationschoolList = db.NotificationSchools.Where(t => t.NotificationID == id).ToList();
            foreach (NotificationSchool te in notificationschoolList)
            {
                db.NotificationSchools.Remove(te);
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
            var notificationschools = db.NotificationSchools.Include(t => t.CurrentSchool).Include(t => t.CurrentNotification).Where(t => t.NotificationID == id).ToList();           
            return PartialView(notificationschools);
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

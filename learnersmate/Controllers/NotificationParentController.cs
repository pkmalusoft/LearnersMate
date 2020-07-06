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
    public class NotificationParentController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var notifications= db.Notifications.Include(t => t.CurrentNotificationType).Where(t => t.NotificationTypeID == 3).OrderByDescending(t => t.NotificationID).ToList();           
            return View(notifications);
        }

        [SessionCreate]
        public ActionResult Create()
        {      
            Notification n = new Notification();
            n.NotifiedDate = DateTime.Now;
            n.NotificationTypeID = 3;
            ViewBag.ParentID = new MultiSelectList(db.Parents.OrderByDescending(e => e.Name), "ParentID", "Name");
            return PartialView(n);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] ParentID)
        {                 
            ViewBag.Message = "";
            ViewBag.Error = "Error";            
            try
                {
                db.Notifications.Add(notification);
                db.SaveChanges();                
                              
                foreach (string eid in ParentID)
                {
                    NotificationParent notificationparent = new NotificationParent();
                    notificationparent.NotificationID = notification.NotificationID;
                    notificationparent.ParentID = int.Parse(eid);
                    db.NotificationParents.Add(notificationparent);
                    db.SaveChanges();
                }
               
                ViewBag.Error = "";
                ViewBag.Message = "Created Successfully, Please click REFRESH button to view";    
                
                }
                catch { }
            var notificationparentList = db.NotificationParents.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationParent te in notificationparentList)
            {
                idList.Add(te.ParentID);
            }
            ViewBag.ParentID = new MultiSelectList(db.Parents.OrderByDescending(e => e.Name), "ParentID", "Name", idList);
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
            var notificationparentList = db.NotificationParents.Where(t => t.NotificationID == notification.NotificationID);
            List<int> idList = new List<int>();
            foreach (NotificationParent te in notificationparentList)
            {
                idList.Add(te.ParentID);
            }
            ViewBag.ParentID = new MultiSelectList(db.Parents.OrderByDescending(e => e.Name), "ParentID", "Name", idList);
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
			ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");                    
            return View(notification);
        }      
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] ParentID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            List<int> idList = new List<int>();
            var notificationparentList = db.NotificationParents.Where(t => t.NotificationID == notification.NotificationID).ToList();
            try
            {
                db.Entry(notification).State = EntityState.Modified;
                db.SaveChanges();

                
                foreach (NotificationParent te in notificationparentList)
                {
                    db.NotificationParents.Remove(te);
                    db.SaveChanges();
                }
                foreach (string eid in ParentID)
                {
                    NotificationParent notificationparent = new NotificationParent();
                    notificationparent.NotificationID = notification.NotificationID;
                    notificationparent.ParentID = int.Parse(eid);
                    db.NotificationParents.Add(notificationparent);
                    db.SaveChanges();
                }         
                
                Session["msg"] = "Modified Successfully";
                Session["err"] = "";

                return RedirectToAction("Index");
            }
            catch { }
            
            foreach (NotificationParent te in notificationparentList)
            {
                idList.Add(te.ParentID);
            }
            ViewBag.ParentID = new MultiSelectList(db.Parents.OrderByDescending(e => e.Name), "ParentID", "Name", idList);
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
            var notificationparentList = db.NotificationParents.Where(t => t.NotificationID == id).ToList();
            foreach (NotificationParent te in notificationparentList)
            {
                db.NotificationParents.Remove(te);
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
            var notificationparents = db.NotificationParents.Include(t => t.CurrentParent).Include(t => t.CurrentNotification).Where(t => t.NotificationID == id).ToList();           
            return PartialView(notificationparents);
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

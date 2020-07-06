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
    public class NotificationController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        public ActionResult Index()
        {
            //ViewBag.Message = Session["msg"];
            //ViewBag.Error = Session["err"];
            //Session["err"] = "";
            //Session["msg"] = "";
            //int notifyid = Convert.ToInt16(Request.QueryString["notifyid"].ToString());
            //var notificationlist = new List<Notification>();
           
            //switch (notifyid)
            //{
            //    case 1:
            //        var notificationsschool = db.NotificationSchools.Include(t => t.CurrentNotification).Include(t => t.CurrentNotification.CurrentNotificationType).OrderByDescending(t => t.NotificationID).ToList();
            //        foreach (NotificationSchool n in notificationsschool)
            //        {
            //            Notification notification = new Notification();
            //            notification.NotificationID = n.CurrentNotification.NotificationID;
            //            notification.NotificationTypeID = n.CurrentNotification.NotificationTypeID;
            //            notification.Name = n.CurrentNotification.Name;
            //            notification.Detail = n.CurrentNotification.Detail;
            //            notification.NotifiedDate = n.CurrentNotification.NotifiedDate;
            //            notificationlist.Add(notification);
            //        }
            //        break;
            //    case 2:
            //        var notificationsteacher = db.NotificationTeachers.Include(t => t.CurrentNotification).Include(t => t.CurrentNotification.CurrentNotificationType).OrderByDescending(t => t.NotificationID).ToList();
            //        foreach (NotificationTeacher n in notificationsteacher)
            //        {
            //            Notification notification = new Notification();
            //            notification.NotificationID = n.CurrentNotification.NotificationID;
            //            notification.NotificationTypeID = n.CurrentNotification.NotificationTypeID;
            //            notification.Name = n.CurrentNotification.Name;
            //            notification.Detail = n.CurrentNotification.Detail;
            //            notification.NotifiedDate = n.CurrentNotification.NotifiedDate;
            //            notificationlist.Add(notification);
            //        }
            //        break;
            //    case 3:
            //        var notificationsparent = db.NotificationParents.Include(t => t.CurrentNotification).Include(t => t.CurrentNotification.CurrentNotificationType).OrderByDescending(t => t.NotificationID).ToList();
            //        foreach (NotificationParent n in notificationsparent)
            //        {
            //            Notification notification = new Notification();
            //            notification.NotificationID = n.CurrentNotification.NotificationID;
            //            notification.NotificationTypeID = n.CurrentNotification.NotificationTypeID;
            //            notification.Name = n.CurrentNotification.Name;
            //            notification.Detail = n.CurrentNotification.Detail;
            //            notification.NotifiedDate = n.CurrentNotification.NotifiedDate;
            //            notificationlist.Add(notification);
            //        }
            //        break;
            //    case 4:
            //        var notificationsstudent = db.NotificationStudents.Include(t => t.CurrentNotification).Include(t => t.CurrentNotification.CurrentNotificationType).OrderByDescending(t => t.NotificationID).ToList();
            //        foreach (NotificationStudent n in notificationsstudent)
            //        {
            //            Notification notification = new Notification();
            //            notification.NotificationID = n.CurrentNotification.NotificationID;
            //            notification.NotificationTypeID = n.CurrentNotification.NotificationTypeID;
            //            notification.Name = n.CurrentNotification.Name;
            //            notification.Detail = n.CurrentNotification.Detail;
            //            notification.NotifiedDate = n.CurrentNotification.NotifiedDate;
            //            notificationlist.Add(notification);
            //        }
            //        break;
            //    case 5:
            //       var notificationsemployee = db.NotificationEmployees.Include(t => t.CurrentNotification).Include(t => t.CurrentNotification.CurrentNotificationType).OrderByDescending(t => t.NotificationID).ToList();
            //        foreach (NotificationEmployee n in notificationsemployee)
            //        {
            //            Notification notification = new Notification();
            //            notification.NotificationID = n.CurrentNotification.NotificationID;
            //            notification.NotificationTypeID = n.CurrentNotification.NotificationTypeID;
            //            notification.Name = n.CurrentNotification.Name;
            //            notification.Detail = n.CurrentNotification.Detail;
            //            notification.NotifiedDate = n.CurrentNotification.NotifiedDate;
            //            notificationlist.Add(notification);
            //        }
            //        break;
            //    default:
            //        break;
            //}
            return View();
        }

        [SessionCreate]
        public ActionResult Create(int id)
        {
			ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");           
            switch(id)
            {
                case 1:
                   
                    ViewBag.NotifyTo = "School";
                    ViewBag.NotifyID = new MultiSelectList(db.Schools.OrderByDescending(e => e.Name), "SchoolID", "Name");
                    break;
                case 2:
                    ViewBag.NotifyTo = "Teacher";
                    ViewBag.NotifyID = new MultiSelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name");
                    break;
                case 3:
                    ViewBag.NotifyTo = "Parent";
                    ViewBag.NotifyID = new MultiSelectList(db.Parents.OrderByDescending(e => e.Name), "ParentID", "Name");
                    break;
                case 4:
                    ViewBag.NotifyTo = "Student";
                    ViewBag.NotifyID = new MultiSelectList(db.Students.OrderByDescending(e => e.Name), "StudentID", "Name");
                    break;
                case 5:
                    ViewBag.NotifyTo = "Employee";
                    ViewBag.NotifyID = new MultiSelectList(db.Employees.OrderByDescending(e => e.Name), "EmployeeID", "Name");
                    break;
                default:
                    break;
            }
            Notification n = new Notification();
            n.NotifiedDate = DateTime.Now;
            return PartialView(n);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] NotifyID, int id)
        {                 
            ViewBag.Message = "";
            ViewBag.Error = "Error";
            notification.NotificationTypeID = id;
            try
                {                  
                    db.Notifications.Add(notification);
                    db.SaveChanges();

                    switch (id)
                    {
                        case 1:                            
                            ViewBag.NotifyTo = "School";
                            ViewBag.NotifyID = new MultiSelectList(db.Schools.OrderByDescending(e => e.Name), "SchoolID", "Name");
                            ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");
                        foreach (string eid in NotifyID)
                        {
                            NotificationSchool notificationschool = new NotificationSchool();
                            notificationschool.NotificationID = notification.NotificationID;
                            notificationschool.SchoolID = int.Parse(eid);
                            db.NotificationSchools.Add(notificationschool);
                            db.SaveChanges();
                        }
                            break;
                        case 2:
                            ViewBag.NotifyTo = "Teacher";
                            ViewBag.NotifyID = new MultiSelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name");
                            ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");
                        foreach (string eid in NotifyID)
                        {
                            NotificationTeacher notificationteacher = new NotificationTeacher();
                            notificationteacher.NotificationID = notification.NotificationID;
                            notificationteacher.TeacherID = int.Parse(eid);
                            db.NotificationTeachers.Add(notificationteacher);
                            db.SaveChanges();
                        }
                            break;
                        case 3:
                            ViewBag.NotifyTo = "Parent";
                            ViewBag.NotifyID = new MultiSelectList(db.Parents.OrderByDescending(e => e.Name), "ParentID", "Name");
                            ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");
                        foreach (string eid in NotifyID)
                        {
                            NotificationParent notificationparent = new NotificationParent();
                            notificationparent.NotificationID = notification.NotificationID;
                            notificationparent.ParentID = int.Parse(eid);
                            db.NotificationParents.Add(notificationparent);
                            db.SaveChanges();
                        }
                            break;
                        case 4:
                            ViewBag.NotifyTo = "Student";
                            ViewBag.NotifyID = new MultiSelectList(db.Students.OrderByDescending(e => e.Name), "StudentID", "Name");
                            ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");
                        foreach (string eid in NotifyID)
                        {
                            NotificationStudent notificationstudent = new NotificationStudent();
                            notificationstudent.NotificationID = notification.NotificationID;
                            notificationstudent.StudentID = int.Parse(eid);
                            db.NotificationStudents.Add(notificationstudent);
                            db.SaveChanges();
                        }
                            break;
                        case 5:
                            ViewBag.NotifyTo = "Employee";
                            ViewBag.NotifyID = new MultiSelectList(db.Employees.OrderByDescending(e => e.Name), "EmployeeID", "Name");
                            ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");
                        foreach (string eid in NotifyID)
                        {
                            NotificationEmployee notificationemployee = new NotificationEmployee();
                            notificationemployee.NotificationID = notification.NotificationID;
                            notificationemployee.EmployeeID = int.Parse(eid);
                            db.NotificationEmployees.Add(notificationemployee);
                            db.SaveChanges();
                        }
                            break;
                        default:
                            break;
                    }

                    ViewBag.Error = "";
                    ViewBag.Message = "Created Successfully, Please click REFRESH button to view";                   
                }
                catch { }            
            return PartialView();           
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
            int notifyid = notification.NotificationTypeID;
            switch (notifyid)
            {
                case 1:
                    ViewBag.NotifyTo = "School";                   
                    var notificationschoolList = db.NotificationSchools.Where(t => t.NotificationID == notification.NotificationID);
                    List<int> idList = new List<int>();
                    foreach (NotificationSchool te in notificationschoolList)
                    {
                        idList.Add(te.SchoolID);
                    }
                    ViewBag.NotifyID = new MultiSelectList(db.Schools.OrderByDescending(e => e.Name), "SchoolID", "Name", idList);
                    break;
                case 2:
                    ViewBag.NotifyTo = "Teacher";                    
                    var notificationteacherList = db.NotificationTeachers.Where(t => t.NotificationID == notification.NotificationID);
                    idList = new List<int>();
                    foreach (NotificationTeacher te in notificationteacherList)
                    {
                        idList.Add(te.TeacherID);
                    }
                    ViewBag.NotifyID = new MultiSelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name", idList);
                    break;
                case 3:
                    ViewBag.NotifyTo = "Parent";
                    var notificationparentList = db.NotificationParents.Where(t => t.NotificationID == notification.NotificationID);
                    idList = new List<int>();
                    foreach (NotificationParent te in notificationparentList)
                    {
                        idList.Add(te.ParentID);
                    }
                    ViewBag.NotifyID = new MultiSelectList(db.Parents.OrderByDescending(e => e.Name), "ParentID", "Name", idList);
                    break;
                case 4:
                    ViewBag.NotifyTo = "Student";
                    var notificationstudentList = db.NotificationStudents.Where(t => t.NotificationID == notification.NotificationID);
                    idList = new List<int>();
                    foreach (NotificationStudent te in notificationstudentList)
                    {
                        idList.Add(te.StudentID);
                    }
                    ViewBag.NotifyID = new MultiSelectList(db.Students.OrderByDescending(e => e.Name), "StudentID", "Name", idList);
                    break;
                case 5:
                    ViewBag.NotifyTo = "Employee";
                    var notificationemployeeList = db.NotificationEmployees.Where(t => t.NotificationID == notification.NotificationID);
                    idList = new List<int>();
                    foreach (NotificationEmployee te in notificationemployeeList)
                    {
                        idList.Add(te.EmployeeID);
                    }
                    ViewBag.NotifyID = new MultiSelectList(db.Employees.OrderByDescending(e => e.Name), "EmployeeID", "Name", idList);
                    break;
                default:
                    break;
            }
           
            ViewBag.Error = Session["err"];
            ViewBag.Message = Session["msg"];
            Session["err"] = "";
            Session["msg"] = "";
			ViewBag.NotificationTypeID = new SelectList(db.NotificationTypes, "NotificationTypeID", "Name");                    
            return View(notification);
        }      
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NotificationID,NotificationTypeID,Name,Detail,NotifiedDate")] Notification notification, string[] NotifyID)
        {
            Session["err"] = "Error";
            Session["msg"] = "";            
            List<int> idList = new List<int>();
            try
            {
                db.Entry(notification).State = EntityState.Modified;
                db.SaveChanges();

                int notifyid = notification.NotificationTypeID;
                switch (notifyid)
                {
                    case 1:
                        ViewBag.NotifyTo = "School";
                        var notificationschoolList = db.NotificationSchools.Where(t => t.NotificationID == notification.NotificationID).ToList();
                        foreach (NotificationSchool te in notificationschoolList)
                        {
                            db.NotificationSchools.Remove(te);
                            db.SaveChanges();
                        }
                        foreach (string eid in NotifyID)
                        {
                            NotificationSchool notificationschool = new NotificationSchool();
                            notificationschool.NotificationID = notification.NotificationID;
                            notificationschool.SchoolID = int.Parse(eid);
                            db.NotificationSchools.Add(notificationschool);
                            db.SaveChanges();
                        }
                        break;
                    case 2:
                        ViewBag.NotifyTo = "Teacher";
                        var notificationteacherList = db.NotificationTeachers.Where(t => t.NotificationID == notification.NotificationID).ToList();
                        foreach (NotificationTeacher te in notificationteacherList)
                        {
                            db.NotificationTeachers.Remove(te);
                            db.SaveChanges();
                        }
                        foreach (string eid in NotifyID)
                        {
                            NotificationTeacher notificationteacher = new NotificationTeacher();
                            notificationteacher.NotificationID = notification.NotificationID;
                            notificationteacher.TeacherID = int.Parse(eid);
                            db.NotificationTeachers.Add(notificationteacher);
                            db.SaveChanges();
                        }
                        break;
                    case 3:
                        ViewBag.NotifyTo = "Parent";
                        var notificationparentList = db.NotificationParents.Where(t => t.NotificationID == notification.NotificationID).ToList();
                        foreach (NotificationParent te in notificationparentList)
                        {
                            db.NotificationParents.Remove(te);
                            db.SaveChanges();
                        }
                        foreach (string eid in NotifyID)
                        {
                            NotificationParent notificationparent = new NotificationParent();
                            notificationparent.NotificationID = notification.NotificationID;
                            notificationparent.ParentID = int.Parse(eid);
                            db.NotificationParents.Add(notificationparent);
                            db.SaveChanges();
                        }
                        break;
                    case 4:
                        ViewBag.NotifyTo = "Student";
                        var notificationstudentList = db.NotificationStudents.Where(t => t.NotificationID == notification.NotificationID).ToList();
                        foreach (NotificationStudent te in notificationstudentList)
                        {
                            db.NotificationStudents.Remove(te);
                            db.SaveChanges();
                        }
                        foreach (string eid in NotifyID)
                        {
                            NotificationStudent notificationstudent = new NotificationStudent();
                            notificationstudent.NotificationID = notification.NotificationID;
                            notificationstudent.StudentID = int.Parse(eid);
                            db.NotificationStudents.Add(notificationstudent);
                            db.SaveChanges();
                        }
                        break;
                    case 5:
                        ViewBag.NotifyTo = "Employee";
                        var notificationemployeeList = db.NotificationEmployees.Where(t => t.NotificationID == notification.NotificationID).ToList();
                        foreach (NotificationEmployee te in notificationemployeeList)
                        {
                            db.NotificationEmployees.Remove(te);
                            db.SaveChanges();
                        }
                        foreach (string eid in NotifyID)
                        {
                            NotificationEmployee notificationemployee = new NotificationEmployee();
                            notificationemployee.NotificationID = notification.NotificationID;
                            notificationemployee.EmployeeID = int.Parse(eid);
                            db.NotificationEmployees.Add(notificationemployee);
                            db.SaveChanges();
                        }
                        break;
                    default:
                        break;
                }                
                
                Session["msg"] = "Modified Successfully";
                Session["err"] = "";
            }
            catch { }            
           
            return Redirect("/Notification/Index/" + notification.NotificationID  + "?notifyid=" + notification.NotificationTypeID);
        }
        
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error";
            Session["msg"] = "";
            Notification notification = db.Notifications.Find(id);
            int notifyid = notification.NotificationTypeID;
            try
            {                
                switch (notifyid)
                {
                    case 1:
                        ViewBag.NotifyTo = "School";
                        var notificationschoolList = db.NotificationSchools.Where(t => t.NotificationID == id).ToList();
                        foreach (NotificationSchool te in notificationschoolList)
                        {
                            db.NotificationSchools.Remove(te);
                            db.SaveChanges();
                        }
                        break;
                    case 2:
                        ViewBag.NotifyTo = "Teacher";
                        var notificationteacherList = db.NotificationTeachers.Where(t => t.NotificationID == id).ToList();
                        foreach (NotificationTeacher te in notificationteacherList)
                        {
                            db.NotificationTeachers.Remove(te);
                            db.SaveChanges();
                        }
                        break;
                    case 3:
                        ViewBag.NotifyTo = "Parent";
                        var notificationparentList = db.NotificationParents.Where(t => t.NotificationID == id).ToList();
                        foreach (NotificationParent te in notificationparentList)
                        {
                            db.NotificationParents.Remove(te);
                            db.SaveChanges();
                        }
                        break;
                    case 4:
                        ViewBag.NotifyTo = "Student";
                        var notificationstudentList = db.NotificationStudents.Where(t => t.NotificationID == id).ToList();
                        foreach (NotificationStudent te in notificationstudentList)
                        {
                            db.NotificationStudents.Remove(te);
                            db.SaveChanges();
                        }
                        break;
                    case 5:
                        ViewBag.NotifyTo = "Employee";
                        var notificationemployeeList = db.NotificationEmployees.Where(t => t.NotificationID == id).ToList();
                        foreach (NotificationEmployee te in notificationemployeeList)
                        {
                            db.NotificationEmployees.Remove(te);
                            db.SaveChanges();
                        }
                        break;
                    default:
                        break;
                }                
                
                db.Notifications.Remove(notification);
                db.SaveChanges();

                
                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";
                
            }
            catch{}           
            return Redirect("/Notification/Index?notifyid=" + notifyid);
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

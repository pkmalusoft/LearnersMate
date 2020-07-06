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
    public class StudentAssignmentController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var studentassignments= db.StudentAssignments.Include(t => t.CurrentTeacher).Include(t => t.CurrentClass).Include(t => t.CurrentSection).Include(t => t.CurrentSubject).OrderByDescending(t => t.StudentAssignmentID).ToList();           
            return View(studentassignments);
        }
       
        [SessionCreate]
        public ActionResult Create()
        {           
            int roleid = Convert.ToInt16(Session["RoleID"].ToString());
            if(roleid == 3)
            {
                int userid = Convert.ToInt16(Session["UserID"].ToString());
                Teacher teacher = db.Teachers.Where(t => t.UserID == userid).FirstOrDefault();
                ViewBag.TeacherID = new SelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name", teacher.TeacherID);
            }
            else
            {
                ViewBag.TeacherID = new SelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name");
            }
           
            ViewBag.ClassID = new SelectList(db.Classes.OrderByDescending(e => e.Name), "ClassID", "Name");
            ViewBag.SectionID = new SelectList(db.Sections.OrderByDescending(e => e.Name), "SectionID", "Name");
            ViewBag.SubjectID = new SelectList(db.Subjects.OrderByDescending(e => e.Name).Where(s => s.ClassID==1), "SubjectID", "Name");
            ViewBag.Subjects = db.Subjects.OrderByDescending(e => e.Name);
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StudentAssignmentID,TeacherID,ClassID,SectionID,SubjectID,Title,Detail,AssignedDate,EndDate")] StudentAssignment studentassignment)
        {                 
            ViewBag.Message = "";
            ViewBag.Error = "Error, Please check input fields";
           
            try
                {
                db.StudentAssignments.Add(studentassignment);
                db.SaveChanges();
               
                ViewBag.Error = "";
                ViewBag.Message = "Created Successfully, Please click REFRESH button to view";    
                
                }
                catch { }
            ViewBag.TeacherID = new SelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name", studentassignment.TeacherID);
            ViewBag.ClassID = new SelectList(db.Classes.OrderByDescending(e => e.Name), "ClassID", "Name", studentassignment.ClassID);
            ViewBag.SectionID = new SelectList(db.Sections.OrderByDescending(e => e.Name), "SectionID", "Name", studentassignment.SectionID);
            ViewBag.SubjectID = new SelectList(db.Subjects.OrderByDescending(e => e.Name).Where(s => s.ClassID == studentassignment.ClassID), "SubjectID", "Name", studentassignment.SubjectID);
            return PartialView(studentassignment);           
        }
        
		[SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StudentAssignment studentassignment = db.StudentAssignments.Find(id);
            if (studentassignment == null)
            {
                return HttpNotFound();
            }
            ViewBag.TeacherID = new SelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name", studentassignment.TeacherID);
            ViewBag.ClassID = new SelectList(db.Classes.OrderByDescending(e => e.Name), "ClassID", "Name", studentassignment.ClassID);
            ViewBag.SectionID = new SelectList(db.Sections.OrderByDescending(e => e.Name), "SectionID", "Name", studentassignment.SectionID);
            ViewBag.SubjectID = new SelectList(db.Subjects.OrderByDescending(e => e.Name), "SubjectID", "Name", studentassignment.SubjectID);
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(studentassignment);
        }
               
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StudentAssignmentID,TeacherID,ClassID,SectionID,SubjectID,Title,Detail,AssignedDate,EndDate")] StudentAssignment studentassignment)
        {
            Session["err"] = "Error, Please check input fields";
            Session["msg"] = "";
          
            try
            {
                db.Entry(studentassignment).State = EntityState.Modified;
                db.SaveChanges();
                                
                Session["msg"] = "Modified Successfully";
                Session["err"] = "";

                return RedirectToAction("Index");
            }
            catch { }
            
            ViewBag.TeacherID = new SelectList(db.Teachers.OrderByDescending(e => e.Name), "TeacherID", "Name", studentassignment.TeacherID);
            ViewBag.ClassID = new SelectList(db.Classes.OrderByDescending(e => e.Name), "ClassID", "Name", studentassignment.ClassID);
            ViewBag.SectionID = new SelectList(db.Sections.OrderByDescending(e => e.Name), "SectionID", "Name", studentassignment.SectionID);
            ViewBag.SubjectID = new SelectList(db.Subjects.OrderByDescending(e => e.Name).Where(s => s.ClassID == studentassignment.ClassID), "SubjectID", "Name", studentassignment.SubjectID);
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(studentassignment);
        }
            

        public ActionResult Submit(int id)
        {
            
            StudentAssignment studentassignment = db.StudentAssignments.Find(id);
            
            int studentid = 0;
            int roleid = Convert.ToInt16(Session["RoleID"].ToString());
            if (roleid == 5)
            {
                int userid = Convert.ToInt16(Session["UserID"].ToString());
                Student student = db.Students.Where(t => t.UserID == userid).FirstOrDefault();
                studentid = student.StudentID;
                ViewBag.StudentID = new SelectList(db.Students.Where(s => s.ClassID == studentassignment.ClassID && s.SectionID == studentassignment.SectionID).OrderByDescending(e => e.Name), "StudentID", "Name", studentid);
            }
            if (studentid == 0)
            {
                ViewBag.StudentID = new SelectList(db.Students.Where(s => s.ClassID == studentassignment.ClassID && s.SectionID == studentassignment.SectionID).OrderByDescending(e => e.Name), "StudentID", "Name");
            }
            StudentAssignmentSubmission studentassignmentsubmission = new StudentAssignmentSubmission();
            studentassignmentsubmission.StudentAssignmentID = id;
            studentassignmentsubmission.StudentID = studentid;
            studentassignmentsubmission.Remarks = "Submitted asignment";
            studentassignmentsubmission.SubmittedDate = DateTime.Now;

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(studentassignmentsubmission);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Submit([Bind(Include = "StudentAssignmentSubmissionID,StudentAssignmentID,StudentID,Remarks,SubmittedDate")] StudentAssignmentSubmission studentassignmentsubmission)
        {
            Session["err"] = "Error, Please check input fields";
            Session["msg"] = "";
            StudentAssignment studentassignment = db.StudentAssignments.Find(studentassignmentsubmission.StudentAssignmentID);
            try
            {
                StudentAssignmentSubmission exist = db.StudentAssignmentSubmissions.Include(t => t.CurrentStudentAssignment).Include(t => t.CurrentStudent).Include(t => t.CurrentStudent.CurrentSection).Include(t => t.CurrentStudent.CurrentClass).Where(t => t.CurrentStudent.StudentID == studentassignmentsubmission.StudentID).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Student already submitted for this assignment";
                    Session["msg"] = "";
                    ViewBag.Message = Session["msg"];
                    ViewBag.Error = Session["err"];
                    Session["err"] = "";
                    Session["msg"] = "";
                    ViewBag.StudentID = new SelectList(db.Students.Where(s => s.ClassID == studentassignment.ClassID && s.SectionID == studentassignment.SectionID).OrderByDescending(e => e.Name), "StudentID", "Name", studentassignmentsubmission.StudentID);
                    return View(studentassignmentsubmission);
                }

                db.StudentAssignmentSubmissions.Add(studentassignmentsubmission);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Submitted Successfully";

               //return RedirectToAction("Index");

            }
            catch { }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.StudentID = new SelectList(db.Students.Where(s => s.ClassID == studentassignment.ClassID && s.SectionID == studentassignment.SectionID).OrderByDescending(e => e.Name), "StudentID", "Name", studentassignmentsubmission.StudentID);
            return View(studentassignmentsubmission);
        }

        public ActionResult EditSubmit(int id)
        {
            StudentAssignmentSubmission studentassignmentsubmission = db.StudentAssignmentSubmissions.Find(id);
            StudentAssignment studentassignment = db.StudentAssignments.Find(studentassignmentsubmission.StudentAssignmentID);
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.StudentID = new SelectList(db.Students.Where(s => s.ClassID == studentassignment.ClassID && s.SectionID == studentassignment.SectionID).OrderByDescending(e => e.Name), "StudentID", "Name", studentassignmentsubmission.StudentID);
            ViewBag.Existing = studentassignmentsubmission.StudentID.ToString();
            return View(studentassignmentsubmission);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditSubmit([Bind(Include = "StudentAssignmentSubmissionID,StudentAssignmentID,StudentID,Remarks,SubmittedDate")] StudentAssignmentSubmission studentassignmentsubmission, string existing)
        {
            Session["err"] = "Error, Please check input fields";
            Session["msg"] = "";
            StudentAssignment studentassignment = db.StudentAssignments.Find(studentassignmentsubmission.StudentAssignmentID);
            ViewBag.Existing = existing;
            try
            {
                int studentidexist = Convert.ToInt16(existing);
                if (studentassignmentsubmission.StudentID != studentidexist)
                {
                    StudentAssignmentSubmission exist = db.StudentAssignmentSubmissions.Include(t => t.CurrentStudentAssignment).Include(t => t.CurrentStudent).Include(t => t.CurrentStudent.CurrentSection).Include(t => t.CurrentStudent.CurrentClass).Where(t => t.CurrentStudent.StudentID == studentassignmentsubmission.StudentID && t.CurrentStudent.StudentID != studentidexist).FirstOrDefault();
                    if (exist != null)
                    {
                        Session["err"] = "Student already submitted for this assignment";
                        Session["msg"] = "";
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        ViewBag.StudentID = new SelectList(db.Students.Where(s => s.ClassID == studentassignment.ClassID && s.SectionID == studentassignment.SectionID).OrderByDescending(e => e.Name), "StudentID", "Name", studentassignmentsubmission.StudentID);
                        return View(studentassignmentsubmission);
                    }
                }
                db.Entry(studentassignmentsubmission).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return Redirect("/StudentAssignment/IndexSubmit/" + studentassignmentsubmission.StudentAssignmentID);

            }
            catch { }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.StudentID = new SelectList(db.Students.Where(s => s.ClassID == studentassignment.ClassID && s.SectionID == studentassignment.SectionID).OrderByDescending(e => e.Name), "StudentID", "Name", studentassignmentsubmission.StudentID);
            return View(studentassignmentsubmission);
        }

        [SessionEdit]
        public ActionResult IndexSubmit(int id)
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var studentassignmentsubmission = db.StudentAssignmentSubmissions.Include(t => t.CurrentStudentAssignment).Include(t => t.CurrentStudent).Include(t => t.CurrentStudent.CurrentSection).Include(t => t.CurrentStudent.CurrentClass).Where(t => t.StudentAssignmentID == id).OrderByDescending(t => t.StudentAssignmentSubmissionID).ToList();
            if (studentassignmentsubmission.Count == 0)
            {
                @ViewBag.NoRows = "No Submisiions available for this Assignment";
            }
            return View(studentassignmentsubmission);
        }

        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Please check dependent data";
            Session["msg"] = "";
            try { 
            StudentAssignment studentassignment = db.StudentAssignments.Find(id);            
            db.StudentAssignments.Remove(studentassignment);
            db.SaveChanges();

            Session["err"] = "";
            Session["msg"] = "Deleted Successfully";
                
            }
            catch{}           
            return RedirectToAction("Index");
        }

        [SessionDelete]
        public ActionResult DeleteConfirmSubmit(int id)
        {
            Session["err"] = "Error, Please check dependent data";
            Session["msg"] = "";
            StudentAssignmentSubmission studentassignmentsubmission = db.StudentAssignmentSubmissions.Find(id);
            try
            {               
                db.StudentAssignmentSubmissions.Remove(studentassignmentsubmission);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return Redirect("/StudentAssignment/IndexSubmit/" + studentassignmentsubmission.StudentAssignmentID);
        }
        public ActionResult ListFor(int? id)
        {
            var studentassignments = db.StudentAssignments.Include(t => t.CurrentTeacher).Include(t => t.CurrentClass).Include(t => t.CurrentSection).Include(t => t.CurrentSubject).Where(t => t.StudentAssignmentID == id).OrderByDescending(t => t.StudentAssignmentID);           
            return PartialView(studentassignments);
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

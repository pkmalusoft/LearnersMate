using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using learnersmate.Models;
using SelectPdf;
using Microsoft.Owin.Security;
using learnersmate.Context;
using learnersmate.Filters;

namespace learnersmate.Controllers
{   
    [SessionCheck]
    public class StudentAttendanceController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /StudentAttendance/
        [SessionCreate]
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
           
            int companyacademicyearid = Convert.ToInt16(Session["CompanyAcademicYearID"].ToString());
            int roleid = Convert.ToInt16(Session["RoleID"].ToString());
            int userid = Convert.ToInt16(Session["UserID"].ToString());
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            System.Globalization.DateTimeFormatInfo mfi = new System.Globalization.DateTimeFormatInfo();

            int classid = 0;
            if (Request.QueryString["class"] != null)
            {
                try
                {
                    classid = Convert.ToInt16(Request.QueryString["class"]);                    
                }
                catch { }
            }
            int sectionid = 0;
            if (Request.QueryString["section"] != null)
            {
                try
                {
                    sectionid = Convert.ToInt16(Request.QueryString["section"]);
                }
                catch { }
            }
            DateTime dte = Convert.ToDateTime(DateTime.Now.Year + "-" + DateTime.Now.Month + "-" + DateTime.Now.Day);
            DateTime dteyearstart = Convert.ToDateTime(DateTime.Now.Year + "-01-01");
            
            if (Request.QueryString["date"] != null)
            {
                try
                {
                    dte = Convert.ToDateTime(Request.QueryString["date"]);
                    dte = Convert.ToDateTime(dte.Year + "-" + dte.Month + "-" + dte.Day);
                }
                catch { }               
            }

            List<StudentAttendanceModel> studentAttendancemodelList = new List<StudentAttendanceModel>();
            
            Calendar calendar = db.Calendars.Where(c => c.Date == dte).FirstOrDefault();
            if (calendar.IsHoliday) {
                ViewBag.Error = "  Selected date : " + dte.Day + " - " + mfi.GetMonthName(dte.Month).Substring(0, 3) + " - " + dte.Year + " is HOLIDAY : " + calendar.Description;
                calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();               
                dte = calendar.Date;
                dte = Convert.ToDateTime(dte.Year + "-" + dte.Month + "-" + dte.Day);                
            }
            int workingdays = db.Calendars.Where(c => c.Date <= dte && c.Date >= dteyearstart && c.IsHoliday == false).Count();
            foreach (Student student in db.Students.ToList())
            {
                StudentAttendance isStudentAdded = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate == calendar.Date).FirstOrDefault();                               
                if (isStudentAdded == null)
                {
                    StudentAttendance studentAttendancenew = new StudentAttendance();
                    studentAttendancenew.AttendanceTypeID = 2;
                    studentAttendancenew.AttendanceDate = calendar.Date;
                    studentAttendancenew.StudentID = student.StudentID;
                    studentAttendancenew.IdCard = student.IdCard;
                    studentAttendancenew.UserID = userid;
                    studentAttendancenew.UpdatedDate = DateTime.Now;
                    studentAttendancenew.Percentage = 0;
                    db.StudentAttendances.Add(studentAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    StudentAttendance studentAttendanceexist = db.StudentAttendances.Find(isStudentAdded.StudentAttendanceID);
                    int attendeddays = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    studentAttendanceexist.Percentage = perc1;
                    db.Entry(studentAttendanceexist).State = EntityState.Modified;
                    db.SaveChanges();
                }                
            }
            
            var studentAttendance = db.StudentAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentStudent).Include(s => s.CurrentStudent.CurrentSchool).Include(s => s.CurrentStudent.CurrentClass).Include(s => s.CurrentStudent.CurrentSection).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date && s.CurrentStudent.CurrentSchool.SchoolID == schoolid && s.CurrentStudent.CurrentClass.ClassID == classid && s.CurrentStudent.CurrentSection.SectionID == sectionid).OrderBy(t => t.CurrentStudent.Name).ToList();
            foreach (StudentAttendance ta in studentAttendance)
            {
                StudentAttendanceModel studentAttendancemodel = new StudentAttendanceModel();
                studentAttendancemodel.StudentAttendanceID = ta.StudentAttendanceID;
                studentAttendancemodel.StudentID = ta.StudentID;
                studentAttendancemodel.ClassID = ta.CurrentStudent.CurrentClass.ClassID;
                studentAttendancemodel.SectionID = ta.CurrentStudent.CurrentSection.SectionID;
                studentAttendancemodel.Class = ta.CurrentStudent.CurrentClass.Name;
                studentAttendancemodel.Section = ta.CurrentStudent.CurrentSection.Name;
                studentAttendancemodel.IdCard = ta.IdCard;
                studentAttendancemodel.StudentName = ta.CurrentStudent.Name;
                studentAttendancemodel.AttendanceTypeID = ta.AttendanceTypeID;
                studentAttendancemodel.BackDay1 = "";
                studentAttendancemodel.BackDay2 = "";
                studentAttendancemodel.BackDay3 = "";
                studentAttendancemodel.BackDay4 = "";
                studentAttendancemodel.BackDay5 = "";
                studentAttendancemodel.BackDay6 = "";
                studentAttendancemodel.Percentage = ta.Percentage;
                studentAttendancemodelList.Add(studentAttendancemodel);
            }
            ViewBag.SelectedDate = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3) + " " + calendar.Date.Year;

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Student student in db.Students.ToList())
            {
                StudentAttendance isStudentAdded = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isStudentAdded == null)
                {
                    StudentAttendance studentAttendancenew = new StudentAttendance();
                    studentAttendancenew.AttendanceTypeID = 2;
                    studentAttendancenew.AttendanceDate = calendar.Date;
                    studentAttendancenew.StudentID = student.StudentID;
                    studentAttendancenew.IdCard = student.IdCard;
                    studentAttendancenew.UserID = userid;
                    studentAttendancenew.UpdatedDate = DateTime.Now;
                    studentAttendancenew.Percentage = 0;
                    db.StudentAttendances.Add(studentAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    StudentAttendance studentAttendanceexist = db.StudentAttendances.Find(isStudentAdded.StudentAttendanceID);
                    int attendeddays = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    studentAttendanceexist.Percentage = perc1;
                    db.Entry(studentAttendanceexist).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            studentAttendance = db.StudentAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentStudent).Include(s => s.CurrentStudent.CurrentSchool).Include(s => s.CurrentStudent.CurrentClass).Include(s => s.CurrentStudent.CurrentSection).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date && s.CurrentStudent.CurrentSchool.SchoolID == schoolid && s.CurrentStudent.CurrentClass.ClassID == classid && s.CurrentStudent.CurrentSection.SectionID == sectionid).OrderBy(t => t.CurrentStudent.Name).ToList();
            foreach (StudentAttendance ta in studentAttendance)
            {
                StudentAttendanceModel studentattendanceid = studentAttendancemodelList.Find(item => item.StudentID == ta.StudentID);
                studentattendanceid.BackDay1 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay1 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);
            

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Student student in db.Students.ToList())
            {
                StudentAttendance isStudentAdded = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isStudentAdded == null)
                {
                    StudentAttendance studentAttendancenew = new StudentAttendance();
                    studentAttendancenew.AttendanceTypeID = 2;
                    studentAttendancenew.AttendanceDate = calendar.Date;
                    studentAttendancenew.StudentID = student.StudentID;
                    studentAttendancenew.IdCard = student.IdCard;
                    studentAttendancenew.UserID = userid;
                    studentAttendancenew.UpdatedDate = DateTime.Now;
                    studentAttendancenew.Percentage = 0;
                    db.StudentAttendances.Add(studentAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    StudentAttendance studentAttendanceexist = db.StudentAttendances.Find(isStudentAdded.StudentAttendanceID);
                    int attendeddays = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    studentAttendanceexist.Percentage = perc1;
                    db.Entry(studentAttendanceexist).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            studentAttendance = db.StudentAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentStudent).Include(s => s.CurrentStudent.CurrentSchool).Include(s => s.CurrentStudent.CurrentClass).Include(s => s.CurrentStudent.CurrentSection).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date && s.CurrentStudent.CurrentSchool.SchoolID == schoolid && s.CurrentStudent.CurrentClass.ClassID == classid && s.CurrentStudent.CurrentSection.SectionID == sectionid).OrderBy(t => t.CurrentStudent.Name).ToList();
            foreach (StudentAttendance ta in studentAttendance)
            {
                StudentAttendanceModel studentattendanceid = studentAttendancemodelList.Find(item => item.StudentID == ta.StudentID);
                studentattendanceid.BackDay2 = ta.CurrentAttendanceType.Name;                
            }
            ViewBag.BackDay2 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);            

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Student student in db.Students.ToList())
            {
                StudentAttendance isStudentAdded = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isStudentAdded == null)
                {
                    StudentAttendance studentAttendancenew = new StudentAttendance();
                    studentAttendancenew.AttendanceTypeID = 2;
                    studentAttendancenew.AttendanceDate = calendar.Date;
                    studentAttendancenew.StudentID = student.StudentID;
                    studentAttendancenew.IdCard = student.IdCard;
                    studentAttendancenew.UserID = userid;
                    studentAttendancenew.UpdatedDate = DateTime.Now;
                    studentAttendancenew.Percentage = 0;
                    db.StudentAttendances.Add(studentAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    StudentAttendance studentAttendanceexist = db.StudentAttendances.Find(isStudentAdded.StudentAttendanceID);
                    int attendeddays = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    studentAttendanceexist.Percentage = perc1;
                    db.Entry(studentAttendanceexist).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            studentAttendance = db.StudentAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentStudent).Include(s => s.CurrentStudent.CurrentSchool).Include(s => s.CurrentStudent.CurrentClass).Include(s => s.CurrentStudent.CurrentSection).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date && s.CurrentStudent.CurrentSchool.SchoolID == schoolid && s.CurrentStudent.CurrentClass.ClassID == classid && s.CurrentStudent.CurrentSection.SectionID == sectionid).OrderBy(t => t.CurrentStudent.Name).ToList();
            foreach (StudentAttendance ta in studentAttendance)
            {
                StudentAttendanceModel studentattendanceid = studentAttendancemodelList.Find(item => item.StudentID == ta.StudentID);
                studentattendanceid.BackDay3 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay3 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Student student in db.Students.ToList())
            {
                StudentAttendance isStudentAdded = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isStudentAdded == null)
                {
                    StudentAttendance studentAttendancenew = new StudentAttendance();
                    studentAttendancenew.AttendanceTypeID = 2;
                    studentAttendancenew.AttendanceDate = calendar.Date;
                    studentAttendancenew.StudentID = student.StudentID;
                    studentAttendancenew.IdCard = student.IdCard;
                    studentAttendancenew.UserID = userid;
                    studentAttendancenew.UpdatedDate = DateTime.Now;
                    studentAttendancenew.Percentage = 0;
                    db.StudentAttendances.Add(studentAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    StudentAttendance studentAttendanceexist = db.StudentAttendances.Find(isStudentAdded.StudentAttendanceID);
                    int attendeddays = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    studentAttendanceexist.Percentage = perc1;
                    db.Entry(studentAttendanceexist).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            studentAttendance = db.StudentAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentStudent).Include(s => s.CurrentStudent.CurrentSchool).Include(s => s.CurrentStudent.CurrentClass).Include(s => s.CurrentStudent.CurrentSection).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date && s.CurrentStudent.CurrentSchool.SchoolID == schoolid && s.CurrentStudent.CurrentClass.ClassID == classid && s.CurrentStudent.CurrentSection.SectionID == sectionid).OrderBy(t => t.CurrentStudent.Name).ToList();
            foreach (StudentAttendance ta in studentAttendance)
            {
                StudentAttendanceModel studentattendanceid = studentAttendancemodelList.Find(item => item.StudentID == ta.StudentID);
                studentattendanceid.BackDay4 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay4 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Student student in db.Students.ToList())
            {
                StudentAttendance isStudentAdded = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isStudentAdded == null)
                {
                    StudentAttendance studentAttendancenew = new StudentAttendance();
                    studentAttendancenew.AttendanceTypeID = 2;
                    studentAttendancenew.AttendanceDate = calendar.Date;
                    studentAttendancenew.StudentID = student.StudentID;
                    studentAttendancenew.IdCard = student.IdCard;
                    studentAttendancenew.UserID = userid;
                    studentAttendancenew.UpdatedDate = DateTime.Now;
                    studentAttendancenew.Percentage = 0;
                    db.StudentAttendances.Add(studentAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    StudentAttendance studentAttendanceexist = db.StudentAttendances.Find(isStudentAdded.StudentAttendanceID);
                    int attendeddays = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    studentAttendanceexist.Percentage = perc1;
                    db.Entry(studentAttendanceexist).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            studentAttendance = db.StudentAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentStudent).Include(s => s.CurrentStudent.CurrentSchool).Include(s => s.CurrentStudent.CurrentClass).Include(s => s.CurrentStudent.CurrentSection).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date && s.CurrentStudent.CurrentSchool.SchoolID == schoolid && s.CurrentStudent.CurrentClass.ClassID == classid && s.CurrentStudent.CurrentSection.SectionID == sectionid).OrderBy(t => t.CurrentStudent.Name).ToList();
            foreach (StudentAttendance ta in studentAttendance)
            {
                StudentAttendanceModel studentattendanceid = studentAttendancemodelList.Find(item => item.StudentID == ta.StudentID);
                studentattendanceid.BackDay5 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay5 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);
           
            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Student student in db.Students.ToList())
            {
                StudentAttendance isStudentAdded = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isStudentAdded == null)
                {
                    StudentAttendance studentAttendancenew = new StudentAttendance();
                    studentAttendancenew.AttendanceTypeID = 2;
                    studentAttendancenew.AttendanceDate = calendar.Date;
                    studentAttendancenew.StudentID = student.StudentID;
                    studentAttendancenew.IdCard = student.IdCard;
                    studentAttendancenew.UserID = userid;
                    studentAttendancenew.UpdatedDate = DateTime.Now;
                    studentAttendancenew.Percentage = 0;
                    db.StudentAttendances.Add(studentAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    StudentAttendance studentAttendanceexist = db.StudentAttendances.Find(isStudentAdded.StudentAttendanceID);
                    int attendeddays = db.StudentAttendances.Where(s => s.StudentID == student.StudentID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    studentAttendanceexist.Percentage = perc1;
                    db.Entry(studentAttendanceexist).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            studentAttendance = db.StudentAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentStudent).Include(s => s.CurrentStudent.CurrentSchool).Include(s => s.CurrentStudent.CurrentClass).Include(s => s.CurrentStudent.CurrentSection).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date && s.CurrentStudent.CurrentSchool.SchoolID == schoolid && s.CurrentStudent.CurrentClass.ClassID == classid && s.CurrentStudent.CurrentSection.SectionID == sectionid).OrderBy(t => t.CurrentStudent.Name).ToList();
            foreach (StudentAttendance ta in studentAttendance)
            {
                StudentAttendanceModel studentattendanceid = studentAttendancemodelList.Find(item => item.StudentID == ta.StudentID);
                studentattendanceid.BackDay6 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay6 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", classid);
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", sectionid);
            ViewBag.AttendanceTypeID = db.AttendanceTypes.ToList();
            Class classselected = db.Classes.Find(classid);
            Section sectionselected = db.Sections.Find(sectionid);
            if(classselected != null && sectionselected != null)
            {
                ViewBag.Selected = "Selected Class : " + classselected.Name + ", Section: " + sectionselected.Name;
            }            
            return View(studentAttendancemodelList);
        }

        [HttpPost]        
        public ActionResult Edit(List<TempStudentAttendance> studentAttendanceList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try
            {
                foreach (TempStudentAttendance t in studentAttendanceList.ToList())
                {
                    StudentAttendance studentattendance = db.StudentAttendances.Find(t.id);
                    studentattendance.AttendanceTypeID = t.attendancetypeid;
                    db.Entry(studentattendance).State = EntityState.Modified;
                    db.SaveChanges();

                    Session["err"] = "";
                    Session["msg"] = "Modified Successfully";
                }
            }
            catch { }            
            return Json(Session["err"], JsonRequestBehavior.AllowGet);
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

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
    public class TeacherAttendanceController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /TeacherAttendance/
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

            List<TeacherAttendanceModel> teacherAttendancemodelList = new List<TeacherAttendanceModel>();
            
            Calendar calendar = db.Calendars.Where(c => c.Date == dte).FirstOrDefault();
            if (calendar.IsHoliday) {
                ViewBag.Error = "  Selected date : " + dte.Day + " - " + mfi.GetMonthName(dte.Month).Substring(0, 3) + " - " + dte.Year + " is HOLIDAY : " + calendar.Description;
                calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();               
                dte = calendar.Date;
                dte = Convert.ToDateTime(dte.Year + "-" + dte.Month + "-" + dte.Day);                
            }
            int workingdays = db.Calendars.Where(c => c.Date <= dte && c.Date >= dteyearstart && c.IsHoliday == false).Count();
            foreach (Teacher teacher in db.Teachers.ToList())
            {
                TeacherAttendance isTeacherAdded = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate == calendar.Date).FirstOrDefault();                               
                if (isTeacherAdded == null)
                {
                    TeacherAttendance teacherAttendancenew = new TeacherAttendance();
                    teacherAttendancenew.AttendanceTypeID = 2;
                    teacherAttendancenew.AttendanceDate = calendar.Date;
                    teacherAttendancenew.TeacherID = teacher.TeacherID;
                    teacherAttendancenew.UserID = userid;
                    teacherAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.TeacherAttendances.Add(teacherAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //TeacherAttendance teacherAttendanceexist = db.TeacherAttendances.Find(isTeacherAdded.TeacherAttendanceID);
                    //int attendeddays = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //teacherAttendanceexist.Percentage = perc1;
                    //db.Entry(teacherAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }                
            }
            
            var teacherAttendance = db.TeacherAttendances.Include(s => s.CurrentTeacher).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentTeacher.Name).ToList();
            foreach (TeacherAttendance ta in teacherAttendance)
            {
                int presentdays = db.TeacherAttendances.Where(s => s.TeacherID == ta.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                int absentdays = db.TeacherAttendances.Where(s => s.TeacherID == ta.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 2).Count();
                int leavedays = db.TeacherAttendances.Where(s => s.TeacherID == ta.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 3).Count();

                TeacherAttendanceModel teacherAttendancemodel = new TeacherAttendanceModel();
                teacherAttendancemodel.TeacherAttendanceID = ta.TeacherAttendanceID;
                teacherAttendancemodel.TeacherID = ta.TeacherID;
                teacherAttendancemodel.TeacherName = ta.CurrentTeacher.Name;
                teacherAttendancemodel.AttendanceTypeID = ta.AttendanceTypeID;
                teacherAttendancemodel.BackDay1 = "";
                teacherAttendancemodel.BackDay2 = "";
                teacherAttendancemodel.BackDay3 = "";
                teacherAttendancemodel.BackDay4 = "";
                teacherAttendancemodel.BackDay5 = "";
                teacherAttendancemodel.BackDay6 = "";
                teacherAttendancemodel.Present = presentdays;
                teacherAttendancemodel.Absent = absentdays;
                teacherAttendancemodel.Leave = leavedays;
                teacherAttendancemodelList.Add(teacherAttendancemodel);
            }
            ViewBag.SelectedDate = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3) + " " + calendar.Date.Year;

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Teacher teacher in db.Teachers.ToList())
            {
                TeacherAttendance isTeacherAdded = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isTeacherAdded == null)
                {
                    TeacherAttendance teacherAttendancenew = new TeacherAttendance();
                    teacherAttendancenew.AttendanceTypeID = 2;
                    teacherAttendancenew.AttendanceDate = calendar.Date;
                    teacherAttendancenew.TeacherID = teacher.TeacherID;
                    teacherAttendancenew.UserID = userid;
                    teacherAttendancenew.UpdatedDate = DateTime.Now;                  
                    db.TeacherAttendances.Add(teacherAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //TeacherAttendance teacherAttendanceexist = db.TeacherAttendances.Find(isTeacherAdded.TeacherAttendanceID);
                    //int attendeddays = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //teacherAttendanceexist.Percentage = perc1;
                    //db.Entry(teacherAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            teacherAttendance = db.TeacherAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentTeacher).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentTeacher.Name).ToList();
            foreach (TeacherAttendance ta in teacherAttendance)
            {
                TeacherAttendanceModel teacherattendanceid = teacherAttendancemodelList.Find(item => item.TeacherID == ta.TeacherID);
                teacherattendanceid.BackDay1 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay1 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);
            

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Teacher teacher in db.Teachers.ToList())
            {
                TeacherAttendance isTeacherAdded = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isTeacherAdded == null)
                {
                    TeacherAttendance teacherAttendancenew = new TeacherAttendance();
                    teacherAttendancenew.AttendanceTypeID = 2;
                    teacherAttendancenew.AttendanceDate = calendar.Date;
                    teacherAttendancenew.TeacherID = teacher.TeacherID;
                    teacherAttendancenew.UserID = userid;
                    teacherAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.TeacherAttendances.Add(teacherAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //TeacherAttendance teacherAttendanceexist = db.TeacherAttendances.Find(isTeacherAdded.TeacherAttendanceID);
                    //int attendeddays = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //teacherAttendanceexist.Percentage = perc1;
                    //db.Entry(teacherAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            teacherAttendance = db.TeacherAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentTeacher).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentTeacher.Name).ToList();
            foreach (TeacherAttendance ta in teacherAttendance)
            {
                TeacherAttendanceModel teacherattendanceid = teacherAttendancemodelList.Find(item => item.TeacherID == ta.TeacherID);
                teacherattendanceid.BackDay2 = ta.CurrentAttendanceType.Name;                
            }
            ViewBag.BackDay2 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);            

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Teacher teacher in db.Teachers.ToList())
            {
                TeacherAttendance isTeacherAdded = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isTeacherAdded == null)
                {
                    TeacherAttendance teacherAttendancenew = new TeacherAttendance();
                    teacherAttendancenew.AttendanceTypeID = 2;
                    teacherAttendancenew.AttendanceDate = calendar.Date;
                    teacherAttendancenew.TeacherID = teacher.TeacherID;
                    teacherAttendancenew.UserID = userid;
                    teacherAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.TeacherAttendances.Add(teacherAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //TeacherAttendance teacherAttendanceexist = db.TeacherAttendances.Find(isTeacherAdded.TeacherAttendanceID);
                    //int attendeddays = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //teacherAttendanceexist.Percentage = perc1;
                    //db.Entry(teacherAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            teacherAttendance = db.TeacherAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentTeacher).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentTeacher.Name).ToList();
            foreach (TeacherAttendance ta in teacherAttendance)
            {
                TeacherAttendanceModel teacherattendanceid = teacherAttendancemodelList.Find(item => item.TeacherID == ta.TeacherID);
                teacherattendanceid.BackDay3 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay3 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Teacher teacher in db.Teachers.ToList())
            {
                TeacherAttendance isTeacherAdded = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isTeacherAdded == null)
                {
                    TeacherAttendance teacherAttendancenew = new TeacherAttendance();
                    teacherAttendancenew.AttendanceTypeID = 2;
                    teacherAttendancenew.AttendanceDate = calendar.Date;
                    teacherAttendancenew.TeacherID = teacher.TeacherID;
                    teacherAttendancenew.UserID = userid;
                    teacherAttendancenew.UpdatedDate = DateTime.Now;                    
                    db.TeacherAttendances.Add(teacherAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //TeacherAttendance teacherAttendanceexist = db.TeacherAttendances.Find(isTeacherAdded.TeacherAttendanceID);
                    //int attendeddays = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //teacherAttendanceexist.Percentage = perc1;
                    //db.Entry(teacherAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            teacherAttendance = db.TeacherAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentTeacher).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentTeacher.Name).ToList();
            foreach (TeacherAttendance ta in teacherAttendance)
            {
                TeacherAttendanceModel teacherattendanceid = teacherAttendancemodelList.Find(item => item.TeacherID == ta.TeacherID);
                teacherattendanceid.BackDay4 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay4 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Teacher teacher in db.Teachers.ToList())
            {
                TeacherAttendance isTeacherAdded = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isTeacherAdded == null)
                {
                    TeacherAttendance teacherAttendancenew = new TeacherAttendance();
                    teacherAttendancenew.AttendanceTypeID = 2;
                    teacherAttendancenew.AttendanceDate = calendar.Date;
                    teacherAttendancenew.TeacherID = teacher.TeacherID;
                    teacherAttendancenew.UserID = userid;
                    teacherAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.TeacherAttendances.Add(teacherAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //TeacherAttendance teacherAttendanceexist = db.TeacherAttendances.Find(isTeacherAdded.TeacherAttendanceID);
                    //int attendeddays = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //teacherAttendanceexist.Percentage = perc1;
                    //db.Entry(teacherAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            teacherAttendance = db.TeacherAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentTeacher).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentTeacher.Name).ToList();
            foreach (TeacherAttendance ta in teacherAttendance)
            {
                TeacherAttendanceModel teacherattendanceid = teacherAttendancemodelList.Find(item => item.TeacherID == ta.TeacherID);
                teacherattendanceid.BackDay5 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay5 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);
           
            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Teacher teacher in db.Teachers.ToList())
            {
                TeacherAttendance isTeacherAdded = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isTeacherAdded == null)
                {
                    TeacherAttendance teacherAttendancenew = new TeacherAttendance();
                    teacherAttendancenew.AttendanceTypeID = 2;
                    teacherAttendancenew.AttendanceDate = calendar.Date;
                    teacherAttendancenew.TeacherID = teacher.TeacherID;
                    teacherAttendancenew.UserID = userid;
                    teacherAttendancenew.UpdatedDate = DateTime.Now;                    
                    db.TeacherAttendances.Add(teacherAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //TeacherAttendance teacherAttendanceexist = db.TeacherAttendances.Find(isTeacherAdded.TeacherAttendanceID);
                    //int attendeddays = db.TeacherAttendances.Where(s => s.TeacherID == teacher.TeacherID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //teacherAttendanceexist.Percentage = perc1;
                    //db.Entry(teacherAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            teacherAttendance = db.TeacherAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentTeacher).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentTeacher.Name).ToList();
            foreach (TeacherAttendance ta in teacherAttendance)
            {
                TeacherAttendanceModel teacherattendanceid = teacherAttendancemodelList.Find(item => item.TeacherID == ta.TeacherID);
                teacherattendanceid.BackDay6 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay6 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            ViewBag.AttendanceTypeID = db.AttendanceTypes.ToList();            
            return View(teacherAttendancemodelList);
        }

        [HttpPost]        
        public ActionResult Edit(List<TempTeacherAttendance> teacherAttendanceList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try
            {
                foreach (TempTeacherAttendance t in teacherAttendanceList.ToList())
                {
                    TeacherAttendance teacherattendance = db.TeacherAttendances.Find(t.id);
                    teacherattendance.AttendanceTypeID = t.attendancetypeid;
                    db.Entry(teacherattendance).State = EntityState.Modified;
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

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
    public class EmployeeAttendanceController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /EmployeeAttendance/
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

            List<EmployeeAttendanceModel> employeeAttendancemodelList = new List<EmployeeAttendanceModel>();
            
            Calendar calendar = db.Calendars.Where(c => c.Date == dte).FirstOrDefault();
            if (calendar.IsHoliday) {
                ViewBag.Error = "  Selected date : " + dte.Day + " - " + mfi.GetMonthName(dte.Month).Substring(0, 3) + " - " + dte.Year + " is HOLIDAY : " + calendar.Description;
                calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();               
                dte = calendar.Date;
                dte = Convert.ToDateTime(dte.Year + "-" + dte.Month + "-" + dte.Day);                
            }
            int workingdays = db.Calendars.Where(c => c.Date <= dte && c.Date >= dteyearstart && c.IsHoliday == false).Count();
            foreach (Employee employee in db.Employees.ToList())
            {
                EmployeeAttendance isEmployeeAdded = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate == calendar.Date).FirstOrDefault();                               
                if (isEmployeeAdded == null)
                {
                    EmployeeAttendance employeeAttendancenew = new EmployeeAttendance();
                    employeeAttendancenew.AttendanceTypeID = 2;
                    employeeAttendancenew.AttendanceDate = calendar.Date;
                    employeeAttendancenew.EmployeeID = employee.EmployeeID;
                    employeeAttendancenew.UserID = userid;
                    employeeAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.EmployeeAttendances.Add(employeeAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //EmployeeAttendance employeeAttendanceexist = db.EmployeeAttendances.Find(isEmployeeAdded.EmployeeAttendanceID);
                    //int attendeddays = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //employeeAttendanceexist.Percentage = perc1;
                    //db.Entry(employeeAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }                
            }
            
            var employeeAttendance = db.EmployeeAttendances.Include(s => s.CurrentEmployee).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentEmployee.Name).ToList();
           
            foreach (EmployeeAttendance ta in employeeAttendance)
            {
                int presentdays = db.EmployeeAttendances.Where(s => s.EmployeeID == ta.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                int absentdays = db.EmployeeAttendances.Where(s => s.EmployeeID == ta.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 2).Count();
                int leavedays = db.EmployeeAttendances.Where(s => s.EmployeeID == ta.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 3).Count();

                EmployeeAttendanceModel employeeAttendancemodel = new EmployeeAttendanceModel();
                employeeAttendancemodel.EmployeeAttendanceID = ta.EmployeeAttendanceID;
                employeeAttendancemodel.EmployeeID = ta.EmployeeID;
                employeeAttendancemodel.EmployeeName = ta.CurrentEmployee.Name;
                employeeAttendancemodel.AttendanceTypeID = ta.AttendanceTypeID;
                employeeAttendancemodel.BackDay1 = "";
                employeeAttendancemodel.BackDay2 = "";
                employeeAttendancemodel.BackDay3 = "";
                employeeAttendancemodel.BackDay4 = "";
                employeeAttendancemodel.BackDay5 = "";
                employeeAttendancemodel.BackDay6 = "";
                employeeAttendancemodel.Present = presentdays;
                employeeAttendancemodel.Absent = absentdays;
                employeeAttendancemodel.Leave = leavedays;
                employeeAttendancemodelList.Add(employeeAttendancemodel);
            }
            ViewBag.SelectedDate = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3) + " " + calendar.Date.Year;

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Employee employee in db.Employees.ToList())
            {
                EmployeeAttendance isEmployeeAdded = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isEmployeeAdded == null)
                {
                    EmployeeAttendance employeeAttendancenew = new EmployeeAttendance();
                    employeeAttendancenew.AttendanceTypeID = 2;
                    employeeAttendancenew.AttendanceDate = calendar.Date;
                    employeeAttendancenew.EmployeeID = employee.EmployeeID;
                    employeeAttendancenew.UserID = userid;
                    employeeAttendancenew.UpdatedDate = DateTime.Now;                    
                    db.EmployeeAttendances.Add(employeeAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //EmployeeAttendance employeeAttendanceexist = db.EmployeeAttendances.Find(isEmployeeAdded.EmployeeAttendanceID);
                    //int attendeddays = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //employeeAttendanceexist.Percentage = perc1;
                    //db.Entry(employeeAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            employeeAttendance = db.EmployeeAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentEmployee).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentEmployee.Name).ToList();
            foreach (EmployeeAttendance ta in employeeAttendance)
            {
                EmployeeAttendanceModel employeeattendanceid = employeeAttendancemodelList.Find(item => item.EmployeeID == ta.EmployeeID);
                employeeattendanceid.BackDay1 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay1 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);
            

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Employee employee in db.Employees.ToList())
            {
                EmployeeAttendance isEmployeeAdded = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isEmployeeAdded == null)
                {
                    EmployeeAttendance employeeAttendancenew = new EmployeeAttendance();
                    employeeAttendancenew.AttendanceTypeID = 2;
                    employeeAttendancenew.AttendanceDate = calendar.Date;
                    employeeAttendancenew.EmployeeID = employee.EmployeeID;
                    employeeAttendancenew.UserID = userid;
                    employeeAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.EmployeeAttendances.Add(employeeAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //EmployeeAttendance employeeAttendanceexist = db.EmployeeAttendances.Find(isEmployeeAdded.EmployeeAttendanceID);
                    //int attendeddays = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //employeeAttendanceexist.Percentage = perc1;
                    //db.Entry(employeeAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            employeeAttendance = db.EmployeeAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentEmployee).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentEmployee.Name).ToList();
            foreach (EmployeeAttendance ta in employeeAttendance)
            {
                EmployeeAttendanceModel employeeattendanceid = employeeAttendancemodelList.Find(item => item.EmployeeID == ta.EmployeeID);
                employeeattendanceid.BackDay2 = ta.CurrentAttendanceType.Name;                
            }
            ViewBag.BackDay2 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);            

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Employee employee in db.Employees.ToList())
            {
                EmployeeAttendance isEmployeeAdded = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isEmployeeAdded == null)
                {
                    EmployeeAttendance employeeAttendancenew = new EmployeeAttendance();
                    employeeAttendancenew.AttendanceTypeID = 2;
                    employeeAttendancenew.AttendanceDate = calendar.Date;
                    employeeAttendancenew.EmployeeID = employee.EmployeeID;
                    employeeAttendancenew.UserID = userid;
                    employeeAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.EmployeeAttendances.Add(employeeAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //EmployeeAttendance employeeAttendanceexist = db.EmployeeAttendances.Find(isEmployeeAdded.EmployeeAttendanceID);
                    //int attendeddays = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //employeeAttendanceexist.Percentage = perc1;
                    //db.Entry(employeeAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            employeeAttendance = db.EmployeeAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentEmployee).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentEmployee.Name).ToList();
            foreach (EmployeeAttendance ta in employeeAttendance)
            {
                EmployeeAttendanceModel employeeattendanceid = employeeAttendancemodelList.Find(item => item.EmployeeID == ta.EmployeeID);
                employeeattendanceid.BackDay3 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay3 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Employee employee in db.Employees.ToList())
            {
                EmployeeAttendance isEmployeeAdded = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isEmployeeAdded == null)
                {
                    EmployeeAttendance employeeAttendancenew = new EmployeeAttendance();
                    employeeAttendancenew.AttendanceTypeID = 2;
                    employeeAttendancenew.AttendanceDate = calendar.Date;
                    employeeAttendancenew.EmployeeID = employee.EmployeeID;
                    employeeAttendancenew.UserID = userid;
                    employeeAttendancenew.UpdatedDate = DateTime.Now;                    
                    db.EmployeeAttendances.Add(employeeAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //EmployeeAttendance employeeAttendanceexist = db.EmployeeAttendances.Find(isEmployeeAdded.EmployeeAttendanceID);
                    //int attendeddays = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //employeeAttendanceexist.Percentage = perc1;
                    //db.Entry(employeeAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            employeeAttendance = db.EmployeeAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentEmployee).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentEmployee.Name).ToList();
            foreach (EmployeeAttendance ta in employeeAttendance)
            {
                EmployeeAttendanceModel employeeattendanceid = employeeAttendancemodelList.Find(item => item.EmployeeID == ta.EmployeeID);
                employeeattendanceid.BackDay4 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay4 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Employee employee in db.Employees.ToList())
            {
                EmployeeAttendance isEmployeeAdded = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isEmployeeAdded == null)
                {
                    EmployeeAttendance employeeAttendancenew = new EmployeeAttendance();
                    employeeAttendancenew.AttendanceTypeID = 2;
                    employeeAttendancenew.AttendanceDate = calendar.Date;
                    employeeAttendancenew.EmployeeID = employee.EmployeeID;
                    employeeAttendancenew.UserID = userid;
                    employeeAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.EmployeeAttendances.Add(employeeAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //EmployeeAttendance employeeAttendanceexist = db.EmployeeAttendances.Find(isEmployeeAdded.EmployeeAttendanceID);
                    //int attendeddays = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //employeeAttendanceexist.Percentage = perc1;
                    //db.Entry(employeeAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            employeeAttendance = db.EmployeeAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentEmployee).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentEmployee.Name).ToList();
            foreach (EmployeeAttendance ta in employeeAttendance)
            {
                EmployeeAttendanceModel employeeattendanceid = employeeAttendancemodelList.Find(item => item.EmployeeID == ta.EmployeeID);
                employeeattendanceid.BackDay5 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay5 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);
           
            dte = calendar.Date.AddDays(-1);
            calendar = db.Calendars.Where(c => c.Date <= dte && c.IsHoliday == false).OrderByDescending(c => c.Date).FirstOrDefault();
            foreach (Employee employee in db.Employees.ToList())
            {
                EmployeeAttendance isEmployeeAdded = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate == calendar.Date).FirstOrDefault();
                if (isEmployeeAdded == null)
                {
                    EmployeeAttendance employeeAttendancenew = new EmployeeAttendance();
                    employeeAttendancenew.AttendanceTypeID = 2;
                    employeeAttendancenew.AttendanceDate = calendar.Date;
                    employeeAttendancenew.EmployeeID = employee.EmployeeID;
                    employeeAttendancenew.UserID = userid;
                    employeeAttendancenew.UpdatedDate = DateTime.Now;                   
                    db.EmployeeAttendances.Add(employeeAttendancenew);
                    db.SaveChanges();
                }
                else
                {
                    //EmployeeAttendance employeeAttendanceexist = db.EmployeeAttendances.Find(isEmployeeAdded.EmployeeAttendanceID);
                    //int attendeddays = db.EmployeeAttendances.Where(s => s.EmployeeID == employee.EmployeeID && s.AttendanceDate <= calendar.Date && s.AttendanceTypeID == 1).Count();
                    //double perc = Convert.ToInt16(attendeddays) * 100 / Convert.ToInt16(workingdays);
                    //decimal perc1 = Convert.ToDecimal(string.Format("{0:0.00}", perc));
                    //employeeAttendanceexist.Percentage = perc1;
                    //db.Entry(employeeAttendanceexist).State = EntityState.Modified;
                    //db.SaveChanges();
                }
            }
            employeeAttendance = db.EmployeeAttendances.Include(s => s.CurrentAttendanceType).Include(s => s.CurrentEmployee).Include(s => s.CurrentUser).Where(s => s.AttendanceDate == calendar.Date).OrderBy(t => t.CurrentEmployee.Name).ToList();
            foreach (EmployeeAttendance ta in employeeAttendance)
            {
                EmployeeAttendanceModel employeeattendanceid = employeeAttendancemodelList.Find(item => item.EmployeeID == ta.EmployeeID);
                employeeattendanceid.BackDay6 = ta.CurrentAttendanceType.Name;
            }
            ViewBag.BackDay6 = calendar.Date.Day + " " + mfi.GetMonthName(calendar.Date.Month).Substring(0, 3);

            ViewBag.AttendanceTypeID = db.AttendanceTypes.ToList();            
            return View(employeeAttendancemodelList);
        }

        [HttpPost]        
        public ActionResult Edit(List<TempEmployeeAttendance> employeeAttendanceList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try
            {
                foreach (TempEmployeeAttendance t in employeeAttendanceList.ToList())
                {
                    EmployeeAttendance employeeattendance = db.EmployeeAttendances.Find(t.id);
                    employeeattendance.AttendanceTypeID = t.attendancetypeid;
                    db.Entry(employeeattendance).State = EntityState.Modified;
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

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
    public class TimeTableController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /TimeTable/
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
            School school = db.Schools.Find(schoolid);
            var timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentSection).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.TimeTableID == 0).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
            switch(roleid)
            {
                case 1:
                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentSection).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                case 2:

                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentSection).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentSchool.SchoolID == schoolid).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                case 3:
                    Teacher teacher = db.Teachers.Where(t => t.UserID == userid).FirstOrDefault();
                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentSection).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentTeacher.TeacherID == teacher.TeacherID).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                case 4:

                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentSection).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentSchool.SchoolID == schoolid).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                case 5:
                    Student student = db.Students.Where(t => t.UserID == userid).FirstOrDefault();
                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentSection).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentClass.ClassID == student.ClassID).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                default:                       
                        break;
            }
            return View(timeTables);            
        }
        [SessionCreate]
        public ActionResult Create(int id)
        {
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", id);
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name");
            IEnumerable<SelectListItem> periodlist = (from p in db.Periods select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.Time, Value = p.PeriodID.ToString() });
            ViewBag.PeriodID = new SelectList(periodlist, "Value", "Text");          
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "Name");
            ViewBag.SubjectID = new SelectList(db.Subjects.Where(c => c.ClassID == id), "SubjectID", "Name");
            TimeTable timetable = new TimeTable();
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            timetable.SchoolID = schoolid;
            return View(timetable);
             
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Create([Bind(Include = "TimeTableID,SchoolID,ClassID,SectionID,PeriodID,TeacherID,SubjectID,IsClassTeacher")] TimeTable timeTable, int ClassID)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                TimeTable timeTableexist = db.TimeTables.Where(c => c.SchoolID == timeTable.SchoolID && c.ClassID == timeTable.ClassID && c.SectionID == timeTable.SectionID && c.PeriodID == timeTable.PeriodID).FirstOrDefault();
                if (timeTableexist != null)
                {
                    Session["err"] = "Time Table already exists";
                    ViewBag.Message = Session["msg"];
                    ViewBag.Error = Session["err"];
                    Session["err"] = "";
                    Session["msg"] = "";
                    ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", timeTable.ClassID);
                    ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", timeTable.SectionID);
                    ViewBag.PeriodID = new SelectList(db.Periods, "PeriodID", "Name", timeTable.PeriodID);
                    ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "Name", timeTable.TeacherID);
                    ViewBag.SubjectID = new SelectList(db.Subjects.Where(c => c.ClassID == ClassID), "SubjectID", "Name", timeTable.SubjectID);
                    return View(timeTable);
                }
                db.TimeTables.Add(timeTable);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";

                return RedirectToAction("Index");
            }
            
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", timeTable.ClassID);
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", timeTable.SectionID);
            ViewBag.PeriodID = new SelectList(db.Periods, "PeriodID", "Name", timeTable.PeriodID);
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "Name", timeTable.TeacherID);
            ViewBag.SubjectID = new SelectList(db.Subjects.Where(c => c.ClassID == ClassID), "SubjectID", "Name", timeTable.SubjectID);
            return View(timeTable);
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "TimeTableID,SchoolID,ClassID,SectionID,PeriodID,TeacherID,SubjectID,IsClassTeacher")] TimeTable timeTable, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
           
            if (ModelState.IsValid)
            {
                TimeTable timeTableexist = db.TimeTables.Where(c => c.SchoolID == timeTable.SchoolID && c.ClassID == timeTable.ClassID && c.SectionID == timeTable.SectionID && c.PeriodID == timeTable.PeriodID).FirstOrDefault();
                if (timeTableexist != null)
                {
                    Session["err"] = "TimeTable already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.TimeTables.Add(timeTable);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_TimeTablePartial", frompage, new { id = timeTable.TimeTableID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }


        // GET: /TimeTable/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TimeTable timeTable = db.TimeTables.Include(c => c.CurrentClass).Where(c => c.TimeTableID==id).FirstOrDefault();
            if (timeTable == null)
            {
                return HttpNotFound();
            }
            Period period = db.Periods.Find(timeTable.PeriodID);
            ViewBag.Time = period.Time;
            ViewBag.Existing = timeTable.SchoolID.ToString() + timeTable.ClassID.ToString() + timeTable.SectionID.ToString() + timeTable.PeriodID.ToString();
            ViewBag.ClassName = timeTable.CurrentClass.Name;
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", timeTable.SectionID);
            ViewBag.PeriodID = new SelectList(db.Periods, "PeriodID", "Name", timeTable.PeriodID);
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "Name", timeTable.TeacherID);
            ViewBag.SubjectID = new SelectList(db.Subjects.Where(c => c.ClassID == timeTable.ClassID), "SubjectID", "Name", timeTable.SubjectID);
            return View(timeTable);
        }

        // POST: /TimeTable/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TimeTableID,SchoolID,ClassID,SectionID,PeriodID,TeacherID,SubjectID,IsClassTeacher")] TimeTable timeTable, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                string name = timeTable.SchoolID.ToString() + timeTable.ClassID.ToString() + timeTable.SectionID.ToString() + timeTable.PeriodID.ToString();
                if (name != existing)
                {
                    TimeTable exist = db.TimeTables.Include(c => c.CurrentClass).Where(c => c.SchoolID == timeTable.SchoolID && c.ClassID == timeTable.ClassID && c.SectionID == timeTable.SectionID && c.PeriodID == timeTable.PeriodID).FirstOrDefault();
                    if (exist != null)
                    {
                        Session["err"] = "Time Table already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";

                        ViewBag.ClassName = exist.CurrentClass.Name;
                        ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", timeTable.SectionID);
                        ViewBag.PeriodID = new SelectList(db.Periods, "PeriodID", "Name", timeTable.PeriodID);
                        ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "Name", timeTable.TeacherID);
                        ViewBag.SubjectID = new SelectList(db.Subjects.Where(c => c.ClassID == timeTable.ClassID), "SubjectID", "Name", timeTable.SubjectID);
                        return View(timeTable);
                    }
                }

                db.Entry(timeTable).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index");
            }
            ViewBag.Existing = existing;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            TimeTable timeTableexist = db.TimeTables.Include(c => c.CurrentClass).Where(c => c.TimeTableID == timeTable.TimeTableID).FirstOrDefault();
            ViewBag.ClassName = timeTableexist.CurrentClass.Name;
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", timeTable.SectionID);
            ViewBag.PeriodID = new SelectList(db.Periods, "PeriodID", "Name", timeTable.PeriodID);
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "Name", timeTable.TeacherID);
            ViewBag.SubjectID = new SelectList(db.Subjects.Where(c => c.ClassID == timeTable.ClassID), "SubjectID", "Name", timeTable.SubjectID);
            return View(timeTable);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                TimeTable timeTable = db.TimeTables.Find(id);
                db.TimeTables.Remove(timeTable);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";            

            }
            catch { }
            return RedirectToAction("Index");
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

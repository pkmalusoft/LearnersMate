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
    public class Exam1Controller : Controller
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

            var exams = db.ExamPortions.Include(t => t.CurrentExam).Include(t => t.CurrentChapter).Include(t => t.CurrentTopic).Where(t => t.ExamPortionID == 0).OrderBy(t => t.CurrentExam.Date).ToList();
            switch(roleid)
            {
                case 1:
                    exams = db.ExamPortions.Include(t => t.CurrentExam).Include(t => t.CurrentChapter).Include(t => t.CurrentTopic).Where(t => t.CurrentExam.CurrentSchool.CompanyAcademicYearID == companyacademicyearid).OrderBy(t => t.CurrentExam.Date).ToList();                    
                    break;
                case 2:
                    exams = db.ExamPortions.Include(t => t.CurrentExam).Include(t => t.CurrentChapter).Include(t => t.CurrentTopic).Where(t => t.CurrentExam.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentExam.CurrentSchool.SchoolID == schoolid).OrderBy(t => t.CurrentExam.Date).ToList();                                        
                    break;
                case 3:                    
                    exams = db.ExamPortions.Include(t => t.CurrentExam).Include(t => t.CurrentChapter).Include(t => t.CurrentTopic).Where(t => t.CurrentExam.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentExam.CurrentSchool.SchoolID == schoolid).OrderBy(t => t.CurrentExam.Date).ToList();
                    break;
                case 4:
                    exams = db.ExamPortions.Include(t => t.CurrentExam).Include(t => t.CurrentChapter).Include(t => t.CurrentTopic).Where(t => t.CurrentExam.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentExam.CurrentSchool.SchoolID == schoolid).OrderBy(t => t.CurrentExam.Date).ToList();
                    break;
                case 5:
                    exams = db.ExamPortions.Include(t => t.CurrentExam).Include(t => t.CurrentChapter).Include(t => t.CurrentTopic).Where(t => t.CurrentExam.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentExam.CurrentSchool.SchoolID == schoolid).OrderBy(t => t.CurrentExam.Date).ToList();
                    break;
                default:                       
                        break;
            }
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "Name");
            ViewBag.ChapterID = new SelectList(db.Chapters, "ChapterID", "Name");
            ViewBag.TopicID = new SelectList(db.Topics, "TopicID", "Name");
            return View(exams);            
        }
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "Name");
            ViewBag.ChapterID = new SelectList(db.Chapters, "ChapterID", "Name");
            ViewBag.TopicID = new SelectList(db.Topics, "TopicID", "Name");

            ExamModel exammodel = new ExamModel();
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            exammodel.SchoolID = schoolid;
            return PartialView(exammodel);
             
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Create([Bind(Include = "ExamID,Name,SchoolID,SubjectID,SubjectName,Date,ExamPortionID,ChapterID,ChapterName,TopicID,TopicName,Remarks")] ExamModel exammodel)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Exam examexists = db.Exams.Where(c => c.Name == exammodel.Name).FirstOrDefault();
                if (examexists != null)
                {
                    Session["err"] = "TimeTable already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                Exam exam = new Exam();
                exam.Name = exammodel.Name;
                exam.SchoolID = exammodel.SchoolID;
                exam.SubjectID = exammodel.SubjectID;
                exam.Date = exammodel.Date;
                exam.Remarks = exammodel.Remarks;
                db.Exams.Add(exam);
                db.SaveChanges();

                //ExamPortion examportion = new ExamPortion();
                //examportion.ExamID = exammodel.ExamID;
                //examportion.ChapterID = exammodel.ChapterID;
                //examportion.TopicID = exammodel.TopicID;
                //db.ExamPortions.Add(examportion);
                //db.SaveChanges();                

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/TimeTable/Index";
            data.type = "success";
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
            
            Exam exam = db.Exams.Find(id);            
            if (exam == null)
            {
                return HttpNotFound();
            }
            ExamModel exammodel = new ExamModel();            
            var examportion = db.ExamPortions.Where(e => e.ExamID == exam.ExamID).ToList();  
            foreach(ExamPortion ep in examportion){
                exammodel.Name = exam.Name;
                exammodel.SchoolID = exam.SchoolID;
                exammodel.SubjectID = exam.SubjectID;
                exammodel.Date = exam.Date;
                exammodel.Remarks = exam.Remarks;
                exammodel.ExamID = ep.ExamID;
                exammodel.ExamPortionID = ep.ExamPortionID;
                exammodel.ChapterID = ep.ChapterID;
                exammodel.TopicID = ep.TopicID;                
            }            
            
            ViewBag.Existing = exam.Name;
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "Name", exam.SubjectID);
            ViewBag.Chapters = db.Chapters.OrderBy(c => c.Name);
            ViewBag.Topics = db.Topics.OrderBy(c => c.Name);
            return View(exammodel);
        }

        // POST: /TimeTable/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TimeTableID,SchoolID,ClassID,PeriodID,TeacherID,SubjectID,IsClassTeacher")] TimeTable timeTable, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                string name = timeTable.SchoolID.ToString() + timeTable.ClassID.ToString() + timeTable.PeriodID.ToString() + timeTable.TeacherID.ToString() + timeTable.SubjectID.ToString();
                if (name != existing)
                {
                    TimeTable timeTableexist = db.TimeTables.Where(c => c.SchoolID == timeTable.SchoolID && c.ClassID == timeTable.ClassID && c.PeriodID == timeTable.PeriodID && c.TeacherID == timeTable.TeacherID && c.SubjectID == timeTable.SubjectID).FirstOrDefault();
                    if (timeTableexist != null)
                    {
                        Session["err"] = "TimeTable already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
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
                        
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", timeTable.ClassID);
            ViewBag.PeriodID = new SelectList(db.Periods, "PeriodID", "Name", timeTable.PeriodID);
            ViewBag.TeacherID = new SelectList(db.Teachers, "TeacherID", "Name", timeTable.TeacherID);
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "Name", timeTable.SubjectID);
            return View(timeTable);
        }

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

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
    public class ExamPortionController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /ExamPortion/
        public ActionResult Index(int id)
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.ExamID = id;
            Exam exam = db.Exams.Find(id);
            ViewBag.ExamID = id;
            ViewBag.SubjectID = exam.SubjectID;
            ViewBag.ChapterID1 = new SelectList(db.Chapters.Include(e => e.CurrentSubject).Where(e => e.CurrentSubject.SubjectID == exam.SubjectID), "ChapterID", "Name");

            var examPortion = db.ExamPortions.Include(e => e.CurrentExam).Include(e => e.CurrentChapter).Include(e => e.CurrentTopic).Where(e => e.ExamID == id).OrderBy(e => e.ChapterID).ToList();
            return View(examPortion);
        }
        [SessionCreate]
        public ActionResult Create(int id)
        {
            Exam exam = db.Exams.Find(id);
            ExamPortion examPortion = new ExamPortion();
            examPortion.ExamID = id;
            IEnumerable<SelectListItem> subjectlist = (from p in db.Chapters.Include(s => s.CurrentSubject).Include(s => s.CurrentSubject.CurrentClass).Where(e => e.CurrentSubject.SubjectID == exam.SubjectID).OrderBy(s => s.CurrentSubject.Name).OrderBy(s => s.CurrentSubject.CurrentClass.Name) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + " : " + p.CurrentSubject.Name + " : " + p.CurrentSubject.CurrentClass.Name, Value = p.ChapterID.ToString() });
            ViewBag.ChapterID = new SelectList(subjectlist, "Value", "Text");            
            ViewBag.TopicID = new SelectList(db.Topics, "TopicID", "Name");
           
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(examPortion);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Create([Bind(Include = "ExamPortionID,ExamID,ChapterID,TopicID")] ExamPortion examportion)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                ExamPortion exist = db.ExamPortions.Where(s => s.TopicID == examportion.TopicID).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Topic already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.ExamPortions.Add(examportion);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
            }
            data.message = Session["msg"].ToString();
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        
        // GET: /ExamPortion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ExamPortion examPortion = db.ExamPortions.Find(id);
            Exam exam = db.Exams.Find(examPortion.ExamID);
            if (examPortion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = examPortion.TopicID;
            ViewBag.ChapterID = new SelectList(db.Chapters.Include(e => e.CurrentSubject).Where(e => e.CurrentSubject.SubjectID == exam.SubjectID), "ChapterID", "Name", examPortion.ChapterID);
            ViewBag.TopicID = new SelectList(db.Topics, "TopicID", "Name", examPortion.TopicID);
            return View(examPortion);
        }

        // POST: /ExamPortion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ExamPortionID,ExamID,ChapterID,TopicID")] ExamPortion examPortion, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (Convert.ToString(examPortion.TopicID) != existing)
                {
                    ExamPortion examPortionexisting = db.ExamPortions.Where(s => s.TopicID == examPortion.TopicID).FirstOrDefault();
                    if (examPortionexisting != null)
                    {
                        Session["err"] = "Topic already exists";

                        ViewBag.Existing = existing;
                        Exam exam = db.Exams.Find(examPortion.ExamID);
                        ViewBag.ChapterID = new SelectList(db.Chapters.Include(e => e.CurrentSubject).Where(e => e.CurrentSubject.SubjectID == exam.SubjectID), "ChapterID", "Name", examPortion.ChapterID);
                        ViewBag.TopicID = new SelectList(db.Topics, "TopicID", "Name", examPortion.TopicID);

                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(examPortion);
                    }
                }

                db.Entry(examPortion).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index", "Exam");
            }
            ViewBag.Existing = existing;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(examPortion);
        }

        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                ExamPortion examPortion = db.ExamPortions.Find(id);
                db.ExamPortions.Remove(examPortion);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";            

            }
            catch { }
            return RedirectToAction("Index","Exam");
        }
        public JsonResult GetTopicsbyChapterID(int id)
        {
            IEnumerable<SelectListItem> subjectlist = (from p in db.Topics.Where(e => e.ChapterID == id).OrderBy(s => s.Name) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name, Value = p.TopicID.ToString() });
            var x = subjectlist;
            return Json(x, JsonRequestBehavior.AllowGet);
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

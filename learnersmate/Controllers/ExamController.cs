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
    public class ExamController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /Exam/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var exam = db.Exams.Include(e => e.CurrentSchool).Include(e => e.CurrentSubject).Include(e => e.CurrentSubject.CurrentClass).OrderByDescending(t => t.Date).ToList();
            return View(exam);
        }       

        public ActionResult _Create()
        {
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            Exam exam = new Exam();
            exam.SchoolID = schoolid;           
            IEnumerable<SelectListItem> subjectlist = (from p in db.Subjects.Include(s => s.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentClass.Name, Value = p.SubjectID.ToString() });
            ViewBag.SubjectID = new SelectList(subjectlist, "Value", "Text");   
            return PartialView(exam);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "ExamID,Name,SchoolID,SubjectID,Date,Remarks")] Exam exam)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Exam examexist = db.Exams.Where(c => c.Name == exam.Name).FirstOrDefault();
                if (examexist != null)
                {
                    Session["err"] = "Exam name already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Exams.Add(exam);
                db.SaveChanges();

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/Exam/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /Exam/Edit/5
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
            ViewBag.Existing = exam.Name + exam.SubjectID;
            IEnumerable<SelectListItem> subjectlist = (from p in db.Subjects.Include(s => s.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentClass.Name, Value = p.SubjectID.ToString() });
            ViewBag.SubjectID = new SelectList(subjectlist, "Value", "Text", exam.SubjectID); 
            return View(exam);

        }

        // POST: /Exam/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ExamID,Name,SchoolID,SubjectID,Date,Remarks")] Exam exam, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (exam.Name + exam.SubjectID != existing)
                {
                    Exam examexisting = db.Exams.Where(s => s.Name == exam.Name && s.SubjectID != exam.SubjectID).FirstOrDefault();
                    if (examexisting != null)
                    {
                        Session["err"] = "Exam name already exists";

                        ViewBag.Existing = existing;
                        IEnumerable<SelectListItem> subjectlist = (from p in db.Subjects.Include(s => s.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentClass.Name, Value = p.SubjectID.ToString() });
                        ViewBag.SubjectID = new SelectList(subjectlist, "Value", "Text", exam.SubjectID);

                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(exam);
                    }
                }

                db.Entry(exam).State = EntityState.Modified;
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
            return View(exam);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Exam exam = db.Exams.Find(id);
                db.Exams.Remove(exam);
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

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
    public class SubjectController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /Subject/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var subject = db.Subjects.Include(s=> s.CurrentClass).OrderBy(s => s.Name).ToList();
            return View(subject);
        }       

        public ActionResult _Create()
        {
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name");
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "SubjectID,Name,ClassID")] Subject subject)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Subject subjectexist = db.Subjects.Where(s => s.Name == subject.Name && s.ClassID == subject.ClassID).FirstOrDefault();
                if (subjectexist != null)
                {
                    Session["err"] = "Subject already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Subjects.Add(subject);
                db.SaveChanges();

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/Subject/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "SubjectID,Name,ClassID")] Subject subject, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
           
            if (ModelState.IsValid)
            {
                Subject subjectexist = db.Subjects.Where(s => s.Name == subject.Name && s.ClassID == subject.ClassID).FirstOrDefault();
                if (subjectexist != null)
                {
                    Session["err"] = "Subject already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.Subjects.Add(subject);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_SubjectPartial", frompage, new { id = subject.SubjectID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }


        // GET: /Subject/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Subject subject = db.Subjects.Find(id);
            if (subject == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = subject.Name + subject.ClassID.ToString();
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", subject.ClassID);
            return View(subject);
        }

        // POST: /Subject/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SubjectID,Name,ClassID")] Subject subject, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (subject.Name + subject.ClassID != existing)
                {
                    Subject subjectexisting = db.Subjects.Where(s => s.Name == subject.Name && s.ClassID == subject.ClassID).FirstOrDefault();
                    if (subjectexisting != null)
                    {
                        Session["err"] = "Subject already exists";

                        ViewBag.Existing = existing;
                        ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", subject.ClassID);

                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";

                        return View(subject);
                    }
                }

                db.Entry(subject).State = EntityState.Modified;
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
            return View(subject);
        }

        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Subject subject = db.Subjects.Find(id);
                db.Subjects.Remove(subject);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";            

            }
            catch { }
            return RedirectToAction("Index");
        }

        public ActionResult GetSubject(int? id)
        {
            Subject subject = db.Subjects.Find(id);                    
            return View(subject);
        }
        public JsonResult GetSubjectByClass(int id)
        {
            IEnumerable<SelectListItem> data = (from p in db.Subjects.Where(s=>s.ClassID == id) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name, Value = p.SubjectID.ToString() });            
            return Json(data, JsonRequestBehavior.AllowGet);
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

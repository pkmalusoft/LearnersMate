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
    public class ChapterController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /Chapter/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";                        
            var chapter = db.Chapters.Include(s => s.CurrentSubject).Include(s => s.CurrentSubject.CurrentClass).OrderBy(s => s.CurrentSubject.CurrentClass.ClassID).ToList();
            return View(chapter);
        }       

        public ActionResult _Create()
        {            
            IEnumerable<SelectListItem> subjectlist = (from p in db.Subjects.Include(s => s.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentClass.Name, Value = p.SubjectID.ToString() });
            ViewBag.SubjectID = new SelectList(subjectlist, "Value", "Text");          
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "ChapterID,Name,SubjectID")] Chapter chapter)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Chapter chapterexist = db.Chapters.Where(s => s.Name == chapter.Name && s.SubjectID == chapter.SubjectID).FirstOrDefault();
                if (chapterexist != null)
                {
                    Session["err"] = "Chapter already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Chapters.Add(chapter);
                db.SaveChanges();

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/Chapter/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "ChapterID,Name,SubjectID")] Chapter chapter, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
           
            if (ModelState.IsValid)
            {
                Chapter chapterexist = db.Chapters.Where(s => s.Name == chapter.Name && s.SubjectID == chapter.SubjectID).FirstOrDefault();
                if (chapterexist != null)
                {
                    Session["err"] = "Chapter already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.Chapters.Add(chapter);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_ChapterPartial", frompage, new { id = chapter.ChapterID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }


        // GET: /Chapter/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Chapter chapter = db.Chapters.Find(id);
            if (chapter == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = chapter.Name + chapter.SubjectID;
            IEnumerable<SelectListItem> subjectlist = (from p in db.Subjects.Include(s => s.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentClass.Name, Value = p.SubjectID.ToString() });
            ViewBag.SubjectID = new SelectList(subjectlist, "Value", "Text", chapter.SubjectID);  
            return View(chapter);
        }

        // POST: /Chapter/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ChapterID,Name,SubjectID")] Chapter chapter, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            IEnumerable<SelectListItem> subjectlist = (from p in db.Subjects.Include(s => s.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentClass.Name, Value = p.SubjectID.ToString() });

            if (ModelState.IsValid)
            {
                if (chapter.Name + chapter.SubjectID != existing)
                {
                    Chapter chapterexisting = db.Chapters.Where(s => s.Name == chapter.Name && s.SubjectID == chapter.SubjectID).FirstOrDefault();
                    if (chapterexisting != null)
                    {
                        Session["err"] = "Chapter name already exists";

                        ViewBag.Existing = existing;                       
                        ViewBag.SubjectID = new SelectList(subjectlist, "Value", "Text", chapter.SubjectID);

                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(chapter);
                    }
                }

                db.Entry(chapter).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index");
            }
            ViewBag.Existing = existing;
            ViewBag.SubjectID = new SelectList(subjectlist, "Value", "Text", chapter.SubjectID);

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";           
            return View(chapter);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Chapter chapter = db.Chapters.Find(id);
                db.Chapters.Remove(chapter);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";            

            }
            catch { }
            return RedirectToAction("Index");
        }
        public ActionResult GetChapter(int? id)
        {
            Chapter chapter = db.Chapters.Find(id);
            return View(chapter);
        }
        public ActionResult GetChapterBySubject(int? id)
        {
            //var data = db.Chapters.Where(c => c.SubjectID == id);
            //IEnumerable<SelectListItem> subjectlist = (from p in db.Chapters.Include(s => s.CurrentSubject).Where(c => c.SubjectID == id) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentSubject.Name, Value = p.ChapterID.ToString() });
            //ViewBag.ChapterID1 = new SelectList(subjectlist, "Value", "Text", id);
            //return Json(data);
            Chapter chapter = db.Chapters.Find(id);
            return View(chapter);
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


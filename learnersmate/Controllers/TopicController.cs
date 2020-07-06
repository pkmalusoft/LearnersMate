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
    public class TopicController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /Topic/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var topic = db.Topics.Include(t => t.CurrentChapter.CurrentSubject.CurrentClass).Include(t => t.CurrentChapter.CurrentSubject).Include(t => t.CurrentChapter).OrderBy(t => t.CurrentChapter.CurrentSubject.CurrentClass.ClassID).ToList();
            return View(topic);
        }       

        public ActionResult _Create()
        {
            IEnumerable<SelectListItem> subjectlist = (from p in db.Chapters.Include(s => s.CurrentSubject).Include(s => s.CurrentSubject.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentSubject.Name + "-" + p.CurrentSubject.CurrentClass.Name, Value = p.ChapterID.ToString() });
            ViewBag.ChapterID = new SelectList(subjectlist, "Value", "Text");     
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "TopicID,Name,ChapterID")] Topic topic)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Topic topicexist = db.Topics.Where(c => c.Name == topic.Name && c.ChapterID == topic.ChapterID).FirstOrDefault();
                if (topicexist != null)
                {
                    Session["err"] = "Topic name already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Topics.Add(topic);
                db.SaveChanges();

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/Topic/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "TopicID,Name,ChapterID")] Topic topic, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
           
            if (ModelState.IsValid)
            {
                Topic topicexist = db.Topics.Where(c => c.Name == topic.Name && c.ChapterID == topic.ChapterID).FirstOrDefault();
                if (topicexist != null)
                {
                    Session["err"] = "Topic name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.Topics.Add(topic);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_TopicPartial", frompage, new { id = topic.TopicID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }


        // GET: /Topic/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Topic topic = db.Topics.Find(id);
            if (topic == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = topic.Name + topic.ChapterID;           
            IEnumerable<SelectListItem> subjectlist = (from p in db.Chapters.Include(s => s.CurrentSubject).Include(s => s.CurrentSubject.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentSubject.Name + "-" + p.CurrentSubject.CurrentClass.Name, Value = p.ChapterID.ToString() });
            ViewBag.ChapterID = new SelectList(subjectlist, "Value", "Text", topic.ChapterID);   
            return View(topic);
        }

        // POST: /Topic/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TopicID,Name,ChapterID")] Topic topic, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (topic.Name + topic.ChapterID != existing)
                {
                    Topic topicexisting = db.Topics.Where(s => s.Name == topic.Name && s.ChapterID == topic.ChapterID).FirstOrDefault();
                    if (topicexisting != null)
                    {
                        Session["err"] = "Topic name already exists";

                        ViewBag.Existing = existing;
                        IEnumerable<SelectListItem> subjectlist = (from p in db.Chapters.Include(s => s.CurrentSubject).Include(s => s.CurrentSubject.CurrentClass) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name + "-" + p.CurrentSubject.Name + "-" + p.CurrentSubject.CurrentClass.Name, Value = p.ChapterID.ToString() });
                        ViewBag.ChapterID = new SelectList(subjectlist, "Value", "Text", topic.ChapterID);

                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";

                        return View(topic);
                    }
                }

                db.Entry(topic).State = EntityState.Modified;
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
            ViewBag.ChapterID = new SelectList(db.Chapters, "ChapterID", "Name", topic.ChapterID);
            return View(topic);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Topic topic = db.Topics.Find(id);
                db.Topics.Remove(topic);
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

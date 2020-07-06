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
    public class SectionController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /Section/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var section = db.Sections.OrderBy(t => t.Name).ToList();
            return View(section);
        }       

        public ActionResult _Create()
        {
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "SectionID,Name")] Section section)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Section sectionexist = db.Sections.Where(c => c.Name == section.Name).FirstOrDefault();
                if (sectionexist != null)
                {
                    Session["err"] = "Section name already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Sections.Add(section);
                db.SaveChanges();

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/Section/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "SectionID,Name")] Section section, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
           
            if (ModelState.IsValid)
            {
                Section sectionexist = db.Sections.Where(c => c.Name == section.Name).FirstOrDefault();
                if (sectionexist != null)
                {
                    Session["err"] = "Section name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.Sections.Add(section);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_SectionPartial", frompage, new { id = section.SectionID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }


        // GET: /Section/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Section section = db.Sections.Find(id);
            if (section == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = section.Name;
            return View(section);
        }

        // POST: /Section/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SectionID,Name")] Section section, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (section.Name != existing)
                {
                    Section sectionexisting = db.Sections.Where(s => s.Name == section.Name).FirstOrDefault();
                    if (sectionexisting != null)
                    {
                        Session["err"] = "Section name already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(section);
                    }
                }

                db.Entry(section).State = EntityState.Modified;
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
            return View(section);
        }

        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Section section = db.Sections.Find(id);
                db.Sections.Remove(section);
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

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
    public class ClassController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /Class/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var classs = db.Classes.OrderBy(t => t.Name).ToList();
            return View(classs);
        }       

        public ActionResult _Create()
        {
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "ClassID,Name")] Class classs)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Class classexist = db.Classes.Where(c => c.Name == classs.Name).FirstOrDefault();
                if (classexist != null)
                {
                    Session["err"] = "Class name already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Classes.Add(classs);
                db.SaveChanges();

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/Class/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "ClassID,Name")] Class classs, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
           
            if (ModelState.IsValid)
            {
                Class classexist = db.Classes.Where(c => c.Name == classs.Name).FirstOrDefault();
                if (classexist != null)
                {
                    Session["err"] = "Class name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.Classes.Add(classs);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_ClassPartial", frompage, new { id = classs.ClassID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }


        // GET: /Class/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Class classs = db.Classes.Find(id);
            if (classs == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = classs.Name;
            return View(classs);
        }

        // POST: /Class/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClassID,Name")] Class classs, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (classs.Name != existing)
                {
                    Class classexisting = db.Classes.Where(s => s.Name == classs.Name).FirstOrDefault();
                    if (classexisting != null)
                    {
                        Session["err"] = "Class name already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(classs);
                    }
                }

                db.Entry(classs).State = EntityState.Modified;
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
            return View(classs);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Class classs = db.Classes.Find(id);
                db.Classes.Remove(classs);
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

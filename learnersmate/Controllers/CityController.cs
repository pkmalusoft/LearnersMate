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
    public class CityController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /City/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var city = db.Citys.OrderBy(t => t.Name).ToList();
            return View(city);
        }       

        public ActionResult _Create()
        {
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "CityID,CityCode,Name")] City city)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                City cityexist = db.Citys.Where(c => c.Name == city.Name).FirstOrDefault();
                if (cityexist != null)
                {
                    Session["err"] = "City name already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Citys.Add(city);
                db.SaveChanges();

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/City/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "CityID,CityCode,Name")] City city, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
           
            if (ModelState.IsValid)
            {
                City cityexist = db.Citys.Where(c => c.Name == city.Name).FirstOrDefault();
                if (cityexist != null)
                {
                    Session["err"] = "City name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.Citys.Add(city);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_CityPartial", frompage, new { id = city.CityID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }


        // GET: /City/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            City city = db.Citys.Find(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = city.Name;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(city);
        }

        // POST: /City/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CityID,CityCode,Name")] City city, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (city.Name != existing)
                {
                    City cityexisting = db.Citys.Where(s => s.Name == city.Name).FirstOrDefault();
                    if (cityexisting != null)
                    {
                        Session["err"] = "City name already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(city);
                    }
                }

                db.Entry(city).State = EntityState.Modified;
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
            return View(city);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                City city = db.Citys.Find(id);
                db.Citys.Remove(city);
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

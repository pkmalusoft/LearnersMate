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
    public class AttendanceTypeController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /AttendanceType/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var attendanceType = db.AttendanceTypes.OrderBy(t => t.Name).ToList();
            return View(attendanceType);
        }       

        public ActionResult _Create()
        {
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "AttendanceTypeID,Name")] AttendanceType attendanceType)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                AttendanceType attendanceTypeexist = db.AttendanceTypes.Where(c => c.Name == attendanceType.Name).FirstOrDefault();
                if (attendanceTypeexist != null)
                {
                    Session["err"] = "AttendanceType name already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.AttendanceTypes.Add(attendanceType);
                db.SaveChanges();

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/AttendanceType/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "AttendanceTypeID,Name")] AttendanceType attendanceType, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
           
            if (ModelState.IsValid)
            {
                AttendanceType attendanceTypeexist = db.AttendanceTypes.Where(c => c.Name == attendanceType.Name).FirstOrDefault();
                if (attendanceTypeexist != null)
                {
                    Session["err"] = "AttendanceType name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.AttendanceTypes.Add(attendanceType);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_AttendanceTypePartial", frompage, new { id = attendanceType.AttendanceTypeID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }


        // GET: /AttendanceType/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AttendanceType attendanceType = db.AttendanceTypes.Find(id);
            if (attendanceType == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = attendanceType.Name;
            return View(attendanceType);
        }

        // POST: /AttendanceType/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AttendanceTypeID,Name")] AttendanceType attendanceType, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (attendanceType.Name != existing)
                {
                    AttendanceType attendanceTypeexisting = db.AttendanceTypes.Where(s => s.Name == attendanceType.Name).FirstOrDefault();
                    if (attendanceTypeexisting != null)
                    {
                        Session["err"] = "AttendanceType name already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(attendanceType);
                    }
                }

                db.Entry(attendanceType).State = EntityState.Modified;
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
            return View(attendanceType);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                AttendanceType attendanceType = db.AttendanceTypes.Find(id);
                db.AttendanceTypes.Remove(attendanceType);
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

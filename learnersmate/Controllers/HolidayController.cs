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
    public class HolidayController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        // GET: /Holiday/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var holiday = db.Calendars.Where(c => c.IsHoliday == true && c.Title != "SUNDAY").OrderByDescending(t => t.Date).ToList();
            return View(holiday);
        }       

        public ActionResult _Create()
        {
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "CalendarID,Title,Description,StartDate,NoOfDays")] HolidayModel holiday)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Calendar holidayexist = db.Calendars.Where(c => c.Date == holiday.StartDate && c.Title == holiday.Title).FirstOrDefault();
                if (holidayexist != null)
                {
                    Session["err"] = "Holiday title already exists";                   
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                int nofofdays = holiday.NoOfDays;
                DateTime startdate = holiday.StartDate;
                while (nofofdays != 0)
                {
                    Calendar holidayupdate = db.Calendars.Where(c => c.Date == startdate && c.Title != "SUNDAY").FirstOrDefault();
                    if(holidayupdate != null)
                    {
                        holidayupdate.Title = holiday.Title;
                        holidayupdate.Description = holiday.Description;
                        holidayupdate.IsHoliday = true;
                        db.Entry(holidayupdate).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                    
                    nofofdays = nofofdays - 1;
                    startdate = startdate.AddDays(+1);
                }               

                ModelState.Clear();
               
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }
            data.message = "/Holiday/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /Holiday/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Calendar holiday = db.Calendars.Find(id);
            int cnt = db.Calendars.Where(c => c.Title == holiday.Title && c.Date >= holiday.Date).Count();
            if (holiday == null)
            {
                return HttpNotFound();
            }
            HolidayModel holidaymodel = new HolidayModel();
            holidaymodel.CalendarID = holiday.CalendarID;
            holidaymodel.Title = holiday.Title;
            holidaymodel.Description = holiday.Description;
            holidaymodel.StartDate = holiday.Date;
            holidaymodel.NoOfDays = cnt;
            ViewBag.Existing = holiday.Date.Year + "-" + holiday.Date.Month + "-" + holiday.Date.Day + holiday.Title;           
            return View(holidaymodel);
        }

        // POST: /Holiday/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CalendarID,Title,Description,StartDate,NoOfDays")] HolidayModel holiday, string existing)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                string compareexist = holiday.StartDate.Year + "-" + holiday.StartDate.Month + "-" + holiday.StartDate.Day;
                if (compareexist + holiday.Title != existing)
                {
                    Calendar holidayexisting = db.Calendars.Where(c => c.Date == holiday.StartDate && c.Title == holiday.Title).FirstOrDefault();
                    if (holidayexisting != null)
                    {
                        Session["err"] = "Holiday title already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(holiday);
                    }
                }

                int nofofdays = holiday.NoOfDays;
                DateTime startdate = holiday.StartDate;
                while (nofofdays != 0)
                {
                    Calendar holidayupdate = db.Calendars.Where(c => c.Date == startdate && c.Title != "SUNDAY").FirstOrDefault();
                    if (holidayupdate != null)
                    {
                        holidayupdate.Title = holiday.Title;
                        holidayupdate.Description = holiday.Description;
                        holidayupdate.IsHoliday = true;
                        db.Entry(holidayupdate).State = EntityState.Modified;
                        db.SaveChanges();
                    }

                    nofofdays = nofofdays - 1;
                    startdate = startdate.AddDays(+1);
                }

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index");
            }
            ViewBag.Existing = existing;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(holiday);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Calendar holiday = db.Calendars.Find(id);
                DateTime startdate = holiday.Date;
                int nofofdays = db.Calendars.Where(c => c.Title == holiday.Title && c.Date >= startdate && c.Title != "SUNDAY").Count();
                while (nofofdays != 0)
                {
                    if(holiday.Title != "SUNDAY")
                    {
                        holiday.Title = "";
                        holiday.Description = "";
                        holiday.IsHoliday = false;
                        db.Entry(holiday).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                   
                    nofofdays = nofofdays - 1;
                    startdate = startdate.AddDays(+1);
                }
                    

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

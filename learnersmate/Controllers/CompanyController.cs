using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using learnersmate.Models;
using Microsoft.Owin.Security;
using System.Globalization;
using System.IO;
using learnersmate.Context;
using learnersmate.Filters;
namespace learnersmate.Controllers
{  
    [SessionCheck]
    public class CompanyController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /Company/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var companys = db.Companys.Include(c => c.CurrentCity).Include(c => c.CurrentCountry).Include(c => c.CurrentCurrency);
            return View(companys.ToList());
        }
        // GET: /Company/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = db.Companys.Find(1);
            if (company == null)
            {
                return HttpNotFound();
            }
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name");
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name");
            ViewBag.CurrencyID = new SelectList(db.Currencys, "CurrencyID", "Name");
            return View(company);
        }

        // GET: /Company/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = db.Companys.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name", company.CityID);
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", company.CountryID);
            ViewBag.CurrencyID = new SelectList(db.Currencys, "CurrencyID", "Name", company.CurrencyID);
            return View(company);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CompanyID,Name,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Email,Website,RegNo,CurrencyID,DefaultLanguage,AcademicYearID,Logo")] Company company, HttpPostedFileBase uploadLogo, string newlogo)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (company.Name != "")
            {
                //string newfilename = Guid.NewGuid().ToString();
                //string logopath = company.Logo;
                //if (uploadLogo != null)
                //{
                //    var fileName = Path.GetFileName(uploadLogo.FileName);
                //    var extention = Path.GetExtension(uploadLogo.FileName);
                //    var filenamewithoutextension = Path.GetFileNameWithoutExtension(uploadLogo.FileName);
                //    try
                //    {
                //        uploadLogo.SaveAs(Server.MapPath("/Uploads/" + newfilename + "." + extention));
                //        logopath = "/Uploads/" + newfilename + "." + extention;
                //        company.Logo = logopath;
                //    }
                //    catch { }

                //}
                
                try {

                    if (newlogo != "")
                    {
                        company.Logo = newlogo;
                    }
                    db.Entry(company).State = EntityState.Modified;
                    db.SaveChanges();

                    Session["err"] = "";
                    Session["msg"] = "Modified Successfully";
                }
                catch {
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
            }

            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name", company.CityID);
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", company.CountryID);
            ViewBag.CurrencyID = new SelectList(db.Currencys, "CurrencyID", "Name", company.CurrencyID);

            data.message = "/Company/Edit/1";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult _CityPartial(int? id)
        {
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name", id);
            return PartialView();
        }

        public ActionResult _CountryPartial(int? id)
        {
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", id);
            return PartialView();
        }

        public ActionResult _CurrencyPartial(int? id)
        {
            ViewBag.CurrencyID = new SelectList(db.Currencys, "CurrencyID", "Name", id);
            return PartialView();
        }
        public ActionResult Upload()
        {
            errordata data = new errordata();
            data.type = "error";
            try
            {
                string filename = Guid.NewGuid().ToString();
                var file = Request.Files[0];
                //var fileName = Path.GetFileName(file.FileName);
                var extention = Path.GetExtension(file.FileName);
                //var filenamewithoutextension = Path.GetFileNameWithoutExtension(file.FileName);
                file.SaveAs(Server.MapPath("/Uploads/" + filename + "" + extention + ""));
                data.message = "/Uploads/" + filename + "" + extention + "";
                data.type = "success";
                return Json(data, JsonRequestBehavior.AllowGet);

                //for (int i = 0; i < Request.Files.Count; i++)
                //{
                    
                //}
            }
            catch
            {
                data.message = "Can't upload file, please contact support";
            }
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

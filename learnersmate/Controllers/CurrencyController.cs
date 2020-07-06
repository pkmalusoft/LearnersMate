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
    public class CurrencyController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
       
        // GET: /Currency/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var currency = db.Currencys.Include(c => c.CurrentCountry).OrderByDescending(t => t.CurrencyID).ToList();
            return View(currency.ToList());
        }
        
        public ActionResult _Create()
        {
			ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name");
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "CurrencyID,Name,Symbol,NoOfDecimals,MonetaryUnit,CountryID,StatusBaseCurrency,ExchangeRate")] Currency currency)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                Currency exist = db.Currencys.Where(c => c.Name == currency.Name).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Currency name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.Currencys.Add(currency);
                db.SaveChanges();
              
                Session["err"] = "";
                Session["msg"] = "Created Successfully";               
            }           
			
            data.message = "/Currency/Index";
            data.type = "success";
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", currency.CountryID);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "CurrencyID,Name,Symbol,NoOfDecimals,MonetaryUnit,CountryID,StatusBaseCurrency,ExchangeRate")] Currency currency, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";           
            if (ModelState.IsValid)
            {
                Currency exist = db.Currencys.Where(c => c.Name == currency.Name).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Currency name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Currencys.Add(currency);
                db.SaveChanges();

                ModelState.Clear();
             
                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_CurrencyPartial", frompage, new { id = currency.CurrencyID });
            }

            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", currency.CountryID);
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }

        // GET: /Currency/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Currency currency = db.Currencys.Find(id);
            if (currency == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = currency.Name;
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", currency.CountryID);
            return View(currency);
        }

        // POST: /Currency/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="CurrencyID,Name,Symbol,NoOfDecimals,MonetaryUnit,CountryID,StatusBaseCurrency,ExchangeRate")] Currency currency, string existing)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (currency.Name != existing)
                {
                    Currency exist= db.Currencys.Where(s => s.Name == currency.Name).FirstOrDefault();
                    if (exist != null)
                    {
                        Session["err"] = "Currency name already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(currency);
                    }
                }
                db.Entry(currency).State = EntityState.Modified;
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
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", currency.CountryID);
            return View(currency);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Currency currency = db.Currencys.Find(id);
                db.Currencys.Remove(currency);
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

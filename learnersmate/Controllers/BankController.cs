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
    public class BankController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /Bank/       
        public ActionResult Index()
        {            
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var bank = db.Banks.OrderByDescending(t => t.BankID).ToList();
            return View(bank);
        }
        public ActionResult GetPdfList()
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("Bank", "BankPrint").Replace("GetPdfList", "Index"));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "BankList.pdf";
            return fileResult;

        }

        public ActionResult _Create()
        {
            return PartialView();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "BankID,Name")] Bank bank)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                Bank exist = db.Banks.Where(c => c.Name == bank.Name).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Bank name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.Banks.Add(bank);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
            }
            data.message = "/Bank/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }       

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "BankID,Name")] Bank bank, string frompage)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                Bank exist = db.Banks.Where(c => c.Name == bank.Name).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Bank name already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.Banks.Add(bank);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
                return RedirectToAction("_BankPartial", frompage, new { id = bank.BankID });
            }
            data.message = Session["err"].ToString();
            return Json(data, JsonRequestBehavior.AllowGet);

        }

        // GET: /Bank/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bank bank = db.Banks.Find(id);
            if (bank == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = bank.Name;
            return View(bank);
        }

        // POST: /Bank/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="BankID,Name")] Bank bank, string existing)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (bank.Name != existing)
                {
                    Bank exist = db.Banks.Where(c => c.Name == bank.Name && c.Name != existing).FirstOrDefault();
                    if (exist != null)
                    {
                        Session["err"] = "City name already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(bank);
                    }
                }

                db.Entry(bank).State = EntityState.Modified;
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
            return View(bank);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Bank bank = db.Banks.Find(id);
                db.Banks.Remove(bank);
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

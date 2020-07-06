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
using learnersmate.Context;
using learnersmate.Filters;
namespace learnersmate.Controllers
{
    [SessionCheck]
    public class PurchaseInvoiceController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /PurchaseInvoice/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var purchaseinvoices = db.PurchaseInvoices.Include(p => p.CurrentCurrency).Include(p => p.CurrentDiscountType).Include(p => p.CurrentEmployee).Include(p => p.CurrentSupplier).Where(p => p.Flag == true);
            return View(purchaseinvoices.ToList());
        }
        public JsonResult GetExchangeRate(int id)
        {
            Currency currency = db.Currencys.Find(id);
            return Json(currency.ExchangeRate, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult CreateNewPurchaseInvoiceDetail(List<tempPurchaseInvoiceDetail> purchaseInvoiceDetailList, List<tempPurchaseInvoice> purchaseInvoiceList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            int purchaseinvoiceid = 0;
            try
            {

                foreach (tempPurchaseInvoiceDetail t in purchaseInvoiceDetailList.ToList())
                {
                    purchaseinvoiceid = t.purchaseinvoiceid;
                    if (t.Quantity > 0)
                    {
                        try
                        {
                            PurchaseInvoiceDetail purchaseinvoicedetail = db.PurchaseInvoiceDetails.Find(t.purchaseinvoicedetailid);
                            if (purchaseinvoicedetail == null)
                            {

                                PurchaseInvoiceDetail purchaseinvoicedetail1 = new PurchaseInvoiceDetail();
                                purchaseinvoicedetail1.Description = t.Description;
                                purchaseinvoicedetail1.PurchaseInvoiceID = t.purchaseinvoiceid;
                                purchaseinvoicedetail1.Quantity = t.Quantity;
                                purchaseinvoicedetail1.PurchaseInvoiceDetailUnit = t.purchaseinvoicedetailunit;
                                purchaseinvoicedetail1.Rate = decimal.Round(Convert.ToDecimal(t.Rate.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail1.RateFC = decimal.Round(Convert.ToDecimal(t.Ratefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail1.DetailValue = decimal.Round(Convert.ToDecimal(t.DetailValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail1.DetailValueFC = decimal.Round(Convert.ToDecimal(t.DetailValuefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail1.Tax = t.Tax;
                                purchaseinvoicedetail1.NetValue = decimal.Round(Convert.ToDecimal(t.NetValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail1.AccountHeadID = t.accountheadid;
                                purchaseinvoicedetail1.DetailJob = t.DetailJob;
                                purchaseinvoicedetail1.ProductsServices = t.ProductsServices;
                                purchaseinvoicedetail1.Flag = false;
                                db.PurchaseInvoiceDetails.Add(purchaseinvoicedetail1);
                                db.SaveChanges();
                            }
                            else
                            {
                                purchaseinvoicedetail.Description = t.Description;
                                purchaseinvoicedetail.PurchaseInvoiceID = t.purchaseinvoiceid;
                                purchaseinvoicedetail.Quantity = t.Quantity;
                                purchaseinvoicedetail.PurchaseInvoiceDetailUnit = t.purchaseinvoicedetailunit;
                                purchaseinvoicedetail.Rate = decimal.Round(Convert.ToDecimal(t.Rate.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail.RateFC = decimal.Round(Convert.ToDecimal(t.Ratefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                t.DetailValue = t.Quantity * t.Rate;
                                t.DetailValuefc = t.Quantity * t.Ratefc;
                                purchaseinvoicedetail.DetailValue = decimal.Round(Convert.ToDecimal(t.DetailValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail.DetailValueFC = decimal.Round(Convert.ToDecimal(t.DetailValuefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail.Tax = t.Tax;
                                t.NetValue = t.DetailValue - (t.DetailValue * t.Tax) / 100;
                                purchaseinvoicedetail.NetValue = decimal.Round(Convert.ToDecimal(t.NetValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                purchaseinvoicedetail.AccountHeadID = t.accountheadid;
                                purchaseinvoicedetail.DetailJob = t.DetailJob;
                                purchaseinvoicedetail.ProductsServices = t.ProductsServices;
                                db.Entry(purchaseinvoicedetail).State = EntityState.Modified;
                                db.SaveChanges();
                            }

                            purchaseinvoiceid = t.purchaseinvoiceid;
                            decimal totalamt = 0;
                            try
                            {
                                totalamt = db.PurchaseInvoiceDetails.Where(u => u.PurchaseInvoiceID == purchaseinvoiceid).Sum(u => (decimal)u.NetValue);
                                PurchaseInvoice purchaseinvoice = db.PurchaseInvoices.Find(t.purchaseinvoiceid);
                                purchaseinvoice.GrossTotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                                db.Entry(purchaseinvoice).State = EntityState.Modified;
                                db.SaveChanges();
                            }
                            catch { }

                        }
                        catch { }
                    }
                }
            }
            catch { }


            try
            {
                decimal totalamtfinal = 0;
                try { totalamtfinal = db.PurchaseInvoiceDetails.Where(u => u.PurchaseInvoiceID == purchaseinvoiceid).Sum(u => (decimal)u.NetValue); }
                catch
                {
                }
                foreach (tempPurchaseInvoice bv in purchaseInvoiceList.ToList())
                {
                    purchaseinvoiceid = bv.purchaseinvoiceid;
                    PurchaseInvoice purchaseinvoicefinal = db.PurchaseInvoices.Find(bv.purchaseinvoiceid);
                    purchaseinvoicefinal.InvoiceNo = "PI-" + purchaseinvoiceid.ToString("D" + 6);
                    purchaseinvoicefinal.InvoiceDate = bv.invoicedate;
                    purchaseinvoicefinal.SupplierID = bv.supplierid;
                    purchaseinvoicefinal.ExternalReference = bv.externalreference;
                    purchaseinvoicefinal.QuotationNoDate = bv.quotationnodate;
                    purchaseinvoicefinal.LPONoDate = bv.lponodate;
                    purchaseinvoicefinal.CurrencyID = bv.currencyid;
                    purchaseinvoicefinal.EmployeeID = bv.employeeid;
                    //if (totalamtfinal > 0)
                    //{
                    //    purchaseinvoicefinal.GrossTotalAmount = decimal.Round(Convert.ToDecimal(totalamtfinal.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    //}
                    //purchaseinvoicefinal.DiscountTypeID = bv.discounttypeid;
                    //purchaseinvoicefinal.VatAmount = decimal.Round(Convert.ToDecimal(bv.vatamount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    //if (bv.discounttypeid == 1)
                    //{
                    //    purchaseinvoicefinal.Discount = bv.discount;
                    //}
                    //else
                    //{
                    //    decimal discountpercentagecalc = (purchaseinvoicefinal.GrossTotalAmount * bv.discount) / 100;
                    //    purchaseinvoicefinal.Discount = decimal.Round(Convert.ToDecimal(discountpercentagecalc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    //}
                    //purchaseinvoicefinal.NetTotalAmount = decimal.Round(Convert.ToDecimal((purchaseinvoicefinal.GrossTotalAmount - purchaseinvoicefinal.Discount - bv.vatamount).ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    //purchaseinvoicefinal.Remarks = bv.remarks;                    
                    db.Entry(purchaseinvoicefinal).State = EntityState.Modified;
                    db.SaveChanges();

                }
                PurchaseInvoiceDetail purchaseinvoicedetail = new PurchaseInvoiceDetail();
                purchaseinvoicedetail.Description = "-";
                purchaseinvoicedetail.PurchaseInvoiceID = purchaseinvoiceid;
                purchaseinvoicedetail.Quantity = 0;
                purchaseinvoicedetail.PurchaseInvoiceDetailUnit = 0;
                purchaseinvoicedetail.Rate = 0.00M;
                purchaseinvoicedetail.RateFC = 0.00M;
                purchaseinvoicedetail.DetailValue = 0.00M;
                purchaseinvoicedetail.DetailValueFC = 0.00M;
                purchaseinvoicedetail.Tax = 0;
                purchaseinvoicedetail.NetValue = 0.00M;
                purchaseinvoicedetail.AccountHeadID = 1;
                purchaseinvoicedetail.DetailJob = "";
                purchaseinvoicedetail.ProductsServices = "";
                purchaseinvoicedetail.Flag = false;
                db.PurchaseInvoiceDetails.Add(purchaseinvoicedetail);
                db.SaveChanges();

                Session["msg"] = "Created Successfully";
                Session["err"] = "";
            }
            catch
            {
            }

            return RedirectToAction("CreateNew", "PurchaseInvoice", new { id = purchaseinvoiceid });

        }
        public ActionResult CreateNew(int id)
        {
            var purchaseinvoice = db.PurchaseInvoices.Where(b => b.PurchaseInvoiceID == id).ToList();
            var purchaseinvoicedetail = db.PurchaseInvoiceDetails.Where(b => b.PurchaseInvoiceID == id).ToList();
            if (purchaseinvoicedetail.Count == 0)
            {
                PurchaseInvoiceDetail purchaseinvoicedetailnew = new PurchaseInvoiceDetail();
                purchaseinvoicedetailnew.Description = "-";
                purchaseinvoicedetailnew.PurchaseInvoiceID = id;
                purchaseinvoicedetailnew.Quantity = 0;
                purchaseinvoicedetailnew.PurchaseInvoiceDetailUnit = 0;
                purchaseinvoicedetailnew.Rate = 0.00M;
                purchaseinvoicedetailnew.RateFC = 0.00M;
                purchaseinvoicedetailnew.DetailValue = 0.00M;
                purchaseinvoicedetailnew.DetailValueFC = 0.00M;
                purchaseinvoicedetailnew.Tax = 0;
                purchaseinvoicedetailnew.NetValue = 0.00M;
                purchaseinvoicedetailnew.AccountHeadID = 1;
                purchaseinvoicedetailnew.DetailJob = "";
                purchaseinvoicedetailnew.ProductsServices = "";
                purchaseinvoicedetailnew.Flag = false;
                db.PurchaseInvoiceDetails.Add(purchaseinvoicedetailnew);
                db.SaveChanges();
                ViewBag.SingleRow = "1";
            }
            PurchaseInvoicePurchaseInvoiceDetailPurchaseInvoiceDetailAllocationModel multiModel = new PurchaseInvoicePurchaseInvoiceDetailPurchaseInvoiceDetailAllocationModel();
            multiModel.PurchaseInvoices = purchaseinvoice;
            multiModel.PurchaseInvoiceDetails = purchaseinvoicedetail;

            foreach (PurchaseInvoice bv in purchaseinvoice)
            {
                ViewBag.EmployeeID = new SelectList(db.Employees.Where(e => e.EmployeeID > 1), "EmployeeID", "Name", bv.EmployeeID);
                ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "Name", bv.SupplierID);
                ViewBag.CurrencyID = new SelectList(db.Currencys, "CurrencyID", "Name", bv.CurrencyID);
                ViewBag.DiscountTypeID = new SelectList(db.DiscountTypes, "DiscountTypeID", "Name", bv.DiscountTypeID);
                var currencyexchangerate = db.Currencys.Where(c => c.CurrencyID == bv.CurrencyID).ToList();
                foreach (Currency c in currencyexchangerate)
                {
                    ViewBag.ExchangeRate = c.ExchangeRate;
                }
            }

            ViewBag.AccountHeads = db.AccountHeads.OrderBy(a => a.Name);

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.Message1 = Session["msg1"];
            Session["msg1"] = "";
            ViewBag.PageType = "CreateNew";
            return View(multiModel);
        }

        [HttpPost]
        public ActionResult CreateNew(List<tempPurchaseInvoiceDetail> purchaseInvoiceDetailList, List<tempPurchaseInvoice> purchaseInvoiceList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            int purchaseinvoiceid = 0;
            foreach (tempPurchaseInvoiceDetail t in purchaseInvoiceDetailList.ToList())
            {
                purchaseinvoiceid = t.purchaseinvoiceid;
                if (t.Quantity > 0)
                {
                    try
                    {
                        PurchaseInvoiceDetail purchaseinvoicedetail = db.PurchaseInvoiceDetails.Find(t.purchaseinvoicedetailid);
                        if (purchaseinvoicedetail == null)
                        {

                            PurchaseInvoiceDetail purchaseinvoicedetail1 = new PurchaseInvoiceDetail();
                            purchaseinvoicedetail1.Description = t.Description;
                            purchaseinvoicedetail1.PurchaseInvoiceID = t.purchaseinvoiceid;
                            purchaseinvoicedetail1.Quantity = t.Quantity;
                            purchaseinvoicedetail1.PurchaseInvoiceDetailUnit = t.purchaseinvoicedetailunit;
                            purchaseinvoicedetail1.Rate = decimal.Round(Convert.ToDecimal(t.Rate.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.RateFC = decimal.Round(Convert.ToDecimal(t.Ratefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.DetailValue = decimal.Round(Convert.ToDecimal(t.DetailValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.DetailValueFC = decimal.Round(Convert.ToDecimal(t.DetailValuefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.Tax = t.Tax;
                            purchaseinvoicedetail1.NetValue = decimal.Round(Convert.ToDecimal(t.NetValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.AccountHeadID = t.accountheadid;
                            purchaseinvoicedetail1.DetailJob = t.DetailJob;
                            purchaseinvoicedetail1.ProductsServices = t.ProductsServices;
                            purchaseinvoicedetail1.Flag = true;
                            db.PurchaseInvoiceDetails.Add(purchaseinvoicedetail1);
                            db.SaveChanges();
                        }
                        else
                        {
                            purchaseinvoicedetail.Description = t.Description;
                            purchaseinvoicedetail.PurchaseInvoiceID = t.purchaseinvoiceid;
                            purchaseinvoicedetail.Quantity = t.Quantity;
                            purchaseinvoicedetail.PurchaseInvoiceDetailUnit = t.purchaseinvoicedetailunit;
                            purchaseinvoicedetail.Rate = decimal.Round(Convert.ToDecimal(t.Rate.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail.RateFC = decimal.Round(Convert.ToDecimal(t.Ratefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            t.DetailValue = t.Quantity * t.Rate;
                            t.DetailValuefc = t.Quantity * t.Ratefc;
                            purchaseinvoicedetail.DetailValue = decimal.Round(Convert.ToDecimal(t.DetailValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail.DetailValueFC = decimal.Round(Convert.ToDecimal(t.DetailValuefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail.Tax = t.Tax;
                            t.NetValue = t.DetailValue - (t.DetailValue * t.Tax) / 100;
                            purchaseinvoicedetail.NetValue = decimal.Round(Convert.ToDecimal(t.NetValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail.AccountHeadID = t.accountheadid;
                            purchaseinvoicedetail.DetailJob = t.DetailJob;
                            purchaseinvoicedetail.ProductsServices = t.ProductsServices;
                            db.Entry(purchaseinvoicedetail).State = EntityState.Modified;
                            db.SaveChanges();
                        }

                        purchaseinvoiceid = t.purchaseinvoiceid;
                        decimal totalamt = 0;
                        try
                        {
                            totalamt = db.PurchaseInvoiceDetails.Where(u => u.PurchaseInvoiceID == purchaseinvoiceid).Sum(u => (decimal)u.NetValue);
                            PurchaseInvoice purchaseinvoice = db.PurchaseInvoices.Find(t.purchaseinvoiceid);
                            purchaseinvoice.GrossTotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            db.Entry(purchaseinvoice).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                        catch { }

                    }
                    catch { }
                }
            }

            try
            {
                decimal totalamtfinal = 0;
                try { totalamtfinal = db.PurchaseInvoiceDetails.Where(u => u.PurchaseInvoiceID == purchaseinvoiceid).Sum(u => (decimal)u.NetValue); }
                catch
                {
                }
                foreach (tempPurchaseInvoice bv in purchaseInvoiceList.ToList())
                {
                    PurchaseInvoice purchaseinvoicefinal = db.PurchaseInvoices.Find(bv.purchaseinvoiceid);
                    purchaseinvoicefinal.InvoiceNo = "PI-" + purchaseinvoiceid.ToString("D" + 6);
                    purchaseinvoicefinal.InvoiceDate = bv.invoicedate;
                    purchaseinvoicefinal.SupplierID = bv.supplierid;
                    purchaseinvoicefinal.ExternalReference = bv.externalreference;
                    purchaseinvoicefinal.QuotationNoDate = bv.quotationnodate;
                    purchaseinvoicefinal.LPONoDate = bv.lponodate;
                    purchaseinvoicefinal.CurrencyID = bv.currencyid;
                    purchaseinvoicefinal.EmployeeID = bv.employeeid;
                    if (totalamtfinal > 0)
                    {
                        purchaseinvoicefinal.GrossTotalAmount = decimal.Round(Convert.ToDecimal(totalamtfinal.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    }
                    else
                    {
                        purchaseinvoicefinal.GrossTotalAmount = 0.00M;
                    }
                    purchaseinvoicefinal.DiscountTypeID = bv.discounttypeid;
                    if (bv.vatamount > 0)
                    {
                        purchaseinvoicefinal.VatAmount = decimal.Round(Convert.ToDecimal(bv.vatamount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    }
                    else
                    {
                        purchaseinvoicefinal.VatAmount = 0.00M;
                    }

                    if (bv.discounttypeid == 1)
                    {
                        purchaseinvoicefinal.Discount = bv.discount;
                    }
                    else
                    {
                        decimal discountpercentagecalc = (purchaseinvoicefinal.GrossTotalAmount * bv.discount) / 100;
                        if (discountpercentagecalc > 0)
                        {
                            purchaseinvoicefinal.Discount = decimal.Round(Convert.ToDecimal(discountpercentagecalc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                        }
                        else
                        {
                            purchaseinvoicefinal.Discount = 0.00M;
                        }

                    }
                    if (purchaseinvoicefinal.GrossTotalAmount > 0)
                    {
                        purchaseinvoicefinal.NetTotalAmount = decimal.Round(Convert.ToDecimal((purchaseinvoicefinal.GrossTotalAmount - purchaseinvoicefinal.Discount - bv.vatamount).ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    }
                    else
                    {
                        purchaseinvoicefinal.NetTotalAmount = 0.00M;
                    }
                    purchaseinvoicefinal.Remarks = bv.remarks;
                    purchaseinvoicefinal.Flag = true;
                    db.Entry(purchaseinvoicefinal).State = EntityState.Modified;
                    db.SaveChanges();

                    var purchaseinvoicedetailfinal = db.PurchaseInvoiceDetails.Where(b => b.PurchaseInvoiceID == purchaseinvoiceid).OrderBy(p => p.PurchaseInvoiceDetailID).Skip(1).ToList();
                    foreach (PurchaseInvoiceDetail bvd in purchaseinvoicedetailfinal)
                    {
                        if (bvd.NetValue == 0)
                        {
                            db.PurchaseInvoiceDetails.Remove(bvd);
                            db.SaveChanges();
                        }
                    }
                    Session["msg"] = "Created Successfully";
                    Session["err"] = "";
                }
            }
            catch
            {

            }
            return Json(Session["err"], JsonRequestBehavior.AllowGet);
        }

        // GET: /PurchaseInvoice/Create
        [SessionCreate]
        public ActionResult Create()
        {
            PurchaseInvoice purchaseinvoice = new PurchaseInvoice();
            purchaseinvoice.InvoiceNo = "PI-";
            purchaseinvoice.InvoiceDate = DateTime.Now;
            purchaseinvoice.SupplierID = 0;
            purchaseinvoice.ExternalReference = "";
            purchaseinvoice.QuotationNoDate = "";
            purchaseinvoice.LPONoDate = "";
            purchaseinvoice.CurrencyID = 1;
            purchaseinvoice.EmployeeID = 1;
            purchaseinvoice.GrossTotalAmount = 0.00M;
            purchaseinvoice.DiscountTypeID = 1;
            purchaseinvoice.VatAmount = 0.00M;
            purchaseinvoice.Discount = 0.00M;
            purchaseinvoice.NetTotalAmount = 0.00M;
            purchaseinvoice.Remarks = "";
            purchaseinvoice.Flag = true;
            db.PurchaseInvoices.Add(purchaseinvoice);
            db.SaveChanges();
            purchaseinvoice.InvoiceNo = "PI-" + purchaseinvoice.PurchaseInvoiceID.ToString("D" + 6);
            db.Entry(purchaseinvoice).State = EntityState.Modified;
            db.SaveChanges();

            PurchaseInvoiceDetail purchaseinvoicedetail = new PurchaseInvoiceDetail();
            purchaseinvoicedetail.Description = "-";
            purchaseinvoicedetail.PurchaseInvoiceID = purchaseinvoice.PurchaseInvoiceID;
            purchaseinvoicedetail.Quantity = 0;
            purchaseinvoicedetail.PurchaseInvoiceDetailUnit = 0;
            purchaseinvoicedetail.Rate = 0.00M;
            purchaseinvoicedetail.RateFC = 0.00M;
            purchaseinvoicedetail.DetailValue = 0.00M;
            purchaseinvoicedetail.DetailValueFC = 0.00M;
            purchaseinvoicedetail.Tax = 0;
            purchaseinvoicedetail.NetValue = 0.00M;
            purchaseinvoicedetail.AccountHeadID = 1;
            purchaseinvoicedetail.DetailJob = "";
            purchaseinvoicedetail.ProductsServices = "";
            purchaseinvoicedetail.Flag = false;
            db.PurchaseInvoiceDetails.Add(purchaseinvoicedetail);
            db.SaveChanges();

            return RedirectToAction("CreateNew", new { id = purchaseinvoice.PurchaseInvoiceID });
        }
        [SessionEdit]
        public ActionResult Edit(int id)
        {
            var purchaseinvoice = db.PurchaseInvoices.Where(b => b.PurchaseInvoiceID == id).ToList();
            var purchaseinvoicedetail = db.PurchaseInvoiceDetails.Where(b => b.PurchaseInvoiceID == id).ToList();
            if (purchaseinvoicedetail.Count == 0)
            {
                PurchaseInvoiceDetail purchaseinvoicedetailnew = new PurchaseInvoiceDetail();
                purchaseinvoicedetailnew.Description = "-";
                purchaseinvoicedetailnew.PurchaseInvoiceID = id;
                purchaseinvoicedetailnew.Quantity = 0;
                purchaseinvoicedetailnew.PurchaseInvoiceDetailUnit = 0;
                purchaseinvoicedetailnew.Rate = 0.00M;
                purchaseinvoicedetailnew.RateFC = 0.00M;
                purchaseinvoicedetailnew.DetailValue = 0.00M;
                purchaseinvoicedetailnew.DetailValueFC = 0.00M;
                purchaseinvoicedetailnew.Tax = 0;
                purchaseinvoicedetailnew.NetValue = 0.00M;
                purchaseinvoicedetailnew.AccountHeadID = 1;
                purchaseinvoicedetailnew.DetailJob = "";
                purchaseinvoicedetailnew.ProductsServices = "";
                purchaseinvoicedetailnew.Flag = false;
                db.PurchaseInvoiceDetails.Add(purchaseinvoicedetailnew);
                db.SaveChanges();
            }
            PurchaseInvoicePurchaseInvoiceDetailPurchaseInvoiceDetailAllocationModel multiModel = new PurchaseInvoicePurchaseInvoiceDetailPurchaseInvoiceDetailAllocationModel();
            multiModel.PurchaseInvoices = purchaseinvoice;
            multiModel.PurchaseInvoiceDetails = purchaseinvoicedetail;

            foreach (PurchaseInvoice bv in purchaseinvoice)
            {
                ViewBag.EmployeeID = new SelectList(db.Employees.Where(e => e.EmployeeID > 1), "EmployeeID", "Name", bv.EmployeeID);
                ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "Name", bv.SupplierID);
                ViewBag.CurrencyID = new SelectList(db.Currencys, "CurrencyID", "Name", bv.CurrencyID);
                ViewBag.DiscountTypeID = new SelectList(db.DiscountTypes, "DiscountTypeID", "Name", bv.DiscountTypeID);
                var currencyexchangerate = db.Currencys.Where(c => c.CurrencyID == bv.CurrencyID).ToList();
                foreach (Currency c in currencyexchangerate)
                {
                    ViewBag.ExchangeRate = c.ExchangeRate;
                }
            }

            ViewBag.AccountHeads = db.AccountHeads.OrderBy(a => a.Name);

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.Message1 = Session["msg1"];
            Session["msg1"] = "";
            ViewBag.PageType = "Edit";
            return View(multiModel);
        }

        [HttpPost]
        public ActionResult Edit(List<tempPurchaseInvoiceDetail> purchaseInvoiceDetailList, List<tempPurchaseInvoice> purchaseInvoiceList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            int purchaseinvoiceid = 0;
            foreach (tempPurchaseInvoiceDetail t in purchaseInvoiceDetailList.ToList())
            {
                purchaseinvoiceid = t.purchaseinvoiceid;
                if (t.Quantity > 0)
                {
                    try
                    {
                        PurchaseInvoiceDetail purchaseinvoicedetail = db.PurchaseInvoiceDetails.Find(t.purchaseinvoicedetailid);
                        if (purchaseinvoicedetail == null)
                        {

                            PurchaseInvoiceDetail purchaseinvoicedetail1 = new PurchaseInvoiceDetail();
                            purchaseinvoicedetail1.Description = t.Description;
                            purchaseinvoicedetail1.PurchaseInvoiceID = t.purchaseinvoiceid;
                            purchaseinvoicedetail1.Quantity = t.Quantity;
                            purchaseinvoicedetail1.PurchaseInvoiceDetailUnit = t.purchaseinvoicedetailunit;
                            purchaseinvoicedetail1.Rate = decimal.Round(Convert.ToDecimal(t.Rate.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.RateFC = decimal.Round(Convert.ToDecimal(t.Ratefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.DetailValue = decimal.Round(Convert.ToDecimal(t.DetailValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.DetailValueFC = decimal.Round(Convert.ToDecimal(t.DetailValuefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.Tax = t.Tax;
                            purchaseinvoicedetail1.NetValue = decimal.Round(Convert.ToDecimal(t.NetValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail1.AccountHeadID = t.accountheadid;
                            purchaseinvoicedetail1.DetailJob = t.DetailJob;
                            purchaseinvoicedetail1.ProductsServices = t.ProductsServices;
                            purchaseinvoicedetail1.Flag = true;
                            db.PurchaseInvoiceDetails.Add(purchaseinvoicedetail1);
                            db.SaveChanges();
                        }
                        else
                        {
                            purchaseinvoicedetail.Description = t.Description;
                            purchaseinvoicedetail.PurchaseInvoiceID = t.purchaseinvoiceid;
                            purchaseinvoicedetail.Quantity = t.Quantity;
                            purchaseinvoicedetail.PurchaseInvoiceDetailUnit = t.purchaseinvoicedetailunit;
                            purchaseinvoicedetail.Rate = decimal.Round(Convert.ToDecimal(t.Rate.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail.RateFC = decimal.Round(Convert.ToDecimal(t.Ratefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            t.DetailValue = t.Quantity * t.Rate;
                            t.DetailValuefc = t.Quantity * t.Ratefc;
                            purchaseinvoicedetail.DetailValue = decimal.Round(Convert.ToDecimal(t.DetailValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail.DetailValueFC = decimal.Round(Convert.ToDecimal(t.DetailValuefc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail.Tax = t.Tax;
                            t.NetValue = t.DetailValue - (t.DetailValue * t.Tax) / 100;
                            purchaseinvoicedetail.NetValue = decimal.Round(Convert.ToDecimal(t.NetValue.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            purchaseinvoicedetail.AccountHeadID = t.accountheadid;
                            purchaseinvoicedetail.DetailJob = t.DetailJob;
                            purchaseinvoicedetail.ProductsServices = t.ProductsServices;
                            db.Entry(purchaseinvoicedetail).State = EntityState.Modified;
                            db.SaveChanges();
                        }

                        purchaseinvoiceid = t.purchaseinvoiceid;
                        decimal totalamt = 0;
                        try
                        {
                            totalamt = db.PurchaseInvoiceDetails.Where(u => u.PurchaseInvoiceID == purchaseinvoiceid).Sum(u => (decimal)u.NetValue);
                            PurchaseInvoice purchaseinvoice = db.PurchaseInvoices.Find(t.purchaseinvoiceid);
                            purchaseinvoice.GrossTotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            db.Entry(purchaseinvoice).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                        catch { }

                    }
                    catch { }
                }
            }

            try
            {
                decimal totalamtfinal = 0;
                try { totalamtfinal = db.PurchaseInvoiceDetails.Where(u => u.PurchaseInvoiceID == purchaseinvoiceid).Sum(u => (decimal)u.NetValue); }
                catch
                {
                }
                foreach (tempPurchaseInvoice bv in purchaseInvoiceList.ToList())
                {
                    PurchaseInvoice purchaseinvoicefinal = db.PurchaseInvoices.Find(bv.purchaseinvoiceid);
                    purchaseinvoicefinal.InvoiceNo = "PI-" + purchaseinvoiceid.ToString("D" + 6);
                    purchaseinvoicefinal.InvoiceDate = bv.invoicedate;
                    purchaseinvoicefinal.SupplierID = bv.supplierid;
                    purchaseinvoicefinal.ExternalReference = bv.externalreference;
                    purchaseinvoicefinal.QuotationNoDate = bv.quotationnodate;
                    purchaseinvoicefinal.LPONoDate = bv.lponodate;
                    purchaseinvoicefinal.CurrencyID = bv.currencyid;
                    purchaseinvoicefinal.EmployeeID = bv.employeeid;
                    if (totalamtfinal > 0)
                    {
                        purchaseinvoicefinal.GrossTotalAmount = decimal.Round(Convert.ToDecimal(totalamtfinal.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    }
                    else
                    {
                        purchaseinvoicefinal.GrossTotalAmount = 0.00M;
                    }
                    purchaseinvoicefinal.DiscountTypeID = bv.discounttypeid;
                    if (bv.vatamount > 0)
                    {
                        purchaseinvoicefinal.VatAmount = decimal.Round(Convert.ToDecimal(bv.vatamount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    }
                    else
                    {
                        purchaseinvoicefinal.VatAmount = 0.00M;
                    }

                    if (bv.discounttypeid == 1)
                    {
                        purchaseinvoicefinal.Discount = bv.discount;
                    }
                    else
                    {
                        decimal discountpercentagecalc = (purchaseinvoicefinal.GrossTotalAmount * bv.discount) / 100;
                        if (discountpercentagecalc > 0)
                        {
                            purchaseinvoicefinal.Discount = decimal.Round(Convert.ToDecimal(discountpercentagecalc.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                        }
                        else
                        {
                            purchaseinvoicefinal.Discount = 0.00M;
                        }

                    }
                    if (purchaseinvoicefinal.GrossTotalAmount > 0)
                    {
                        purchaseinvoicefinal.NetTotalAmount = decimal.Round(Convert.ToDecimal((purchaseinvoicefinal.GrossTotalAmount - purchaseinvoicefinal.Discount - bv.vatamount).ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    }
                    else
                    {
                        purchaseinvoicefinal.NetTotalAmount = 0.00M;
                    }
                    purchaseinvoicefinal.Remarks = bv.remarks;
                    purchaseinvoicefinal.Flag = true;
                    db.Entry(purchaseinvoicefinal).State = EntityState.Modified;
                    db.SaveChanges();

                    var purchaseinvoicedetailfinal = db.PurchaseInvoiceDetails.Where(b => b.PurchaseInvoiceID == purchaseinvoiceid).OrderBy(p => p.PurchaseInvoiceDetailID).Skip(1).ToList();
                    foreach (PurchaseInvoiceDetail bvd in purchaseinvoicedetailfinal)
                    {
                        if (bvd.NetValue == 0)
                        {
                            db.PurchaseInvoiceDetails.Remove(bvd);
                            db.SaveChanges();
                        }
                    }
                    Session["msg"] = "Modified Successfully";
                    Session["err"] = "";
                }
            }
            catch
            {

            }
            return Json(Session["err"], JsonRequestBehavior.AllowGet);
        }
        // GET: /PurchaseInvoice/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseInvoice purchaseinvoice = db.PurchaseInvoices.Find(id);
            if (purchaseinvoice == null)
            {
                return HttpNotFound();
            }
            return View(purchaseinvoice);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try
            {
                var bankvouherdetailList = db.PurchaseInvoiceDetails.Where(t => t.PurchaseInvoiceID == id).ToList();
                foreach (PurchaseInvoiceDetail te in bankvouherdetailList)
                {
                    db.PurchaseInvoiceDetails.Remove(te);
                    db.SaveChanges();
                }
                PurchaseInvoice purchaseinvoice = db.PurchaseInvoices.Find(id);
                db.PurchaseInvoices.Remove(purchaseinvoice);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";
            }
            catch { }
            return RedirectToAction("Index");
        }

        public ActionResult DeleteConfirmCreateNew(int id)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            PurchaseInvoiceDetail purchaseinvoicedetail = db.PurchaseInvoiceDetails.Find(id);
            try
            {
                db.PurchaseInvoiceDetails.Remove(purchaseinvoicedetail);
                db.SaveChanges();
                try
                {
                    decimal totalamt = db.PurchaseInvoiceDetails.Where(u => u.PurchaseInvoiceID == purchaseinvoicedetail.PurchaseInvoiceID && purchaseinvoicedetail.Flag == true).Sum(u => (decimal)u.NetValue);

                    PurchaseInvoice purchaseinvoice = db.PurchaseInvoices.Find(purchaseinvoicedetail.PurchaseInvoiceID);
                    purchaseinvoice.GrossTotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    db.Entry(purchaseinvoice).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch { }

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return Redirect("/PurchaseInvoice/CreateNew/" + purchaseinvoicedetail.PurchaseInvoiceID);
        }
        public ActionResult DeleteConfirmEdit(int id)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            PurchaseInvoiceDetail purchaseinvoicedetail = db.PurchaseInvoiceDetails.Find(id);
            try
            {
                db.PurchaseInvoiceDetails.Remove(purchaseinvoicedetail);
                db.SaveChanges();
                try
                {
                    decimal totalamt = db.PurchaseInvoiceDetails.Where(u => u.PurchaseInvoiceID == purchaseinvoicedetail.PurchaseInvoiceID && purchaseinvoicedetail.Flag == true).Sum(u => (decimal)u.NetValue);

                    PurchaseInvoice purchaseinvoice = db.PurchaseInvoices.Find(purchaseinvoicedetail.PurchaseInvoiceID);
                    purchaseinvoice.GrossTotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    db.Entry(purchaseinvoice).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch { }


                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Edit", "PurchaseInvoice", new { id = purchaseinvoicedetail.PurchaseInvoiceID });
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

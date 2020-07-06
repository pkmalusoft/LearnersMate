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
using SelectPdf;
using learnersmate.Context;
using learnersmate.Filters;
namespace learnersmate.Controllers
{
    [SessionCheck]
    public class CashVoucherController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
       
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var cashvouchers = db.CashVouchers.Include(b => b.CurrentEmployee).Include(b => b.CurrentVoucherType).OrderByDescending(b => b.CashVoucherID);
            ViewBag.AccountHeads = db.AccountHeads;
            return View(cashvouchers.ToList());
        }
       
        public ActionResult GetPdfList()
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("CashVoucher", "CashVoucherPrint").Replace("GetPdfList", "Index"));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "CashVoucherList.pdf";
            return fileResult;

        }
        public ActionResult GetPdf(int id)
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("CashVoucher", "CashVoucherPrint").Replace("GetPdf", "Details"));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "CashVoucher.pdf";
            return fileResult;

        }
        [SessionCreate]
        public ActionResult Create()
        {
            CashVoucher cashvoucher = new CashVoucher();
            cashvoucher.VoucherNo = "CRV-";
            cashvoucher.VoucherTypeID = 1;
            cashvoucher.EmployeeID = int.Parse(Session["UserID"].ToString());
            cashvoucher.AccountHeadID = 1;
            cashvoucher.VoucherDate = DateTime.Now;
            cashvoucher.ReferenceNo = "";
            cashvoucher.ReferenceDate = DateTime.Now;
            cashvoucher.Narration = "";
            cashvoucher.TotalAmount = 0.00M;
            cashvoucher.Flag = false;
            db.CashVouchers.Add(cashvoucher);
            db.SaveChanges();
            cashvoucher.VoucherNo = "CRV-" + cashvoucher.CashVoucherID.ToString("D" + 6);
            db.Entry(cashvoucher).State = EntityState.Modified;
            db.SaveChanges();

            CashVoucherDetail cashvoucherdetail = new CashVoucherDetail();           
            cashvoucherdetail.CashVoucherID = cashvoucher.CashVoucherID;
            cashvoucherdetail.AccountHeadID = 1;
            cashvoucherdetail.Amount = 0.00M;
            cashvoucherdetail.Remarks = "";            
            db.CashVoucherDetails.Add(cashvoucherdetail);
            db.SaveChanges();
            Session["Create"] = "1";
            return RedirectToAction("Edit", new { id = cashvoucher.CashVoucherID });
        }
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            var cashvoucher = db.CashVouchers.Where(b => b.CashVoucherID == id).ToList();
            var cashvoucherdetail = db.CashVoucherDetails.Where(b => b.CashVoucherID == id).ToList();
            if (cashvoucherdetail.Count == 0)
            {
                CashVoucherDetail cashvoucherdetail1 = new CashVoucherDetail();               
                cashvoucherdetail1.CashVoucherID = int.Parse(id.ToString());
                cashvoucherdetail1.AccountHeadID = 1;
                cashvoucherdetail1.Amount = 0.00M;
                cashvoucherdetail1.Remarks = "";                
                db.CashVoucherDetails.Add(cashvoucherdetail1);
                db.SaveChanges();
                cashvoucherdetail = db.CashVoucherDetails.Where(b => b.CashVoucherID == id).ToList();
            }
            CashVoucherCashVoucherDetailCashVoucherDetailAllocationModel multiModel = new CashVoucherCashVoucherDetailCashVoucherDetailAllocationModel();
            multiModel.CashVouchers = cashvoucher;
            multiModel.CashVoucherDetails = cashvoucherdetail;

            foreach (CashVoucher bv in cashvoucher)
            {
                ViewBag.AccountHeadID = new SelectList(db.AccountHeads.Include(a => a.CurrentAccountGroup).Where(a => a.CurrentAccountGroup.Name.ToLower() == "cash").OrderBy(a => a.Name), "AccountHeadID", "Name", bv.AccountHeadID);
                ViewBag.AccountHeads = db.AccountHeads.Include(a => a.CurrentAccountGroup).Where(a => a.CurrentAccountGroup.Name.ToLower() == "cash").OrderBy(a => a.Name);
                ViewBag.EmployeeID = new SelectList(db.Employees.Where(e => e.EmployeeID > 1), "EmployeeID", "Name", bv.EmployeeID);
                ViewBag.VoucherTypeID = new SelectList(db.VoucherTypes, "VoucherTypeID", "Name", bv.VoucherTypeID);
            }

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            HttpSessionStateBase session = HttpContext.Session;
            if (session["Create"] != null)
            { ViewBag.PageType = "Create"; }
            else { ViewBag.PageType = "Edit"; }         
            Session["Create"] = null;
            return View(multiModel);
        }

        [HttpPost]
        public ActionResult Edit(List<tempCashVoucherDetail> cashVoucherDetailList, List<tempCashVoucher> cashVoucherList, string create)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            int cashvoucherid = 0;
            foreach (tempCashVoucherDetail t in cashVoucherDetailList.ToList())
            {
                cashvoucherid = t.cashvoucherid;
                if (Convert.ToDecimal(t.amount.Replace(",", "")) > 0)
                {
                    try
                    {  
                        CashVoucherDetail cashvoucherdetail = db.CashVoucherDetails.Find(t.cashvoucherdetailid);
                        if (cashvoucherdetail == null)
                        {
                            CashVoucherDetail cashvoucherdetail1 = new CashVoucherDetail();                           
                            cashvoucherdetail1.CashVoucherID = t.cashvoucherid;
                            cashvoucherdetail1.AccountHeadID = t.accountheadid;
                            cashvoucherdetail1.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",","")), 2, MidpointRounding.AwayFromZero);
                            cashvoucherdetail1.Remarks = t.remarks;                            
                            db.CashVoucherDetails.Add(cashvoucherdetail1);
                            db.SaveChanges();
                        }
                        else
                        {
                            cashvoucherdetail.CashVoucherID = t.cashvoucherid;
                            cashvoucherdetail.AccountHeadID = t.accountheadid;
                            cashvoucherdetail.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",", "")), 2, MidpointRounding.AwayFromZero);
                            cashvoucherdetail.Remarks = t.remarks;
                            db.Entry(cashvoucherdetail).State = EntityState.Modified;
                            db.SaveChanges();
                        }

                        cashvoucherid = t.cashvoucherid;                        

                    }
                    catch { }
                }
            }

            try
            {
                var cashvoucherdetailfinal = db.CashVoucherDetails.Where(b => b.CashVoucherID == cashvoucherid).OrderBy(b => b.CashVoucherDetailID).Skip(1).ToList();
                foreach (CashVoucherDetail cvd in cashvoucherdetailfinal)
                {
                    if (cvd.Amount == 0)
                    {
                        db.CashVoucherDetails.Remove(cvd);
                        db.SaveChanges();
                    }
                }
            }
            catch {}

            

            if (create == "1")
            {               
                try
                {
                    CashVoucherDetail cashvoucherdetail1 = new CashVoucherDetail();
                    cashvoucherdetail1.CashVoucherID = cashvoucherid;
                    cashvoucherdetail1.AccountHeadID = 1;
                    cashvoucherdetail1.Amount = 0.00M;
                    cashvoucherdetail1.Remarks = "";
                    db.CashVoucherDetails.Add(cashvoucherdetail1);
                    db.SaveChanges();
                }
                catch { }
            }
            decimal totalamt = 0;
            try
            {
                totalamt = db.CashVoucherDetails.Where(u => u.CashVoucherID == cashvoucherid).Sum(u => (decimal)u.Amount);
            }
            catch { }
            try {
                
                foreach (tempCashVoucher bv in cashVoucherList.ToList())
                {
                    CashVoucher cashvoucherfinal = db.CashVouchers.Find(bv.cashvoucherid);
                    if (bv.vouchertypeid == 1)
                    {
                        cashvoucherfinal.VoucherNo = "CRV-" + cashvoucherid.ToString("D" + 6);
                    }
                    else
                    {
                        cashvoucherfinal.VoucherNo = "CPV-" + cashvoucherid.ToString("D" + 6);
                    }
                    cashvoucherfinal.VoucherTypeID = bv.vouchertypeid;
                    cashvoucherfinal.EmployeeID = bv.employeeid;
                    cashvoucherfinal.AccountHeadID = bv.accountheadid;
                    cashvoucherfinal.VoucherDate = bv.voucherdate;
                    cashvoucherfinal.ReferenceNo = bv.referenceno;
                    cashvoucherfinal.ReferenceDate = bv.referencedate;
                    cashvoucherfinal.Narration = bv.narration;
                    cashvoucherfinal.TotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    db.Entry(cashvoucherfinal).State = EntityState.Modified;
                    db.SaveChanges();
                    if (create == "0" && cashvoucherfinal.TotalAmount > 0)
                    {
                        cashvoucherfinal.Flag = true;
                        db.Entry(cashvoucherfinal).State = EntityState.Modified;
                        db.SaveChanges();

                        var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == cashvoucherfinal.VoucherNo).ToList();
                        foreach (AccountJournal accountjournal1 in accountjournals)
                        {
                            var accountjournaldetails = db.AccountJournalDetails.Where(a => a.AccountJournalID == accountjournal1.AccountJournalID).ToList();
                            foreach (AccountJournalDetail accountjournaldetail1 in accountjournaldetails)
                            {
                                db.AccountJournalDetails.Remove(accountjournaldetail1);

                            }
                            db.SaveChanges();
                            db.AccountJournals.Remove(accountjournal1);
                        }
                        db.SaveChanges();

                        AccountJournal accountjournal = new AccountJournal();
                        accountjournal.VoucherNo = cashvoucherfinal.VoucherNo;
                        accountjournal.VoucherType = cashvoucherfinal.VoucherNo.Substring(0, 2);
                        accountjournal.TransactionDate = cashvoucherfinal.VoucherDate;
                        accountjournal.BranchID = int.Parse(Session["BranchID"].ToString());
                        accountjournal.FinancialYearID = int.Parse(Session["FinancialYearID"].ToString());
                        accountjournal.UserID = Session["UserID"].ToString();
                        accountjournal.Remarks = "Cash Voucher";
                        db.AccountJournals.Add(accountjournal);
                        db.SaveChanges();

                        var cashvoucherdetail = db.CashVoucherDetails.Where(d => d.CashVoucherID == cashvoucherfinal.CashVoucherID).ToList();
                        int voucheracc = 0;
                        foreach (CashVoucherDetail d in cashvoucherdetail)
                        {                            
                            AccountJournalDetail accountjournaldetail = new AccountJournalDetail();
                            if (voucheracc == 0)
                            {
                                voucheracc = cashvoucherfinal.AccountHeadID;
                                accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                                accountjournaldetail.AccountHeadID = cashvoucherfinal.AccountHeadID;
                                accountjournaldetail.AnalysisHeadID = 0;
                                if (cashvoucherfinal.VoucherTypeID == 1)
                                {
                                    accountjournaldetail.Amount = cashvoucherfinal.TotalAmount * -1;
                                    accountjournaldetail.Remarks = "Cash Voucher Receipt";
                                }else{
                                    accountjournaldetail.Amount = cashvoucherfinal.TotalAmount;
                                    accountjournaldetail.Remarks = "Cash Voucher Payment";
                                }                               
                                
                                db.AccountJournalDetails.Add(accountjournaldetail);
                                db.SaveChanges();   
                            }
                            accountjournaldetail = new AccountJournalDetail();
                            accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                            accountjournaldetail.AccountHeadID = d.AccountHeadID;
                            accountjournaldetail.AnalysisHeadID = 0;
                            if (cashvoucherfinal.VoucherTypeID == 1)
                            {
                                accountjournaldetail.Amount = d.Amount;
                                accountjournaldetail.Remarks = "Cash Voucher Receipt";
                            }
                            else
                            {
                                accountjournaldetail.Amount = d.Amount * -1;
                                accountjournaldetail.Remarks = "Cash Voucher Payment";
                            }                           
                            db.AccountJournalDetails.Add(accountjournaldetail);
                            db.SaveChanges();                            
                        }            
                    }                    
                    
                    Session["msg"] = "Modified Successfully";
                    Session["err"] = "";
                }
            }
            catch {}
            return Json(Session["err"], JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult DeleteAccountJournal(string voucherno)
        {
            try
            {
                var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == voucherno).ToList();
                foreach (AccountJournal accountjournal1 in accountjournals)
                {
                    var accountjournaldetails = db.AccountJournalDetails.Where(a => a.AccountJournalID == accountjournal1.AccountJournalID).ToList();
                    foreach (AccountJournalDetail accountjournaldetail1 in accountjournaldetails)
                    {
                        db.AccountJournalDetails.Remove(accountjournaldetail1);

                    }
                    db.SaveChanges();
                    db.AccountJournals.Remove(accountjournal1);
                }
                db.SaveChanges();
              
            }
            catch { }
            return Json("", JsonRequestBehavior.AllowGet);
        }

                
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CashVoucher cashvoucher = db.CashVouchers.Find(id);
            if (cashvoucher == null)
            {
                return HttpNotFound();
            }
            VoucherType vouchertypemaster = db.VoucherTypes.Find(cashvoucher.VoucherTypeID);
            ViewBag.VoucherTypeID = vouchertypemaster.Name;
            Employee employee = db.Employees.Find(cashvoucher.EmployeeID);
            ViewBag.EmployeeID = employee.Name;
            AccountHead accounthead = db.AccountHeads.Find(cashvoucher.AccountHeadID);
            ViewBag.AccountHeadID = accounthead.Name;
            return View(cashvoucher);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            CashVoucher cashvoucher = db.CashVouchers.Find(id);
            try
            {
                var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == cashvoucher.VoucherNo).ToList();
                foreach (AccountJournal accountjournal1 in accountjournals)
                {
                    var accountjournaldetails = db.AccountJournalDetails.Where(a => a.AccountJournalID == accountjournal1.AccountJournalID).ToList();
                    foreach (AccountJournalDetail accountjournaldetail1 in accountjournaldetails)
                    {
                        db.AccountJournalDetails.Remove(accountjournaldetail1);

                    }
                    db.SaveChanges();
                    db.AccountJournals.Remove(accountjournal1);
                }
                db.SaveChanges();

            }
            catch { }
            try
            {

                var cashVoucherdetail = db.CashVoucherDetails.Where(b => b.CashVoucherID == id).ToList();

                foreach (CashVoucherDetail a in cashVoucherdetail)
                {
                    var cashVoucherdetailallocation = db.CashVoucherDetailAllocations.Where(b => b.CashVoucherDetailID == a.CashVoucherDetailID).ToList();
                    foreach (CashVoucherDetailAllocation b in cashVoucherdetailallocation)
                    {
                        db.CashVoucherDetailAllocations.Remove(b);
                        db.SaveChanges();
                    }
                    db.CashVoucherDetails.Remove(a);
                    db.SaveChanges();
                }

                db.CashVouchers.Remove(cashvoucher);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }
        public ActionResult DeleteDetailConfirm(int id)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            CashVoucherDetail cashvoucherdetail = db.CashVoucherDetails.Find(id);
            try
            {
                var cashVoucherdetailallocation = db.CashVoucherDetailAllocations.Where(b => b.CashVoucherDetailID == id).ToList();
                foreach (CashVoucherDetailAllocation b in cashVoucherdetailallocation)
                {
                    db.CashVoucherDetailAllocations.Remove(b);
                    db.SaveChanges();
                }
                db.CashVoucherDetails.Remove(cashvoucherdetail);
                db.SaveChanges();
                
            }
            catch { }

            try
            {
                decimal totalamt = db.CashVoucherDetails.Where(u => u.CashVoucherID == cashvoucherdetail.CashVoucherID).Sum(u => (decimal)u.Amount);

                CashVoucher cashvoucher = db.CashVouchers.Find(cashvoucherdetail.CashVoucherID);
                cashvoucher.TotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                db.Entry(cashvoucher).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";
            }
            catch { }

           return RedirectToAction("Edit", new { id = cashvoucherdetail.CashVoucherID });
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
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
    public class JournalVoucherController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
       
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var journalvouchers = db.JournalVouchers.Include(b => b.CurrentEmployee).Include(b => b.CurrentVoucherType).OrderByDescending(b => b.JournalVoucherID);
            ViewBag.AccountHeads = db.AccountHeads;
            ViewBag.DebitCredits = db.DebitCredits;
            return View(journalvouchers.ToList());
        }
       
        public ActionResult GetPdfList()
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("JournalVoucher", "JournalVoucherPrint").Replace("GetPdfList", "Index"));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "JournalVoucherList.pdf";
            return fileResult;

        }
        public ActionResult GetPdf(int id)
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("JournalVoucher", "JournalVoucherPrint").Replace("GetPdf", "Details"));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "JournalVoucher.pdf";
            return fileResult;

        }
        [SessionCreate]
        public ActionResult Create()
        {
            JournalVoucher journalvoucher = new JournalVoucher();
            journalvoucher.VoucherNo = "JV-";            
            journalvoucher.VoucherDate = DateTime.Now;          
            journalvoucher.Narration = "";            
            journalvoucher.DebitTotalAmount = 0.00M;
            journalvoucher.CreditTotalAmount = 0.00M;
            journalvoucher.DiffTotalAmount = 0.00M;
            journalvoucher.Flag = false;
            db.JournalVouchers.Add(journalvoucher);
            db.SaveChanges();
            journalvoucher.VoucherNo = "JV-" + journalvoucher.JournalVoucherID.ToString("D" + 6);
            db.Entry(journalvoucher).State = EntityState.Modified;
            db.SaveChanges();

            JournalVoucherDetail journalvoucherdetail = new JournalVoucherDetail();           
            journalvoucherdetail.JournalVoucherID = journalvoucher.JournalVoucherID;
            journalvoucherdetail.AccountHeadID = 1;
            journalvoucherdetail.DebitCreditID = 1;
            journalvoucherdetail.Amount = 0.00M;
            journalvoucherdetail.Remarks = "";            
            db.JournalVoucherDetails.Add(journalvoucherdetail);
            db.SaveChanges();
            Session["Create"] = "1";
            return RedirectToAction("Edit", new { id = journalvoucher.JournalVoucherID });
        }
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            var journalvoucher = db.JournalVouchers.Where(b => b.JournalVoucherID == id).ToList();
            var journalvoucherdetail = db.JournalVoucherDetails.Where(b => b.JournalVoucherID == id).ToList();
            if (journalvoucherdetail.Count == 0)
            {
                JournalVoucherDetail journalvoucherdetail1 = new JournalVoucherDetail();               
                journalvoucherdetail1.JournalVoucherID = int.Parse(id.ToString());
                journalvoucherdetail1.AccountHeadID = 1;
                journalvoucherdetail1.DebitCreditID = 1;
                journalvoucherdetail1.Amount = 0.00M;
                journalvoucherdetail1.Remarks = "";                
                db.JournalVoucherDetails.Add(journalvoucherdetail1);
                db.SaveChanges();
                journalvoucherdetail = db.JournalVoucherDetails.Where(b => b.JournalVoucherID == id).ToList();
            }
            JournalVoucherJournalVoucherDetailJournalVoucherDetailAllocationModel multiModel = new JournalVoucherJournalVoucherDetailJournalVoucherDetailAllocationModel();
            multiModel.JournalVouchers = journalvoucher;
            multiModel.JournalVoucherDetails = journalvoucherdetail;
           
            ViewBag.AccountHeads = db.AccountHeads.OrderBy(a => a.Name);
            ViewBag.DebitCredits = db.DebitCredits;

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
        public ActionResult Edit(List<tempJournalVoucherDetail> journalVoucherDetailList, List<tempJournalVoucher> journalVoucherList, string create)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            int journalvoucherid = 0;
            foreach (tempJournalVoucherDetail t in journalVoucherDetailList.ToList())
            {
                journalvoucherid = t.journalvoucherid;
                 try
                    {  
                        JournalVoucherDetail journalvoucherdetail = db.JournalVoucherDetails.Find(t.journalvoucherdetailid);
                        if (journalvoucherdetail == null)
                        {
                            JournalVoucherDetail journalvoucherdetail1 = new JournalVoucherDetail();                           
                            journalvoucherdetail1.JournalVoucherID = t.journalvoucherid;
                            journalvoucherdetail1.AccountHeadID = t.accountheadid;
                            journalvoucherdetail1.DebitCreditID = t.debitcreditid;
                            journalvoucherdetail1.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",","")), 2, MidpointRounding.AwayFromZero);
                            journalvoucherdetail1.Remarks = t.remarks;                            
                            db.JournalVoucherDetails.Add(journalvoucherdetail1);
                            db.SaveChanges();
                        }
                        else
                        {
                            journalvoucherdetail.JournalVoucherID = t.journalvoucherid;
                            journalvoucherdetail.AccountHeadID = t.accountheadid;
                            journalvoucherdetail.DebitCreditID = t.debitcreditid;
                            if (t.debitcreditid == 1)
                            {
                                journalvoucherdetail.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",", "")), 2, MidpointRounding.AwayFromZero);
                            }
                            else
                            {
                                journalvoucherdetail.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",", "")) * -1, 2, MidpointRounding.AwayFromZero);
                            }
                            
                            journalvoucherdetail.Remarks = t.remarks;
                            db.Entry(journalvoucherdetail).State = EntityState.Modified;
                            db.SaveChanges();
                        }

                        journalvoucherid = t.journalvoucherid;
                        

                    }
                    catch { }
            }            
                        
            try
            {
                var journalvoucherdetailfinal = db.JournalVoucherDetails.Where(b => b.JournalVoucherID == journalvoucherid).OrderBy(b => b.JournalVoucherDetailID).Skip(1).ToList();
                foreach (JournalVoucherDetail cvd in journalvoucherdetailfinal)
                {
                    if (cvd.Amount == 0)
                    {
                        db.JournalVoucherDetails.Remove(cvd);
                        db.SaveChanges();
                    }
                }
            }
            catch {}
        

            if (create == "1")
            {               
                try
                {
                    JournalVoucherDetail journalvoucherdetail1 = new JournalVoucherDetail();
                    journalvoucherdetail1.JournalVoucherID = journalvoucherid;
                    journalvoucherdetail1.AccountHeadID = 1;
                    journalvoucherdetail1.DebitCreditID = 1;
                    journalvoucherdetail1.Amount = 0.00M;
                    journalvoucherdetail1.Remarks = "";
                    db.JournalVoucherDetails.Add(journalvoucherdetail1);
                    db.SaveChanges();
                }
                catch { }
            }

            decimal debittotalamt = 0;
            decimal credittotalamt = 0;
            try
            {
                debittotalamt = db.JournalVoucherDetails.Where(u => u.JournalVoucherID == journalvoucherid).Where(u => u.DebitCreditID == 1).Sum(u => (decimal)u.Amount);
            }
            catch { }
            try
            {
                credittotalamt = db.JournalVoucherDetails.Where(u => u.JournalVoucherID == journalvoucherid).Where(u => u.DebitCreditID == 2).Sum(u => (decimal)u.Amount);

            }
            catch { }
     

            try {
                
                foreach (tempJournalVoucher bv in journalVoucherList.ToList())
                {
                    JournalVoucher journalvoucherfinal = db.JournalVouchers.Find(bv.journalvoucherid);
                    journalvoucherfinal.VoucherNo = "JV-" + journalvoucherid.ToString("D" + 6);
                    journalvoucherfinal.VoucherDate = bv.voucherdate;                    
                    journalvoucherfinal.Narration = bv.narration;
                    journalvoucherfinal.DebitTotalAmount = decimal.Round(Convert.ToDecimal(debittotalamt), 2, MidpointRounding.AwayFromZero);
                    journalvoucherfinal.CreditTotalAmount = decimal.Round(Convert.ToDecimal(credittotalamt), 2, MidpointRounding.AwayFromZero);
                    journalvoucherfinal.DiffTotalAmount = decimal.Round(Convert.ToDecimal((debittotalamt - Convert.ToDecimal(credittotalamt.ToString().Replace("-", "")))), 2, MidpointRounding.AwayFromZero);
                    db.Entry(journalvoucherfinal).State = EntityState.Modified;
                    db.SaveChanges();

                    if (create == "0")
                    {
                        journalvoucherfinal.Flag = true;
                        db.Entry(journalvoucherfinal).State = EntityState.Modified;
                        db.SaveChanges();

                        var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == journalvoucherfinal.VoucherNo).ToList();
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
                        accountjournal.VoucherNo = journalvoucherfinal.VoucherNo;
                        accountjournal.VoucherType = journalvoucherfinal.VoucherNo.Substring(0, 2); 
                        accountjournal.TransactionDate = journalvoucherfinal.VoucherDate;
                        accountjournal.BranchID = int.Parse(Session["BranchID"].ToString());
                        accountjournal.FinancialYearID = int.Parse(Session["FinancialYearID"].ToString());
                        accountjournal.UserID = Session["UserID"].ToString();
                        accountjournal.Remarks = "Journal Voucher";
                        db.AccountJournals.Add(accountjournal);
                        db.SaveChanges();

                        var journalvoucherdetail = db.JournalVoucherDetails.Where(d => d.JournalVoucherID == journalvoucherfinal.JournalVoucherID).ToList();
                       
                        foreach (JournalVoucherDetail d in journalvoucherdetail)
                        {                            
                            AccountJournalDetail accountjournaldetail = new AccountJournalDetail();                         
                            accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                            accountjournaldetail.AccountHeadID = d.AccountHeadID;
                            accountjournaldetail.AnalysisHeadID = 0;
                            if (d.DebitCreditID == 1)
                            {
                                accountjournaldetail.Amount = d.Amount;
                                accountjournaldetail.Remarks = "Journal Voucher Debit";
                            }
                            else
                            {
                                accountjournaldetail.Amount = d.Amount * -1;
                                accountjournaldetail.Remarks = "Journal Voucher Credit";
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
            JournalVoucher journalvoucher = db.JournalVouchers.Find(id);
            if (journalvoucher == null)
            {
                return HttpNotFound();
            }
            
            return View(journalvoucher);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            JournalVoucher journalvoucher = db.JournalVouchers.Find(id);
            try
            {
                var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == journalvoucher.VoucherNo).ToList();
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
                var journalVoucherdetail = db.JournalVoucherDetails.Where(b => b.JournalVoucherID == id).ToList();
                foreach (JournalVoucherDetail a in journalVoucherdetail)
                {
                    var journalVoucherdetailallocation = db.JournalVoucherDetailAllocations.Where(b => b.JournalVoucherDetailID == a.JournalVoucherDetailID).ToList();
                    foreach (JournalVoucherDetailAllocation b in journalVoucherdetailallocation)
                    {
                        db.JournalVoucherDetailAllocations.Remove(b);
                        db.SaveChanges();
                    }
                    db.JournalVoucherDetails.Remove(a);
                    db.SaveChanges();
                }

                db.JournalVouchers.Remove(journalvoucher);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }
        [SessionDelete]
        public ActionResult DeleteDetailConfirm(int id)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            JournalVoucherDetail journalvoucherdetail = db.JournalVoucherDetails.Find(id);
            try
            {
                var journalVoucherdetailallocation = db.JournalVoucherDetailAllocations.Where(b => b.JournalVoucherDetailID == id).ToList();
                foreach (JournalVoucherDetailAllocation b in journalVoucherdetailallocation)
                {
                    db.JournalVoucherDetailAllocations.Remove(b);
                    db.SaveChanges();
                }
                db.JournalVoucherDetails.Remove(journalvoucherdetail);
                db.SaveChanges();
                
            }
            catch { }

            try
            {
                decimal debittotalamt = 0;
                decimal credittotalamt = 0;
                debittotalamt = db.JournalVoucherDetails.Where(u => u.JournalVoucherID == journalvoucherdetail.JournalVoucherID).Where(u => u.DebitCreditID == 1).Sum(u => (decimal)u.Amount);
                credittotalamt = db.JournalVoucherDetails.Where(u => u.JournalVoucherID == journalvoucherdetail.JournalVoucherID).Where(u => u.DebitCreditID == 2).Sum(u => (decimal)u.Amount);
                
                JournalVoucher journalvoucher = db.JournalVouchers.Find(journalvoucherdetail.JournalVoucherID);
                journalvoucher.DebitTotalAmount = decimal.Round(Convert.ToDecimal(debittotalamt), 2, MidpointRounding.AwayFromZero);
                journalvoucher.CreditTotalAmount = decimal.Round(Convert.ToDecimal(credittotalamt), 2, MidpointRounding.AwayFromZero);
                journalvoucher.DiffTotalAmount = decimal.Round(Convert.ToDecimal(debittotalamt - credittotalamt), 2, MidpointRounding.AwayFromZero);
                db.Entry(journalvoucher).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";
            }
            catch { }

           return RedirectToAction("Edit", new { id = journalvoucherdetail.JournalVoucherID });
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
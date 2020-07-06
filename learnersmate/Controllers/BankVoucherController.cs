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
    public class BankVoucherController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
       
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var bankvouchers = db.BankVouchers.Include(b => b.CurrentEmployee).Include(b => b.CurrentVoucherType).OrderByDescending(b => b.BankVoucherID);
            ViewBag.AccountHeads = db.AccountHeads;
            return View(bankvouchers.ToList());
        }
       
        public ActionResult GetPdfList()
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("BankVoucher", "BankVoucherPrint").Replace("GetPdfList", "Index"));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "BankVoucherList.pdf";
            return fileResult;

        }
        public ActionResult GetPdf(int id)
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("BankVoucher", "BankVoucherPrint").Replace("GetPdf", "Details"));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "BankVoucher.pdf";
            return fileResult;

        }
        [SessionCreate]
        public ActionResult Create()
        {
            BankVoucher bankvoucher = new BankVoucher();
            bankvoucher.VoucherNo = "CRV-";
            bankvoucher.VoucherTypeID = 1;
            bankvoucher.EmployeeID = int.Parse(Session["UserID"].ToString());
            bankvoucher.AccountHeadID = 1;
            bankvoucher.VoucherDate = DateTime.Now;
            bankvoucher.ReferenceNo = "";
            bankvoucher.ReferenceDate = DateTime.Now;
            bankvoucher.Narration = "";
            bankvoucher.TotalAmount = 0.00M;
            bankvoucher.Flag = false;
            db.BankVouchers.Add(bankvoucher);
            db.SaveChanges();
            bankvoucher.VoucherNo = "CRV-" + bankvoucher.BankVoucherID.ToString("D" + 6);
            db.Entry(bankvoucher).State = EntityState.Modified;
            db.SaveChanges();

            BankVoucherDetail bankvoucherdetail = new BankVoucherDetail();           
            bankvoucherdetail.BankVoucherID = bankvoucher.BankVoucherID;
            bankvoucherdetail.AccountHeadID = 1;
            bankvoucherdetail.Amount = 0.00M;
            bankvoucherdetail.Remarks = "";            
            db.BankVoucherDetails.Add(bankvoucherdetail);
            db.SaveChanges();
            Session["Create"] = "1";
            return RedirectToAction("Edit", new { id = bankvoucher.BankVoucherID });
        }
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            var bankvoucher = db.BankVouchers.Where(b => b.BankVoucherID == id).ToList();
            var bankvoucherdetail = db.BankVoucherDetails.Where(b => b.BankVoucherID == id).ToList();
            if (bankvoucherdetail.Count == 0)
            {
                BankVoucherDetail bankvoucherdetail1 = new BankVoucherDetail();               
                bankvoucherdetail1.BankVoucherID = int.Parse(id.ToString());
                bankvoucherdetail1.AccountHeadID = 1;
                bankvoucherdetail1.Amount = 0.00M;
                bankvoucherdetail1.Remarks = "";                
                db.BankVoucherDetails.Add(bankvoucherdetail1);
                db.SaveChanges();
                bankvoucherdetail = db.BankVoucherDetails.Where(b => b.BankVoucherID == id).ToList();
            }
            BankVoucherBankVoucherDetailBankVoucherDetailAllocationModel multiModel = new BankVoucherBankVoucherDetailBankVoucherDetailAllocationModel();
            multiModel.BankVouchers = bankvoucher;
            multiModel.BankVoucherDetails = bankvoucherdetail;

            foreach (BankVoucher bv in bankvoucher)
            {
                ViewBag.AccountHeadID = new SelectList(db.AccountHeads.Include(a => a.CurrentAccountGroup).Where(a => a.CurrentAccountGroup.Name.ToLower() == "bank").OrderBy(a => a.Name), "AccountHeadID", "Name", bv.AccountHeadID);
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
        public ActionResult Edit(List<tempBankVoucherDetail> bankVoucherDetailList, List<tempBankVoucher> bankVoucherList, string create)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            int bankvoucherid = 0;
            foreach (tempBankVoucherDetail t in bankVoucherDetailList.ToList())
            {
                bankvoucherid = t.bankvoucherid;
                if (Convert.ToDecimal(t.amount.Replace(",", "")) > 0)
                {
                    try
                    {  
                        BankVoucherDetail bankvoucherdetail = db.BankVoucherDetails.Find(t.bankvoucherdetailid);
                        if (bankvoucherdetail == null)
                        {
                            BankVoucherDetail bankvoucherdetail1 = new BankVoucherDetail();                           
                            bankvoucherdetail1.BankVoucherID = t.bankvoucherid;
                            bankvoucherdetail1.AccountHeadID = t.accountheadid;
                            bankvoucherdetail1.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",","")), 2, MidpointRounding.AwayFromZero);
                            bankvoucherdetail1.Remarks = t.remarks;                            
                            db.BankVoucherDetails.Add(bankvoucherdetail1);
                            db.SaveChanges();
                        }
                        else
                        {
                            bankvoucherdetail.BankVoucherID = t.bankvoucherid;
                            bankvoucherdetail.AccountHeadID = t.accountheadid;
                            bankvoucherdetail.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",", "")), 2, MidpointRounding.AwayFromZero);
                            bankvoucherdetail.Remarks = t.remarks;
                            db.Entry(bankvoucherdetail).State = EntityState.Modified;
                            db.SaveChanges();
                        }

                        bankvoucherid = t.bankvoucherid;
                        

                    }
                    catch { }
                }
            }

            try
            {
                var bankvoucherdetailfinal = db.BankVoucherDetails.Where(b => b.BankVoucherID == bankvoucherid).OrderBy(b => b.BankVoucherDetailID).Skip(1).ToList();
                foreach (BankVoucherDetail cvd in bankvoucherdetailfinal)
                {
                    if (cvd.Amount == 0)
                    {
                        db.BankVoucherDetails.Remove(cvd);
                        db.SaveChanges();
                    }
                }
            }
            catch {}

            if (create == "1")
            {               
                try
                {
                    BankVoucherDetail bankvoucherdetail1 = new BankVoucherDetail();
                    bankvoucherdetail1.BankVoucherID = bankvoucherid;
                    bankvoucherdetail1.AccountHeadID = 1;
                    bankvoucherdetail1.Amount = 0.00M;
                    bankvoucherdetail1.Remarks = "";
                    db.BankVoucherDetails.Add(bankvoucherdetail1);
                    db.SaveChanges();
                }
                catch { }
            }
            decimal totalamt = 0;
            try
            {
                totalamt = db.BankVoucherDetails.Where(u => u.BankVoucherID == bankvoucherid).Sum(u => (decimal)u.Amount);
            }
            catch { }
            try {                
                foreach (tempBankVoucher bv in bankVoucherList.ToList())
                {
                    BankVoucher bankvoucherfinal = db.BankVouchers.Find(bv.bankvoucherid);
                    if (bv.vouchertypeid == 1)
                    {
                        bankvoucherfinal.VoucherNo = "CRV-" + bankvoucherid.ToString("D" + 6);
                    }
                    else
                    {
                        bankvoucherfinal.VoucherNo = "CPV-" + bankvoucherid.ToString("D" + 6);
                    }
                    bankvoucherfinal.VoucherTypeID = bv.vouchertypeid;
                    bankvoucherfinal.EmployeeID = bv.employeeid;
                    bankvoucherfinal.AccountHeadID = bv.accountheadid;
                    bankvoucherfinal.VoucherDate = bv.voucherdate;
                    bankvoucherfinal.ReferenceNo = bv.referenceno;
                    bankvoucherfinal.ReferenceDate = bv.referencedate;
                    bankvoucherfinal.Narration = bv.narration;
                    bankvoucherfinal.TotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    db.Entry(bankvoucherfinal).State = EntityState.Modified;
                    db.SaveChanges();
                    if (create == "0" && bankvoucherfinal.TotalAmount > 0)
                    {
                        bankvoucherfinal.Flag = true;
                        db.Entry(bankvoucherfinal).State = EntityState.Modified;
                        db.SaveChanges();

                        var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == bankvoucherfinal.VoucherNo).ToList();
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
                        accountjournal.VoucherNo = bankvoucherfinal.VoucherNo;
                        accountjournal.VoucherType = bankvoucherfinal.VoucherNo.Substring(0, 2);
                        accountjournal.TransactionDate = bankvoucherfinal.VoucherDate;
                        accountjournal.BranchID = int.Parse(Session["BranchID"].ToString());
                        accountjournal.FinancialYearID = int.Parse(Session["FinancialYearID"].ToString());
                        accountjournal.UserID = Session["UserID"].ToString();
                        accountjournal.Remarks = "Bank Voucher";
                        db.AccountJournals.Add(accountjournal);
                        db.SaveChanges();

                        var bankvoucherdetail = db.BankVoucherDetails.Where(d => d.BankVoucherID == bankvoucherfinal.BankVoucherID).ToList();
                        int voucheracc = 0;
                        foreach (BankVoucherDetail d in bankvoucherdetail)
                        {                            
                            AccountJournalDetail accountjournaldetail = new AccountJournalDetail();
                            if (voucheracc == 0)
                            {
                                voucheracc = bankvoucherfinal.AccountHeadID;
                                accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                                accountjournaldetail.AccountHeadID = bankvoucherfinal.AccountHeadID;
                                accountjournaldetail.AnalysisHeadID = 0;
                                if (bankvoucherfinal.VoucherTypeID == 1)
                                {
                                    accountjournaldetail.Amount = bankvoucherfinal.TotalAmount * -1;
                                    accountjournaldetail.Remarks = "Bank Voucher Receipt";
                                }else{
                                    accountjournaldetail.Amount = bankvoucherfinal.TotalAmount;
                                    accountjournaldetail.Remarks = "Bank Voucher Payment";
                                }                               
                                
                                db.AccountJournalDetails.Add(accountjournaldetail);
                                db.SaveChanges();   
                            }
                            accountjournaldetail = new AccountJournalDetail();
                            accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                            accountjournaldetail.AccountHeadID = d.AccountHeadID;
                            accountjournaldetail.AnalysisHeadID = 0;
                            if (bankvoucherfinal.VoucherTypeID == 1)
                            {
                                accountjournaldetail.Amount = d.Amount;
                                accountjournaldetail.Remarks = "Bank Voucher Receipt";
                            }
                            else
                            {
                                accountjournaldetail.Amount = d.Amount * -1;
                                accountjournaldetail.Remarks = "Bank Voucher Payment";
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
            BankVoucher bankvoucher = db.BankVouchers.Find(id);
            if (bankvoucher == null)
            {
                return HttpNotFound();
            }
            VoucherType vouchertypemaster = db.VoucherTypes.Find(bankvoucher.VoucherTypeID);
            ViewBag.VoucherTypeID = vouchertypemaster.Name;
            Employee employee = db.Employees.Find(bankvoucher.EmployeeID);
            ViewBag.EmployeeID = employee.Name;
            AccountHead accounthead = db.AccountHeads.Find(bankvoucher.AccountHeadID);
            ViewBag.AccountHeadID = accounthead.Name;
            return View(bankvoucher);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            BankVoucher bankvoucher = db.BankVouchers.Find(id);
            try
            {
                var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == bankvoucher.VoucherNo).ToList();
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
                var bankVoucherdetail = db.BankVoucherDetails.Where(b => b.BankVoucherID == id).ToList();
                foreach (BankVoucherDetail a in bankVoucherdetail)
                {
                    var bankVoucherdetailallocation = db.BankVoucherDetailAllocations.Where(b => b.BankVoucherDetailID == a.BankVoucherDetailID).ToList();
                    foreach (BankVoucherDetailAllocation b in bankVoucherdetailallocation)
                    {
                        db.BankVoucherDetailAllocations.Remove(b);
                        db.SaveChanges();
                    }
                    db.BankVoucherDetails.Remove(a);
                    db.SaveChanges();
                }

                db.BankVouchers.Remove(bankvoucher);
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
            BankVoucherDetail bankvoucherdetail = db.BankVoucherDetails.Find(id);
            try
            {
                var bankVoucherdetailallocation = db.BankVoucherDetailAllocations.Where(b => b.BankVoucherDetailID == id).ToList();
                foreach (BankVoucherDetailAllocation b in bankVoucherdetailallocation)
                {
                    db.BankVoucherDetailAllocations.Remove(b);
                    db.SaveChanges();
                }
                db.BankVoucherDetails.Remove(bankvoucherdetail);
                db.SaveChanges();
                
            }
            catch { }

            try
            {
                decimal totalamt = db.BankVoucherDetails.Where(u => u.BankVoucherID == bankvoucherdetail.BankVoucherID).Sum(u => (decimal)u.Amount);

                BankVoucher bankvoucher = db.BankVouchers.Find(bankvoucherdetail.BankVoucherID);
                bankvoucher.TotalAmount = decimal.Round(Convert.ToDecimal(totalamt.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                db.Entry(bankvoucher).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";
            }
            catch { }

           return RedirectToAction("Edit", new { id = bankvoucherdetail.BankVoucherID });
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
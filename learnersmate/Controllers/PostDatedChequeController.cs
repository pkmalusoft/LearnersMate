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
    public class PostDatedChequeController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
       
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var postdatedcheques = db.PostDatedCheques.Where(p => p.Flag == true).OrderByDescending(p => p.PostDatedChequeID);
            ViewBag.AccountHeads = db.AccountHeads.OrderBy(a => a.Name);
            ViewBag.VoucherTypes = db.VoucherTypes;
            ViewBag.Banks = db.Banks;   
            return View(postdatedcheques.ToList());
        }
        public ActionResult GetPdfList()
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("PostDatedCheque", "PostDatedChequePrint").Replace("GetPdfList", "Index"));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "PostDatedChequeList.pdf";
            return fileResult;

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

        public int SavePostDatedCheque(List<tempPostDatedChequeDetail> postDatedChequeDetailList, List<tempPostDatedCheque> postDatedChequeList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            int postdatedchequeid = 0;
            foreach (tempPostDatedChequeDetail t in postDatedChequeDetailList.ToList())
            {
                postdatedchequeid = t.postdatedchequeid;
                if (Convert.ToDecimal(t.amount) > 0)
                {
                    try
                    {
                        PostDatedChequeDetail postdatedchequedetail = db.PostDatedChequeDetails.Find(t.postdatedchequedetailid);
                        if (postdatedchequedetail == null)
                        {

                            PostDatedChequeDetail postdatedchequedetail1 = new PostDatedChequeDetail();                           
                            postdatedchequedetail1.PostDatedChequeID = t.postdatedchequeid;
                            postdatedchequedetail1.ReceivedFromID = t.receivedfromid;
                            postdatedchequedetail1.AccountHeadID = t.accountheadid;
                            postdatedchequedetail1.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",", "")), 2, MidpointRounding.AwayFromZero);
                            postdatedchequedetail1.Remarks = "";
                            db.PostDatedChequeDetails.Add(postdatedchequedetail1);
                            db.SaveChanges();                            
                        }
                        else
                        {                            
                            postdatedchequedetail.PostDatedChequeID = t.postdatedchequeid;
                            postdatedchequedetail.ReceivedFromID = t.receivedfromid;
                            postdatedchequedetail.AccountHeadID = t.accountheadid;
                            postdatedchequedetail.Amount = decimal.Round(Convert.ToDecimal(t.amount.Replace(",", "")), 2, MidpointRounding.AwayFromZero);                            
                            postdatedchequedetail.Remarks = t.remarks;
                            db.Entry(postdatedchequedetail).State = EntityState.Modified;
                            db.SaveChanges();
                        }

                        postdatedchequeid = t.postdatedchequeid;                                           

                    }
                    catch { }
                }
            }
                        
            decimal totalamtfinal = 0;
            try
            {
                totalamtfinal = db.PostDatedChequeDetails.Where(u => u.PostDatedChequeID == postdatedchequeid).Sum(u => (decimal)u.Amount);                
            }
            catch { }
            try
            {               
               
                foreach (tempPostDatedCheque bv in postDatedChequeList.ToList())
                {
                    PostDatedCheque postdatedchequefinal = db.PostDatedCheques.Find(postdatedchequeid);
                    if (bv.vouchertypeid == 1)
                    {
                        postdatedchequefinal.VoucherNo = "PDCR-" + postdatedchequeid.ToString("D" + 6);
                    }
                    else
                    {
                        postdatedchequefinal.VoucherNo = "PDCP-" + postdatedchequeid.ToString("D" + 6);
                    }
                    postdatedchequefinal.TransactionDate = bv.transactiondate;
                    postdatedchequefinal.VoucherTypeID = bv.vouchertypeid;
                    postdatedchequefinal.BankID = bv.bankid;
                    postdatedchequefinal.PayersBank = bv.payersbank;
                    postdatedchequefinal.ChequeNo = bv.chequeno;
                    postdatedchequefinal.ChequeDate = bv.chequedate;
                    postdatedchequefinal.TotalAmount = decimal.Round(Convert.ToDecimal(totalamtfinal.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    postdatedchequefinal.Remarks = bv.remarks;
                    db.Entry(postdatedchequefinal).State = EntityState.Modified;
                    db.SaveChanges();

                }
                Session["msg"] = "Created Successfully";
                Session["err"] = "";
            }
            catch
            {
            }

            return postdatedchequeid;
        }
        [SessionCreate]
        public ActionResult Create()
        {
            PostDatedCheque postdatedcheque = new PostDatedCheque();
            postdatedcheque.VoucherNo = "PDCR-";
            postdatedcheque.TransactionDate = DateTime.Now;
            postdatedcheque.VoucherTypeID = 1;
            postdatedcheque.BankID = 1;
            postdatedcheque.PayersBank = "";
            postdatedcheque.ChequeNo = "";
            postdatedcheque.ChequeDate = DateTime.Now;
            postdatedcheque.TotalAmount = 0.00M;
            postdatedcheque.Remarks = "";
            postdatedcheque.Flag = false;
            db.PostDatedCheques.Add(postdatedcheque);
            db.SaveChanges();
            postdatedcheque.VoucherNo = "PDCR-" + postdatedcheque.PostDatedChequeID.ToString("D" + 6);
            db.Entry(postdatedcheque).State = EntityState.Modified;
            db.SaveChanges();

            PostDatedChequeDetail postdatedchequedetail = new PostDatedChequeDetail();            
            postdatedchequedetail.PostDatedChequeID = postdatedcheque.PostDatedChequeID;
            postdatedchequedetail.ReceivedFromID = 1;
            postdatedchequedetail.AccountHeadID = 1;
            postdatedchequedetail.Amount = 0.00M;
            postdatedchequedetail.Remarks = "";            
            db.PostDatedChequeDetails.Add(postdatedchequedetail);
            db.SaveChanges();           

            return RedirectToAction("Edit", new { id = postdatedcheque.PostDatedChequeID });
        }

        [HttpPost]
        public ActionResult EditPostDatedChequeDetail(List<tempPostDatedChequeDetail> postDatedChequeDetailList, List<tempPostDatedCheque> postDatedChequeList)
        {
            int postdatedchequeid = SavePostDatedCheque(postDatedChequeDetailList, postDatedChequeList);
            PostDatedChequeDetail postdatedchequedetail = new PostDatedChequeDetail();            
            postdatedchequedetail.PostDatedChequeID = postdatedchequeid;
            postdatedchequedetail.ReceivedFromID = 1;
            postdatedchequedetail.AccountHeadID = 1;
            postdatedchequedetail.Amount = 0.00M;
            postdatedchequedetail.Remarks = "";            
            db.PostDatedChequeDetails.Add(postdatedchequedetail);
            db.SaveChanges();          
            return RedirectToAction("Edit", "PostDatedCheque", new { id = postdatedchequeid });
        }
        [SessionEdit]
        public ActionResult Edit(int id)
        {
            var postdatedcheque = db.PostDatedCheques.Where(b => b.PostDatedChequeID == id).ToList();
            var postdatedchequedetail = db.PostDatedChequeDetails.Where(b => b.PostDatedChequeID == id).ToList();
            if (postdatedchequedetail.Count == 0)
            {
                PostDatedChequeDetail postdatedchequedetail1 = new PostDatedChequeDetail();               
                postdatedchequedetail1.PostDatedChequeID = id;
                postdatedchequedetail1.ReceivedFromID = 1;
                postdatedchequedetail1.AccountHeadID = 1;
                postdatedchequedetail1.Amount = 0.00M;
                postdatedchequedetail1.Remarks = "";                
                db.PostDatedChequeDetails.Add(postdatedchequedetail1);
                db.SaveChanges();               
                postdatedchequedetail = db.PostDatedChequeDetails.Where(b => b.PostDatedChequeID == id).ToList();
            }
            PostDatedChequePostDatedChequeDetailPostDatedChequeDetailAllocationModel multiModel = new PostDatedChequePostDatedChequeDetailPostDatedChequeDetailAllocationModel();
            multiModel.PostDatedCheques = postdatedcheque;
            multiModel.PostDatedChequeDetails = postdatedchequedetail;

            ViewBag.AccountHeads = db.AccountHeads.OrderBy(a => a.Name);
            ViewBag.VoucherTypes = db.VoucherTypes;
            ViewBag.Banks = db.Banks;   

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";           
            return View(multiModel);
        }

        [HttpPost]
        public ActionResult Edit(List<tempPostDatedChequeDetail> postDatedChequeDetailList, List<tempPostDatedCheque> postDatedChequeList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            int postdatedchequeid = SavePostDatedCheque(postDatedChequeDetailList, postDatedChequeList);

            var postdatedchequedetailfinal = db.PostDatedChequeDetails.Where(b => b.PostDatedChequeID == postdatedchequeid).OrderBy(p => p.PostDatedChequeDetailID).Skip(1).ToList();
            foreach (PostDatedChequeDetail bvd in postdatedchequedetailfinal)
            {
                if (bvd.Amount == 0)
                {
                    db.PostDatedChequeDetails.Remove(bvd);
                    db.SaveChanges();
                }
            }
            decimal totalamtfinal = 0;
            try
            {
                totalamtfinal = db.PostDatedChequeDetails.Where(u => u.PostDatedChequeID == postdatedchequeid).Sum(u => (decimal)u.Amount);                
            }
            catch { }
            foreach (tempPostDatedCheque bv in postDatedChequeList.ToList())
            {
                PostDatedCheque postdatedchequefinal = db.PostDatedCheques.Find(postdatedchequeid);
                if (bv.vouchertypeid == 1)
                {
                    postdatedchequefinal.VoucherNo = "PDCR-" + postdatedchequeid.ToString("D" + 6);
                }
                else
                {
                    postdatedchequefinal.VoucherNo = "PDCP-" + postdatedchequeid.ToString("D" + 6);
                }
                postdatedchequefinal.TransactionDate = bv.transactiondate;
                postdatedchequefinal.VoucherTypeID = bv.vouchertypeid;
                postdatedchequefinal.BankID = bv.bankid;
                postdatedchequefinal.PayersBank = bv.payersbank;
                postdatedchequefinal.ChequeNo = bv.chequeno;
                postdatedchequefinal.ChequeDate = bv.chequedate;
                postdatedchequefinal.Remarks = bv.remarks;
                postdatedchequefinal.TotalAmount = decimal.Round(Convert.ToDecimal(totalamtfinal), 2, MidpointRounding.AwayFromZero);
                postdatedchequefinal.Flag = true;
                db.Entry(postdatedchequefinal).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";               
               
            }

            return Json(Session["msg"], JsonRequestBehavior.AllowGet);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            PostDatedCheque postdatedcheque = db.PostDatedCheques.Find(id);
            try
            {
                var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == postdatedcheque.VoucherNo).ToList();
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
                var postdatedchequedetailList = db.PostDatedChequeDetails.Where(t => t.PostDatedChequeID == id).ToList();
                foreach (PostDatedChequeDetail te in postdatedchequedetailList)
                {
                    db.PostDatedChequeDetails.Remove(te);
                    db.SaveChanges();
                }
                
                db.PostDatedCheques.Remove(postdatedcheque);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }
        public int DeleteConfirmDetail(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            int postdatedchequeid = 0;
            PostDatedChequeDetail postdatedchequedetail = db.PostDatedChequeDetails.Find(id);
            try
            {
                postdatedchequeid = postdatedchequedetail.PostDatedChequeID;
                db.PostDatedChequeDetails.Remove(postdatedchequedetail);
                db.SaveChanges();
                decimal totalamtfinal = 0;
                try
                {
                    totalamtfinal = db.PostDatedChequeDetails.Where(u => u.PostDatedChequeID == postdatedchequeid).Sum(u => (decimal)u.Amount);
                    PostDatedCheque postdatedcheque = db.PostDatedCheques.Find(postdatedchequeid);
                    postdatedcheque.TotalAmount = decimal.Round(Convert.ToDecimal(totalamtfinal.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                    db.Entry(postdatedcheque).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch { }
                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";
            }
            catch { }
            return postdatedchequeid;
        }
        public ActionResult DeleteConfirmEdit(int id)
        {
            int postdatedchequeid = DeleteConfirmDetail(id);
            return RedirectToAction("Edit", "PostDatedCheque", new { id = postdatedchequeid });
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

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
using System.Globalization;

namespace learnersmate.Controllers
{   
    [SessionCheck]
    public class CashBookController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
         
        public ActionResult Index()
        {            
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            Session["FromDate"] = DateTime.Now;
            Session["ToDate"] = DateTime.Now;
            List<CashBook> cashbooks = new List<CashBook>();
            return View(cashbooks);    
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Index(DateTime fromdate, DateTime todate)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            Session["FromDate"] = fromdate.ToShortDateString();
            Session["ToDate"] = todate.ToShortDateString();
            int userid = Convert.ToInt32(Session["UserID"].ToString());
            foreach (CashBook cashbookexist in db.CashBooks.Where(c => c.UserId == userid).ToList())
            {
                db.CashBooks.Remove(cashbookexist);
            }
            db.SaveChanges();
            Company company = db.Companys.Include(c => c.CurrentCountry).Include(c => c.CurrentCity).Where(c => c.CompanyID == 1).FirstOrDefault();
                       
            CashBook cashbook = new CashBook();            
            cashbook.Col1 = "";
            cashbook.Col2 = "";
            cashbook.Col3 = "";
            cashbook.Col4 = "";
            cashbook.Col5 = "";
            cashbook.Address = "<b>" + company.Name + "</b><br/>Address: " + company.HouseNo + " " + company.BuildingName + " " + company.Street + " " + company.Area + " " + company.Location + " " + company.CurrentCity.Name + " " + company.CurrentCountry.Name + " " + company.PinCode + "<br/>Email: " + company.Email + " , Mobile: " + company.Mobile;
            cashbook.FromToDate = "From : " + Convert.ToDateTime(fromdate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(fromdate.ToString()).Month) + "-" + Convert.ToDateTime(fromdate.ToString()).Year + " To:" + Convert.ToDateTime(todate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(todate.ToString()).Month) + "-" + Convert.ToDateTime(todate.ToString()).Year;
            cashbook.UserId = userid;
            db.CashBooks.Add(cashbook);
            db.SaveChanges();

         
            cashbook = new CashBook();
            cashbook.Col1 = "<b>Type Voucher No</b>";
            cashbook.Col2 = "<b>Remarks</b>";
            cashbook.Col3 = "<b>Credit</b>";
            cashbook.Col4 = "<b>Debit</b>";
            cashbook.Col5 = "<b>Balance</b>";
            cashbook.Address = "<b></b>";
            cashbook.FromToDate = "";
            cashbook.UserId = userid;
            db.CashBooks.Add(cashbook);
            db.SaveChanges();

            try
            { 
               
                decimal grandtotdebit = 0;
                decimal grandtotcredit = 0;
                decimal balance = 0;
                int r = 0;
                int k = 0;
                var accountjournaltrdates = db.AccountJournals.Where(t => t.TransactionDate >= fromdate && t.TransactionDate <= todate).OrderBy(t => t.TransactionDate).Select(t => t.TransactionDate).Distinct().ToList();
                foreach (DateTime accountjournaltrdate in accountjournaltrdates)
                {
                    var accountjournaldetails = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Include(a => a.CurrentAccountHead).OrderByDescending(t => t.CurrentAccountJournal.TransactionDate).Where(t => t.CurrentAccountJournal.TransactionDate == accountjournaltrdate).OrderBy(t => t.AccountJournalDetailID).ToList();
                    r = 0;                   
                    foreach (AccountJournalDetail accountjournaldetail in accountjournaldetails)
                    {                       
                        if (r == 0)
                        {
                            if (k == 0)
                            {
                                cashbook = new CashBook();
                                cashbook.Col1 = "";
                                cashbook.Col2 = "Openinig Balance";

                                decimal openingcreditamt = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate < fromdate && accountjournaldetail.Amount < 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                                decimal openingdebitamt = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate < fromdate && accountjournaldetail.Amount >= 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                                decimal openingbalanceamt = Convert.ToDecimal(openingdebitamt) - Convert.ToDecimal(openingcreditamt);
                                cashbook.Col3 = Convert.ToString(Convert.ToDecimal(openingcreditamt).ToString("#,##0.00")).Replace("-", "");
                                cashbook.Col4 = Convert.ToString(Convert.ToDecimal(openingdebitamt).ToString("#,##0.00")).Replace("-", "");
                                cashbook.Col5 = Convert.ToString(openingbalanceamt.ToString("#,##0.00")).Replace("-", "");
                                cashbook.Address = "";
                                cashbook.FromToDate = "";
                                cashbook.UserId = userid;
                                db.CashBooks.Add(cashbook);
                                db.SaveChanges();
                                k = 1;
                            }                            

                            cashbook = new CashBook();
                            cashbook.Col1 = "<b>" + Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Month) + "-" + Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Year + "</b>";
                            cashbook.Col2 = "";
                            cashbook.Col3 = "";
                            cashbook.Col4 = "";
                            cashbook.Col5 = "";
                            cashbook.Address = "";
                            cashbook.FromToDate = "";
                            cashbook.UserId = userid;
                            db.CashBooks.Add(cashbook);
                            db.SaveChanges();
                            r = 1;
                        }
                        else
                        {
                            if (accountjournaldetail.Amount < 0)
                            {
                                cashbook = new CashBook();
                                cashbook.Col1 = accountjournaldetail.CurrentAccountJournal.VoucherType + " " + accountjournaldetail.CurrentAccountJournal.VoucherNo;
                                cashbook.Col2 = "<b>By</b> " + accountjournaldetail.CurrentAccountHead.Name;
                                cashbook.Col3 = Convert.ToString(accountjournaldetail.Amount.ToString("#,##0.00")).Replace("-", "");
                                cashbook.Col4 = "";
                                balance -= balance - Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));                               
                                cashbook.Col5 = balance.ToString();
                                cashbook.Address = "";
                                cashbook.FromToDate = "";
                                cashbook.UserId = userid;
                                db.CashBooks.Add(cashbook);
                                db.SaveChanges();
                                grandtotdebit += Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                                grandtotcredit += 0;

                            }
                            else
                            {
                                cashbook = new CashBook();
                                cashbook.Col1 = accountjournaldetail.CurrentAccountJournal.VoucherType + " " + accountjournaldetail.CurrentAccountJournal.VoucherNo;
                                cashbook.Col2 = "<b>To</b> " + accountjournaldetail.CurrentAccountHead.Name;
                                cashbook.Col3 = "";
                                cashbook.Col4 = accountjournaldetail.Amount.ToString("#,##0.00");
                                balance += Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                                cashbook.Col5 = balance.ToString();
                                cashbook.Address = "";
                                cashbook.FromToDate = "";
                                cashbook.UserId = userid;
                                db.CashBooks.Add(cashbook);
                                db.SaveChanges();
                                grandtotdebit += 0;
                                grandtotcredit += Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                            }
                                
                        } 

                    } 
                               
                }
                cashbook = new CashBook();
                cashbook.Col1 = "";
                cashbook.Col2 = "<b>Grand Total</b>";
                cashbook.Col3 = "<b>" + grandtotcredit.ToString("#,##0.00") + "</b>";
                cashbook.Col4 = "<b>" + grandtotdebit.ToString("#,##0.00") + "</b>";
                cashbook.Col5 = "<b>" + balance.ToString("#,##0.00") + "</b>";
                cashbook.Address = "";
                cashbook.FromToDate = "";
                cashbook.UserId = userid;
                db.CashBooks.Add(cashbook);
                db.SaveChanges();
                Session["err"] = "";
                Session["msg"] = "Generated Successfully";
            }
            catch { }                        

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var cashbooklist = db.CashBooks.ToList();
            return View(cashbooklist);
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

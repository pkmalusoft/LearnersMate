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
    public class LedgerBookController : Controller
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
            List<LedgerBook> ledgerbooks = new List<LedgerBook>();
            ViewBag.AccountGroupID = new SelectList(db.AccountGroups.OrderBy(a => a.Name), "AccountGroupID", "Name");
            return View(ledgerbooks);    
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Index(DateTime fromdate, DateTime todate, int accountgroupid)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            Session["FromDate"] = fromdate.ToShortDateString();
            Session["ToDate"] = todate.ToShortDateString();
            int userid = Convert.ToInt32(Session["UserID"].ToString());
            foreach (LedgerBook ledgerbookexist in db.LedgerBooks.Where(c => c.UserId == userid).ToList())
            {
                db.LedgerBooks.Remove(ledgerbookexist);
            }
            db.SaveChanges();
            Company company = db.Companys.Include(c => c.CurrentCountry).Include(c => c.CurrentCity).Where(c => c.CompanyID == 1).FirstOrDefault();
            AccountGroup accountgroup = db.AccountGroups.Find(accountgroupid);
            LedgerBook ledgerbook = new LedgerBook();            
            ledgerbook.Col1 = "";
            ledgerbook.Col2 = "";
            ledgerbook.Col3 = "";
            ledgerbook.Col4 = "";
            ledgerbook.Col5 = "";
            ledgerbook.Col6 = "";
            ledgerbook.Address = "<b>" + company.Name + "</b><br/>Address: " + company.HouseNo + " " + company.BuildingName + " " + company.Street + " " + company.Area + " " + company.Location + " " + company.CurrentCity.Name + " " + company.CurrentCountry.Name + " " + company.PinCode + "<br/>Email: " + company.Email + " , Mobile: " + company.Mobile;
            ledgerbook.FromToDate = "From : " + Convert.ToDateTime(fromdate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(fromdate.ToString()).Month) + "-" + Convert.ToDateTime(fromdate.ToString()).Year + " To:" + Convert.ToDateTime(todate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(todate.ToString()).Month) + "-" + Convert.ToDateTime(todate.ToString()).Year;
            ledgerbook.Name = "<b>" + accountgroup.Name + "</b>";
            ledgerbook.UserId = userid;
            db.LedgerBooks.Add(ledgerbook);
            db.SaveChanges();

           
            ledgerbook = new LedgerBook();
            ledgerbook.Col1 = "";
            ledgerbook.Col2 = "";
            ledgerbook.Col3 = "";
            ledgerbook.Col4 = "";
            ledgerbook.Col5 = "";
            ledgerbook.Col6 = "";
            ledgerbook.Address = "<b>" + accountgroup.Name + "</b>";
            ledgerbook.FromToDate = "";
            ledgerbook.Name = "";
            ledgerbook.UserId = userid;
            db.LedgerBooks.Add(ledgerbook);
            db.SaveChanges();

            ledgerbook = new LedgerBook();
            ledgerbook.Col1 = "<b>Date</b>";
            ledgerbook.Col2 = "<b>Type Voucher No</b>";
            ledgerbook.Col3 = "<b>Remarks</b>";
            ledgerbook.Col4 = "<b>Credit</b>";
            ledgerbook.Col5 = "<b>Debit</b>";
            ledgerbook.Col6 = "<b>Balance</b>";           
            ledgerbook.Address = "<b></b>";
            ledgerbook.FromToDate = "";
            ledgerbook.Name = "";
            ledgerbook.UserId = userid;
            db.LedgerBooks.Add(ledgerbook);
            db.SaveChanges();

            try
            { 
               
                decimal grandtotdebit = 0;
                decimal grandtotcredit = 0;
                decimal balance = 0;
               
                var accountjournaltrdates = db.AccountJournals.Where(t => t.TransactionDate >= fromdate && t.TransactionDate <= todate).OrderBy(t => t.TransactionDate).Select(t => t.TransactionDate).Distinct().ToList();
                foreach (DateTime accountjournaltrdate in accountjournaltrdates)
                {
                    var accountjournaldetails = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Include(a => a.CurrentAccountHead).Include(a => a.CurrentAccountHead.CurrentAccountGroup).OrderByDescending(t => t.CurrentAccountJournal.TransactionDate).Where(t => t.CurrentAccountJournal.TransactionDate == accountjournaltrdate && t.CurrentAccountHead.CurrentAccountGroup.AccountGroupID == accountgroupid).OrderBy(t => t.AccountJournalDetailID).ToList();                            
                    foreach (AccountJournalDetail accountjournaldetail in accountjournaldetails)
                    {
                        if (accountjournaldetail.Amount < 0)
                        {
                            ledgerbook = new LedgerBook();
                            ledgerbook.Col1 = Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Month) + "-" + Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Year;
                            ledgerbook.Col2 = accountjournaldetail.CurrentAccountJournal.VoucherType + " " + accountjournaldetail.CurrentAccountJournal.VoucherNo;
                            ledgerbook.Col3 = "<b>By</b> " + accountjournaldetail.CurrentAccountHead.Name;
                            ledgerbook.Col4 = Convert.ToString(accountjournaldetail.Amount.ToString("#,##0.00")).Replace("-", "");
                            ledgerbook.Col5 = "";
                            balance -= balance - Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                            ledgerbook.Col6 = balance.ToString();
                            ledgerbook.Address = "";
                            ledgerbook.FromToDate = "";
                            ledgerbook.Name = "";
                            ledgerbook.UserId = userid;
                            db.LedgerBooks.Add(ledgerbook);
                            db.SaveChanges();
                            grandtotdebit += Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                            grandtotcredit += 0;

                        }
                        else
                        {
                            ledgerbook = new LedgerBook();
                            ledgerbook.Col1 = Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Month) + "-" + Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate.ToString()).Year;
                            ledgerbook.Col2 = accountjournaldetail.CurrentAccountJournal.VoucherType + " " + accountjournaldetail.CurrentAccountJournal.VoucherNo;
                            ledgerbook.Col3 = "<b>To</b> " + accountjournaldetail.CurrentAccountHead.Name;
                            ledgerbook.Col4 = "";
                            ledgerbook.Col5 = accountjournaldetail.Amount.ToString("#,##0.00");
                            balance += Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                            ledgerbook.Col6 = balance.ToString();
                            ledgerbook.Address = "";
                            ledgerbook.FromToDate = "";
                            ledgerbook.Name = "";
                            ledgerbook.UserId = userid;
                            db.LedgerBooks.Add(ledgerbook);
                            db.SaveChanges();
                            grandtotdebit += 0;
                            grandtotcredit += Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                        }

                    } 
                               
                }
                ledgerbook = new LedgerBook();
                ledgerbook.Col1 = "";
                ledgerbook.Col2 = "";
                ledgerbook.Col3 = "<b>Grand Total</b>";
                ledgerbook.Col4 = "<b>" + grandtotcredit.ToString("#,##0.00") + "</b>";
                ledgerbook.Col5 = "<b>" + grandtotdebit.ToString("#,##0.00") + "</b>";
                ledgerbook.Col6 = "<b>" + balance.ToString("#,##0.00") + "</b>";
                ledgerbook.Address = "";
                ledgerbook.FromToDate = "";
                ledgerbook.Name = "";
                ledgerbook.UserId = userid;
                db.LedgerBooks.Add(ledgerbook);
                db.SaveChanges();
                Session["err"] = "";
                Session["msg"] = "Generated Successfully";
            }
            catch { }                        

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var ledgerbooklist = db.LedgerBooks.ToList();
            ViewBag.AccountGroupID = new SelectList(db.AccountGroups.OrderBy(a => a.Name), "AccountGroupID", "Name", accountgroupid);
            ViewBag.AccountGroupName = accountgroup.Name;
            return View(ledgerbooklist);
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

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
    public class TrialBalanceController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
         
        public ActionResult Index()
        {            
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";            
            List<TrialBalance> trialbalances = new List<TrialBalance>();
            return View(trialbalances);    
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Index(DateTime enddate)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";          
            int userid = Convert.ToInt32(Session["UserID"].ToString());
            foreach (TrialBalance trialbalanceexist in db.TrialBalances.Where(c => c.UserId == userid).ToList())
            {
                db.TrialBalances.Remove(trialbalanceexist);
            }
            db.SaveChanges();
            Company company = db.Companys.Include(c => c.CurrentCountry).Include(c => c.CurrentCity).Where(c => c.CompanyID == 1).FirstOrDefault();
                       
            TrialBalance trialbalance = new TrialBalance();            
            trialbalance.Col1 = "";
            trialbalance.Col2 = "";
            trialbalance.Col3 = "";           
            trialbalance.Address = "<b>" + company.Name + "</b><br/>Address: " + company.HouseNo + " " + company.BuildingName + " " + company.Street + " " + company.Area + " " + company.Location + " " + company.CurrentCity.Name + " " + company.CurrentCountry.Name + " " + company.PinCode + "<br/>Email: " + company.Email + " , Mobile: " + company.Mobile;
            trialbalance.EndDate = "For the period of ending : " + Convert.ToDateTime(enddate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(enddate.ToString()).Month) + "-" + Convert.ToDateTime(enddate.ToString()).Year;
            trialbalance.UserId = userid;
            db.TrialBalances.Add(trialbalance);
            db.SaveChanges();
            
            trialbalance = new TrialBalance();          
            trialbalance.Col1 = "<b>Particulars</b>";
            trialbalance.Col2 = "<b>Credit</b>";
            trialbalance.Col3 = "<b>Debit</b>";            
            trialbalance.Address = "<b></b>";
            trialbalance.EndDate = "";
            trialbalance.UserId = userid;
            db.TrialBalances.Add(trialbalance);
            db.SaveChanges();
            try
            {
                var accountheads = db.AccountHeads.Include(a => a.CurrentAccountGroup).Include(a => a.CurrentAccountGroup.CurrentAccountCategory).OrderByDescending(a => a.AccountHeadID).ToList();
                foreach(var item in accountheads.OrderBy(item => item.CurrentAccountGroup.CurrentAccountCategory.Name).Select(item => item.CurrentAccountGroup.CurrentAccountCategory.AccountCategoryID).Distinct())
                {
                    AccountCategory accountcategory = db.AccountCategorys.Find(item);
                    decimal creditamt = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate <= enddate && t.CurrentAccountHead.CurrentAccountGroup.CurrentAccountCategory.AccountCategoryID == item && t.Amount < 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                    decimal debitamt = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate <= enddate && t.CurrentAccountHead.CurrentAccountGroup.CurrentAccountCategory.AccountCategoryID == item && t.Amount > 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                    trialbalance = new TrialBalance();
                    trialbalance.Col1 = "<h3>" + accountcategory.Name + "</h3>";
                    trialbalance.Col2 = "<h3>" + Convert.ToString(Convert.ToDecimal(creditamt).ToString("#,##0.00")).Replace("-", "") + "</h3>";
                    trialbalance.Col3 = "<h3>" + Convert.ToString(Convert.ToDecimal(debitamt).ToString("#,##0.00")).Replace("-", "") + "</h3>";
                    trialbalance.Address = "";
                    trialbalance.EndDate = "";
                    trialbalance.UserId = userid;
                    db.TrialBalances.Add(trialbalance);
                    db.SaveChanges();

                    foreach (var item2 in accountheads.Where(item2 => item2.CurrentAccountGroup.CurrentAccountCategory.AccountCategoryID == item).OrderBy(item2 => item2.CurrentAccountGroup.Name).Select(item2 => item2.CurrentAccountGroup.AccountGroupID).Distinct())
                    {
                        AccountGroup accountgroup = db.AccountGroups.Find(item2);
                        decimal creditamt2 = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate <= enddate && t.CurrentAccountHead.CurrentAccountGroup.AccountGroupID == item2 && t.Amount < 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                        decimal debitamt2 = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate <= enddate && t.CurrentAccountHead.CurrentAccountGroup.AccountGroupID == item2 && t.Amount > 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                        trialbalance = new TrialBalance();
                        trialbalance.Col1 = "<h4><span style='color:#919191'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + accountgroup.Name + "</span></h4>";
                        trialbalance.Col2 = "<h4><span style='color:#919191'>" + Convert.ToString(Convert.ToDecimal(creditamt2).ToString("#,##0.00")).Replace("-", "") + "</span></h4>";
                        trialbalance.Col3 = "<h4><span style='color:#919191'>" + Convert.ToString(Convert.ToDecimal(creditamt2).ToString("#,##0.00")).Replace("-", "") + "</span></h4>";
                        trialbalance.Address = "";
                        trialbalance.EndDate = "";
                        trialbalance.UserId = userid;
                        db.TrialBalances.Add(trialbalance);
                        db.SaveChanges();

                        foreach (var item3 in accountheads.Where(item3 => item3.CurrentAccountGroup.AccountGroupID == item2).OrderBy(item3 => item3.CurrentAccountGroup.Name).Select(item3 => item3.AccountHeadID).Distinct())
                        {

                            AccountHead accounthead = db.AccountHeads.Find(item3);
                            decimal creditamt3 = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate <= enddate && t.CurrentAccountHead.AccountHeadID == item3 && t.Amount < 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                            decimal debitamt3 = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate <= enddate && t.CurrentAccountHead.AccountHeadID == item3 && t.Amount > 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                            trialbalance = new TrialBalance();
                            trialbalance.Col1 = "<small><span style='color:#C0C0C0'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + accounthead.Name + "</span></small>";
                            trialbalance.Col2 = "<small><span style='color:#C0C0C0'>" + Convert.ToString(Convert.ToDecimal(creditamt3).ToString("#,##0.00")).Replace("-", "") + "</span></small>";
                            trialbalance.Col3 = "<small><span style='color:#C0C0C0'>" + Convert.ToString(Convert.ToDecimal(creditamt3).ToString("#,##0.00")).Replace("-", "") + "</span></small>";
                            trialbalance.Address = "";
                            trialbalance.EndDate = "";
                            trialbalance.UserId = userid;
                            db.TrialBalances.Add(trialbalance);
                            db.SaveChanges();
                        }

                    }

                }

                decimal creditamt4 = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate <= enddate && t.Amount < 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                decimal debitamt4 = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Where(t => t.CurrentAccountJournal.TransactionDate <= enddate && t.Amount > 0).Select(t => t.Amount).DefaultIfEmpty().Sum();
                trialbalance = new TrialBalance();
                trialbalance.Col1 = "<b>Grand Total</b>";
                trialbalance.Col2 = "<b>" + Convert.ToString(Convert.ToDecimal(creditamt4).ToString("#,##0.00")).Replace("-", "") + "</b>";
                trialbalance.Col3 = "<b>" + Convert.ToString(Convert.ToDecimal(debitamt4).ToString("#,##0.00")).Replace("-", "") + "</b>";
                trialbalance.Address = "";
                trialbalance.EndDate = "";
                trialbalance.UserId = userid;
                db.TrialBalances.Add(trialbalance);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Generated Successfully";
            }
            catch { }                        

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var trialbalancelist = db.TrialBalances.ToList();
            return View(trialbalancelist);
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

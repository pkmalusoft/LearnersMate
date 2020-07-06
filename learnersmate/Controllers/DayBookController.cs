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
    public class DayBookController : Controller
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
            List<DayBook> daybooks = new List<DayBook>();
            return View(daybooks);    
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
            
            foreach (DayBook2 daybook2 in db.DayBooks2.ToList())
            {
                db.DayBooks2.Remove(daybook2);
            }
            db.SaveChanges();
            Company company = db.Companys.Include(c => c.CurrentCountry).Include(c => c.CurrentCity).Where(c => c.CompanyID == 1).FirstOrDefault();
            List<DayBook> daybooks = new List<DayBook>();
            List<DayBook2> daybooks2 = new List<DayBook2>();
            DayBook2 daybook2head = new DayBook2();
            daybook2head.Col1 = "Voucher No";
            daybook2head.Col2 = "Particulars";
            daybook2head.Col3 = "Credit Acc";
            daybook2head.Col4 = "Debit Acc";
            daybook2head.Col5 = "Credit Amt";
            daybook2head.Col6 = "Debit Amt";
            daybook2head.Col7 = Convert.ToDateTime(fromdate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(fromdate.ToString()).Month) + "-" + Convert.ToDateTime(fromdate.ToString()).Year; ;
            daybook2head.Col8 = Convert.ToDateTime(todate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(todate.ToString()).Month) + "-" + Convert.ToDateTime(todate.ToString()).Year; ;
            daybook2head.Col9 = "<b>" + company.Name + "</b><br/>Address: " + company.HouseNo + " " + company.BuildingName + " " + company.Street + " " + company.Area + " " + company.Location + " " + company.CurrentCity.Name + " " + company.CurrentCountry.Name + " " + company.PinCode + "<br/>Email: " + company.Email + " , Mobile: " + company.Mobile;           
            daybooks2.Add(daybook2head);
            db.DayBooks2.Add(daybook2head);
            db.SaveChanges();
            try
            { 
                decimal daytotdebit = 0;
                decimal daytotcredit = 0;
                decimal grandtotdebit = 0;
                decimal grandtotcredit = 0;
                int r = 0;
                var accountjournaltrdates = db.AccountJournals.Where(t => t.TransactionDate >= fromdate && t.TransactionDate <= todate).OrderBy(t => t.TransactionDate).Select(t => t.TransactionDate).Distinct().ToList();
                foreach (DateTime accountjournaltrdate in accountjournaltrdates)
                {
                    var accountjournaldetails = db.AccountJournalDetails.Include(a => a.CurrentAccountJournal).Include(a => a.CurrentAccountHead).OrderByDescending(t => t.CurrentAccountJournal.TransactionDate).Where(t => t.CurrentAccountJournal.TransactionDate == accountjournaltrdate).OrderBy(t => t.AccountJournalDetailID).ToList();
                    r = 0;
                    daytotdebit = 0;
                    daytotcredit = 0;
                    foreach (AccountJournalDetail accountjournaldetail in accountjournaldetails)
                    {
                        DayBook daybook = new DayBook();
                        DayBook2 daybook2 = new DayBook2();
                        if (r == 0)
                        {
                            daybook.TransactionDate = Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate);

                            daybook2.Col1 = Convert.ToDateTime(daybook.TransactionDate.ToString()).Day.ToString() + "-" + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Convert.ToDateTime(daybook.TransactionDate.ToString()).Month) + "-" + Convert.ToDateTime(daybook.TransactionDate.ToString()).Year;
                            daybook2.Col2 = "";
                            daybook2.Col3 = "";
                            daybook2.Col4 = "";
                            daybook2.Col5 = "";
                            daybook2.Col6 = "";
                            daybook2.Col7 = "";
                            daybook2.Col8 = "";
                            daybook2.Col9 = "";
                            
                            daybooks2.Add(daybook2);
                            db.DayBooks2.Add(daybook2);
                            db.SaveChanges();
                            r =1;
                        }else
                        {
                            daybook.TransactionDate = null;
                        }                                                         
                        daybook.VoucherNo = accountjournaldetail.CurrentAccountJournal.VoucherType + " " + accountjournaldetail.CurrentAccountJournal.VoucherNo;
                        daybook.DetailParticulars = accountjournaldetail.Remarks;
                        if (accountjournaldetail.Amount >= 0)
                        {
                            daybook.DebitAccount = accountjournaldetail.CurrentAccountHead.Name;
                            daybook.Debit = accountjournaldetail.Amount;
                            daytotdebit += accountjournaldetail.Amount;
                        }
                        if (accountjournaldetail.Amount <= 0)
                        {
                            daybook.CreditAccount = accountjournaldetail.CurrentAccountHead.Name;
                            daybook.Credit = Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                            daytotcredit += Convert.ToDecimal(Convert.ToString(accountjournaldetail.Amount).Replace("-", ""));
                        }
                        daybook.DebitDayTotal = null;
                        daybook.CreditDayTotal = null;
                        daybook.DebitGrandTotal = null;
                        daybook.CreditGrandTotal = null;
                        daybooks.Add(daybook);
                       
                        daybook2.Col1 = daybook.VoucherNo;
                        daybook2.Col2 = daybook.DetailParticulars;
                        daybook2.Col3 = daybook.CreditAccount;
                        daybook2.Col4 = daybook.DebitAccount;
                    
                        daybook2.Col5 = Convert.ToDecimal(daybook.Credit).ToString("#,##0.00"); 
                        daybook2.Col6 = Convert.ToDecimal(daybook.Debit).ToString("#,##0.00"); 
                        daybook2.Col7 = "";
                        daybook2.Col8 = "";
                        daybook2.Col9 = "";
                       
                        daybooks2.Add(daybook2);
                        db.DayBooks2.Add(daybook2);
                        db.SaveChanges();

                    } 

                        DayBook daybookdaytot = new DayBook();
                        daybookdaytot.DetailParticulars = "DAY TOTAL";
                        daybookdaytot.DebitDayTotal = daytotdebit;
                        daybookdaytot.CreditDayTotal = daytotcredit;                        
                        daybooks.Add(daybookdaytot);

                    DayBook2 daybook2tot = new DayBook2();
                    daybook2tot.Col1 = "";
                    daybook2tot.Col2 = "";
                    daybook2tot.Col3 = "";
                    daybook2tot.Col4 = daybookdaytot.DetailParticulars;
                    daybook2tot.Col5 = Convert.ToDecimal(daybookdaytot.CreditDayTotal).ToString("#,##0.00"); 
                    daybook2tot.Col6 = Convert.ToDecimal(daybookdaytot.DebitDayTotal).ToString("#,##0.00");
                    daybook2tot.Col7 = "";
                    daybook2tot.Col8 = "";
                    daybook2tot.Col9 = "";
                    
                    daybooks2.Add(daybook2tot);
                    db.DayBooks2.Add(daybook2tot);
                    db.SaveChanges();


                        grandtotdebit += daytotdebit;
                        grandtotcredit += daytotcredit;

                        Session["err"] = "";
                        Session["msg"] = "Generated Successfully";    
                               
                }

                        DayBook daybookgrandtot = new DayBook();
                        daybookgrandtot.DetailParticulars = "GRAND TOTAL";
                        daybookgrandtot.DebitGrandTotal = grandtotdebit;
                        daybookgrandtot.CreditGrandTotal = grandtotcredit;                        
                        daybooks.Add(daybookgrandtot);

                DayBook2 daybook22tot = new DayBook2();
                daybook22tot.Col1 = "";
                daybook22tot.Col2 = "";
                daybook22tot.Col3 = "";
                daybook22tot.Col4 = daybookgrandtot.DetailParticulars;
                daybook22tot.Col5 = Convert.ToDecimal(daybookgrandtot.CreditGrandTotal).ToString("#,##0.00");
                daybook22tot.Col6 = Convert.ToDecimal(daybookgrandtot.DebitGrandTotal).ToString("#,##0.00");
                daybook22tot.Col7 = "";
                daybook22tot.Col8 = "";
                daybook22tot.Col9 = "";
               
                daybooks2.Add(daybook22tot);
                db.DayBooks2.Add(daybook22tot);
                db.SaveChanges();


            }
            catch { }                        

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";

            return View(daybooks);
        }
        public ActionResult GetPdfList()
        {
            var converter = new HtmlToPdf();
            PdfDocument doc = converter.ConvertUrl(Request.Url.AbsoluteUri.Replace("DayBook", "DayBookPrint").Replace("GetPdfList", "Index?FromDate=" + Session["FromDate"] + "&ToDate=" + Session["ToDate"]));
            byte[] pdf = doc.Save();
            doc.Close();
            FileResult fileResult = new FileContentResult(pdf, "application/pdf");
            fileResult.FileDownloadName = "DayBookList.pdf";

            return fileResult;
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

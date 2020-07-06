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
using Microsoft.Reporting.WebForms;
using ReportViewerForMvc;

namespace learnersmate.Controllers
{ 
    public class DayBookPrintController : Controller
    {
        private DatabaseContext db = new DatabaseContext();
        
        public ActionResult Index()
        {
            DateTime fromdate = Convert.ToDateTime(Request.QueryString["FromDate"]);
            DateTime todate = Convert.ToDateTime(Request.QueryString["ToDate"].Remove(Request.QueryString["ToDate"].Length - 1));
            
            List<DayBook> daybooks = new List<DayBook>();
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
                        if (r == 0)
                        {
                            daybook.TransactionDate = Convert.ToDateTime(accountjournaldetail.CurrentAccountJournal.TransactionDate);
                            r = 1;
                        }
                        else
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

                   
                    }


                    DayBook daybookdaytot = new DayBook();
                    daybookdaytot.DetailParticulars = "DAY TOTAL";
                    daybookdaytot.DebitDayTotal = daytotdebit;
                    daybookdaytot.CreditDayTotal = daytotcredit;
                    daybooks.Add(daybookdaytot);

                 
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

            }
            catch { }

            //DataTable table = ConvertListToDataTable(daybooks);
            //DataTable daybookstbl = CommanFunctions.ToDataTable(daybooks);
            //ReportViewer reportViewer = new ReportViewer();
            //reportViewer.ProcessingMode = ProcessingMode.Local;
            //reportViewer.SizeToReportContent = true;
            ////reportViewer.Width = unit.Percentage(900);
            ////reportViewer.Height = Unit.Percentage(900);
            //reportViewer.LocalReport.ReportPath = Server.MapPath("~/Reports/daybook.rdl");            
            //ReportDataSource datasource = new ReportDataSource("DataSet1", daybookstbl);
            //reportViewer.LocalReport.DataSources.Clear();
            //reportViewer.LocalReport.DataSources.Add(datasource);
            //reportViewer.ShowPrintButton = true;
            //ViewBag.ReportViewer = reportViewer;
            return View(daybooks);
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

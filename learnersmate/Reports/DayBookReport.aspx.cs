using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Web.Mvc;
using learnersmate.Models;
using SelectPdf;
using Microsoft.Owin.Security;
using learnersmate.Context;
using learnersmate.Filters;
using Microsoft.Reporting.WebForms;
using System.Configuration;
using System.Data.SqlClient;
using System;

namespace learnersmate
{
    [SessionCheck]
    public partial class DayBookReport : System.Web.UI.Page
    {
        private DatabaseContext db = new DatabaseContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ReportViewer1.ServerReport.ReportServerUrl = new System.Uri("http://localhost:1125/");
                //ReportViewer1.ServerReport.ReportPath = Server.MapPath("~/Reports/Untitled.rdl");
                //Microsoft.Reporting.WebForms.ReportDataSource rptdTitle = new Microsoft.Reporting.WebForms.ReportDataSource();
                //rptdTitle.Name = "DataSource1";
                //rptdTitle.Value = DataSet1;
                //ReportViewer1.LocalReport.DataSources.Add(rptdTitle);


                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reports/daybook.rdl");
                //DataTable dt = GetData("SELECT top 1 [DayBookID]      ,[TransactionDate]=Case When [TransactionDate] is null then '' else [TransactionDate] end       ,[VoucherNo]=Case When [VoucherNo] is null then '' else [VoucherNo] end      ,[DetailParticulars]=Case When [DetailParticulars] is null then '' else [DetailParticulars] end      ,[DebitAccount]=Case When [DebitAccount] is null then '' else [DebitAccount] end      ,[CreditAccount]=Case When [CreditAccount] is null then '' else [CreditAccount] end      ,[Debit]=Case When [Debit] is null then 0 else [Debit] end      ,[Credit]=Case When [Credit] is null then 0 else [Credit] end      ,[DebitDayTotal]=Case When [DebitDayTotal] is null then 0 else [DebitDayTotal] end      ,[CreditDayTotal]=Case When [CreditDayTotal] is null then 0 else [CreditDayTotal] end      ,[DebitGrandTotal]=Case When [DebitGrandTotal] is null then 0 else [DebitGrandTotal] end      ,[CreditGrandTotal]=Case When [CreditGrandTotal] is null then 0 else [CreditGrandTotal] end      ,[Length]=Case When [Length] is null then 0 else [Length] end  FROM [dbo].[tmsDayBooks] ");
                DataTable dt = GetData("SELECT *  FROM [dbo].[smsDayBooks] Order by DayBookID");
                ReportDataSource datasource = new ReportDataSource("DataSet1", dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
                ReportViewer1.ShowPrintButton = true;

                //string strEmpUID = "0";
                //string strLocationID = "0";
                //string strDepartmentID = "0";
                //MyReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
                //string username = System.Configuration.ConfigurationManager.AppSettings["ReportViewerUser"].ToString();
                //string password = System.Configuration.ConfigurationManager.AppSettings["ReportViewerPassword"].ToString();
                //string domain = System.Configuration.ConfigurationManager.AppSettings["ReportViewerDomain"].ToString();
                //MyReportViewer.ServerReport.ReportServerCredentials = new MyReportServerCredentials();
                //MyReportViewer.ServerReport.ReportServerUrl = new Uri(@"http://server/ReportServer");
                //MyReportViewer.ServerReport.ReportPath = @"/Report Project2/Report1";
                //MyReportViewer.ShowParameterPrompts = false;
                //MyReportViewer.ShowPrintButton = true;
                //Microsoft.Reporting.WebForms.ReportParameter[] RptParameters = new Microsoft.Reporting.WebForms.ReportParameter[3];
                //RptParameters[0] = new Microsoft.Reporting.WebForms.ReportParameter("EmpUID", strEmpUID);
                //RptParameters[1] = new Microsoft.Reporting.WebForms.ReportParameter("LocationID", strLocationID);
                //RptParameters[2] = new Microsoft.Reporting.WebForms.ReportParameter("DepartmentID", strDepartmentID);
                //MyReportViewer.ServerReport.SetParameters(RptParameters);
                //MyReportViewer.ServerReport.Refresh();


            }

        }
        private DataTable GetData(string query)
        {

            string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlCommand Cmd = new SqlCommand(query);
            using (SqlConnection C = new SqlConnection(conString))
            using (Cmd)
            {   //using SqlCeCommand
                Cmd.Connection = C;
                C.Open();
                using (SqlDataReader Rdr = Cmd.ExecuteReader())
                {
                    //Create datatable to hold schema and data seperately
                    //Get schema of our actual table
                    DataTable DTSchema = Rdr.GetSchemaTable();
                    DataTable DT = new DataTable();
                    if (DTSchema != null)
                        if (DTSchema.Rows.Count > 0)
                            for (int i = 0; i < DTSchema.Rows.Count; i++)
                            {
                                //Create new column for each row in schema table
                                //Set properties that are causing errors and add it to our datatable
                                //Rows in schema table are filled with information of columns in our actual table
                                DataColumn Col = new DataColumn(DTSchema.Rows[i]["ColumnName"].ToString(), (Type)DTSchema.Rows[i]["DataType"]);
                                Col.AllowDBNull = true;
                                Col.Unique = false;
                                Col.AutoIncrement = false;
                                DT.Columns.Add(Col);
                            }

                    while (Rdr.Read())
                    {
                        //Read data and fill it to our datatable
                        DataRow Row = DT.NewRow();
                        for (int i = 0; i < DT.Columns.Count; i++)
                        {
                            Row[i] = Rdr[i];
                        }
                        DT.Rows.Add(Row);
                    }
                    //This is our datatable filled with data
                    return DT;
                }
            }

            //using (SqlConnection con = new SqlConnection(conString))
            //{
            //    using (SqlDataAdapter sda = new SqlDataAdapter())
            //    {
            //        cmd.Connection = con;
            //        sda.SelectCommand = cmd;
            //        using (DataSource1 dt = new DataSource1())
            //        {
            //            dt.Clear();                       
            //            sda.Fill(dt, "DataTable1");
            //            return dt;
            //        }
            //    }
            //}
        }
    }
}
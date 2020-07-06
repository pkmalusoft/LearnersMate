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
    public partial class CashBookReport : System.Web.UI.Page
    {
        private DatabaseContext db = new DatabaseContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                int userid = Convert.ToInt32(Session["UserID"].ToString());
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reports/cashbook.rdl");                
                DataTable dt = GetData("SELECT *  FROM [dbo].[tmsCashBooks] Where UserID = '" + userid  + "' Order by CashBookID");
                ReportDataSource datasource = new ReportDataSource("DataSet1", dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
                ReportViewer1.ShowPrintButton = true;

               

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
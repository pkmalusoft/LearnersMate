using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using learnersmate.Context;
using learnersmate.Filters;
using learnersmate.Models;
namespace learnersmate.Controllers
{
    [SessionCheck]
    public class CalendarController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetCalendarData()
        {            
            JsonResult result = new JsonResult();

            try
            {              
                List<PublicHoliday> data = this.LoadData();               
                result = this.Json(data, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {              
                Console.Write(ex);
            }
            return result;
        }
        private List<PublicHoliday> LoadData()
        {            
            List<PublicHoliday> lst = new List<PublicHoliday>();

            try
            {                
                string line = string.Empty;
                var calendarlist = db.Calendars.Where(c => c.IsHoliday == true).OrderByDescending(c => c.Date).ToList();
                foreach(Calendar c in calendarlist)
                {
                    PublicHoliday infoObj = new PublicHoliday();
                    string[] info = line.Split(',');
                    infoObj.ID = c.CalendarID;
                    infoObj.Title = c.Title;
                    infoObj.Desc = c.Description;
                    infoObj.Start_Date = c.Date.ToString();
                    infoObj.End_Date = c.Date.ToString();
                    lst.Add(infoObj);
                }
                //string srcFilePath = "/PublicHoliday.txt";
                //var rootPath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase);
                //var fullPath = Path.Combine(rootPath, srcFilePath);
                //string filePath = new Uri(fullPath).LocalPath;
                //string srcFilePath = Server.MapPath("/PublicHoliday.txt");
                //StreamReader sr = new StreamReader(new FileStream(srcFilePath, FileMode.Open, FileAccess.Read)); 
                //while ((line = sr.ReadLine()) != null)
                //{                   
                //    PublicHoliday infoObj = new PublicHoliday();
                //    string[] info = line.Split(',');                    
                //    infoObj.Sr = Convert.ToInt32(info[0].ToString());
                //    infoObj.Title = info[1].ToString();
                //    infoObj.Desc = info[2].ToString();
                //    infoObj.Start_Date = info[3].ToString();
                //    infoObj.End_Date = info[4].ToString();
                //    lst.Add(infoObj);
                //}               
                //sr.Dispose();
                //sr.Close();
            }
            catch (Exception ex)
            {               
                Console.Write(ex);
            }           
            return lst;
        }
    }
    
}
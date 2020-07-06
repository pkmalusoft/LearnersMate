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
namespace learnersmate.Controllers
{
    [SessionCheck]
    //[RouteArea("Dashboard")]
    //[RoutePrefix("")]
    //[Route(“{action}”)]

    public class DashboardController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        [Route("dashboard")]
        public ActionResult Index()
        {
            SuperAdminDashboard dashboard = new SuperAdminDashboard();
            dashboard.SchoolsCount = 0;
            dashboard.TeachersCount = 0;
            dashboard.ParentsCount = 0;
            dashboard.StudentsCount = 0;
            return View(dashboard);
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

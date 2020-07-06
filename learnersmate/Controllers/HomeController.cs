using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using learnersmate.Models;
using Microsoft.Owin.Security;
using learnersmate.Context;
namespace learnersmate.Controllers
{  
    public class HomeController : Controller
    {       
        public ActionResult Index()        
        {            
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult Routing() // Routing
        {
            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
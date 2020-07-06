using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using learnersmate.Models;
using learnersmate.Context;
using learnersmate.Filters;
namespace learnersmate.Controllers
{   
    public class JournalVoucherPrintController : Controller
    {
        private DatabaseContext db = new DatabaseContext();        
        // GET: /JournalVoucherPrint/
        public ActionResult Index()
        {
            var journalvouchers = db.JournalVouchers.OrderByDescending(b => b.JournalVoucherID);
            ViewBag.AccountHeads = db.AccountHeads;
            return View(journalvouchers.ToList());
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

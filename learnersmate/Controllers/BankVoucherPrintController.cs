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
    public class BankVoucherPrintController : Controller
    {
        private DatabaseContext db = new DatabaseContext();        
        // GET: /BankVoucherPrint/
        public ActionResult Index()
        {
            var bankvouchers = db.BankVouchers.Include(b => b.CurrentEmployee).Include(b => b.CurrentVoucherType).OrderByDescending(b => b.BankVoucherID);
            ViewBag.AccountHeads = db.AccountHeads;
            return View(bankvouchers.ToList());
        }

        // GET: /BankVoucherPrint/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BankVoucher bankvoucher = db.BankVouchers.Find(id);
            if (bankvoucher == null)
            {
                return HttpNotFound();
            }
            VoucherType vouchertypemaster = db.VoucherTypes.Find(bankvoucher.VoucherTypeID);
            ViewBag.VoucherTypeID = vouchertypemaster.Name;
            Employee employee = db.Employees.Find(bankvoucher.EmployeeID);
            ViewBag.EmployeeID = employee.Name;
            AccountHead accounthead = db.AccountHeads.Find(bankvoucher.AccountHeadID);           
            ViewBag.AccountHeadID = accounthead.Name;
            return View(bankvoucher);
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

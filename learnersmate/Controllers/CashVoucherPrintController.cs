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
    public class CashVoucherPrintController : Controller
    {
        private DatabaseContext db = new DatabaseContext();        
        // GET: /CashVoucherPrint/
        public ActionResult Index()
        {
            var cashvouchers = db.CashVouchers.Include(b => b.CurrentEmployee).Include(b => b.CurrentVoucherType).OrderByDescending(b => b.CashVoucherID);
            ViewBag.AccountHeads = db.AccountHeads;
            return View(cashvouchers.ToList());
        }

        // GET: /CashVoucherPrint/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CashVoucher cashvoucher = db.CashVouchers.Find(id);
            if (cashvoucher == null)
            {
                return HttpNotFound();
            }
            VoucherType vouchertypemaster = db.VoucherTypes.Find(cashvoucher.VoucherTypeID);
            ViewBag.VoucherTypeID = vouchertypemaster.Name;
            Employee employee = db.Employees.Find(cashvoucher.EmployeeID);
            ViewBag.EmployeeID = employee.Name;
            AccountHead accounthead = db.AccountHeads.Find(cashvoucher.AccountHeadID);           
            ViewBag.AccountHeadID = accounthead.Name;
            return View(cashvoucher);
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

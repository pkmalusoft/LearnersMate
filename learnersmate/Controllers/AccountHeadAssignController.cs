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
    [SessionCheck]   
    public class AccountHeadAssignController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
                        
            ViewBag.AccountHeads = db.AccountHeads.OrderBy(a => a.Name);            
            var accountheadassign = db.AccountHeadAssigns.ToList();
            return View(accountheadassign.ToList());
        }
     
        [HttpPost]
        public ActionResult EditAccountHeadAssign(List<tempAcHeadAssigns> acheadList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try
            {
                foreach (tempAcHeadAssigns t in acheadList.ToList())
                {
                    AccountHeadAssign acheadassign = db.AccountHeadAssigns.Find(t.id);
                    acheadassign.AccountHeadID = t.acheadid;
                    db.Entry(acheadassign).State = EntityState.Modified;
                    db.SaveChanges();

                    Session["err"] = "";
                    Session["msg"] = "Modified Successfully";
                   
                }
            }
            catch { }
           return RedirectToAction("Index");
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
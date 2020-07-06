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
    public class AllocationGroupController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /AllocationGroup/
        public ActionResult Index()
        {
            return View(db.AllocationGroups.ToList());
        }
        public ActionResult _Create()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "AllocationGroupID,Name")] AllocationGroup allocationgroupmaster)
        {
            string msg = "Error in processing.";
            if (ModelState.IsValid)
            {
                allocationgroupmaster.Name = allocationgroupmaster.Name.ToUpper();
                db.AllocationGroups.Add(allocationgroupmaster);
                db.SaveChanges();

                ModelState.Clear();
                msg = "Successfully created.";

                return RedirectToAction("_GroupPartial", "BankVoucherDetailAllocation", new { id = allocationgroupmaster.AllocationGroupID });
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public ActionResult _Edit()
        {            
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name");
            return View();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _EditFor([Bind(Include = "AllocationGroupID,Name")] AllocationGroup allocationgroupmaster)
        {
            string msg = "Error in processing.";
            if (ModelState.IsValid)
            {
                allocationgroupmaster.Name = allocationgroupmaster.Name.ToUpper();
                db.Entry(allocationgroupmaster).State = EntityState.Modified;
                db.SaveChanges();

                ModelState.Clear();
                msg = "Successfully created.";

                return RedirectToAction("_GroupPartial", "BankVoucherDetailAllocation", new { id = allocationgroupmaster.AllocationGroupID });
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetGroup(int id)
        {            
            AllocationGroup allocationgroupmaster = db.AllocationGroups.Find(id);          
            return Json(allocationgroupmaster.Name, JsonRequestBehavior.AllowGet);
        }
        // GET: /AllocationGroup/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllocationGroup allocationgroupmaster = db.AllocationGroups.Find(id);
            if (allocationgroupmaster == null)
            {
                return HttpNotFound();
            }
            return View(allocationgroupmaster);
        }

        // GET: /AllocationGroup/Create
        [SessionCreate]
        public ActionResult Create()
        {
            return View();
        }

        // POST: /AllocationGroup/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="AllocationGroupID,Name")] AllocationGroup allocationgroupmaster)
        {
            if (ModelState.IsValid)
            {
                db.AllocationGroups.Add(allocationgroupmaster);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(allocationgroupmaster);
        }

        // GET: /AllocationGroup/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllocationGroup allocationgroupmaster = db.AllocationGroups.Find(id);
            if (allocationgroupmaster == null)
            {
                return HttpNotFound();
            }
            return View(allocationgroupmaster);
        }

        // POST: /AllocationGroup/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="AllocationGroupID,Name")] AllocationGroup allocationgroupmaster)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                db.Entry(allocationgroupmaster).State = EntityState.Modified;
                db.SaveChanges();
                Session["err"] = "";
                Session["msg"] = "Modified Successfully";
                return RedirectToAction("Index");
            }
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(allocationgroupmaster);
        }

        // GET: /AllocationGroup/Delete/5
        [SessionDelete]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllocationGroup allocationgroupmaster = db.AllocationGroups.Find(id);
            if (allocationgroupmaster == null)
            {
                return HttpNotFound();
            }
            return View(allocationgroupmaster);
        }

        // POST: /AllocationGroup/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AllocationGroup allocationgroupmaster = db.AllocationGroups.Find(id);
            db.AllocationGroups.Remove(allocationgroupmaster);
            db.SaveChanges();
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

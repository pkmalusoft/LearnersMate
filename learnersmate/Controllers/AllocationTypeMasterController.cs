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
    public class AllocationTypeController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /AllocationType/
        public ActionResult Index()
        {
            var allocationtypemasters = db.AllocationTypes.Include(a => a.CurrentAllocationGroup);           
            return View(allocationtypemasters.ToList());
        }
        public ActionResult _Create()
        {
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name");
            //if (!string.IsNullOrEmpty((string)Session["Group"]))
            //{
            //    int group = int.Parse(Session["Group"].ToString());
            //    ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name", group);
            //}
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateFor([Bind(Include = "AllocationTypeID,Name,AllocationGroupID")] AllocationType allocationtypemaster)
        {
            string msg = "Error in processing.";
            if (ModelState.IsValid)
            {
                db.AllocationTypes.Add(allocationtypemaster);
                db.SaveChanges();

                ModelState.Clear();
                msg = "Successfully created.";

                return RedirectToAction("_GroupPartial", "BankVoucherDetailAllocation", new { id = allocationtypemaster.AllocationGroupID });
            }
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name");
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public ActionResult _Edit()
        {
            List<SelectListItem> AllocationGroupTypeCombinedItems = new List<SelectListItem>();
            int repeatedgroupid = 0;
            var atm = db.AllocationTypes.Include(a => a.CurrentAllocationGroup).OrderBy(a => a.AllocationGroupID).ToList();
            foreach (AllocationType at in atm)
            {

                if (repeatedgroupid != at.AllocationGroupID)
                {

                    AllocationGroupTypeCombinedItems.Add(new SelectListItem
                    {
                        Text = at.CurrentAllocationGroup.Name,
                        Value = "0"
                    });
                    repeatedgroupid = at.AllocationGroupID;

                }
                AllocationGroupTypeCombinedItems.Add(new SelectListItem
                {
                    Text = "----" + at.Name,
                    Value = at.AllocationTypeID.ToString()
                });


            }

            ViewBag.AllocationTypes = AllocationGroupTypeCombinedItems;
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name");
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name");     
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _EditFor([Bind(Include = "AllocationTypeID,Name")] AllocationType allocationtypemaster)
        {
            string msg = "Error in processing.";
            if (ModelState.IsValid)
            {
                AllocationType allocationtypemaster1 = db.AllocationTypes.Find(allocationtypemaster.AllocationTypeID);
                allocationtypemaster1.Name = allocationtypemaster.Name;
                db.Entry(allocationtypemaster1).State = EntityState.Modified;
                db.SaveChanges();

                ModelState.Clear();
                msg = "Successfully created.";

                return RedirectToAction("_GroupPartial", "BankVoucherDetailAllocation", new { id = allocationtypemaster.AllocationGroupID });
            }
           
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name");
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name");   
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetType1(int id)
        {
            var allocationtypemaster = db.AllocationTypes.Where(a => a.AllocationGroupID == id).ToList();
            return Json(allocationtypemaster, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetType2(int id)
        {
            
            AllocationType allocationtypemaster = db.AllocationTypes.Find(id);
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name", allocationtypemaster.AllocationGroupID);
            return Json(allocationtypemaster.Name, JsonRequestBehavior.AllowGet);
        }
        // GET: /AllocationType/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllocationType allocationtypemaster = db.AllocationTypes.Find(id);
            if (allocationtypemaster == null)
            {
                return HttpNotFound();
            }
            return View(allocationtypemaster);
        }

        // GET: /AllocationType/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name");
            return View();
        }

        // POST: /AllocationType/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="AllocationTypeID,Name,AllocationGroupID")] AllocationType allocationtypemaster)
        {
            if (ModelState.IsValid)
            {
                db.AllocationTypes.Add(allocationtypemaster);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name", allocationtypemaster.AllocationGroupID);
            return View(allocationtypemaster);
        }

        // GET: /AllocationType/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllocationType allocationtypemaster = db.AllocationTypes.Find(id);
            if (allocationtypemaster == null)
            {
                return HttpNotFound();
            }
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name", allocationtypemaster.AllocationGroupID);
            return View(allocationtypemaster);
        }

        // POST: /AllocationType/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="AllocationTypeID,Name,AllocationGroupID")] AllocationType allocationtypemaster)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                db.Entry(allocationtypemaster).State = EntityState.Modified;
                db.SaveChanges();
                Session["err"] = "";
                Session["msg"] = "Modified Successfully";
                return RedirectToAction("Index");
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name", allocationtypemaster.AllocationGroupID);
            return View(allocationtypemaster);
        }

        // GET: /AllocationType/Delete/5
        [SessionDelete]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllocationType allocationtypemaster = db.AllocationTypes.Find(id);
            if (allocationtypemaster == null)
            {
                return HttpNotFound();
            }
            return View(allocationtypemaster);
        }

        // POST: /AllocationType/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AllocationType allocationtypemaster = db.AllocationTypes.Find(id);
            db.AllocationTypes.Remove(allocationtypemaster);
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

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
   
    public class tempJournalVoucherDetailAllocation
    {
        public int journalvoucherdetailallocationid { get; set; }
        public int journalvoucherdetailid { get; set; }
        public int allocationtypeid { get; set; }
        public decimal Amount { get; set; }
    }
    public class tempJournalVoucherDetailAllocationList
    {
        public List<tempJournalVoucherDetailAllocation> tempJournalVoucherDetailAllocations { get; set; }
    }
       
    [SessionCheck]
    public class JournalVoucherDetailAllocationController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /JournalVoucherDetailAllocation/
        public ActionResult Index()
        {
            var journalvoucherdetailallocations = db.JournalVoucherDetailAllocations.Include(b => b.CurrentAllocationType).Include(b => b.CurrentJournalVoucherDetail);
            return View(journalvoucherdetailallocations.ToList());
        }
        public ActionResult _GroupPartial(int? id)
        {            
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name", id);
            return PartialView();
        }
        public ActionResult CreatePopUp(int id)
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.MessageD = Session["msgD"];
            ViewBag.ErrorD = Session["errD"];
            Session["errD"] = "";
            Session["msgD"] = "";
            var journalvoucherdetailallocation = db.JournalVoucherDetailAllocations.Include(b => b.CurrentJournalVoucherDetail).Where(b => b.JournalVoucherDetailID == id).ToList();
            if (journalvoucherdetailallocation.Count == 0)
            {
                //return HttpNotFound();
                JournalVoucherDetailAllocation journalvoucherdetailallocation1 = new JournalVoucherDetailAllocation();                
                journalvoucherdetailallocation1.JournalVoucherDetailID = id;
                journalvoucherdetailallocation1.AllocationTypeID = 0;
                journalvoucherdetailallocation1.Amount = 0.00M;
                db.JournalVoucherDetailAllocations.Add(journalvoucherdetailallocation1);
                db.SaveChanges();

                journalvoucherdetailallocation = db.JournalVoucherDetailAllocations.Include(b => b.CurrentJournalVoucherDetail).Where(b => b.JournalVoucherDetailID == id).ToList();
            }
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name");
            List<SelectListItem> AllocationGroupTypeCombinedItems = new List<SelectListItem>();
            int repeatedgroupid = 0;
            var atm = db.AllocationTypes.Include(a => a.CurrentAllocationGroup).OrderBy(a => a.AllocationGroupID).ToList();
            foreach(AllocationType at in atm)
                {

                  if(repeatedgroupid != at.AllocationGroupID)
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
            ViewBag.JournalVoucherDetailID = id.ToString();
            return View(journalvoucherdetailallocation);
        }
        
        [HttpPost]
        public ActionResult CreatePopUp(List<tempJournalVoucherDetailAllocation> journalVoucherDetailAllocationList)
        {
            Session["msg"] = "";
            Session["err"] = "Error";
            int journalvoucherdetailid = 0;
            try
            {
                foreach (tempJournalVoucherDetailAllocation t in journalVoucherDetailAllocationList.ToList())
                {
                    journalvoucherdetailid = t.journalvoucherdetailid;
                    if (t.allocationtypeid.ToString() != "0")
                    {
                        JournalVoucherDetailAllocation journalvoucherdetailallocation = db.JournalVoucherDetailAllocations.Find(t.journalvoucherdetailallocationid);
                        if (journalvoucherdetailallocation == null)
                        {
                            JournalVoucherDetailAllocation journalvoucherdetailallocation1 = new JournalVoucherDetailAllocation();                           
                            journalvoucherdetailallocation1.JournalVoucherDetailID = t.journalvoucherdetailid;
                            journalvoucherdetailallocation1.AllocationTypeID = t.allocationtypeid;
                            journalvoucherdetailallocation1.Amount = decimal.Round(Convert.ToDecimal(t.Amount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            db.JournalVoucherDetailAllocations.Add(journalvoucherdetailallocation1);
                            db.SaveChanges();

                        }
                        else
                        {
                            journalvoucherdetailallocation.JournalVoucherDetailID = t.journalvoucherdetailid;
                            journalvoucherdetailallocation.AllocationTypeID = t.allocationtypeid;
                            journalvoucherdetailallocation.Amount = decimal.Round(Convert.ToDecimal(t.Amount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            db.Entry(journalvoucherdetailallocation).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                    }
                    
                }
                Session["msg"] = "Success";
                Session["err"] = "";
            }
            catch
            {

            }
            ViewBag.AllocationGroupID = new SelectList(db.AllocationGroups, "AllocationGroupID", "Name");
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
            ViewBag.JournalVoucherDetailID = journalvoucherdetailid.ToString();

            var journalvoucherdetailallocation2 = db.JournalVoucherDetailAllocations.Include(b => b.CurrentJournalVoucherDetail).Where(b => b.JournalVoucherDetailID == journalvoucherdetailid).ToList();
            return View(journalvoucherdetailallocation2);
        }
        
        // GET: /JournalVoucherDetailAllocation/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JournalVoucherDetailAllocation journalvoucherdetailallocation = db.JournalVoucherDetailAllocations.Find(id);
            if (journalvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            return View(journalvoucherdetailallocation);
        }

        // GET: /JournalVoucherDetailAllocation/Create

        public ActionResult Create()
        {
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name");
            ViewBag.JournalVoucherDetailID = new SelectList(db.JournalVoucherDetails, "JournalVoucherDetailID", "Name");
            return View();
        }

        // POST: /JournalVoucherDetailAllocation/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="JournalVoucherDetailAllocationID,Name,JournalVoucherDetailID,AllocationTypeID,Amount")] JournalVoucherDetailAllocation journalvoucherdetailallocation)
        {
            if (ModelState.IsValid)
            {
                db.JournalVoucherDetailAllocations.Add(journalvoucherdetailallocation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", journalvoucherdetailallocation.AllocationTypeID);
            ViewBag.JournalVoucherDetailID = new SelectList(db.JournalVoucherDetails, "JournalVoucherDetailID", "Name", journalvoucherdetailallocation.JournalVoucherDetailID);
            return View(journalvoucherdetailallocation);
        }
        [HttpPost]
        public ActionResult CreateGroup(string groupname, string JournalVoucherDetailID)
        {
           
            return View();
        }
        // GET: /JournalVoucherDetailAllocation/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JournalVoucherDetailAllocation journalvoucherdetailallocation = db.JournalVoucherDetailAllocations.Find(id);
            if (journalvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", journalvoucherdetailallocation.AllocationTypeID);
            ViewBag.JournalVoucherDetailID = new SelectList(db.JournalVoucherDetails, "JournalVoucherDetailID", "Name", journalvoucherdetailallocation.JournalVoucherDetailID);
            return View(journalvoucherdetailallocation);
        }

        // POST: /JournalVoucherDetailAllocation/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="JournalVoucherDetailAllocationID,Name,JournalVoucherDetailID,AllocationTypeID,Amount")] JournalVoucherDetailAllocation journalvoucherdetailallocation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(journalvoucherdetailallocation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", journalvoucherdetailallocation.AllocationTypeID);
            ViewBag.JournalVoucherDetailID = new SelectList(db.JournalVoucherDetails, "JournalVoucherDetailID", "Name", journalvoucherdetailallocation.JournalVoucherDetailID);
            return View(journalvoucherdetailallocation);
        }

        // GET: /JournalVoucherDetailAllocation/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JournalVoucherDetailAllocation journalvoucherdetailallocation = db.JournalVoucherDetailAllocations.Find(id);
            if (journalvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            return View(journalvoucherdetailallocation);
        }

        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error";
            Session["msg"] = "";           
            JournalVoucherDetailAllocation journalvoucherdetailallocation = db.JournalVoucherDetailAllocations.Find(id);
            try
            {
                db.JournalVoucherDetailAllocations.Remove(journalvoucherdetailallocation);
                db.SaveChanges();                
                Session["err"] = "";
                Session["msg"] = "Success";

            }
            catch { }
            return RedirectToAction("CreatePopUp", "JournalVoucherDetailAllocation", new { id = journalvoucherdetailallocation.JournalVoucherDetailID });
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

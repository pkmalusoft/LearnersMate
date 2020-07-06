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
   
    public class tempCashVoucherDetailAllocation
    {
        public int cashvoucherdetailallocationid { get; set; }
        public int cashvoucherdetailid { get; set; }
        public int allocationtypeid { get; set; }
        public decimal Amount { get; set; }
    }
    public class tempCashVoucherDetailAllocationList
    {
        public List<tempCashVoucherDetailAllocation> tempCashVoucherDetailAllocations { get; set; }
    }
       
    [SessionCheck]
    public class CashVoucherDetailAllocationController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /CashVoucherDetailAllocation/
        public ActionResult Index()
        {
            var cashvoucherdetailallocations = db.CashVoucherDetailAllocations.Include(b => b.CurrentAllocationType).Include(b => b.CurrentCashVoucherDetail);
            return View(cashvoucherdetailallocations.ToList());
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
            var cashvoucherdetailallocation = db.CashVoucherDetailAllocations.Include(b => b.CurrentCashVoucherDetail).Where(b => b.CashVoucherDetailID == id).ToList();
            if (cashvoucherdetailallocation.Count == 0)
            {
                //return HttpNotFound();
                CashVoucherDetailAllocation cashvoucherdetailallocation1 = new CashVoucherDetailAllocation();                
                cashvoucherdetailallocation1.CashVoucherDetailID = id;
                cashvoucherdetailallocation1.AllocationTypeID = 0;
                cashvoucherdetailallocation1.Amount = 0.00M;
                db.CashVoucherDetailAllocations.Add(cashvoucherdetailallocation1);
                db.SaveChanges();

                cashvoucherdetailallocation = db.CashVoucherDetailAllocations.Include(b => b.CurrentCashVoucherDetail).Where(b => b.CashVoucherDetailID == id).ToList();
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
            ViewBag.CashVoucherDetailID = id.ToString();
            return View(cashvoucherdetailallocation);
        }
        
        [HttpPost]
        public ActionResult CreatePopUp(List<tempCashVoucherDetailAllocation> cashVoucherDetailAllocationList)
        {
            Session["msg"] = "";
            Session["err"] = "Error";
            int cashvoucherdetailid = 0;
            try
            {
                foreach (tempCashVoucherDetailAllocation t in cashVoucherDetailAllocationList.ToList())
                {
                    cashvoucherdetailid = t.cashvoucherdetailid;
                    if (t.allocationtypeid.ToString() != "0")
                    {
                        CashVoucherDetailAllocation cashvoucherdetailallocation = db.CashVoucherDetailAllocations.Find(t.cashvoucherdetailallocationid);
                        if (cashvoucherdetailallocation == null)
                        {
                            CashVoucherDetailAllocation cashvoucherdetailallocation1 = new CashVoucherDetailAllocation();                           
                            cashvoucherdetailallocation1.CashVoucherDetailID = t.cashvoucherdetailid;
                            cashvoucherdetailallocation1.AllocationTypeID = t.allocationtypeid;
                            cashvoucherdetailallocation1.Amount = decimal.Round(Convert.ToDecimal(t.Amount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            db.CashVoucherDetailAllocations.Add(cashvoucherdetailallocation1);
                            db.SaveChanges();

                        }
                        else
                        {
                            cashvoucherdetailallocation.CashVoucherDetailID = t.cashvoucherdetailid;
                            cashvoucherdetailallocation.AllocationTypeID = t.allocationtypeid;
                            cashvoucherdetailallocation.Amount = decimal.Round(Convert.ToDecimal(t.Amount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            db.Entry(cashvoucherdetailallocation).State = EntityState.Modified;
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
            ViewBag.CashVoucherDetailID = cashvoucherdetailid.ToString();

            var cashvoucherdetailallocation2 = db.CashVoucherDetailAllocations.Include(b => b.CurrentCashVoucherDetail).Where(b => b.CashVoucherDetailID == cashvoucherdetailid).ToList();
            return View(cashvoucherdetailallocation2);
        }
        
        // GET: /CashVoucherDetailAllocation/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CashVoucherDetailAllocation cashvoucherdetailallocation = db.CashVoucherDetailAllocations.Find(id);
            if (cashvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            return View(cashvoucherdetailallocation);
        }

        // GET: /CashVoucherDetailAllocation/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name");
            ViewBag.CashVoucherDetailID = new SelectList(db.CashVoucherDetails, "CashVoucherDetailID", "Name");
            return View();
        }

        // POST: /CashVoucherDetailAllocation/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="CashVoucherDetailAllocationID,Name,CashVoucherDetailID,AllocationTypeID,Amount")] CashVoucherDetailAllocation cashvoucherdetailallocation)
        {
            if (ModelState.IsValid)
            {
                db.CashVoucherDetailAllocations.Add(cashvoucherdetailallocation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", cashvoucherdetailallocation.AllocationTypeID);
            ViewBag.CashVoucherDetailID = new SelectList(db.CashVoucherDetails, "CashVoucherDetailID", "Name", cashvoucherdetailallocation.CashVoucherDetailID);
            return View(cashvoucherdetailallocation);
        }
        [HttpPost]
        public ActionResult CreateGroup(string groupname, string CashVoucherDetailID)
        {
           
            return View();
        }
        // GET: /CashVoucherDetailAllocation/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CashVoucherDetailAllocation cashvoucherdetailallocation = db.CashVoucherDetailAllocations.Find(id);
            if (cashvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", cashvoucherdetailallocation.AllocationTypeID);
            ViewBag.CashVoucherDetailID = new SelectList(db.CashVoucherDetails, "CashVoucherDetailID", "Name", cashvoucherdetailallocation.CashVoucherDetailID);
            return View(cashvoucherdetailallocation);
        }

        // POST: /CashVoucherDetailAllocation/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="CashVoucherDetailAllocationID,Name,CashVoucherDetailID,AllocationTypeID,Amount")] CashVoucherDetailAllocation cashvoucherdetailallocation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cashvoucherdetailallocation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", cashvoucherdetailallocation.AllocationTypeID);
            ViewBag.CashVoucherDetailID = new SelectList(db.CashVoucherDetails, "CashVoucherDetailID", "Name", cashvoucherdetailallocation.CashVoucherDetailID);
            return View(cashvoucherdetailallocation);
        }

        // GET: /CashVoucherDetailAllocation/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CashVoucherDetailAllocation cashvoucherdetailallocation = db.CashVoucherDetailAllocations.Find(id);
            if (cashvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            return View(cashvoucherdetailallocation);
        }

        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error";
            Session["msg"] = "";           
            CashVoucherDetailAllocation cashvoucherdetailallocation = db.CashVoucherDetailAllocations.Find(id);
            try
            {
                db.CashVoucherDetailAllocations.Remove(cashvoucherdetailallocation);
                db.SaveChanges();                
                Session["err"] = "";
                Session["msg"] = "Success";

            }
            catch { }
            return RedirectToAction("CreatePopUp", "CashVoucherDetailAllocation", new { id = cashvoucherdetailallocation.CashVoucherDetailID });
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

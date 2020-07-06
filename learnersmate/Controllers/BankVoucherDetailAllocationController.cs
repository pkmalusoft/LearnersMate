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
   
    public class tempBankVoucherDetailAllocation
    {
        public int bankvoucherdetailallocationid { get; set; }
        public int bankvoucherdetailid { get; set; }
        public int allocationtypeid { get; set; }
        public decimal Amount { get; set; }
    }
    public class tempBankVoucherDetailAllocationList
    {
        public List<tempBankVoucherDetailAllocation> tempBankVoucherDetailAllocations { get; set; }
    }
       
    [SessionCheck]
    public class BankVoucherDetailAllocationController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /BankVoucherDetailAllocation/
        public ActionResult Index()
        {
            var bankvoucherdetailallocations = db.BankVoucherDetailAllocations.Include(b => b.CurrentAllocationType).Include(b => b.CurrentBankVoucherDetail);
            return View(bankvoucherdetailallocations.ToList());
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
            var bankvoucherdetailallocation = db.BankVoucherDetailAllocations.Include(b => b.CurrentBankVoucherDetail).Where(b => b.BankVoucherDetailID == id).ToList();
            if (bankvoucherdetailallocation.Count == 0)
            {
                //return HttpNotFound();
                BankVoucherDetailAllocation bankvoucherdetailallocation1 = new BankVoucherDetailAllocation();                
                bankvoucherdetailallocation1.BankVoucherDetailID = id;
                bankvoucherdetailallocation1.AllocationTypeID = 0;
                bankvoucherdetailallocation1.Amount = 0.00M;
                db.BankVoucherDetailAllocations.Add(bankvoucherdetailallocation1);
                db.SaveChanges();

                bankvoucherdetailallocation = db.BankVoucherDetailAllocations.Include(b => b.CurrentBankVoucherDetail).Where(b => b.BankVoucherDetailID == id).ToList();
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
            ViewBag.BankVoucherDetailID = id.ToString();
            return View(bankvoucherdetailallocation);
        }
        
        [HttpPost]
        public ActionResult CreatePopUp(List<tempBankVoucherDetailAllocation> bankVoucherDetailAllocationList)
        {
            Session["msg"] = "";
            Session["err"] = "Error";
            int bankvoucherdetailid = 0;
            try
            {
                foreach (tempBankVoucherDetailAllocation t in bankVoucherDetailAllocationList.ToList())
                {
                    bankvoucherdetailid = t.bankvoucherdetailid;
                    if (t.allocationtypeid.ToString() != "0")
                    {
                        BankVoucherDetailAllocation bankvoucherdetailallocation = db.BankVoucherDetailAllocations.Find(t.bankvoucherdetailallocationid);
                        if (bankvoucherdetailallocation == null)
                        {
                            BankVoucherDetailAllocation bankvoucherdetailallocation1 = new BankVoucherDetailAllocation();                           
                            bankvoucherdetailallocation1.BankVoucherDetailID = t.bankvoucherdetailid;
                            bankvoucherdetailallocation1.AllocationTypeID = t.allocationtypeid;
                            bankvoucherdetailallocation1.Amount = decimal.Round(Convert.ToDecimal(t.Amount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            db.BankVoucherDetailAllocations.Add(bankvoucherdetailallocation1);
                            db.SaveChanges();

                        }
                        else
                        {
                            bankvoucherdetailallocation.BankVoucherDetailID = t.bankvoucherdetailid;
                            bankvoucherdetailallocation.AllocationTypeID = t.allocationtypeid;
                            bankvoucherdetailallocation.Amount = decimal.Round(Convert.ToDecimal(t.Amount.ToString("#.##")), 2, MidpointRounding.AwayFromZero);
                            db.Entry(bankvoucherdetailallocation).State = EntityState.Modified;
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
            ViewBag.BankVoucherDetailID = bankvoucherdetailid.ToString();

            var bankvoucherdetailallocation2 = db.BankVoucherDetailAllocations.Include(b => b.CurrentBankVoucherDetail).Where(b => b.BankVoucherDetailID == bankvoucherdetailid).ToList();
            return View(bankvoucherdetailallocation2);
        }
        
        // GET: /BankVoucherDetailAllocation/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BankVoucherDetailAllocation bankvoucherdetailallocation = db.BankVoucherDetailAllocations.Find(id);
            if (bankvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            return View(bankvoucherdetailallocation);
        }

        // GET: /BankVoucherDetailAllocation/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name");
            ViewBag.BankVoucherDetailID = new SelectList(db.BankVoucherDetails, "BankVoucherDetailID", "Name");
            return View();
        }

        // POST: /BankVoucherDetailAllocation/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="BankVoucherDetailAllocationID,Name,BankVoucherDetailID,AllocationTypeID,Amount")] BankVoucherDetailAllocation bankvoucherdetailallocation)
        {
            if (ModelState.IsValid)
            {
                db.BankVoucherDetailAllocations.Add(bankvoucherdetailallocation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", bankvoucherdetailallocation.AllocationTypeID);
            ViewBag.BankVoucherDetailID = new SelectList(db.BankVoucherDetails, "BankVoucherDetailID", "Name", bankvoucherdetailallocation.BankVoucherDetailID);
            return View(bankvoucherdetailallocation);
        }
        [HttpPost]
        public ActionResult CreateGroup(string groupname, string BankVoucherDetailID)
        {
           
            return View();
        }
        // GET: /BankVoucherDetailAllocation/Edit/5
       
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BankVoucherDetailAllocation bankvoucherdetailallocation = db.BankVoucherDetailAllocations.Find(id);
            if (bankvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", bankvoucherdetailallocation.AllocationTypeID);
            ViewBag.BankVoucherDetailID = new SelectList(db.BankVoucherDetails, "BankVoucherDetailID", "Name", bankvoucherdetailallocation.BankVoucherDetailID);
            return View(bankvoucherdetailallocation);
        }

        // POST: /BankVoucherDetailAllocation/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="BankVoucherDetailAllocationID,Name,BankVoucherDetailID,AllocationTypeID,Amount")] BankVoucherDetailAllocation bankvoucherdetailallocation)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                db.Entry(bankvoucherdetailallocation).State = EntityState.Modified;
                db.SaveChanges();
                Session["err"] = "";
                Session["msg"] = "Modified Successfully";
                return RedirectToAction("Index");
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.AllocationTypeID = new SelectList(db.AllocationTypes, "AllocationTypeID", "Name", bankvoucherdetailallocation.AllocationTypeID);
            ViewBag.BankVoucherDetailID = new SelectList(db.BankVoucherDetails, "BankVoucherDetailID", "Name", bankvoucherdetailallocation.BankVoucherDetailID);
            return View(bankvoucherdetailallocation);
        }

        // GET: /BankVoucherDetailAllocation/Delete/5
        [SessionDelete]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BankVoucherDetailAllocation bankvoucherdetailallocation = db.BankVoucherDetailAllocations.Find(id);
            if (bankvoucherdetailallocation == null)
            {
                return HttpNotFound();
            }
            return View(bankvoucherdetailallocation);
        }

        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error";
            Session["msg"] = "";           
            BankVoucherDetailAllocation bankvoucherdetailallocation = db.BankVoucherDetailAllocations.Find(id);
            try
            {
                db.BankVoucherDetailAllocations.Remove(bankvoucherdetailallocation);
                db.SaveChanges();                
                Session["err"] = "";
                Session["msg"] = "Success";

            }
            catch { }
            return RedirectToAction("CreatePopUp", "BankVoucherDetailAllocation", new { id = bankvoucherdetailallocation.BankVoucherDetailID });
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

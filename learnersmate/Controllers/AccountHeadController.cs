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
    public class AccountHeadController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /AccountHead/
        [SessionCreate]
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";

            var accountheads = db.AccountHeads.Include(a => a.CurrentAccountGroup).Include(a => a.CurrentAccountGroup.CurrentAccountCategory).OrderByDescending(a => a.AccountHeadID).ToList();
            ViewBag.AccountCategory = db.AccountCategorys.ToList();
            ViewBag.AccountGroup = db.AccountGroups.ToList();
            ViewBag.AccountHead = db.AccountHeads.ToList();
            
            return View(accountheads);
        }
        public ActionResult _CreateCategory()
        {
            AccountCategory accountcategory = new AccountCategory();
            accountcategory.Name = "";
            return PartialView(accountcategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateCategoryFor([Bind(Include = "AccountCategorID,Name")] AccountCategory accountcategory)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                AccountCategory exist = db.AccountCategorys.Where(c => c.Name == accountcategory.Name).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Category already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.AccountCategorys.Add(accountcategory);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
            }
            data.message = "/AccountHead/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult _CreateGroup()
        {
            AccountGroup accountgroup = new AccountGroup();            
            ViewBag.AccountCategoryID = new SelectList(db.AccountCategorys, "AccountCategoryID", "Name");
            return PartialView(accountgroup);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateGroupFor([Bind(Include = "AccountGroupID,Name,AccountCategoryID")] AccountGroup accountgroup)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                AccountGroup exist = db.AccountGroups.Where(c => c.Name == accountgroup.Name).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Group already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.AccountGroups.Add(accountgroup);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
            }
            data.message = "/AccountHead/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult _CreateHead()
        {
            ViewBag.AccountCategoryID = new SelectList(db.AccountCategorys, "AccountCategoryID", "Name");
            ViewBag.AccountGroupID = new SelectList(db.AccountGroups, "AccountGroupID", "Name");
            ViewBag.AccountGroups = db.AccountGroups;
            return PartialView();
        }
        public ActionResult CreateHead(int id)
        {
            ViewBag.AccountCategoryID = new SelectList(db.AccountCategorys, "AccountCategoryID", "Name", id);
            ViewBag.AccountGroupID = new SelectList(db.AccountGroups.Where(c => c.AccountCategoryID == id), "AccountGroupID", "Name");            
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult CreateHead([Bind(Include = "AccountHeadID,Name,AccountGroupID")] AccountHead accounthead, int AccountCategoryID)
        {            
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                AccountHead exist = db.AccountHeads.Where(c => c.Name == accounthead.Name).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Head already exists";                    
                    ViewBag.Message = Session["msg"];
                    ViewBag.Error = Session["err"];
                    Session["err"] = "";
                    Session["msg"] = "";
                    ViewBag.AccountCategoryID = new SelectList(db.AccountCategorys, "AccountCategoryID", "Name", AccountCategoryID);
                    ViewBag.AccountGroupID = new SelectList(db.AccountGroups.Where(c => c.AccountGroupID == AccountCategoryID), "AccountGroupID", "Name");
                    return View(accounthead);
                }

                db.AccountHeads.Add(accounthead);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";

                return RedirectToAction("Index");
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.AccountCategoryID = new SelectList(db.AccountCategorys, "AccountCategoryID", "Name", AccountCategoryID);
            ViewBag.AccountGroupID = new SelectList(db.AccountGroups.Where(c => c.AccountGroupID == AccountCategoryID), "AccountGroupID", "Name");
            return View(accounthead);
        }
        public ActionResult EditHead(int id)
        {
            AccountHead accounthead = db.AccountHeads.Include(a => a.CurrentAccountGroup).Include(a => a.CurrentAccountGroup.CurrentAccountCategory).Where(a => a.AccountHeadID == id).FirstOrDefault();            
            ViewBag.AccountCategoryID = accounthead.CurrentAccountGroup.CurrentAccountCategory.Name;
            ViewBag.AccountGroupID = new SelectList(db.AccountGroups.Include(a => a.CurrentAccountCategory).Where(a => a.CurrentAccountCategory.AccountCategoryID == accounthead.CurrentAccountGroup.AccountCategoryID), "AccountGroupID", "Name", accounthead.AccountGroupID);
            ViewBag.Existing = accounthead.Name;
            return View(accounthead);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult EditHead([Bind(Include = "AccountHeadID,Name,AccountGroupID")] AccountHead accounthead, string existing)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (accounthead.Name != existing)
                {
                    AccountHead exist = db.AccountHeads.Include(a => a.CurrentAccountGroup).Include(a => a.CurrentAccountGroup.CurrentAccountCategory).Where(s => s.Name == accounthead.Name && s.Name != existing).FirstOrDefault();
                    if (exist != null)
                    {
                        Session["err"] = "Head already exists";
                        ViewBag.AccountCategoryID = accounthead.CurrentAccountGroup.CurrentAccountCategory.Name;
                        ViewBag.AccountGroupID = new SelectList(db.AccountGroups.Include(a => a.CurrentAccountCategory).Where(a => a.CurrentAccountCategory.AccountCategoryID == exist.CurrentAccountGroup.AccountCategoryID), "AccountGroupID", "Name", accounthead.AccountGroupID);
                        ViewBag.Existing = accounthead.Name;
                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(accounthead);
                    }
                }

                db.Entry(accounthead).State = EntityState.Modified;
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index");
            }
            ViewBag.Existing = existing;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            AccountHead accountheadexist = db.AccountHeads.Include(a => a.CurrentAccountGroup).Include(a => a.CurrentAccountGroup.CurrentAccountCategory).Where(a => a.AccountHeadID == accounthead.AccountHeadID).FirstOrDefault();

            ViewBag.AccountCategoryID = accounthead.CurrentAccountGroup.CurrentAccountCategory.Name;
            ViewBag.AccountGroupID = new SelectList(db.AccountGroups.Include(a => a.CurrentAccountCategory).Where(a => a.CurrentAccountCategory.AccountCategoryID == accountheadexist.CurrentAccountGroup.AccountCategoryID), "AccountGroupID", "Name", accounthead.AccountGroupID);
            ViewBag.Existing = accounthead.Name;
            return View(accounthead);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _CreateHeadFor([Bind(Include = "AccountHeadID,Name,AccountGroupID")] AccountHead accounthead)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                AccountHead exist = db.AccountHeads.Where(c => c.Name == accounthead.Name).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Head already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }

                db.AccountHeads.Add(accounthead);
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
            }
            data.message = "/AccountHead/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult EditCategory(int id)
        {
            AccountCategory accountcategory = db.AccountCategorys.Find(id);
            ViewBag.Existing = accountcategory.Name;
            return View(accountcategory);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult EditCategory([Bind(Include = "AccountCategoryID,Name")] AccountCategory accountcategory, string existing)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (accountcategory.Name != existing)
                {
                    AccountCategory exist = db.AccountCategorys.Where(s => s.Name == accountcategory.Name && s.Name != existing).FirstOrDefault();
                    if (exist != null)
                    {
                        Session["err"] = "Category already exists";
                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(accountcategory);
                    }
                }

                db.Entry(accountcategory).State = EntityState.Modified;
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index");
            }
            ViewBag.Existing = existing;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(accountcategory);
        }
        public ActionResult EditGroup(int id)
        {
            AccountGroup accountgroup = db.AccountGroups.Include(a => a.CurrentAccountCategory).Where(a => a.AccountGroupID == id).FirstOrDefault();
            ViewBag.AccountCategoryID = new SelectList(db.AccountCategorys, "AccountCategoryID", "Name", accountgroup.AccountCategoryID);
            ViewBag.Existing = accountgroup.Name;
            return View(accountgroup);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult EditGroup([Bind(Include = "AccountGroupID,Name,AccountCategoryID")] AccountGroup accountgroup, string existing)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (accountgroup.Name != existing)
                {
                    AccountGroup exist = db.AccountGroups.Where(s => s.Name == accountgroup.Name && s.Name != existing).FirstOrDefault();
                    if (exist != null)
                    {
                        Session["err"] = "Group already exists";
                        ViewBag.AccountCategoryID = new SelectList(db.AccountCategorys, "AccountCategoryID", "Name", accountgroup.AccountCategoryID);
                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(accountgroup);
                    }
                }

                db.Entry(accountgroup).State = EntityState.Modified;
                db.SaveChanges();

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index");
            }
            ViewBag.Existing = existing;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.AccountCategoryID = new SelectList(db.AccountCategorys, "AccountCategoryID", "Name", accountgroup.AccountCategoryID);
            return View(accountgroup);
        }

        [SessionDelete]
        public ActionResult DeleteCategory(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                AccountCategory accountcategory = db.AccountCategorys.Find(id);
                db.AccountCategorys.Remove(accountcategory);
                db.SaveChanges();
                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }
        [SessionDelete]
        public ActionResult DeleteGroup(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                AccountGroup accountgroup = db.AccountGroups.Find(id);
                db.AccountGroups.Remove(accountgroup);
                db.SaveChanges();
                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }
        [SessionDelete]
        public ActionResult DeleteHead(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                AccountHead accounthead = db.AccountHeads.Find(id);
                db.AccountHeads.Remove(accounthead);
                db.SaveChanges();
                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }

        public ActionResult CategoryName(int id)
        {
            AccountCategory x = db.AccountCategorys.Find(id);
            return PartialView(x);
        }
        public ActionResult GroupName(int id)
        {
            AccountGroup x = db.AccountGroups.Find(id);
            return PartialView(x);
        }
        public ActionResult HeadName(int id)
        {
            AccountHead x = db.AccountHeads.Find(id);
            return PartialView(x);
        }
        public JsonResult FilterGroup(int id)
        {
            IEnumerable<SelectListItem> subjectlist = (from p in db.AccountGroups.Where(s => s.AccountGroupID == id) select p).AsEnumerable().Select(p => new SelectListItem() { Text = p.Name, Value = p.AccountGroupID.ToString() });
            return Json(subjectlist, JsonRequestBehavior.AllowGet);
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
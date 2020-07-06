using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using learnersmate.Models;
using SelectPdf;
using Microsoft.Owin.Security;
using learnersmate.Context;
using learnersmate.Filters;
namespace learnersmate.Controllers
{
    [SessionCheck]
    public class FeeBookController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";

            int companyacademicyearid = Convert.ToInt16(Session["CompanyAcademicYearID"].ToString());
            int roleid = Convert.ToInt16(Session["RoleID"].ToString());
            int userid = Convert.ToInt16(Session["UserID"].ToString());
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            var students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.SchoolID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    Parent parent = db.Parents.Where(p => p.UserID == userid).FirstOrDefault();
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.ParentID == parent.ParentID).OrderBy(s => s.Name).ToList();
                    break;
                case 5:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return View(students);
        }
        // GET: /FeeInstalments/
        public ActionResult IndexFeeInstalments(int id)
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
			ViewBag.StudentID = id;
            var feeInstalments = db.FeeBooks.Include(e => e.CurrentStudent).Where(e => e.StudentID == id).OrderBy(e => e.FeeBookID).ToList();
            return View(feeInstalments);
        }
        [SessionCreate]
        public ActionResult Create(int id)
        {
            Student student = db.Students.Find(id);
            FeeBook feeInstalments = new FeeBook();
            feeInstalments.StudentID = id;
            feeInstalments.Amount = Convert.ToDecimal(Convert.ToDecimal(student.Fee / student.FeeInstalments).ToString("#,##0.00")); 

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(feeInstalments);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Create([Bind(Include = "FeeInstalmentsID,StudentID,Title,Amount,Dop")] FeeBook feeinstalments)
        {
            bool result = false;
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                FeeBook exist = db.FeeBooks.Where(s => s.Title == feeinstalments.Title && s.StudentID == feeinstalments.StudentID).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Fee Instalment already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.FeeBooks.Add(feeinstalments);
                db.SaveChanges();
                result = true;
                if (result == true)
                {
                    //Account
                    int feedebitaccount = 0;
                    int salarydebitaccount = 0;
                    
                    int feecreditaccount = 0;
                    int salarycreditaccount = 0;

                    var acheadassignList = db.AccountHeadAssigns.ToList();
                    foreach (AccountHeadAssign acheadassign in acheadassignList)
                    {
                        if (acheadassign.HeadAssignID == 1)
                        {
                            feedebitaccount = acheadassign.AccountHeadID;
                        }

                        if (acheadassign.HeadAssignID == 2)
                        {
                            feecreditaccount = acheadassign.AccountHeadID;
                        }
                        if (acheadassign.HeadAssignID == 3)
                        {
                            salarydebitaccount = acheadassign.AccountHeadID;
                        }
                        if (acheadassign.HeadAssignID == 4)
                        {
                            salarycreditaccount = acheadassign.AccountHeadID;
                        }
                    }

                    Student student = db.Students.Find(feeinstalments.StudentID);
                    string voucherno = "ST" + student.IdCard + "-" + feeinstalments.FeeBookID.ToString();
                    var accountjournals = db.AccountJournals.Where(a => a.VoucherNo == voucherno).ToList();
                    foreach (AccountJournal accountjournal1 in accountjournals)
                    {
                        var accountjournaldetails = db.AccountJournalDetails.Where(a => a.AccountJournalID == accountjournal1.AccountJournalID).ToList();
                        foreach (AccountJournalDetail accountjournaldetail1 in accountjournaldetails)
                        {
                            db.AccountJournalDetails.Remove(accountjournaldetail1);

                        }
                        db.SaveChanges();
                        db.AccountJournals.Remove(accountjournal1);
                    }
                    db.SaveChanges();

                    AccountJournal accountjournal = new AccountJournal();
                    accountjournal.VoucherNo = voucherno;
                    accountjournal.VoucherType = voucherno.Substring(0, 2);
                    accountjournal.TransactionDate = feeinstalments.Dop;
                    accountjournal.BranchID = int.Parse(Session["SchoolID"].ToString());
                    accountjournal.FinancialYearID = int.Parse(Session["AcademicYearID"].ToString());
                    accountjournal.UserID = Session["UserID"].ToString();
                    accountjournal.Remarks = "Student Fee";
                    db.AccountJournals.Add(accountjournal);
                    db.SaveChanges();
                    
                    //debit
                    AccountJournalDetail accountjournaldetail = new AccountJournalDetail();
                    if (feeinstalments.Amount > 0)
                    {
                        accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                        accountjournaldetail.AccountHeadID = feedebitaccount;
                        accountjournaldetail.AnalysisHeadID = 0;
                        accountjournaldetail.Amount = feeinstalments.Amount;
                        accountjournaldetail.Remarks = "Student Fee: " + student.Name + ", Detail: " + feeinstalments.Title + ", fee Debit";
                        db.AccountJournalDetails.Add(accountjournaldetail);
                        db.SaveChanges();
                    }

                    //credit
                    if (feeinstalments.Amount > 0)
                    {
                        accountjournaldetail = new AccountJournalDetail();
                        accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                        accountjournaldetail.AccountHeadID = feecreditaccount;
                        accountjournaldetail.AnalysisHeadID = 0;
                        accountjournaldetail.Amount = feeinstalments.Amount * -1;
                        accountjournaldetail.Remarks = "Student Fee: " + student.Name + ", Detail: " + feeinstalments.Title + ", fee credit";
                        db.AccountJournalDetails.Add(accountjournaldetail);
                        db.SaveChanges();

                    }
                }

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
            }
            data.message = Session["msg"].ToString();
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /FeeInstalments/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeeBook feeInstalments = db.FeeBooks.Find(id);
            if (feeInstalments == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = feeInstalments.Title + feeInstalments.StudentID;
            return View(feeInstalments);
        }

        // POST: /FeeInstalments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "FeeBookID,StudentID,Title,Amount,Dop")] FeeBook feeinstalments, string existing)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (feeinstalments.Title + feeinstalments.StudentID != existing)
                {
                    FeeBook feeInstalmentsexisting = db.FeeBooks.Where(s => s.Title == feeinstalments.Title && s.StudentID == feeinstalments.StudentID).FirstOrDefault();
                    if (feeInstalmentsexisting != null)
                    {
                        Session["err"] = "Topic already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(feeinstalments);
                    }
                }

                db.Entry(feeinstalments).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index");
            }
            ViewBag.Existing = existing;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(feeinstalments);
        }

        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                FeeBook feeInstalments = db.FeeBooks.Find(id);
                db.FeeBooks.Remove(feeInstalments);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index", "FeeBook");
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

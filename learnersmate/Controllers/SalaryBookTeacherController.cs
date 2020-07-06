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
    public class SalaryBookTeacherController : Controller
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
            var teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.SchoolID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == userid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.SchoolID == 0).ToList();
                    break;
                case 5:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                case 6:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return View(teachers);
        }
        // GET: /SalaryInstalments/
        public ActionResult IndexSalaryInstalments(int id)
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
			ViewBag.TeacherID = id;
            var salaryInstalments = db.SalaryBookTeachers.Include(e => e.CurrentTeacher).Where(e => e.TeacherID == id).OrderBy(e => e.SalaryBookID).ToList();
            return View(salaryInstalments);
        }
        [SessionCreate]
        public ActionResult Create(int id)
        {
            Teacher teacher = db.Teachers.Find(id);
            SalaryBookTeacher salaryInstalments = new SalaryBookTeacher();
            salaryInstalments.TeacherID = id;
            salaryInstalments.Amount = teacher.Salary;

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(salaryInstalments);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Create([Bind(Include = "SalaryInstalmentsID,TeacherID,Title,Amount,Dop")] SalaryBookTeacher salaryinstalments)
        {
            bool result = false;
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                SalaryBookTeacher exist = db.SalaryBookTeachers.Where(s => s.Title == salaryinstalments.Title && s.TeacherID == salaryinstalments.TeacherID).FirstOrDefault();
                if (exist != null)
                {
                    Session["err"] = "Salary Instalment already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                db.SalaryBookTeachers.Add(salaryinstalments);
                db.SaveChanges();

                ModelState.Clear();

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

                    Teacher teacher = db.Teachers.Find(salaryinstalments.TeacherID);
                    string voucherno = "EM" + teacher.IdCard + "-" + salaryinstalments.SalaryBookID.ToString();
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
                    accountjournal.TransactionDate = salaryinstalments.Dop;
                    accountjournal.BranchID = int.Parse(Session["SchoolID"].ToString());
                    accountjournal.FinancialYearID = int.Parse(Session["AcademicYearID"].ToString());
                    accountjournal.UserID = Session["UserID"].ToString();
                    accountjournal.Remarks = "Teacher Salary";
                    db.AccountJournals.Add(accountjournal);
                    db.SaveChanges();

                    //debit
                    AccountJournalDetail accountjournaldetail = new AccountJournalDetail();
                    if (salaryinstalments.Amount > 0)
                    {
                        accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                        accountjournaldetail.AccountHeadID = feedebitaccount;
                        accountjournaldetail.AnalysisHeadID = 0;
                        accountjournaldetail.Amount = salaryinstalments.Amount;
                        accountjournaldetail.Remarks = "Teacher Salary: " + teacher.Name + ", Detail: " + salaryinstalments.Title + ", salary Debit";
                        db.AccountJournalDetails.Add(accountjournaldetail);
                        db.SaveChanges();
                    }

                    //credit
                    if (salaryinstalments.Amount > 0)
                    {
                        accountjournaldetail = new AccountJournalDetail();
                        accountjournaldetail.AccountJournalID = accountjournal.AccountJournalID;
                        accountjournaldetail.AccountHeadID = feecreditaccount;
                        accountjournaldetail.AnalysisHeadID = 0;
                        accountjournaldetail.Amount = salaryinstalments.Amount * -1;
                        accountjournaldetail.Remarks = "Teacher Salary: " + teacher.Name + ", Detail: " + salaryinstalments.Title + ", salary credit";
                        db.AccountJournalDetails.Add(accountjournaldetail);
                        db.SaveChanges();

                    }
                }

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
            }
            data.message = Session["msg"].ToString();
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /SalaryInstalments/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalaryBookTeacher salaryInstalments = db.SalaryBookTeachers.Find(id);
            if (salaryInstalments == null)
            {
                return HttpNotFound();
            }
            ViewBag.Existing = salaryInstalments.Title + salaryInstalments.TeacherID;
            return View(salaryInstalments);
        }

        // POST: /SalaryInstalments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SalaryBookID,TeacherID,Title,Amount,Dop")] SalaryBookTeacher salaryinstalments, string existing)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                if (salaryinstalments.Title + salaryinstalments.TeacherID != existing)
                {
                    SalaryBookTeacher salaryInstalmentsexisting = db.SalaryBookTeachers.Where(s => s.Title == salaryinstalments.Title && s.TeacherID == salaryinstalments.TeacherID).FirstOrDefault();
                    if (salaryInstalmentsexisting != null)
                    {
                        Session["err"] = "Topic already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                        return View(salaryinstalments);
                    }
                }

                db.Entry(salaryinstalments).State = EntityState.Modified;
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
            return View(salaryinstalments);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                SalaryBookTeacher salaryInstalments = db.SalaryBookTeachers.Find(id);
                db.SalaryBookTeachers.Remove(salaryInstalments);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index", "SalaryBookTeacher");
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

using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.IO;
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
    public class StudentController : Controller
    {
        private DatabaseContext db = new DatabaseContext();        
        // GET: /Student/
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
            var students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.SchoolID == 0).OrderBy(s => s.ClassID).ToList();
            switch (roleid)
            {
                case 1:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).OrderBy(s => s.ClassID).ToList();
                    break;
                case 3:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).OrderBy(s => s.ClassID).ToList();
                    break;
                case 4:
                    Parent parent = db.Parents.Where(p => p.UserID == userid).FirstOrDefault();
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.ParentID == parent.ParentID).OrderBy(s => s.Name).OrderBy(s => s.ClassID).ToList();
                    break;
                case 5:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).OrderBy(s => s.ClassID).ToList();
                    break;
                default:
                    break;
            }
            return View(students);
        }

        // GET: /Student/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.StudentID == id).FirstOrDefault();
            if (student == null)
            {
                return HttpNotFound();
            }

            return View(student);
        }

        // GET: /Student/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = ""; 
            ViewBag.SchoolID = new SelectList(db.Schools, "SchoolID", "Name");
            ViewBag.ParentID = new SelectList(db.Parents, "ParentID", "Name");
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name");
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name");
           
            int maxId = 1;
            try {
                maxId = (from c in db.Students select c.StudentID).Max();
                maxId = maxId + 1;
            }
            catch { }            

            StudentModel studentmodel = new StudentModel();           
            studentmodel.UserID = 0;
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            School school = db.Schools.Find(schoolid);
            studentmodel.Dob = null;
            studentmodel.SchoolID = schoolid;
            studentmodel.ParentID = 0;
            studentmodel.IdCard = "" + school.ShortName.ToUpper() + "STU" + maxId.ToString("D" + 6);
            studentmodel.ClassID = 0;
            studentmodel.SectionID = 0;
            studentmodel.Fee = 0.00M;
            studentmodel.FeeInstalments = 3;
            studentmodel.Status = true;
            return View(studentmodel);
        }
        
        
        // POST: /Student/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [SessionCreate]
        public ActionResult Create([Bind(Include = "StudentID,Name,IdCard,Dob,Mobile,ClassID,SectionID,GuardianName,GuardianMobile,GuardianEmail,Parent2Name,Parent2Mobile,Parent2Email,Photo,SchoolID,ParentID,UserID,Fee,FeeInstalments,Status,Email,Password")] StudentModel studentmodel, HttpPostedFileBase uploadlogo, string newlogo)        
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (studentmodel.Fee <= 0)
            {
                Session["err"] = "Fee required";
                data.message = Session["err"].ToString();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            if (studentmodel.Name != null)
            {     
                try
                {
                    User studentold = db.Users.Where(s => s.Email == studentmodel.Email).FirstOrDefault();
                    if (studentold != null)
                    {
                        Session["err"] = "Email already exists";                       
                        data.message = Session["err"].ToString();                       
                        return Json(data, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        
                        if (newlogo != "")
                        {
                            studentmodel.Photo = newlogo;
                        }
                        User superadminuser = db.Users.Find(1);

                        User user = new User();
                        user.Email = studentmodel.Email;
                        user.Password = studentmodel.Password;
                        user.CanCreate = false;
                        user.CanEdit = false;
                        user.CanDelete = false;
                        user.CanPrint = false;
                        user.Status = false;
                        user.CreatedOn = DateTime.Now;
                        user.LastLoggedOn = null;
                        db.Users.Add(user);
                        db.SaveChanges();

                        Role role = db.Roles.Where(r => r.Name == "Student").FirstOrDefault();
                        UserRole userroles = new UserRole();
                        userroles.UserID = user.UserID;
                        userroles.RoleID = role.RoleID;
                        db.UserRoles.Add(userroles);
                        db.SaveChanges();

                        Student student = new Student();
                        student.Name = studentmodel.Name;
                        student.IdCard = studentmodel.IdCard;
                        student.Dob = studentmodel.Dob;
                        student.Mobile = studentmodel.Mobile;                        
                        student.ClassID = studentmodel.ClassID;
                        student.SectionID = studentmodel.SectionID;

						student.Photo = studentmodel.Photo;                       
                        student.SchoolID = studentmodel.SchoolID;
                        student.ParentID = studentmodel.ParentID;  
                        student.UserID = user.UserID;
                        student.Fee = studentmodel.Fee;
                        student.FeeInstalments = studentmodel.FeeInstalments;
                        student.Status = studentmodel.Status;

                        student.GuardianName = studentmodel.GuardianName;
                        student.GuardianMobile = studentmodel.GuardianMobile;
                        student.GuardianEmail = studentmodel.GuardianEmail;

                        student.Parent2Name = studentmodel.Parent2Name;
                        student.Parent2Mobile = studentmodel.Parent2Mobile;
                        student.Parent2Email = studentmodel.Parent2Email;  

                        db.Students.Add(student);
                        db.SaveChanges();

                        int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
                        School school = db.Schools.Find(schoolid);

                        student.IdCard = "" + school.ShortName.ToUpper() + "STU" + student.StudentID.ToString("D" + 6);
                        db.Entry(student).State = EntityState.Modified;
                        db.SaveChanges();

                        user.Status = true;
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();

                        string To = studentmodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                        CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                        string subject = "New Student Created";
                        string body = "Hi,";
                        body += "<br/> Student was created. Please login using these credentials, and update student profile. <br/> Login email : " + studentmodel.Email;
                        body += "<br/> Login password : " + studentmodel.Password;
                        body += "<br/> <br/> ----------------------";
                        body += "<br/> Admin";
                        body += "<br/> <a href=" + WebsiteUrl + ">" + WebsiteUrl + "</a>";
                        try { CommanFunctions.SendEmail(UserID, subject, body, superadminuser.Email, To, Ssl, UserID, Password, SMTPPort, Host); }
                        catch {
                            //Session["err"] = "Email sending failed, please check smtp configuration.";                            
                            //data.message = Session["err"].ToString();                            
                            //return Json(data, JsonRequestBehavior.AllowGet);
                        }

                        Session["err"] = "";
                        Session["msg"] = "Created Successfully";
                       
                    }
                    
                }
               catch
                {
                   data.message = Session["err"].ToString();                  
                   return Json(data, JsonRequestBehavior.AllowGet);
               }                
                
            }
           
            data.message = "/Student/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /Student/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            User user = db.Users.Find(student.UserID);
            School school = db.Schools.Find(student.SchoolID);
            Parent parent = db.Parents.Include(p => p.CurrentUser).Include(p => p.CurrentCity).Include(p => p.CurrentCountry).Where(p => p.ParentID == student.ParentID).FirstOrDefault();

            StudentModel studentmodel = new StudentModel();            
            studentmodel.StudentID = student.StudentID;
            studentmodel.Name = student.Name;
            studentmodel.Dob = student.Dob;
            studentmodel.Mobile = student.Mobile;
            studentmodel.IdCard = student.IdCard;
            studentmodel.ClassID = student.ClassID;
            studentmodel.SectionID = student.SectionID;

            studentmodel.GuardianName = student.GuardianName;
            studentmodel.GuardianMobile = student.GuardianMobile;
            studentmodel.GuardianEmail = student.GuardianEmail;

            studentmodel.Parent2Name = student.Parent2Name;
            studentmodel.Parent2Mobile = student.Parent2Mobile;
            studentmodel.Parent2Email = student.Parent2Email;  

			studentmodel.Photo = student.Photo;
            studentmodel.SchoolID = student.SchoolID;
            studentmodel.ParentID = student.ParentID;  
            studentmodel.UserID = student.UserID;
            studentmodel.Fee = student.Fee;
            studentmodel.FeeInstalments = student.FeeInstalments;
            studentmodel.Status = student.Status;
            studentmodel.Email = user.Email;
            studentmodel.Password = user.Password;


            studentmodel.SchoolName = school.Name;
            studentmodel.ParentHouseNo = parent.HouseNo;
            studentmodel.ParentBuildingName = parent.BuildingName;
            studentmodel.ParentStreet = parent.Street;
            studentmodel.ParentArea = parent.Area;
            studentmodel.ParentLocation = parent.Location;
            studentmodel.ParentCity = parent.CurrentCity.Name;
            studentmodel.ParentCountry = parent.CurrentCountry.Name;
            studentmodel.ParentPinCode = parent.PinCode;
            studentmodel.ParentLandline = parent.Landline;
            studentmodel.ParentMobile = parent.Mobile;
            studentmodel.ParentEmail = parent.CurrentUser.Email;

           
            if (student == null)
            {
                return HttpNotFound();
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";

            ViewBag.ExistingEmail = user.Email;
            ViewBag.CompanyID = "1";
            ViewBag.SchoolID = new SelectList(db.Schools, "SchoolID", "Name", school.SchoolID);
            ViewBag.ParentID = new SelectList(db.Parents, "ParentID", "Name", parent.ParentID);
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", student.ClassID);
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", student.SectionID);   
            return View(studentmodel);
        }

        // POST: /Student/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [SessionEdit]
        public ActionResult Edit([Bind(Include = "StudentID,Name,IdCard,Dob,Mobile,ClassID,SectionID,GuardianName,GuardianMobile,GuardianEmail,Parent2Name,Parent2Mobile,Parent2Email,Photo,SchoolID,ParentID,UserID,Status,Fee,FeeInstalments,Email,Password")] StudentModel studentmodel, HttpPostedFileBase uploadlogo, string newlogo, string existingemail)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try 
            {
                if (studentmodel.Email != "")
                {
                    if (studentmodel.Email != existingemail)
                    {
                        User studentold = db.Users.Where(s => s.Email == studentmodel.Email).FirstOrDefault();
                        if (studentold != null)
                        {
                            Session["err"] = "Email already exists";
                            data.message = Session["err"].ToString();
                            return Json(data, JsonRequestBehavior.AllowGet);
                        }
                    }
                    if (newlogo != "")
                    {
                        studentmodel.Photo = newlogo;
                    }

                    User superadminuser = db.Users.Find(1);

                    User user = db.Users.Find(studentmodel.UserID);
                    user.Email = studentmodel.Email;
                    user.Password = studentmodel.Password;
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    Student student = db.Students.Find(studentmodel.StudentID);
                    student.Name = studentmodel.Name;
                    student.Dob = studentmodel.Dob;
                    student.Mobile = studentmodel.Mobile;
                    student.IdCard = studentmodel.IdCard;
                    student.ClassID = studentmodel.ClassID;
                    student.SectionID = studentmodel.SectionID;

                    student.Photo = studentmodel.Photo;
                    student.SchoolID = studentmodel.SchoolID;
                    student.ParentID = studentmodel.ParentID;
                    student.UserID = studentmodel.UserID;
                    student.Fee = studentmodel.Fee;
                    student.FeeInstalments = studentmodel.FeeInstalments;
                    student.Status = studentmodel.Status;

                    student.GuardianName = studentmodel.GuardianName;
                    student.GuardianMobile = studentmodel.GuardianMobile;
                    student.GuardianEmail = studentmodel.GuardianEmail;

                    student.Parent2Name = studentmodel.Parent2Name;
                    student.Parent2Mobile = studentmodel.Parent2Mobile;
                    student.Parent2Email = studentmodel.Parent2Email;

                    db.Entry(student).State = EntityState.Modified;
                    db.SaveChanges();

                    string To = studentmodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                    CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                    string subject = "Student Modified";
                    string body = "Hi,";
                    body += "<br/> Student was modified. Please login using these credentials, and update student profile. <br/> Login email : " + studentmodel.Email;
                    body += "<br/> Login password : " + studentmodel.Password;
                    body += "<br/> <br/> ----------------------";
                    body += "<br/> Admin";
                    body += "<br/> <a href=" + WebsiteUrl + ">" + WebsiteUrl + "</a>";
                    try { CommanFunctions.SendEmail(UserID, subject, body, superadminuser.Email, To, Ssl, UserID, Password, SMTPPort, Host); }
                    catch
                    {
                        //Session["err"] = "Email sending failed, please check smtp configuration.";
                        //data.message = Session["err"].ToString();
                        //return Json(data, JsonRequestBehavior.AllowGet);
                    }

                    Session["err"] = "";
                    Session["msg"] = "Modified Successfully";
                }
            }
            catch {
                data.message = Session["err"].ToString();
                return Json(data, JsonRequestBehavior.AllowGet);
            }

            data.message = "/Student/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                Student student = db.Students.Find(id);
                student.Status = false;
                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deactivated Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }
        public ActionResult _ClassPartial(int? id)
        {
            ViewBag.ClassID = new SelectList(db.Classes, "ClassID", "Name", id);
            return PartialView();
        }

        public ActionResult _SectionPartial(int? id)
        {
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", id);
            return PartialView();
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

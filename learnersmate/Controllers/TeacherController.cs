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
    public class TeacherController : Controller
    {
        private DatabaseContext db = new DatabaseContext();        
        // GET: /Teacher/
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
            var teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.TeacherID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 5:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return View(teachers);
        }

        // GET: /Teacher/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Teacher teacher = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.TeacherID == id).FirstOrDefault();
            if (teacher == null)
            {
                return HttpNotFound();
            }

            return View(teacher);
        }

        // GET: /Teacher/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";            
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name");
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name");
            ViewBag.SchoolID = new SelectList(db.Schools, "SchoolID", "Name");

            int maxId = 1;
            try
            {
                maxId = (from c in db.Teachers select c.TeacherID).Max();
                maxId = maxId + 1;
            }
            catch { }

            TeacherModel teachermodel = new TeacherModel();
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            School school = db.Schools.Find(schoolid);
            teachermodel.SchoolID = schoolid;
            teachermodel.IdCard = "" + school.ShortName.ToUpper() + "TEA" + maxId.ToString("D" + 6);
            teachermodel.UserID = 0;
            teachermodel.LeavesToAvail = 10;
            teachermodel.Salary = 0.00M;
            teachermodel.Status = true;
            return View(teachermodel);
        }
        
        
        // POST: /Teacher/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TeacherID,Name,IdCard,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Photo,SchoolID,UserID,LeavesToAvail,Salary,Status,Email,Password")] TeacherModel teachermodel, HttpPostedFileBase uploadlogo,string newlogo)        
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (teachermodel.Salary <= 0)
            {
                Session["err"] = "Salary required";
                data.message = Session["err"].ToString();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            if (teachermodel.Name != null)
            {     
                try
                {
                    User teacherold = db.Users.Where(s => s.Email == teachermodel.Email).FirstOrDefault();
                    if (teacherold != null)
                    {
                        Session["err"] = "Email already exists";                       
                        data.message = Session["err"].ToString();                       
                        return Json(data, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        
                        if (newlogo != "")
                        {
                            teachermodel.Photo = newlogo;
                        }
                        User superadminuser = db.Users.Find(1);

                        User user = new User();
                        user.Email = teachermodel.Email;
                        user.Password = teachermodel.Password;
                        user.CanCreate = false;
                        user.CanEdit = false;
                        user.CanDelete = false;
                        user.CanPrint = false;
                        user.Status = false;
                        user.CreatedOn = DateTime.Now;
                        user.LastLoggedOn = null;
                        db.Users.Add(user);
                        db.SaveChanges();
                      

                        Role role = db.Roles.Where(r => r.Name == "Teacher").FirstOrDefault();
                        UserRole userroles = new UserRole();
                        userroles.UserID = user.UserID;
                        userroles.RoleID = role.RoleID;
                        db.UserRoles.Add(userroles);
                        db.SaveChanges();

                        Teacher teacher = new Teacher();
                        teacher.Name = teachermodel.Name;
                        teacher.IdCard = teachermodel.IdCard;
                        teacher.HouseNo = teachermodel.HouseNo;
                        teacher.BuildingName = teachermodel.BuildingName;
                        teacher.Street = teachermodel.Street;
                        teacher.Area = teachermodel.Area;
                        teacher.Location = teachermodel.Location;
                        teacher.CityID = teachermodel.CityID;
                        teacher.CountryID = teachermodel.CountryID;
                        teacher.PinCode = teachermodel.PinCode;
                        teacher.Landline = teachermodel.Landline;
                        teacher.Mobile = teachermodel.Mobile;    
						teacher.Photo = teachermodel.Photo; 
                        teacher.SchoolID = teachermodel.SchoolID;    
                        teacher.UserID = user.UserID;
                        teacher.LeavesToAvail = teachermodel.LeavesToAvail;
                        teacher.Salary = teachermodel.Salary;
                        teacher.Status = teachermodel.Status;
                        db.Teachers.Add(teacher);
                        db.SaveChanges();

                        int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
                        School school = db.Schools.Find(schoolid);

                        teacher.IdCard = "" + school.ShortName.ToUpper() + "TEA" + teacher.TeacherID.ToString("D" + 6);
                        db.Entry(teacher).State = EntityState.Modified;
                        db.SaveChanges();

                        user.Status = true;
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();

                        string To = teachermodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                        CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                        string subject = "New Teacher Created";
                        string body = "Hi,";
                        body += "<br/> Teacher was created. Please login using these credentials, and update teacher profile. <br/> Login email : " + teachermodel.Email;
                        body += "<br/> Login password : " + teachermodel.Password;
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
           
            data.message = "/Teacher/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /Teacher/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Teacher teacher = db.Teachers.Find(id);
            User user = db.Users.Find(teacher.UserID);
            TeacherModel teachermodel = new TeacherModel();            
            teachermodel.TeacherID = teacher.TeacherID;
            teachermodel.Name = teacher.Name;
            teachermodel.IdCard = teacher.IdCard;
            teachermodel.HouseNo = teacher.HouseNo;
            teachermodel.BuildingName = teacher.BuildingName;
            teachermodel.Street = teacher.Street;
            teachermodel.Area = teacher.Area;
            teachermodel.Location = teacher.Location;
            teachermodel.CityID = teacher.CityID;
            teachermodel.CountryID = teacher.CountryID;
            teachermodel.PinCode = teacher.PinCode;
            teachermodel.Landline = teacher.Landline;
            teachermodel.Mobile = teacher.Mobile;   
			teachermodel.Photo = teacher.Photo;
            teachermodel.SchoolID = teacher.SchoolID;    
            teachermodel.UserID = teacher.UserID;
            teachermodel.LeavesToAvail = teacher.LeavesToAvail;
            teachermodel.Salary = teacher.Salary;
            teachermodel.Status = teacher.Status;
            teachermodel.Email = user.Email;
            teachermodel.Password = user.Password;

            if (teacher == null)
            {
                return HttpNotFound();
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";

            ViewBag.ExistingEmail = user.Email;
            ViewBag.CompanyID = "1";
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name", teacher.CityID);
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", teacher.CountryID);
            ViewBag.SchoolID = new SelectList(db.Schools, "SchoolID", "Name", teacher.SchoolID);
            return View(teachermodel);
        }

        // POST: /Teacher/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TeacherID,Name,IdCard,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Photo,SchoolID,UserID,LeavesToAvail,Salary,Status,Email,Password")] TeacherModel teachermodel, HttpPostedFileBase uploadlogo, string newlogo, string existingemail)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try 
            {
                if (ModelState.IsValid)
                {
                    if (teachermodel.Email != existingemail)
                    {
                        User teacherold = db.Users.Where(s => s.Email == teachermodel.Email).FirstOrDefault();
                        if (teacherold != null)
                        {
                            Session["err"] = "Email already exists";
                            data.message = Session["err"].ToString();
                            return Json(data, JsonRequestBehavior.AllowGet);
                        }
                    }
                    if (newlogo != "")
                    {
                        teachermodel.Photo = newlogo;
                    }

                    User superadminuser = db.Users.Find(1);

                    User user = db.Users.Find(teachermodel.UserID);
                    user.Email = teachermodel.Email;
                    user.Password = teachermodel.Password;
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    Teacher teacher = db.Teachers.Find(teachermodel.TeacherID);
                    teacher.Name = teachermodel.Name;
                    teacher.IdCard = teachermodel.IdCard;
                    teacher.HouseNo = teachermodel.HouseNo;
                    teacher.BuildingName = teachermodel.BuildingName;
                    teacher.Street = teachermodel.Street;
                    teacher.Area = teachermodel.Area;
                    teacher.Location = teachermodel.Location;
                    teacher.CityID = teachermodel.CityID;
                    teacher.CountryID = teachermodel.CountryID;
                    teacher.PinCode = teachermodel.PinCode;
                    teacher.Landline = teachermodel.Landline;
                    teacher.Mobile = teachermodel.Mobile;
                    teacher.Photo = teachermodel.Photo;
                    teacher.SchoolID = teachermodel.SchoolID;
                    teacher.UserID = teachermodel.UserID;
                    teacher.LeavesToAvail = teachermodel.LeavesToAvail;
                    teacher.Salary = teachermodel.Salary;
                    teacher.Status = teachermodel.Status;
                   
                    //School school = db.Schools.Find(teachermodel.SchoolID);
                    //teacher.IdCard = "" + school.ShortName.ToUpper() + "TEA" + teachermodel.TeacherID.ToString("D" + 6);
                    db.Entry(teacher).State = EntityState.Modified;
                    db.SaveChanges();

                    string To = teachermodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                    CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                    string subject = "Teacher Modified";
                    string body = "Hi,";
                    body += "<br/> Teacher was modified. Please login using these credentials, and update teacher profile. <br/> Login email : " + teachermodel.Email;
                    body += "<br/> Login password : " + teachermodel.Password;
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

            data.message = "/Teacher/Index";
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
                Teacher teacher = db.Teachers.Find(id);
                teacher.Status = false;
                db.Entry(teacher).State = EntityState.Modified;
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deactivated Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }
        
        public ActionResult _CityPartial(int? id)
        {
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name", id);
            return PartialView();
        }

        public ActionResult _CountryPartial(int? id)
        {
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", id);
            return PartialView();
        }

        public ActionResult _CurrencyPartial(int? id)
        {
            ViewBag.CurrencyID = new SelectList(db.Currencys, "CurrencyID", "Name", id);
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

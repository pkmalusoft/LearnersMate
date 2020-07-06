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
    public class ParentController : Controller
    {
        private DatabaseContext db = new DatabaseContext();        
        // GET: /Parent/
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
            var parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.ParentID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                case 5:
                    Student student = db.Students.Where(s => s.UserID == userid).FirstOrDefault();
                    int parentid = student.ParentID;
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.ParentID == parentid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return View(parents);
        }

        // GET: /Parent/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Parent parent = db.Parents.Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Include(s => s.CurrentUser).Where(s => s.ParentID == id).FirstOrDefault();
            if (parent == null)
            {
                return HttpNotFound();
            }

            return View(parent);
        }

        // GET: /Parent/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";            
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name");
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name");

            ParentModel parentmodel = new ParentModel();
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            parentmodel.SchoolID = schoolid;
            parentmodel.UserID = 0;
            parentmodel.Status = true;
            return View(parentmodel);
        }
        
        
        // POST: /Parent/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ParentID,Name,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Photo,SchoolID,UserID,Status,Email,Password")] ParentModel parentmodel, HttpPostedFileBase uploadlogo, string newlogo)        
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (parentmodel.Name != null)
            {     
                try
                {
                    User parentold = db.Users.Where(s => s.Email == parentmodel.Email).FirstOrDefault();
                    if (parentold != null)
                    {
                        Session["err"] = "Email already exists";                       
                        data.message = Session["err"].ToString();                       
                        return Json(data, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        
                        if (newlogo != "")
                        {
                            parentmodel.Photo = newlogo;
                        }
                        User superadminuser = db.Users.Find(1);

                        User user = new User();
                        user.Email = parentmodel.Email;
                        user.Password = parentmodel.Password;
                        user.CanCreate = false;
                        user.CanEdit = false;
                        user.CanDelete = false;
                        user.CanPrint = false;
                        user.Status = false;
                        user.CreatedOn = DateTime.Now;
                        user.LastLoggedOn = null;
                        db.Users.Add(user);
                        db.SaveChanges();
                                               

                        Role role = db.Roles.Where(r => r.Name == "Parent").FirstOrDefault();
                        UserRole userroles = new UserRole();
                        userroles.UserID = user.UserID;
                        userroles.RoleID = role.RoleID;
                        db.UserRoles.Add(userroles);
                        db.SaveChanges();

                        Parent parent = new Parent();
                        parent.Name = parentmodel.Name;
                        parent.HouseNo = parentmodel.HouseNo;
                        parent.BuildingName = parentmodel.BuildingName;
                        parent.Street = parentmodel.Street;
                        parent.Area = parentmodel.Area;
                        parent.Location = parentmodel.Location;
                        parent.CityID = parentmodel.CityID;
                        parent.CountryID = parentmodel.CountryID;
                        parent.PinCode = parentmodel.PinCode;
                        parent.Landline = parentmodel.Landline;
                        parent.Mobile = parentmodel.Mobile;    
						parent.Photo = parentmodel.Photo;
                        parent.SchoolID = parentmodel.SchoolID;                       
                        parent.UserID = user.UserID;                        
                        parent.Status = parentmodel.Status;
                        db.Parents.Add(parent);
                        db.SaveChanges();

                        user.Status = true;
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();

                        string To = parentmodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                        CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                        string subject = "New Parent Created";
                        string body = "Hi,";
                        body += "<br/> Parent was created. Please login using these credentials, and update parent profile. <br/> Login email : " + parentmodel.Email;
                        body += "<br/> Login password : " + parentmodel.Password;
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
               catch{                   
                   data.message = Session["err"].ToString();                  
                   return Json(data, JsonRequestBehavior.AllowGet);
               }                
                
            }
           
            data.message = "/Parent/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /Parent/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Parent parent = db.Parents.Find(id);
            User user = db.Users.Find(parent.UserID);
            ParentModel parentmodel = new ParentModel();            
            parentmodel.ParentID = parent.ParentID;
            parentmodel.Name = parent.Name;
            parentmodel.HouseNo = parent.HouseNo;
            parentmodel.BuildingName = parent.BuildingName;
            parentmodel.Street = parent.Street;
            parentmodel.Area = parent.Area;
            parentmodel.Location = parent.Location;
            parentmodel.CityID = parent.CityID;
            parentmodel.CountryID = parent.CountryID;
            parentmodel.PinCode = parent.PinCode;
            parentmodel.Landline = parent.Landline;
            parentmodel.Mobile = parent.Mobile;   
			parentmodel.Photo = parent.Photo;
            parentmodel.SchoolID = parent.SchoolID;           
            parentmodel.UserID = parent.UserID;           
            parentmodel.Status = parent.Status;
            parentmodel.Email = user.Email;
            parentmodel.Password = user.Password;

            if (parent == null)
            {
                return HttpNotFound();
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";

            ViewBag.ExistingEmail = user.Email;
            ViewBag.CompanyID = "1";
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name", parent.CityID);
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", parent.CountryID);
            return View(parentmodel);
        }

        // POST: /Parent/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ParentID,Name,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Photo,SchoolID,UserID,Status,Email,Password")] ParentModel parentmodel, HttpPostedFileBase uploadlogo, string newlogo, string existingemail)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try 
            {
                if (ModelState.IsValid)
                {
                    if (parentmodel.Email != existingemail)
                    {
                        User parentold = db.Users.Where(s => s.Email == parentmodel.Email).FirstOrDefault();
                        if (parentold != null)
                        {
                            Session["err"] = "Email already exists";
                            data.message = Session["err"].ToString();
                            return Json(data, JsonRequestBehavior.AllowGet);
                        }
                    }
                   
                       

                       if (newlogo != "")
                        {
                            parentmodel.Photo = newlogo;
                        }

                        User superadminuser = db.Users.Find(1);

                        User user = db.Users.Find(parentmodel.UserID);
                        user.Email = parentmodel.Email;
                        user.Password = parentmodel.Password;
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();

                        Parent parent = db.Parents.Find(parentmodel.ParentID);
                        parent.Name = parentmodel.Name;
                        parent.HouseNo = parentmodel.HouseNo;
                        parent.BuildingName = parentmodel.BuildingName;
                        parent.Street = parentmodel.Street;
                        parent.Area = parentmodel.Area;
                        parent.Location = parentmodel.Location;
                        parent.CityID = parentmodel.CityID;
                        parent.CountryID = parentmodel.CountryID;
                        parent.PinCode = parentmodel.PinCode;
                        parent.Landline = parentmodel.Landline;
                        parent.Mobile = parentmodel.Mobile;     
						parent.Photo = parentmodel.Photo;
                        parent.SchoolID = parentmodel.SchoolID;                        
                        parent.UserID = parentmodel.UserID;                        
                        parent.Status = parentmodel.Status;
                        db.Entry(parent).State = EntityState.Modified;
                        db.SaveChanges();

                        string To = parentmodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                        CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                        string subject = "Parent Modified";
                        string body = "Hi,";
                        body += "<br/> Parent was modified. Please login using these credentials, and update parent profile. <br/> Login email : " + parentmodel.Email;
                        body += "<br/> Login password : " + parentmodel.Password;
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

            data.message = "/Parent/Index";
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
                Parent parent = db.Parents.Find(id);
                parent.Status = false;
                db.Entry(parent).State = EntityState.Modified;
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

        public JsonResult GetDetail(ParentJsonModel data)
        {
            try {

                Parent parent = db.Parents.Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Include(s => s.CurrentUser).Where(s => s.ParentID == data.Id).FirstOrDefault();
                data.Id = parent.ParentID;
                data.ParentName = parent.Name;
                data.ParentHouseNo = parent.HouseNo;
                data.ParentBuildingName = parent.BuildingName;
                data.ParentStreet = parent.Street;
                data.ParentArea = parent.Area;
                data.ParentLocation = parent.Location;
                data.ParentCity = parent.CurrentCity.Name;
                data.ParentCountry = parent.CurrentCountry.Name;
                data.ParentPinCode = parent.PinCode;
                data.ParentLandline = parent.Landline;
                data.ParentMobile = parent.Mobile;
                data.ParentEmail = parent.CurrentUser.Email;
            }
            catch { }
            
            
            return Json(data, JsonRequestBehavior.AllowGet);
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

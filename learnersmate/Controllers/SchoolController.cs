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
    public class SchoolController : Controller
    {
        private DatabaseContext db = new DatabaseContext();        
        // GET: /School/
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
            var schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.SchoolID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:                    
                    schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 5:                   
                    schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return View(schools);   
        }

        // GET: /School/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            School school = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.SchoolID == id).FirstOrDefault();
            if (school == null)
            {
                return HttpNotFound();
            }

            return View(school);
        }

        // GET: /School/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";            
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name");
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name");

            int companyacademicyearid = Convert.ToInt16(Session["CompanyAcademicYearID"].ToString());
            SchoolModel schoolmodel = new SchoolModel();            
            schoolmodel.UserID = 0;
            schoolmodel.CompanyAcademicYearID = companyacademicyearid;
            schoolmodel.Status = true;
            return View(schoolmodel);
        }
        
        
        // POST: /School/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SchoolID,Name,ShortName,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Website,RegNo,Logo,Principal,UserID,CompanyAcademicYearID,Status,Email,Password")] SchoolModel schoolmodel, HttpPostedFileBase uploadlogo, string newlogo)        
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (schoolmodel.Name != null)
            {     
                try
                {
                    User schoolold = db.Users.Where(s => s.Email == schoolmodel.Email).FirstOrDefault();
                    if (schoolold != null)
                    {
                        Session["err"] = "Email already exists";                       
                        data.message = Session["err"].ToString();                       
                        return Json(data, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        //string newfilename = Guid.NewGuid().ToString();
                        //string logopath = schoolmodel.Logo;
                        //if (uploadlogo != null)
                        //{
                        //    var fileName = Path.GetFileName(uploadlogo.FileName);
                        //    var extention = Path.GetExtension(uploadlogo.FileName);
                        //    var filenamewithoutextension = Path.GetFileNameWithoutExtension(uploadlogo.FileName);
                        //    try
                        //    {
                        //        uploadlogo.SaveAs(Server.MapPath("/Uploads/" + newfilename + "." + extention));
                        //        logopath = "/Uploads/" + newfilename + "." + extention;
                        //        schoolmodel.Logo = logopath;
                        //    }
                        //    catch {
                        //        Session["err"] = "Can't upload file, please contact support";                                
                        //        data.message = Session["err"].ToString();                                
                        //        return Json(data, JsonRequestBehavior.AllowGet);
                        //    }
                        //}
                        if (newlogo != "")
                        {
                            schoolmodel.Logo = newlogo;
                        }
                        User superadminuser = db.Users.Find(1);

                        User user = new User();
                        user.Email = schoolmodel.Email;
                        user.Password = schoolmodel.Password;
                        user.CanCreate = false;
                        user.CanEdit = false;
                        user.CanDelete = false;
                        user.CanPrint = false;
                        user.Status = false;
                        user.CreatedOn = DateTime.Now;
                        user.LastLoggedOn = null;
                        db.Users.Add(user);
                        db.SaveChanges();
                        
                        Role role = db.Roles.Where(r => r.Name == "SchoolAdmin").FirstOrDefault();
                        UserRole userroles = new UserRole();
                        userroles.UserID = user.UserID;
                        userroles.RoleID = role.RoleID;
                        db.UserRoles.Add(userroles);
                        db.SaveChanges();

                        School school = new School();
                        school.Name = schoolmodel.Name;
                        school.ShortName = schoolmodel.ShortName;
                        school.HouseNo = schoolmodel.HouseNo;
                        school.BuildingName = schoolmodel.BuildingName;
                        school.Street = schoolmodel.Street;
                        school.Area = schoolmodel.Area;
                        school.Location = schoolmodel.Location;
                        school.CityID = schoolmodel.CityID;
                        school.CountryID = schoolmodel.CountryID;
                        school.PinCode = schoolmodel.PinCode;
                        school.Landline = schoolmodel.Landline;
                        school.Mobile = schoolmodel.Mobile;
                        school.Website = schoolmodel.Website;
                        school.RegNo = schoolmodel.RegNo;
                        school.Logo = schoolmodel.Logo;                        
                        school.Principal = schoolmodel.Principal;
                        school.UserID = user.UserID;
                        int companyacademicyearid = Convert.ToInt16(Session["CompanyAcademicYearID"].ToString());
                        school.CompanyAcademicYearID = companyacademicyearid;
                        school.Status = schoolmodel.Status;
                        db.Schools.Add(school);
                        db.SaveChanges();

                        user.Status = true;
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();

                        string To = schoolmodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                        CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                        string subject = "New School Created";
                        string body = "Hi,";
                        body += "<br/> School was created. Please login using these credentials, and update school profile. <br/> Login email : " + schoolmodel.Email;
                        body += "<br/> Login password : " + schoolmodel.Password;
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
           
            data.message = "/School/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /School/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            School school = db.Schools.Find(id);
            User user = db.Users.Find(school.UserID);
            SchoolModel schoolmodel = new SchoolModel();            
            schoolmodel.SchoolID = school.SchoolID;
            schoolmodel.Name = school.Name;
            schoolmodel.ShortName = school.ShortName;
            schoolmodel.HouseNo = school.HouseNo;
            schoolmodel.BuildingName = school.BuildingName;
            schoolmodel.Street = school.Street;
            schoolmodel.Area = school.Area;
            schoolmodel.Location = school.Location;
            schoolmodel.CityID = school.CityID;
            schoolmodel.CountryID = school.CountryID;
            schoolmodel.PinCode = school.PinCode;
            schoolmodel.Landline = school.Landline;
            schoolmodel.Mobile = school.Mobile;
            schoolmodel.Website = school.Website;
            schoolmodel.RegNo = school.RegNo;
            schoolmodel.Logo = school.Logo;            
            schoolmodel.Principal = school.Principal;
            schoolmodel.UserID = school.UserID;
            schoolmodel.CompanyAcademicYearID = school.CompanyAcademicYearID;
            schoolmodel.Status = school.Status;
            schoolmodel.Email = user.Email;
            schoolmodel.Password = user.Password;

            if (school == null)
            {
                return HttpNotFound();
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";

            ViewBag.ExistingEmail = user.Email;
            ViewBag.CompanyID = "1";
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name", school.CityID);
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", school.CountryID);
            return View(schoolmodel);
        }

        // POST: /School/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SchoolID,Name,ShortName,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Website,RegNo,Logo,Principal,UserID,CompanyAcademicYearID,Status,Email,Password")] SchoolModel schoolmodel, HttpPostedFileBase uploadlogo, string newlogo, string existingemail)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try 
            {
                if (ModelState.IsValid)
                {
                    if (schoolmodel.Email != existingemail)
                    {
                        User schoolold = db.Users.Where(s => s.Email == schoolmodel.Email).FirstOrDefault();
                        if (schoolold != null)
                        {
                            Session["err"] = "Email already exists";
                            data.message = Session["err"].ToString();
                            return Json(data, JsonRequestBehavior.AllowGet);
                        }
                    }
                   
                        //string newfilename = Guid.NewGuid().ToString();
                        //string logopath = schoolmodel.Logo;
                        //if (uploadlogo != null)
                        //{
                        //    var fileName = Path.GetFileName(uploadlogo.FileName);
                        //    var extention = Path.GetExtension(uploadlogo.FileName);
                        //    var filenamewithoutextension = Path.GetFileNameWithoutExtension(uploadlogo.FileName);
                        //    try
                        //    {
                        //        uploadlogo.SaveAs(Server.MapPath("/Uploads/" + newfilename + "." + extention));
                        //        logopath = "/Uploads/" + newfilename + "." + extention;
                        //        schoolmodel.Logo = logopath;
                        //    }
                        //    catch {
                        //        Session["err"] = "Can't upload file, please contact support";
                        //        data.message = Session["err"].ToString();
                        //        return Json(data, JsonRequestBehavior.AllowGet);
                        //    }

                        //}

                       if (newlogo != "")
                        {
                            schoolmodel.Logo = newlogo;
                        }

                        User superadminuser = db.Users.Find(1);

                        User user = db.Users.Find(schoolmodel.UserID);
                        user.Email = schoolmodel.Email;
                        user.Password = schoolmodel.Password;
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();

                        School school = db.Schools.Find(schoolmodel.SchoolID);
                        school.Name = schoolmodel.Name;
                        school.ShortName = schoolmodel.ShortName;
                        school.HouseNo = schoolmodel.HouseNo;
                        school.BuildingName = schoolmodel.BuildingName;
                        school.Street = schoolmodel.Street;
                        school.Area = schoolmodel.Area;
                        school.Location = schoolmodel.Location;
                        school.CityID = schoolmodel.CityID;
                        school.CountryID = schoolmodel.CountryID;
                        school.PinCode = schoolmodel.PinCode;
                        school.Landline = schoolmodel.Landline;
                        school.Mobile = schoolmodel.Mobile;
                        school.Website = schoolmodel.Website;
                        school.RegNo = schoolmodel.RegNo;
                        school.Logo = schoolmodel.Logo;                        
                        school.Principal = schoolmodel.Principal;
                        school.UserID = schoolmodel.UserID;
                        school.CompanyAcademicYearID = schoolmodel.CompanyAcademicYearID;
                        school.Status = schoolmodel.Status;
                        db.Entry(school).State = EntityState.Modified;
                        db.SaveChanges();

                        string To = schoolmodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                        CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                        string subject = "School Modified";
                        string body = "Hi,";
                        body += "<br/> School was modified. Please login using these credentials, and update school profile. <br/> Login email : " + schoolmodel.Email;
                        body += "<br/> Login password : " + schoolmodel.Password;
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

            data.message = "/School/Index";
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
                School school = db.Schools.Find(id);
                school.Status = false;
                db.Entry(school).State = EntityState.Modified;
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
//public JsonResult Upload()
//{
//string filename = Guid.NewGuid().ToString();
//for (int i = 0; i < Request.Files.Count; i++)
//{
//    var file = Request.Files[i];
//    var fileName = Path.GetFileName(file.FileName);
//    var extention = Path.GetExtension(file.FileName);
//    var filenamewithoutextension = Path.GetFileNameWithoutExtension(file.FileName);
//    file.SaveAs(Server.MapPath("/Uploads/" + filename + "." + extention + ""));
//}

//if (file != null)
//{
//    var fileName = Path.GetFileName(file.FileName);
//    var extention = Path.GetExtension(file.FileName);
//    var filenamewithoutextension = Path.GetFileNameWithoutExtension(file.FileName);

//    file.SaveAs(Server.MapPath("/Uploads/" + filename + "." + extention + ""));

//}


//Session["err"] = "Error, Can't Delete, Please check Dependency Data";
//Session["msg"] = "";
//try
//{
//    //for (int i = 0; i < Request.Files.Count; i++)
//    //{
//    //    HttpPostedFileBase file = Request.Files[i]; //Uploaded file
//    //    //Use the following properties to get file's name, size and MIMEType
//    //    int fileSize = file.ContentLength;
//    //    string fileName = file.FileName;
//    //    string mimeType = file.ContentType;
//    //    System.IO.Stream fileContent = file.InputStream;
//    //    //To save file, use SaveAs method
//    //    file.SaveAs(Server.MapPath("~/") + fileName); //File will be saved in application root
//    //}

//    Session["err"] = "";
//    Session["msg"] = "Uploaded Successfully";

//}
//catch { }
//return Json("Uploaded " + Request.Files.Count + " files");
//return Json(filename, JsonRequestBehavior.AllowGet);
//}
//public JsonResult ImageUpload(HttpPostedFileWrapper file)
//{
//    string filename = Guid.NewGuid().ToString();
//    if (file != null)
//    {
//        var fileName = Path.GetFileName(file.FileName);
//        var extention = Path.GetExtension(file.FileName);
//        var filenamewithoutextension = Path.GetFileNameWithoutExtension(file.FileName);

//        file.SaveAs(Server.MapPath("/Uploads/" + filename + "." + extention + ""));

//    }
//    return Json(filename, JsonRequestBehavior.AllowGet);
//}
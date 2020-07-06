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
    public class EmployeeController : Controller
    {
        private DatabaseContext db = new DatabaseContext();        
        // GET: /Employee/
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
            var employees = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.EmployeeID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    employees = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    employees = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:
                    employees = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    employees = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 5:
                    employees = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return View(employees);
        }

        // GET: /Employee/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.EmployeeID == id).FirstOrDefault();
            if (employee == null)
            {
                return HttpNotFound();
            }

            return View(employee);
        }

        // GET: /Employee/Create
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
                maxId = (from c in db.Employees select c.EmployeeID).Max();
                maxId = maxId + 1;
            }
            catch { }

            EmployeeModel employeemodel = new EmployeeModel();
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            School school = db.Schools.Find(schoolid);
            employeemodel.SchoolID = schoolid;
            employeemodel.IdCard = "" + school.ShortName.ToUpper() + "TEA" + maxId.ToString("D" + 6);
            employeemodel.UserID = 0;
            employeemodel.LeavesToAvail = 10;
            employeemodel.Salary = 0.00M;
            employeemodel.Status = true;
            return View(employeemodel);
        }
        
        
        // POST: /Employee/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EmployeeID,Name,IdCard,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Photo,SchoolID,UserID,LeavesToAvail,Salary,Status,Email,Password")] EmployeeModel employeemodel, HttpPostedFileBase uploadlogo,string newlogo)        
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (employeemodel.Salary <= 0)
            {
                Session["err"] = "Salary required";
                data.message = Session["err"].ToString();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            if (employeemodel.Name != null)
            {     
                try
                {
                    User employeeold = db.Users.Where(s => s.Email == employeemodel.Email).FirstOrDefault();
                    if (employeeold != null)
                    {
                        Session["err"] = "Email already exists";                       
                        data.message = Session["err"].ToString();                       
                        return Json(data, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        
                        if (newlogo != "")
                        {
                            employeemodel.Photo = newlogo;
                        }
                        User superadminuser = db.Users.Find(1);

                        User user = new User();
                        user.Email = employeemodel.Email;
                        user.Password = employeemodel.Password;
                        user.CanCreate = false;
                        user.CanEdit = false;
                        user.CanDelete = false;
                        user.CanPrint = false;
                        user.Status = false;
                        user.CreatedOn = DateTime.Now;
                        user.LastLoggedOn = null;
                        db.Users.Add(user);
                        db.SaveChanges();                      

                        Role role = db.Roles.Where(r => r.Name == "Employee").FirstOrDefault();
                        UserRole userroles = new UserRole();
                        userroles.UserID = user.UserID;
                        userroles.RoleID = role.RoleID;
                        db.UserRoles.Add(userroles);
                        db.SaveChanges();

                        Employee employee = new Employee();
                        employee.Name = employeemodel.Name;
                        employee.IdCard = employeemodel.IdCard;
                        employee.HouseNo = employeemodel.HouseNo;
                        employee.BuildingName = employeemodel.BuildingName;
                        employee.Street = employeemodel.Street;
                        employee.Area = employeemodel.Area;
                        employee.Location = employeemodel.Location;
                        employee.CityID = employeemodel.CityID;
                        employee.CountryID = employeemodel.CountryID;
                        employee.PinCode = employeemodel.PinCode;
                        employee.Landline = employeemodel.Landline;
                        employee.Mobile = employeemodel.Mobile;    
						employee.Photo = employeemodel.Photo; 
                        employee.SchoolID = employeemodel.SchoolID;    
                        employee.UserID = user.UserID;
                        employee.LeavesToAvail = employeemodel.LeavesToAvail;
                        employee.Salary = employeemodel.Salary;
                        employee.Status = employeemodel.Status;
                        db.Employees.Add(employee);
                        db.SaveChanges();

                        int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
                        School school = db.Schools.Find(schoolid);

                        employee.IdCard = "" + school.ShortName.ToUpper() + "TEA" + employee.EmployeeID.ToString("D" + 6);
                        db.Entry(employee).State = EntityState.Modified;
                        db.SaveChanges();

                        user.Status = true;
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();

                        string To = employeemodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                        CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                        string subject = "New Employee Created";
                        string body = "Hi,";
                        body += "<br/> Employee was created. Please login using these credentials, and update employee profile. <br/> Login email : " + employeemodel.Email;
                        body += "<br/> Login password : " + employeemodel.Password;
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
           
            data.message = "/Employee/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /Employee/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            User user = db.Users.Find(employee.UserID);
            EmployeeModel employeemodel = new EmployeeModel();            
            employeemodel.EmployeeID = employee.EmployeeID;
            employeemodel.Name = employee.Name;
            employeemodel.IdCard = employee.IdCard;
            employeemodel.HouseNo = employee.HouseNo;
            employeemodel.BuildingName = employee.BuildingName;
            employeemodel.Street = employee.Street;
            employeemodel.Area = employee.Area;
            employeemodel.Location = employee.Location;
            employeemodel.CityID = employee.CityID;
            employeemodel.CountryID = employee.CountryID;
            employeemodel.PinCode = employee.PinCode;
            employeemodel.Landline = employee.Landline;
            employeemodel.Mobile = employee.Mobile;   
			employeemodel.Photo = employee.Photo;
            employeemodel.SchoolID = employee.SchoolID;    
            employeemodel.UserID = employee.UserID;
            employeemodel.LeavesToAvail = employee.LeavesToAvail;
            employeemodel.Salary = employee.Salary;
            employeemodel.Status = employee.Status;
            employeemodel.Email = user.Email;
            employeemodel.Password = user.Password;

            if (employee == null)
            {
                return HttpNotFound();
            }
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";

            ViewBag.ExistingEmail = user.Email;
            ViewBag.CompanyID = "1";
            ViewBag.CityID = new SelectList(db.Citys, "CityID", "Name", employee.CityID);
            ViewBag.CountryID = new SelectList(db.Countrys, "CountryID", "Name", employee.CountryID);
            ViewBag.SchoolID = new SelectList(db.Schools, "SchoolID", "Name", employee.SchoolID);
            return View(employeemodel);
        }

        // POST: /Employee/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EmployeeID,Name,IdCard,HouseNo,BuildingName,Street,Area,Location,CityID,CountryID,PinCode,Landline,Mobile,Photo,SchoolID,UserID,LeavesToAvail,Salary,Status,Email,Password")] EmployeeModel employeemodel, HttpPostedFileBase uploadlogo, string newlogo, string existingemail)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            try 
            {
                if (ModelState.IsValid)
                {
                    if (employeemodel.Email != existingemail)
                    {
                        User employeeold = db.Users.Where(s => s.Email == employeemodel.Email).FirstOrDefault();
                        if (employeeold != null)
                        {
                            Session["err"] = "Email already exists";
                            data.message = Session["err"].ToString();
                            return Json(data, JsonRequestBehavior.AllowGet);
                        }
                    }
                    if (newlogo != "")
                    {
                        employeemodel.Photo = newlogo;
                    }

                    User superadminuser = db.Users.Find(1);

                    User user = db.Users.Find(employeemodel.UserID);
                    user.Email = employeemodel.Email;
                    user.Password = employeemodel.Password;
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    Employee employee = db.Employees.Find(employeemodel.EmployeeID);
                    employee.Name = employeemodel.Name;
                    employee.IdCard = employeemodel.IdCard;
                    employee.HouseNo = employeemodel.HouseNo;
                    employee.BuildingName = employeemodel.BuildingName;
                    employee.Street = employeemodel.Street;
                    employee.Area = employeemodel.Area;
                    employee.Location = employeemodel.Location;
                    employee.CityID = employeemodel.CityID;
                    employee.CountryID = employeemodel.CountryID;
                    employee.PinCode = employeemodel.PinCode;
                    employee.Landline = employeemodel.Landline;
                    employee.Mobile = employeemodel.Mobile;
                    employee.Photo = employeemodel.Photo;
                    employee.SchoolID = employeemodel.SchoolID;
                    employee.UserID = employeemodel.UserID;
                    employee.LeavesToAvail = employeemodel.LeavesToAvail;
                    employee.Salary = employeemodel.Salary;
                    employee.Status = employeemodel.Status;
                    db.Entry(employee).State = EntityState.Modified;
                    db.SaveChanges();

                    string To = employeemodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                    CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                    string subject = "Employee Modified";
                    string body = "Hi,";
                    body += "<br/> Employee was modified. Please login using these credentials, and update employee profile. <br/> Login email : " + employeemodel.Email;
                    body += "<br/> Login password : " + employeemodel.Password;
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

            data.message = "/Employee/Index";
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
                Employee employee = db.Employees.Find(id);
                employee.Status = false;
                db.Entry(employee).State = EntityState.Modified;
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

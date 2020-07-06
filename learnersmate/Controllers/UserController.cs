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
    public class UserController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /User/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
           
            int roleid = Convert.ToInt16(Session["RoleID"].ToString());           
            var user = db.UserRoles.Include(t => t.CurrentUser).Include(t => t.CurrentRole).Where(t => t.UserID==0).OrderByDescending(t => t.UserID).ToList();
            switch (roleid)
            {
                case 1:
                    user = db.UserRoles.Include(t => t.CurrentUser).Include(t => t.CurrentRole).OrderByDescending(t => t.UserID).ToList();
                    break;              
                default:
                    break;
            }            
            return View(user);
        }       
        public ActionResult _Create()
        {
            UserModel usermodel = new UserModel();
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Name");
            return PartialView(usermodel);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _Create([Bind(Include = "UserID,Email,Password,RoleID,CanCreate,CanEdit,CanDelete,CanPrint,Status")] UserModel model)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (ModelState.IsValid)
            {
                User cityexist = db.Users.Where(c => c.Email == model.Email).FirstOrDefault();
                if (cityexist != null)
                {
                    Session["err"] = "Email already exists";
                    data.message = Session["err"].ToString();
                    return Json(data, JsonRequestBehavior.AllowGet);
                }
                //User user = new User();
                //user.Email = model.Email;
                //user.Password = model.Password;
                //user.CanCreate = model.CanCreate;
                //user.CanEdit = model.CanEdit;
                //user.CanDelete = model.CanDelete;
                //user.CanPrint = model.CanPrint;
                //user.Status = true;
                //db.Users.Add(user);
                //db.SaveChanges();

                //UserRole userrole = new UserRole();
                //userrole.UserID = user.UserID;
                //userrole.RoleID = model.RoleID;
                //db.UserRoles.Add(userrole);
                //db.SaveChanges();

                //User superadminuser = db.Users.Find(1);
                //int companyfinancialyearid = Convert.ToInt16(Session["CompanyFinancialYearID"].ToString());
                //int branchid = Convert.ToInt16(Session["BranchID"].ToString());
                //Employee employee = new Employee();
                //employee.Name = "EMP";
                //employee.EmpCode = "EMP-";
                //employee.HouseNo = "";
                //employee.BuildingName = "";
                //employee.Street = "";
                //employee.Area = "";
                //employee.Location = "";
                //employee.CityID = 1;
                //employee.CountryID = 1;
                //employee.PinCode = "";
                //employee.Landline = "";
                //employee.Mobile = "";
                //employee.Website = "";
                //employee.Logo = "";
                //employee.BranchID = branchid;
                //employee.DesignationID = 1;
                //employee.DepartmentID = 1;
                //employee.UserID = user.UserID;
                //employee.DateOfBirth = null; 
                //employee.JoiningDate = null;
                //employee.TerminationDate = null;
                //employee.EmployeeStatusID = 1;
                //db.Employees.Add(employee);
                //db.SaveChanges();

                //employee.EmpCode = "EMP" + employee.EmployeeID.ToString("D" + 6);
                //db.Entry(employee).State = EntityState.Modified;
                //db.SaveChanges();

                //user.Status = true;
                //db.Entry(user).State = EntityState.Modified;
                //db.SaveChanges();

                //string To = model.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                //CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                //string subject = "New Employee Created";
                //string body = "Hi,";
                //body += "<br/> Employee was created. Please login using these credentials, and update employee profile. <br/> Login email : " + model.Email;
                //body += "<br/> Login password : " + model.Password;
                //body += "<br/> <br/> ----------------------";
                //body += "<br/> Admin";
                //body += "<br/> <a href=" + WebsiteUrl + ">" + WebsiteUrl + "</a>";
                //try { CommanFunctions.SendEmail(UserID, subject, body, superadminuser.Email, To, Ssl, UserID, Password, SMTPPort, Host); }
                //catch
                //{
                //}

                ModelState.Clear();

                Session["err"] = "";
                Session["msg"] = "Created Successfully";
            }
            data.message = "/User/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        // GET: /User/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            UserRole userrole = db.UserRoles.Where(m => m.UserID == user.UserID).FirstOrDefault();
            UserModel usermodel = new UserModel();
            usermodel.UserID = user.UserID;
            usermodel.Email = user.Email;
            usermodel.Password = user.Password;
            usermodel.RoleID = userrole.RoleID;
            usermodel.CanCreate = user.CanCreate;
            usermodel.CanEdit = user.CanEdit;
            usermodel.CanDelete = user.CanDelete;
            usermodel.CanPrint = user.CanPrint;
            usermodel.Status = user.Status;
            ViewBag.Existing = user.Email;
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Name", userrole.RoleID);
            return View(usermodel);
        }

        // POST: /User/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include= "UserID,Email,Password,RoleID,CanCreate,CanEdit,CanDelete,CanPrint,Status")] UserModel model, string existing)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Name", model.RoleID);
            if (ModelState.IsValid)
            {
                if (model.Email != existing)
                {
                    User cityexisting = db.Users.Where(s => s.Email == model.Email && s.Email != existing).FirstOrDefault();
                    if (cityexisting != null)
                    {
                        Session["err"] = "Email already exists";

                        ViewBag.Existing = existing;
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";
                       
                        return View(model);
                    }
                }
                User user = db.Users.Find(model.UserID);
                user.Email = model.Email;
                user.Password = model.Password;
                user.CanCreate = model.CanCreate;
                user.CanEdit = model.CanEdit;
                user.CanDelete = model.CanDelete;
                user.CanPrint = model.CanPrint;
                user.Status = true;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();

                UserRole userrole = db.UserRoles.Where(m => m.UserID == model.UserID).FirstOrDefault();
                userrole.UserID = user.UserID;
                userrole.RoleID = model.RoleID;
                db.Entry(userrole).State = EntityState.Modified;
                db.SaveChanges();

                Session["CanCreate"] = user.CanCreate;
                Session["CanEdit"] = user.CanEdit;
                Session["CanDelete"] = user.CanDelete;
                Session["CanPrint"] = user.CanPrint;

                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

                return RedirectToAction("Index","Employee");
            }
            ViewBag.Existing = existing;
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            
            return View(model);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                //User user = db.Users.Find(id);
                //user.Status = false;
                //db.Entry(user).State = EntityState.Modified;
                //db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "De-Activated Successfully";            

            }
            catch { }
            return RedirectToAction("Index");
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

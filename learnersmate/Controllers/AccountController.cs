using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using learnersmate.Models;
using System.Web.Security;
using System.Data.Entity;
using System.Globalization;
using System.Data.SqlClient;
using System.Data;
using learnersmate.Context;
using learnersmate.Filters;
namespace learnersmate.Controllers
{
    //[Authorize]
    public class AccountController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            ViewBag.ReturnUrl = returnUrl;
            ViewBag.AcademicYearID = new SelectList(db.AcademicYears, "AcademicYearID", "Name", 1);
            ViewBag.SchoolID = new SelectList(db.Schools, "SchoolID", "Name", 1);
            return View();
        }
        [AllowAnonymous]
        public ActionResult NotAuthorised()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";            
            return View();
        }
        [AllowAnonymous]
        public ActionResult AcademicYearUpdate(int id)
        {
            int userid = Convert.ToInt32(Session["UserID"].ToString());
            CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == id).FirstOrDefault();
            Session["AcademicYear"] = companyacademicyear.CurrentAcademicYear.Name;
            Session["AcademicYearID"] = companyacademicyear.CurrentAcademicYear.AcademicYearID;
            //Session["CompanyAcademicYearID"] = companyacademicyear.CompanyAcademicYearID;
            Session["AcademicYearList"] = db.AcademicYears.ToList();
            return Redirect(Request.QueryString["ReturnUrl"]);
        }

        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            ViewBag.AcademicYearID = new SelectList(db.AcademicYears, "AcademicYearID", "Name", model.AcademicYearID);
            ViewBag.SchoolID = new SelectList(db.Schools, "SchoolID", "Name", model.SchoolID);
            if (ModelState.IsValid)
            {
                var userManager1 = db.Users.Where(x => x.Email == model.Email && x.Status == true).FirstOrDefault();

                if (userManager1 != null)
                {
                    string username = userManager1.Email;
                    var user = db.Users.Where(x => x.Email == model.Email && x.Password == model.Password).FirstOrDefault();
                    if (user != null)
                    {
                        UserRole userrole = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == userManager1.UserID).FirstOrDefault();
                        FormsAuthentication.SetAuthCookie(user.Email, false);
                        var authTicket = new FormsAuthenticationTicket(1, user.Email, DateTime.Now, DateTime.Now.AddMinutes(2880), model.RememberMe, userrole.CurrentRole.Name);
                        string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
                        var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                        HttpContext.Response.Cookies.Add(authCookie);

                        string rolename = userrole.CurrentRole.Name;
                        int roleid = userrole.RoleID;

                        Company company = db.Companys.Find(1);
                        School school = db.Schools.Find(model.SchoolID);

                        CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == model.AcademicYearID).FirstOrDefault();

                        Session["AcademicYear"] = companyacademicyear.CurrentAcademicYear.Name;
                        Session["AcademicYearID"] = companyacademicyear.CurrentAcademicYear.AcademicYearID;
                        Session["CompanyAcademicYearID"] = companyacademicyear.CompanyAcademicYearID;

                        Session["Email"] = user.Email;
                        Session["UserID"] = user.UserID.ToString();
                        Session["Role"] = rolename;
                        Session["RoleID"] = roleid;
                        Session["Company"] = company.Name;
                        Session["CompanyLogo"] = company.Logo;
                        Session["SchoolID"] = school.SchoolID;
                        Session["School"] = school.Name;
                        Session["AcademicYearList"] = db.AcademicYears.ToList();

                        
                        Session["CanCreate"] = user.CanCreate;
                        Session["CanEdit"] = user.CanEdit;
                        Session["CanDelete"] = user.CanDelete;
                        Session["CanPrint"] = user.CanPrint;

                        int SchoolsCount = db.Schools.Count();
                        Session["SchoolsCount"] = SchoolsCount;
                        int TeachersCount = db.Teachers.Count();
                        Session["TeachersCount"] = TeachersCount;
                        int ParentsCount = db.Parents.Count();
                        Session["ParentsCount"] = ParentsCount;
                        int StudentsCount = db.Students.Count();
                        Session["StudentsCount"] = StudentsCount;
                        int EmployeesCount = db.Employees.Count();
                        Session["EmployeesCount"] = EmployeesCount;

                        try
                        {
                            bool idDefautLanguage = company.DefaultLanguage;
                            List<MenuModel> menuList = new List<MenuModel>();
                            var submenuitems = db.SubMenus.Where(s => s.SubMenuStatus == true).OrderBy(s => s.SubMenuOrder);

                            foreach (SubMenu sm in submenuitems.ToList())
                            {
                                string[] rolesarray = sm.SubMenuRoles.Split(',');
                                if (rolesarray[0] == "true" && roleid == 1)
                                {
                                    MainMenu mainmenu = db.MainMenus.Find(sm.MainMenuID);
                                    MenuModel mm = new MenuModel();
                                    mm.MainMenuID = sm.MainMenuID;
                                    if (idDefautLanguage)
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName;
                                        mm.SubMenuName = sm.SubMenuName;
                                    }
                                    else
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName2;
                                        mm.SubMenuName = sm.SubMenuName2;
                                    }
                                    mm.SubMenuID = sm.SubMenuID;
                                    mm.ControllerName = sm.Controller;
                                    mm.ActionName = sm.Action;
                                    mm.RoleID = roleid;
                                    mm.RoleName = rolename;
                                    menuList.Add(mm);
                                }
                                if (rolesarray[1] == "true" && roleid == 2)
                                {
                                    MainMenu mainmenu = db.MainMenus.Find(sm.MainMenuID);
                                    MenuModel mm = new MenuModel();
                                    mm.MainMenuID = sm.MainMenuID;
                                    if (idDefautLanguage)
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName;
                                        mm.SubMenuName = sm.SubMenuName;
                                    }
                                    else
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName2;
                                        mm.SubMenuName = sm.SubMenuName2;
                                    }
                                    mm.SubMenuID = sm.SubMenuID;
                                    mm.ControllerName = sm.Controller;
                                    mm.ActionName = sm.Action;
                                    mm.RoleID = roleid;
                                    mm.RoleName = rolename;
                                    menuList.Add(mm);
                                }
                                if (rolesarray[2] == "true" && roleid == 3)
                                {
                                    MainMenu mainmenu = db.MainMenus.Find(sm.MainMenuID);
                                    MenuModel mm = new MenuModel();
                                    mm.MainMenuID = sm.MainMenuID;
                                    if (idDefautLanguage)
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName;
                                        mm.SubMenuName = sm.SubMenuName;
                                    }
                                    else
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName2;
                                        mm.SubMenuName = sm.SubMenuName2;
                                    }
                                    mm.SubMenuID = sm.SubMenuID;
                                    mm.ControllerName = sm.Controller;
                                    mm.ActionName = sm.Action;
                                    mm.RoleID = roleid;
                                    mm.RoleName = rolename;
                                    menuList.Add(mm);
                                }
                                if (rolesarray[3] == "true" && roleid == 4)
                                {
                                    MainMenu mainmenu = db.MainMenus.Find(sm.MainMenuID);
                                    MenuModel mm = new MenuModel();
                                    mm.MainMenuID = sm.MainMenuID;
                                    if (idDefautLanguage)
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName;
                                        mm.SubMenuName = sm.SubMenuName;
                                    }
                                    else
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName2;
                                        mm.SubMenuName = sm.SubMenuName2;
                                    }
                                    mm.SubMenuID = sm.SubMenuID;
                                    mm.ControllerName = sm.Controller;
                                    mm.ActionName = sm.Action;
                                    mm.RoleID = roleid;
                                    mm.RoleName = rolename;
                                    menuList.Add(mm);
                                }

                                if (rolesarray[4] == "true" && roleid == 5)
                                {
                                    MainMenu mainmenu = db.MainMenus.Find(sm.MainMenuID);
                                    MenuModel mm = new MenuModel();
                                    mm.MainMenuID = sm.MainMenuID;
                                    if (idDefautLanguage)
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName;
                                        mm.SubMenuName = sm.SubMenuName;
                                    }
                                    else
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName2;
                                        mm.SubMenuName = sm.SubMenuName2;
                                    }
                                    mm.SubMenuID = sm.SubMenuID;
                                    mm.ControllerName = sm.Controller;
                                    mm.ActionName = sm.Action;
                                    mm.RoleID = roleid;
                                    mm.RoleName = rolename;
                                    menuList.Add(mm);
                                }
                                if (rolesarray[5] == "true" && roleid == 6)
                                {
                                    MainMenu mainmenu = db.MainMenus.Find(sm.MainMenuID);
                                    MenuModel mm = new MenuModel();
                                    mm.MainMenuID = sm.MainMenuID;
                                    if (idDefautLanguage)
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName;
                                        mm.SubMenuName = sm.SubMenuName;
                                    }
                                    else
                                    {
                                        mm.MainMenuName = mainmenu.MainMenuName2;
                                        mm.SubMenuName = sm.SubMenuName2;
                                    }
                                    mm.SubMenuID = sm.SubMenuID;
                                    mm.ControllerName = sm.Controller;
                                    mm.ActionName = sm.Action;
                                    mm.RoleID = roleid;
                                    mm.RoleName = rolename;
                                    menuList.Add(mm);
                                }

                            }
                            Session["Menu"] = menuList;
                            Session["Dashboard"] = "/dashboard";

                            user.LastLoggedOn = DateTime.Now;
                            db.Entry(user).State = EntityState.Modified;
                            db.SaveChanges();

                            if (companyacademicyear.CurrentAcademicYear.AcademicYearID == 1)
                            {
                                return RedirectToAction("Index", "dashboard");
                            }
                            else
                            {
                                return RedirectToAction("Index", "dashboard", new { id = companyacademicyear.CurrentAcademicYear.AcademicYearID });
                            }


                        }
                        catch
                        {
                            ModelState.AddModelError("", "Error in retrieve menu items, please contact admin.");
                        }

                    }
                    else
                    {
                        ModelState.AddModelError("", "Invalid username or password.");
                    }


                }
                else
                {
                    ModelState.AddModelError("", "Invalid username or password.");
                }
            }

            return View(model);
        }

        [SessionCheck]
        // GET: /Account/Register      
        public ActionResult Register()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            RegisterViewModel model = new RegisterViewModel();
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Name");
            return View(model);
        }

        // POST: /Account/Register
        [HttpPost]
        [SessionCheck]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterViewModel model)
        {
            //errordata data = new errordata();
            //data.type = "error";
            //Session["err"] = "Error, Please Check Input Fields";
            //Session["msg"] = "";
            //if (model.Email != "")
            //{
            //    User exist = db.Users.Where(c => c.Email == model.Email).FirstOrDefault();
            //    if (exist != null)
            //    {
            //        Session["err"] = "Email already exists";
            //        data.message = Session["err"].ToString();
            //        return Json(data, JsonRequestBehavior.AllowGet);
            //    }

            //    User user = new User();
            //    user.Email = model.Email;
            //    user.Password = model.Password;
            //    user.Status = true;
            //    db.Users.Add(user);
            //    db.SaveChanges();

            //    UserRole userrole = new UserRole();
            //    userrole.UserID = user.UserID;
            //    userrole.RoleID = model.RoleID;
            //    db.UserRoles.Add(userrole);
            //    db.SaveChanges();

            //    ModelState.Clear();

            //    Session["err"] = "";
            //    Session["msg"] = "Created Successfully";
            //}
            //data.message = "/Account/Register";
            //data.type = "success";
            //return Json(data, JsonRequestBehavior.AllowGet);
            return View();
        }

        [SessionCheck]
        // GET: /Account/Manage
        public ActionResult Manage()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.Email = Session["Email"];
            return View();
        }
        // POST: /Account/Manage
        [SessionCheck]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Manage(ManageUserViewModel model)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            ViewBag.Email = Session["Email"];
            int userid = Convert.ToInt32(Session["UserID"].ToString());
            if (ModelState.IsValid)
            {
                try
                {
                    User user = db.Users.Where(u => u.UserID == userid && u.Password == model.OldPassword).FirstOrDefault();
                    if (user == null)
                    {
                        Session["err"] = "Current Password is wrong";
                        ViewBag.Message = Session["msg"];
                        ViewBag.Error = Session["err"];
                        Session["err"] = "";
                        Session["msg"] = "";

                        return View(model);
                    }
                    else
                    {
                        user.Password = model.NewPassword;
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();
                        Session["err"] = "";
                        Session["msg"] = "Modified Successfully";

                    }

                }
                catch
                {
                    Session["err"] = "Error in update";
                    ViewBag.Message = Session["msg"];
                    ViewBag.Error = Session["err"];
                    Session["err"] = "";
                    Session["msg"] = "";
                    return View(model);
                }
            }

            Session["err"] = "Error, Please Check Input Fields";

            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            return View(model);
        }

        [AllowAnonymous]
        public ActionResult _ForgotPassword()
        {
            return PartialView();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult _ForgotPasswordFor([Bind(Include = "Email")] ForgotPasswordModel forgotpassword)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";

            if (ModelState.IsValid)
            {
                User superadminuser = db.Users.Find(1);
                User user = db.Users.Where(u => u.Email == forgotpassword.Email).FirstOrDefault();
                if (user == null)
                {
                    Session["err"] = "Email is not available";
                    Session["msg"] = "";
                }
                else
                {
                    try
                    {
                        string To = forgotpassword.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                        CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                        string subject = "Reset Password";
                        string body = "Hi,";
                        body += "<br/> Your password is : " + user.Password;
                        body += "<br/> <br/> ----------------------";
                        body += "<br/> Admin";
                        body += "<br/> <a href=" + WebsiteUrl + ">" + WebsiteUrl + "</a>";
                        CommanFunctions.SendEmail(UserID, subject, body, superadminuser.Email, To, Ssl, UserID, Password, SMTPPort, Host);
                        Session["err"] = "";
                        Session["msg"] = "Password was sent to your Email";
                    }
                    catch {
                        Session["err"] = "Email sending failed, please check smtp configuration.";
                    }

                }

                return RedirectToAction("Login");
            }

            return Json(Session["err"], JsonRequestBehavior.AllowGet);
        }

        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            return RedirectToAction("Login", "Account");
        }

        private bool HasPassword(int userid)
        {
            User user = db.Users.Where(u => u.UserID == userid).FirstOrDefault();
            if (user != null)
            {
                return user.Password != null;
            }
            return false;
        }

        public enum ManageMessageId
        {
            ChangePasswordSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            Error
        }
        public JsonResult CreateUserPageView()
        {
            errordata data = new errordata();
            data.type = "error";
            try
            {
                int userid = 0;
                try { userid= Convert.ToInt16(System.Web.HttpContext.Current.Session["UserID"].ToString()); } catch { }
                string pageurl = Request.UrlReferrer.AbsolutePath;                              
                UserPageView userpageview = new UserPageView();
                userpageview.UserID = userid;
                userpageview.PageUrl = pageurl;
                userpageview.DateAccessed = DateTime.Now;
                db.UserPageViews.Add(userpageview);
                db.SaveChanges();               

            }
            catch { data.message = "Error"; }
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
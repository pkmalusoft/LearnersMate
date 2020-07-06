using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using learnersmate.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using learnersmate.Context;
using learnersmate.Filters;
namespace WebApp.Migrations
{
    public class tempMenu
    {
        public string MainMenuName { get; set; }
        public string MainMenuName2 { get; set; }
        public string SubMenuName { get; set; }
        public string SubMenuName2 { get; set; }
        public int MainMenuID { get; set; }
        public int SubMenuID { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }       
        public string SubMenuStatus { get; set; }
    }
    public class tempMenuDetail
    {
        public List<tempMenu> tempMenuDetails { get; set; }
    }
       
    [SessionCheck]
    public class MenuMaintainController : Controller
    {
        private DatabaseContext db = new DatabaseContext();       
        // GET: /MenuMaintain/
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            var submenus = db.SubMenus.Include(s => s.CurrentMainMenu).OrderBy(s => s.SubMenuOrder);
            return View(submenus.ToList());
        }
        [HttpPost]
        public ActionResult ModifyMenu(List<tempMenu> menuList)
        {
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            string msg = "Error in processing.";  
            int cntstatus = 0;
            int orderby = 1;
            foreach (tempMenu t in menuList.ToList())
            {
                    MainMenu mainmenu = db.MainMenus.Find(t.MainMenuID);
                    mainmenu.MainMenuName = t.MainMenuName;
                    mainmenu.MainMenuName2 = t.MainMenuName2;
                    db.Entry(mainmenu).State = EntityState.Modified;
                    try { db.SaveChanges(); }
                    catch { }                          

                SubMenu submenu = db.SubMenus.Find(t.SubMenuID);
                submenu.SubMenuName = t.SubMenuName;
                submenu.SubMenuName2 = t.SubMenuName2;
                submenu.Controller = t.ControllerName;
                submenu.Action = t.ActionName;
                submenu.MainMenuID = mainmenu.MainMenuID;
                submenu.SubMenuRoles = t.SubMenuStatus.Split(',')[1 + cntstatus] + "," + t.SubMenuStatus.Split(',')[2 + cntstatus] + "," + t.SubMenuStatus.Split(',')[3 + cntstatus] + "," + t.SubMenuStatus.Split(',')[4 + cntstatus] + "," + t.SubMenuStatus.Split(',')[5 + cntstatus] + "," + t.SubMenuStatus.Split(',')[6 + cntstatus];
                submenu.SubMenuStatus = bool.Parse(t.SubMenuStatus.Split(',')[7 + cntstatus]);
                submenu.SubMenuOrder = orderby;
                db.Entry(submenu).State = EntityState.Modified;
                try { db.SaveChanges(); }
                catch { }
                cntstatus = cntstatus + 7;
                orderby = orderby + 1;                
            }
            
            int roleid = int.Parse(Session["RoleID"].ToString());
            string rolename = Session["Role"].ToString();
            Company company = db.Companys.Find(1);
            bool idDefautLanguage = company.DefaultLanguage;

            List<MenuModel> menuList1 = new List<MenuModel>();
            var submenuitems = db.SubMenus.Where(s => s.SubMenuStatus == true).OrderBy(s => s.SubMenuOrder);

            foreach (SubMenu sm in submenuitems.ToList())
            {
                string[] rolesarray = sm.SubMenuRoles.Split(',');
                if (rolesarray[0] == "true" && roleid == 1)
                {
                    MainMenu mainmenu1 = db.MainMenus.Find(sm.MainMenuID);
                    MenuModel mm = new MenuModel();
                    mm.MainMenuID = sm.MainMenuID;
                    if (idDefautLanguage)
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName;
                        mm.SubMenuName = sm.SubMenuName;
                    }
                    else
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName2;
                        mm.SubMenuName = sm.SubMenuName2;
                    }
                    mm.SubMenuID = sm.SubMenuID;                   
                    mm.ControllerName = sm.Controller;
                    mm.ActionName = sm.Action;
                    mm.RoleID = roleid;
                    mm.RoleName = rolename;
                    menuList1.Add(mm);
                }
                if (rolesarray[1] == "true" && roleid == 2)
                {
                    MainMenu mainmenu1 = db.MainMenus.Find(sm.MainMenuID);
                    MenuModel mm = new MenuModel();
                    mm.MainMenuID = sm.MainMenuID;
                    if (idDefautLanguage)
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName;
                        mm.SubMenuName = sm.SubMenuName;
                    }
                    else
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName2;
                        mm.SubMenuName = sm.SubMenuName2;
                    }
                    mm.SubMenuID = sm.SubMenuID;
                    mm.ControllerName = sm.Controller;
                    mm.ActionName = sm.Action;
                    mm.RoleID = roleid;
                    mm.RoleName = rolename;
                    menuList1.Add(mm);
                }
                if (rolesarray[2] == "true" && roleid == 3)
                {
                    MainMenu mainmenu1 = db.MainMenus.Find(sm.MainMenuID);
                    MenuModel mm = new MenuModel();
                    mm.MainMenuID = sm.MainMenuID;
                    if (idDefautLanguage)
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName;
                        mm.SubMenuName = sm.SubMenuName;
                    }
                    else
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName2;
                        mm.SubMenuName = sm.SubMenuName2;
                    }
                    mm.SubMenuID = sm.SubMenuID;
                    mm.ControllerName = sm.Controller;
                    mm.ActionName = sm.Action;
                    mm.RoleID = roleid;
                    mm.RoleName = rolename;
                    menuList1.Add(mm);
                }
                if (rolesarray[3] == "true" && roleid == 4)
                {
                    MainMenu mainmenu1 = db.MainMenus.Find(sm.MainMenuID);
                    MenuModel mm = new MenuModel();
                    mm.MainMenuID = sm.MainMenuID;
                    if (idDefautLanguage)
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName;
                        mm.SubMenuName = sm.SubMenuName;
                    }
                    else
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName2;
                        mm.SubMenuName = sm.SubMenuName2;
                    }
                    mm.SubMenuID = sm.SubMenuID;
                    mm.ControllerName = sm.Controller;
                    mm.ActionName = sm.Action;
                    mm.RoleID = roleid;
                    mm.RoleName = rolename;
                    menuList1.Add(mm);
                }
                if (rolesarray[4] == "true" && roleid == 5)
                {
                    MainMenu mainmenu1 = db.MainMenus.Find(sm.MainMenuID);
                    MenuModel mm = new MenuModel();
                    mm.MainMenuID = sm.MainMenuID;
                    if (idDefautLanguage)
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName;
                        mm.SubMenuName = sm.SubMenuName;
                    }
                    else
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName2;
                        mm.SubMenuName = sm.SubMenuName2;
                    }
                    mm.SubMenuID = sm.SubMenuID;
                    mm.ControllerName = sm.Controller;
                    mm.ActionName = sm.Action;
                    mm.RoleID = roleid;
                    mm.RoleName = rolename;
                    menuList1.Add(mm);
                }
                if (rolesarray[5] == "true" && roleid == 6)
                {
                    MainMenu mainmenu1 = db.MainMenus.Find(sm.MainMenuID);
                    MenuModel mm = new MenuModel();
                    mm.MainMenuID = sm.MainMenuID;
                    if (idDefautLanguage)
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName;
                        mm.SubMenuName = sm.SubMenuName;
                    }
                    else
                    {
                        mm.MainMenuName = mainmenu1.MainMenuName2;
                        mm.SubMenuName = sm.SubMenuName2;
                    }
                    mm.SubMenuID = sm.SubMenuID;
                    mm.ControllerName = sm.Controller;
                    mm.ActionName = sm.Action;
                    mm.RoleID = roleid;
                    mm.RoleName = rolename;
                    menuList1.Add(mm);
                }
                Session["Menu"] = menuList1;
                msg = "Successfully created.";
                Session["err"] = "";
                Session["msg"] = "Modified Successfully";

            }
            return Json(msg, JsonRequestBehavior.AllowGet);
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

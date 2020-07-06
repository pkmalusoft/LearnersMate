using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Web.Mvc;
using Microsoft.Owin.Security;
using System.Web.Routing;
using System.Linq.Expressions;
using System.Configuration;
using System.Net.Mail;
using System.Security.Cryptography;
using Newtonsoft.Json;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Web.Http;
using System.Web.Http.Description;
using learnersmate.Models;
using System.Reflection;
using learnersmate.Context;

namespace learnersmate.Models
{
    public class SessionCheck : ActionFilterAttribute
    {

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase session = filterContext.HttpContext.Session;
            if (session["Menu"] == null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary {
                                { "Controller", "Account" },
                                { "Action", "Login" }
                                });
            }
        }
    }
    public class SessionView : ActionFilterAttribute
    {
        private DatabaseContext db = new DatabaseContext();

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
                HttpSessionStateBase session = filterContext.HttpContext.Session;
           
                var descriptor = filterContext.ActionDescriptor;
                string actionName = descriptor.ActionName;
                string controllerName = descriptor.ControllerDescriptor.ControllerName;

                int userid = Convert.ToInt16(session["UserID"].ToString());
                UserPagePermission userpagepermission = db.UserPagePermissions.Where(u => u.UserID == userid && u.PageUrl == controllerName && u.CanView == false).FirstOrDefault();
                if (userpagepermission != null)
                {

                    filterContext.Result = new RedirectToRouteResult(
                        new RouteValueDictionary {
                                { "Controller", "Account" },
                                { "Action", "NotAuthorised" }
                                    });
                }
            
        }
    }
    public class SessionCreate : ActionFilterAttribute
    {
        private DatabaseContext db = new DatabaseContext();

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase session = filterContext.HttpContext.Session;
            if (session["CanCreate"].ToString().ToLower() == "false")
            {

                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary {
                                { "Controller", "Account" },
                                { "Action", "NotAuthorised" }
                                });
            }
            //else
            //{
            //    var descriptor = filterContext.ActionDescriptor;
            //    string actionName = descriptor.ActionName;
            //    string controllerName = descriptor.ControllerDescriptor.ControllerName;

            //    int userid = Convert.ToInt16(session["UserID"].ToString());
            //    UserPagePermission userpagepermission = db.UserPagePermissions.Where(u => u.UserID == userid && u.PageUrl == controllerName && u.CanCreate == false).FirstOrDefault();
            //    if (userpagepermission != null)
            //    {

            //        filterContext.Result = new RedirectToRouteResult(
            //            new RouteValueDictionary {
            //                    { "Controller", "Account" },
            //                    { "Action", "NotAuthorised" }
            //                        });
            //    }
            //}
        }
    }
    public class SessionEdit : ActionFilterAttribute
    {
        private DatabaseContext db = new DatabaseContext();
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase session = filterContext.HttpContext.Session;
            if (session["CanEdit"].ToString().ToLower() == "false")
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary {
                                { "Controller", "Account" },
                                { "Action", "NotAuthorised" }
                                });
            }
            //else
            //{
            //    var descriptor = filterContext.ActionDescriptor;
            //    string actionName = descriptor.ActionName;
            //    string controllerName = descriptor.ControllerDescriptor.ControllerName;

            //    int userid = Convert.ToInt16(session["UserID"].ToString());
            //    UserPagePermission userpagepermission = db.UserPagePermissions.Where(u => u.UserID == userid && u.PageUrl == controllerName && u.CanEdit == false).FirstOrDefault();
            //    if (userpagepermission != null)
            //    {

            //        filterContext.Result = new RedirectToRouteResult(
            //            new RouteValueDictionary {
            //                    { "Controller", "Account" },
            //                    { "Action", "NotAuthorised" }
            //                        });
            //    }
            //}
        }
    }
    public class SessionDelete : ActionFilterAttribute
    {
        private DatabaseContext db = new DatabaseContext();
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase session = filterContext.HttpContext.Session;
            if (session["CanDelete"].ToString().ToLower() == "false")
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary {
                                { "Controller", "Account" },
                                { "Action", "NotAuthorised" }
                                });
            }
            //else
            //{
            //    var descriptor = filterContext.ActionDescriptor;
            //    string actionName = descriptor.ActionName;
            //    string controllerName = descriptor.ControllerDescriptor.ControllerName;

            //    int userid = Convert.ToInt16(session["UserID"].ToString());
            //    UserPagePermission userpagepermission = db.UserPagePermissions.Where(u => u.UserID == userid && u.PageUrl == controllerName && u.CanDelete == false).FirstOrDefault();
            //    if (userpagepermission != null)
            //    {

            //        filterContext.Result = new RedirectToRouteResult(
            //            new RouteValueDictionary {
            //                    { "Controller", "Account" },
            //                    { "Action", "NotAuthorised" }
            //                        });
            //    }
            //}
        }
    }
    public class SessionPrint : ActionFilterAttribute
    {
        private DatabaseContext db = new DatabaseContext();
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase session = filterContext.HttpContext.Session;
            if (session["CanPrint"].ToString().ToLower() == "false")
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary {
                                { "Controller", "Account" },
                                { "Action", "NotAuthorised" }
                                });
            }
            //else
            //{
            //    var descriptor = filterContext.ActionDescriptor;
            //    string actionName = descriptor.ActionName;
            //    string controllerName = descriptor.ControllerDescriptor.ControllerName;

            //    int userid = Convert.ToInt16(session["UserID"].ToString());
            //    UserPagePermission userpagepermission = db.UserPagePermissions.Where(u => u.UserID == userid && u.PageUrl == controllerName && u.CanPrint == false).FirstOrDefault();
            //    if (userpagepermission != null)
            //    {

            //        filterContext.Result = new RedirectToRouteResult(
            //            new RouteValueDictionary {
            //                    { "Controller", "Account" },
            //                    { "Action", "NotAuthorised" }
            //                        });
            //    }
            //}
        }
    }

    public static class CommanFunctions
    {
        public static DataTable ToDataTable<TSource>(this IList<TSource> data)
        {
            DataTable dataTable = new DataTable(typeof(TSource).Name);
            PropertyInfo[] props = typeof(TSource).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in props)
            {
                dataTable.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ??
                    prop.PropertyType);
            }

            foreach (TSource item in data)
            {
                var values = new object[props.Length];
                for (int i = 0; i < props.Length; i++)
                {
                    values[i] = props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            return dataTable;

           
        }
        public static void AppSettings(out string WebsiteUrl, out string Ssl, out string UserID, out string Password, out string SMTPPort, out string Host)
        {
            WebsiteUrl = ConfigurationManager.AppSettings.Get("websiteurl");
            Ssl = ConfigurationManager.AppSettings.Get("smtpssl");
            UserID = ConfigurationManager.AppSettings.Get("smtpun");
            Password = ConfigurationManager.AppSettings.Get("smtppwd");
            SMTPPort = ConfigurationManager.AppSettings.Get("smtpport");
            Host = ConfigurationManager.AppSettings.Get("smtphost");
        }
        public static void SendEmail(string From, string Subject, string Body, string To, string Cc, string Ssl, string UserID, string Password, string SMTPPort, string Host)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(To);
            mail.CC.Add(Cc);
            mail.From = new MailAddress(From);
            mail.Subject = Subject;
            mail.Body = Body;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = Host;
            smtp.Port = Convert.ToInt16(SMTPPort);
            smtp.Credentials = new NetworkCredential(UserID, Password);
            smtp.EnableSsl = Convert.ToBoolean(Ssl);
            smtp.Send(mail);
        }
        public static decimal ToDecimal(this string s, int precision, int scale)
        {
            if (s.Length < precision)
                throw new ArgumentException();
            return decimal
                .Parse(
                s.Substring(s.Length - precision)
                .Insert(precision - scale, ".")
                .ToString()
                ,
                System.Globalization.NumberStyles.AllowDecimalPoint,
                System.Globalization.NumberFormatInfo.InvariantInfo
                );
        }

        public static string GetShortDateFormatReports(object iInputDate)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(iInputDate)))
                {
                    return String.Format("{0:dd MMM yyyy}", Convert.ToDateTime(iInputDate));
                }
                return "";
            }
        public static string GetShortDateFormat(object iInputDate)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(iInputDate)))
            {
                return String.Format("{0:dd-MMM-yyyy}", Convert.ToDateTime(iInputDate));
            }
            return "";
        }
        public static string GetDecimalFormat(object iInputDate)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(iInputDate)))
            {
                return String.Format("{0:dd-MMM-yyyy}", Convert.ToDateTime(iInputDate));
            }
            return "";
        }
        public static DateTime GetLastDayOfMonth(DateTime dateTime)
        {
            return new DateTime(dateTime.Year, dateTime.Month, DateTime.DaysInMonth(dateTime.Year, dateTime.Month));
        }
        public static string base64Decode(string sData) //Decode    
        {
            try
            {
                var encoder = new System.Text.UTF8Encoding();
                System.Text.Decoder utf8Decode = encoder.GetDecoder();
                byte[] todecodeByte = Convert.FromBase64String(sData);
                int charCount = utf8Decode.GetCharCount(todecodeByte, 0, todecodeByte.Length);
                char[] decodedChar = new char[charCount];
                utf8Decode.GetChars(todecodeByte, 0, todecodeByte.Length, decodedChar, 0);
                string result = new String(decodedChar);
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in base64Decode" + ex.Message);
            }
        }
    }
}
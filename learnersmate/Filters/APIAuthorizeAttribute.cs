using learnersmate.AES256Encryption;
using learnersmate.Context;
using learnersmate.Models;
using System;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Controllers;

namespace learnersmate.Filters
{
    public class APIAuthorizeAttribute : AuthorizeAttribute
    {
        private DatabaseContext db = new DatabaseContext();
        public override void OnAuthorization(HttpActionContext filterContext)
        {
            if (Authorize(filterContext))
            {
                return;
            }
            HandleUnauthorizedRequest(filterContext);
        }
        protected override void HandleUnauthorizedRequest(HttpActionContext filterContext)
        {
            base.HandleUnauthorizedRequest(filterContext);
        }
        public static apiheaderdata GetAuthorize(string encodedString)
        {
            apiheaderdata apidata = new apiheaderdata();
            if (!string.IsNullOrEmpty(encodedString))
            {
                var key = EncryptionLibrary.DecryptText(encodedString);
                string[] parts = key.Split(new char[] { ':' });
                apidata.UserID = Convert.ToInt32(parts[1]);       // UserID 
                apidata.RoleID = Convert.ToInt32(parts[2]);       // RoleID   
                apidata.SchoolID = Convert.ToInt32(parts[3]);    // SchoolID
                apidata.AcademicYearID = Convert.ToInt32(parts[4]);    // AcademicYearID  

            }
            return apidata;
        }
        private bool Authorize(HttpActionContext actionContext)
        {
            try
            {
                var encodedString = actionContext.Request.Headers.GetValues("Token").First();

                bool validFlag = false;

                if (!string.IsNullOrEmpty(encodedString))
                {
                    var key = EncryptionLibrary.DecryptText(encodedString);
                    string[] parts = key.Split(new char[] { ':' });
                    var RandomKey = parts[0];                     // Random Key
                    var UserID = Convert.ToInt32(parts[1]);       // UserID
                    var RoleID = Convert.ToInt32(parts[2]);       // RoleID
                    var SchoolID = Convert.ToInt32(parts[3]);    // SchoolID
                    var AcademicYearID = Convert.ToInt32(parts[4]);    // AcademicYearID
                    long ticks = long.Parse(parts[5]);            // Ticks
                    DateTime IssuedOn = new DateTime(ticks);

                    var tokenModel = (from token in db.Tokens
                                      where token.TokenKey == RandomKey
                                      select token).FirstOrDefault();

                    if (tokenModel != null)
                    {

                        var ExpiresOn = (from token in db.Tokens
                                         where token.TokenID == tokenModel.TokenID
                                         select token.ExpiresOn
                                         ).FirstOrDefault();

                        if ((DateTime.Now > ExpiresOn))
                        {
                            validFlag = false;
                        }
                        else
                        {
                            validFlag = true;
                        }
                    }
                    else
                    {
                        validFlag = false;
                    }
                }
                return validFlag;
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
    //public class APIAuthorizeAttribute : AuthorizeAttribute
    //{
    //    private DatabaseContext db = new DatabaseContext();
    //    public override void OnAuthorization(HttpActionContext filterContext)
    //    {
    //        if (Authorize(filterContext))
    //        {
    //            return;
    //        }
    //        HandleUnauthorizedRequest(filterContext);
    //    }
    //    protected override void HandleUnauthorizedRequest(HttpActionContext filterContext)
    //    {
    //        base.HandleUnauthorizedRequest(filterContext);
    //    }
    //    public static apiheaderdata GetAuthorize()
    //    {
    //        HttpRequestMessage message = new HttpRequestMessage();
    //        var encodedString = message.Headers.GetValues("Token").First();
    //        apiheaderdata apidata = new apiheaderdata();
    //        if (!string.IsNullOrEmpty(encodedString))
    //        {
    //            var key = EncryptionLibrary.DecryptText(encodedString);
    //            string[] parts = key.Split(new char[] { ':' });
    //            apidata.UserID = Convert.ToInt32(parts[0]);       // UserID               
    //            apidata.SchoolID = Convert.ToInt32(parts[2]);    // SchoolID
    //            apidata.AcademicYearID = Convert.ToInt32(parts[3]);    // AcademicYearID  

    //        }
    //        return apidata;
    //    }
    //    private bool Authorize(HttpActionContext actionContext)
    //    {
    //        try
    //        {
    //            var encodedString = actionContext.Request.Headers.GetValues("Token").First();

    //            bool validFlag = false;

    //            if (!string.IsNullOrEmpty(encodedString))
    //            {
    //                var key = EncryptionLibrary.DecryptText(encodedString);

    //                string[] parts = key.Split(new char[] { ':' });

    //                var UserID = Convert.ToInt32(parts[0]);       // UserID
    //                var RandomKey = parts[1];                     // Random Key
    //                var CompanyID = Convert.ToInt32(parts[2]);    // CompanyID
    //                long ticks = long.Parse(parts[3]);            // Ticks
    //                DateTime IssuedOn = new DateTime(ticks);
    //                var ClientID = parts[4];                      // ClientID 


    //                // By passing this parameter 
    //                var registerModel = (from register in db.ClientKeys
    //                                     where register.CompanyID == CompanyID
    //                                     && register.UserID == UserID
    //                                     && register.ClientID == ClientID
    //                                     select register).FirstOrDefault();

    //                if (registerModel != null)
    //                {
    //                    // Validating Time
    //                    var ExpiresOn = (from token in db.TokensManager
    //                                     where token.CompanyID == CompanyID
    //                                     select token.ExpiresOn).FirstOrDefault();

    //                    if ((DateTime.Now > ExpiresOn))
    //                    {
    //                        validFlag = false;
    //                    }
    //                    else
    //                    {
    //                        validFlag = true;
    //                    }
    //                }
    //                else
    //                {
    //                    validFlag = false;
    //                }
    //            }
    //            return validFlag;
    //        }
    //        catch (Exception)
    //        {
    //            return false;
    //        }
    //    }

    //}
}
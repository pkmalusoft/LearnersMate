using System;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Controllers;
using learnersmate.Models;
using learnersmate.Context;
using learnersmate.Filters;
using learnersmate.AES256Encryption;

namespace learnersmate.Controllers
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
                    var UserID = Convert.ToInt32(parts[0]);       // UserID
                    var RandomKey = parts[1];                     // Random Key
                    var SchoolID = Convert.ToInt32(parts[2]);    // SchoolID
                    var FinancialYearID = Convert.ToInt32(parts[3]);    // FinancialYearID
                    long ticks = long.Parse(parts[4]);            // Ticks
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
}
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Mvc;
using learnersmate.Models;
using learnersmate.Context;
using learnersmate.Filters;
using learnersmate.AES256Encryption;
using static learnersmate.AES256Encryption.EncryptionLibrary;
using System;
using learnersmate.Repository;

namespace learnersmate.Controllers
{
    public class AuthenticateController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();
        IAuthenticate _IAuthenticate;
        public AuthenticateController()
        {
            _IAuthenticate = new AuthenticateConcrete();
        }

        // POST: api/Authenticate
        public HttpResponseMessage Authenticate(LoginViewModel model)
        {
            Token token1 = new Token();
            model.AcademicYearID = 1;
            model.SchoolID = 1;
            if (string.IsNullOrEmpty(model.Email) && string.IsNullOrEmpty(model.Password) && model.AcademicYearID > 0 && model.SchoolID > 0)
            {
                var response = new HttpResponseMessage(HttpStatusCode.NotAcceptable);
                response = Request.CreateResponse(HttpStatusCode.OK, "Required Email, Password, AcademicYearID, SchoolID");
                response.Content = new StringContent("Not Valid Request");
                return response;
            }
            else
            {
                var userManager1 = db.Users.Where(x => x.Email == model.Email && x.Status == true).FirstOrDefault();
                if (userManager1 != null)
                {
                    string username = userManager1.Email;
                    var user = db.Users.Where(x => x.Email == model.Email && x.Password == model.Password).FirstOrDefault();
                    if (user != null)
                    {
                        UserRole userrole = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == userManager1.UserID).FirstOrDefault();
                        string rolename = userrole.CurrentRole.Name;
                        int roleid = userrole.RoleID;
                        Company company = db.Companys.Find(1);
                        School school = db.Schools.Find(model.SchoolID);
                        CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == model.AcademicYearID).FirstOrDefault();
                        var key = KeyGenerator.GetUniqueKey();
                        string randomnumber =
                        string.Join(":", new string[]
                        {
                            key,
                            Convert.ToString(userManager1.UserID),
                            Convert.ToString(roleid),
                            Convert.ToString(school.SchoolID),
                            Convert.ToString(companyacademicyear.CurrentAcademicYear.AcademicYearID),
                            Convert.ToString(DateTime.Now.Ticks)
                        });
                        var newToken = EncryptionLibrary.EncryptText(randomnumber);

                        //var tokensexpired = db.Tokens.Where(t => t.ExpiresOn <= DateTime.Now);
                        //foreach(Token tokenexpired in tokensexpired)
                        //{
                        //    db.Tokens.Remove(tokenexpired);
                        //    db.SaveChanges();
                        //}

                        token1.Password = "";
                        token1.TokenKey = key;
                        token1.IssuedOn = DateTime.Now;
                        token1.ExpiresOn = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["TokenExpiry"]));
                        token1.CreatedOn = DateTime.Now;
                        token1.Email = user.Email;
                        token1.UserID = user.UserID;
                        token1.RoleID = roleid;
                        token1.SchoolID = school.SchoolID;
                        token1.AcademicYearID = companyacademicyear.CurrentAcademicYear.AcademicYearID;
                        token1.Company = company.Name;
                        token1.CompanyLogo = company.Logo;
                        db.Tokens.Add(token1);
                        try
                        {
                            db.SaveChanges();
                            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, token1);
                            response.Headers.Add("Token", newToken);
                            response.Headers.Add("TokenExpiry", ConfigurationManager.AppSettings["TokenExpiry"]);
                            response.Headers.Add("Access-Control-Expose-Headers", "Token,TokenExpiry");
                            return response;

                            //HttpResponseMessage response = new HttpResponseMessage();
                            //response = Request.CreateResponse(HttpStatusCode.OK, "Authorized");
                            //response.Headers.Add("Token", newToken);
                            //response.Headers.Add("TokenExpiry", ConfigurationManager.AppSettings["TokenExpiry"]);
                            //response.Headers.Add("Access-Control-Expose-Headers", "Token,TokenExpiry");
                            //response.Content = token;
                            //return response;
                            //return new HttpResponseMessage(HttpStatusCode.OK) { Content = new StringContent(token, System.Text.Encoding.UTF8, "application/json") };
                        }
                        catch
                        {
                            var response = new HttpResponseMessage(HttpStatusCode.NotFound);
                            response = Request.CreateResponse(HttpStatusCode.OK, "Wrong Password");
                            response.Content = new StringContent("Wrong Password");
                            return response;
                        }

                    }
                    else
                    {
                        var response = new HttpResponseMessage(HttpStatusCode.NotFound);
                        response = Request.CreateResponse(HttpStatusCode.OK, "Wrong Password");
                        response.Content = new StringContent("Wrong Password");
                        return response;
                    }
                }
                else
                {

                    //var message = new HttpResponseMessage(HttpStatusCode.NotFound);
                    //message.Content = new StringContent("Email is not available");
                    //return new HttpResponseMessage { StatusCode = HttpStatusCode.NotAcceptable };
                    var response = new HttpResponseMessage(HttpStatusCode.NotFound);
                    response = Request.CreateResponse(HttpStatusCode.OK, "Email is not available");
                    response.Content = new StringContent("Email is not available");
                    return response;
                }


            }

            //if (string.IsNullOrEmpty(ClientKeys.ClientID) && string.IsNullOrEmpty(ClientKeys.ClientSecret))
            //{
            //    var message = new HttpResponseMessage(HttpStatusCode.NotAcceptable);
            //    message.Content = new StringContent("Not Valid Request");
            //    return message;
            //}
            //else
            //{
            //    if (_IAuthenticate.ValidateKeys(ClientKeys))
            //    {
            //        var clientkeys = _IAuthenticate.GetClientKeysDetailsbyCLientIDandClientSecert(ClientKeys.ClientID, ClientKeys.ClientSecret);

            //        if (clientkeys == null)
            //        {
            //            var message = new HttpResponseMessage(HttpStatusCode.NotFound);
            //            message.Content = new StringContent("InValid Keys");
            //            return message;
            //        }
            //        else
            //        {
            //            if (_IAuthenticate.IsTokenAlreadyExists(clientkeys.CompanyID))
            //            {
            //                _IAuthenticate.DeleteGenerateToken(clientkeys.CompanyID);

            //                return GenerateandSaveToken(clientkeys);
            //            }
            //            else
            //            {
            //                return GenerateandSaveToken(clientkeys);
            //            }
            //        }
            //    }
            //    else
            //    {
            //        var message = new HttpResponseMessage(HttpStatusCode.NotFound);
            //        message.Content = new StringContent("InValid Keys");
            //        return new HttpResponseMessage { StatusCode = HttpStatusCode.NotAcceptable };
            //    }
            //}
        }


        //[NonAction]
        //private HttpResponseMessage GenerateandSaveToken(ClientKey clientkeys)
        //{
        //    var IssuedOn = DateTime.Now;
        //var newToken = _IAuthenticate.GenerateToken(clientkeys, IssuedOn);
        //    TokensManager token = new TokensManager();
        //    token.TokenID = 0;
        //    token.TokenKey = newToken;
        //    token.CompanyID = clientkeys.CompanyID;
        //    token.IssuedOn = IssuedOn;
        //    token.ExpiresOn = DateTime.Now.AddMinutes(Convert.ToInt32(ConfigurationManager.AppSettings["TokenExpiry"]));
        //    token.CreatedOn = DateTime.Now;
        //    var result = _IAuthenticate.InsertToken(token);

        //    if (result == 1)
        //    {
        //        HttpResponseMessage response = new HttpResponseMessage();
        //        response = Request.CreateResponse(HttpStatusCode.OK, "Authorized");
        //        response.Headers.Add("Token", newToken);
        //        response.Headers.Add("TokenExpiry", ConfigurationManager.AppSettings["TokenExpiry"]);
        //        response.Headers.Add("Access-Control-Expose-Headers", "Token,TokenExpiry");
        //        return response;
        //    }
        //    else
        //    {
        //        var message = new HttpResponseMessage(HttpStatusCode.NotAcceptable);
        //        message.Content = new StringContent("Error in Creating Token");
        //        return message;
        //    }
        //}
    }
}

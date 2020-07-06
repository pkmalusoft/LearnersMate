using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Mvc;
using learnersmate.Models;
using learnersmate.Context;
using learnersmate.Filters;
using learnersmate.AES256Encryption;

namespace learnersmate.Controllers
{
   [APIAuthorizeAttribute]
    public class SchoolApiController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();
       
        // GET api/School       
        public IHttpActionResult GetSchools()
        {
            //var schoollist = db.Schools.ToJsonArray();
            //var response = Request.CreateResponse(HttpStatusCode.OK);
            //response.Content = new StringContent(Json(schoollist), Encoding.UTF8, "application/json");
            try
            {
                apiheaderdata apidata = APIAuthorizeAttribute.GetAuthorize(Request.Headers.GetValues("Token").First());            
                //var encodedString = Request.Headers.GetValues("Token").First();
                //apiheaderdata apidata = new apiheaderdata();
                //if (!string.IsNullOrEmpty(encodedString))
                //{
                //    var key = EncryptionLibrary.DecryptText(encodedString);
                //    string[] parts = key.Split(new char[] { ':' });
                //    apidata.UserID = Convert.ToInt32(parts[0]);       // UserID               
                //    apidata.SchoolID = Convert.ToInt32(parts[2]);    // SchoolID
                //    apidata.AcademicYearID = Convert.ToInt32(parts[3]);    // AcademicYearID  

                //}
                CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == apidata.AcademicYearID).FirstOrDefault();
                int companyacademicyearid = companyacademicyear.CompanyAcademicYearID;
                var userroles = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == apidata.UserID).FirstOrDefault();
                int roleid = userroles.CurrentRole.RoleID;
                var schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.SchoolID == 0);
                switch (roleid)
                {
                    case 1:
                        schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name);
                        break;
                    case 2:
                        schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == apidata.SchoolID).OrderBy(s => s.Name);
                        break;
                    case 3:
                        schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == apidata.SchoolID).OrderBy(s => s.Name);
                        break;
                    case 4:
                        schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == apidata.SchoolID).OrderBy(s => s.Name);
                        break;
                    case 5:
                        schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == apidata.SchoolID).OrderBy(s => s.Name);
                        break;
                    default:
                        break;
                }
                List <School> SchoolList = new List<School>();
                foreach (School schoolmodel in schools)
                {
                    School school = new School();
                    school.SchoolID = schoolmodel.SchoolID;
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
                    SchoolList.Add(school);
                }
                
                return Json(SchoolList.ToList());
                
            }
            catch (System.Exception)
            {
                throw;
            }

        }

        // GET api/School/5
        public IHttpActionResult GetSchool(int id)
        {
            School school = db.Schools.Where(s => s.SchoolID == id).FirstOrDefault();
            return Json(school);
        }      

        // PUT api/School/5
        public IHttpActionResult PutSchool(int id, SchoolModel schoolmodel, string newlogo, string existingemail)
        {
            if (!ModelState.IsValid)
            {
                return Json("Please check input values");
            }

            if (id != schoolmodel.SchoolID)
            {
                return Json("Bad Request");
            }
            if (schoolmodel.Email != existingemail)
            {
                User schoolold = db.Users.Where(s => s.Email == schoolmodel.Email).FirstOrDefault();
                if (schoolold != null)
                {                   
                    return Json("Email already exists");
                }
            }
           

            try
            {
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
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SchoolExists(id))
                {
                    return Json("Not Found");
                }
                else
                {
                    return Json("Please check input values");
                }
            }

            //return Json(HttpStatusCode.NoContent);
            return Json("Modified Successfully");
        }

        // POST api/School
        [ResponseType(typeof(School))]
        public IHttpActionResult PostSchool(SchoolModel schoolmodel, string newlogo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            User schoolold = db.Users.Where(s => s.Email == schoolmodel.Email).FirstOrDefault();
            if (schoolold != null)
            {                
                return Json("Email already exists");
            }
            else
            {                
                if (newlogo != "")
                {
                    schoolmodel.Logo = newlogo;
                }

                try
                {
                    apiheaderdata apidata = APIAuthorizeAttribute.GetAuthorize(Request.Headers.GetValues("Token").First());
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
                    school.CompanyAcademicYearID = schoolmodel.CompanyAcademicYearID;
                    school.Principal = schoolmodel.Principal;
                    school.UserID = user.UserID;
                    CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == apidata.AcademicYearID).FirstOrDefault();
                    school.CompanyAcademicYearID = companyacademicyear.CompanyAcademicYearID;
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
                    catch { }
                }
                catch 
                {                   
                    return Json("Error in creating");
                }
            }

            return Json("Created Successfully");
        }

        // DELETE api/School/5
        [ResponseType(typeof(School))]
        public IHttpActionResult DeleteSchool(int id)
        {
            School school = db.Schools.Find(id);
            if (school == null)
            {
                return Json("Not Found");
            }
            school.Status = false;
            db.Entry(school).State = EntityState.Modified;
            db.SaveChanges();
            return Json("Deactivated Successfully");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SchoolExists(int id)
        {
            return db.Schools.Count(e => e.SchoolID == id) > 0;
        }
        //[ResponseType(typeof(School))]
        //public IHttpActionResult GetSchool(int id)
        //{
        //    School school = db.Schools.Find(id);
        //    if (school == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(school);
        //}
    }
}
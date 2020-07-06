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
namespace learnersmate.Controllers
{
    [APIAuthorizeAttribute]
    public class ParentApiController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();
       
        // GET api/Parent       
        public IHttpActionResult GetParents(int userid, int academicyearid, int schoolid)
        {
            //var parentlist = db.Parents.ToJsonArray();
            //var response = Request.CreateResponse(HttpStatusCode.OK);
            //response.Content = new StringContent(Json(parentlist), Encoding.UTF8, "application/json");
            CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == academicyearid).FirstOrDefault();
            int companyacademicyearid = companyacademicyear.CompanyAcademicYearID;
            var userroles = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == userid).FirstOrDefault();
            int roleid = userroles.CurrentRole.RoleID;
            var parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.ParentID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                case 5:
                    Student student = db.Students.Where(s => s.UserID == userid).FirstOrDefault();
                    int parentid = student.ParentID;
                    parents = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.ParentID == parentid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return Json(parents);             
        }

        // GET api/Parent/5
        public IHttpActionResult GetParent(int id)
        {
            Parent parent = db.Parents.Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Include(s => s.CurrentUser).Where(s => s.ParentID == id).OrderBy(s => s.Name).FirstOrDefault();
            return Json(parent);
        }      

        // PUT api/Parent/5
        public IHttpActionResult PutParent(int id, ParentModel parentmodel, string newlogo, string existingemail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != parentmodel.ParentID)
            {
                return BadRequest();
            }
            if (parentmodel.Email != existingemail)
            {
                User parentold = db.Users.Where(s => s.Email == parentmodel.Email).FirstOrDefault();
                if (parentold != null)
                {                   
                    return Json("Email already exists");
                }
            }
           
            try
            {
                if (newlogo != "")
                {
                    parentmodel.Photo = newlogo;
                }

                User superadminuser = db.Users.Find(1);

                User user = db.Users.Find(parentmodel.UserID);
                user.Email = parentmodel.Email;
                user.Password = parentmodel.Password;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();

                Parent parent = db.Parents.Find(parentmodel.ParentID);
                parent.Name = parentmodel.Name;
                parent.HouseNo = parentmodel.HouseNo;
                parent.BuildingName = parentmodel.BuildingName;
                parent.Street = parentmodel.Street;
                parent.Area = parentmodel.Area;
                parent.Location = parentmodel.Location;
                parent.CityID = parentmodel.CityID;
                parent.CountryID = parentmodel.CountryID;
                parent.PinCode = parentmodel.PinCode;
                parent.Landline = parentmodel.Landline;
                parent.Mobile = parentmodel.Mobile;
                parent.Photo = parentmodel.Photo;
                parent.SchoolID = parentmodel.SchoolID;
                parent.UserID = parentmodel.UserID;               
                parent.Status = parentmodel.Status;
                db.Entry(parent).State = EntityState.Modified;
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ParentExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            //return Json(HttpStatusCode.NoContent);
            return Json("Modified Successfully");
        }

        // POST api/Parent
        [ResponseType(typeof(Parent))]
        public IHttpActionResult PostParent(ParentModel parentmodel, string newlogo, int academicyearid)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            User parentold = db.Users.Where(s => s.Email == parentmodel.Email).FirstOrDefault();
            if (parentold != null)
            {                
                return Json("Email already exists");
            }
            else
            {                
                if (newlogo != "")
                {
                    parentmodel.Photo = newlogo;
                }

                try
                {
                    User superadminuser = db.Users.Find(1);

                    User user = new User();
                    user.Email = parentmodel.Email;
                    user.Password = parentmodel.Password;
                    user.CanCreate = false;
                    user.CanEdit = false;
                    user.CanDelete = false;
                    user.CanPrint = false;
                    user.Status = false;
                    user.CreatedOn = DateTime.Now;
                    user.LastLoggedOn = null;
                    db.Users.Add(user);
                    db.SaveChanges();

                   
                    Role role = db.Roles.Where(r => r.Name == "Parent").FirstOrDefault();
                    UserRole userroles = new UserRole();
                    userroles.UserID = user.UserID;
                    userroles.RoleID = role.RoleID;
                    db.UserRoles.Add(userroles);
                    db.SaveChanges();

                    Parent parent = new Parent();
                    parent.Name = parentmodel.Name;
                    parent.HouseNo = parentmodel.HouseNo;
                    parent.BuildingName = parentmodel.BuildingName;
                    parent.Street = parentmodel.Street;
                    parent.Area = parentmodel.Area;
                    parent.Location = parentmodel.Location;
                    parent.CityID = parentmodel.CityID;
                    parent.CountryID = parentmodel.CountryID;
                    parent.PinCode = parentmodel.PinCode;
                    parent.Landline = parentmodel.Landline;
                    parent.Mobile = parentmodel.Mobile; 
					parent.Photo = parentmodel.Photo;
                    parent.SchoolID = parentmodel.SchoolID;                    
                    parent.UserID = user.UserID;
                    parent.Status = parentmodel.Status;
                    db.Parents.Add(parent);
                    db.SaveChanges();

                    user.Status = true;
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    string To = parentmodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                    CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                    string subject = "New Parent Created";
                    string body = "Hi,";
                    body += "<br/> Parent was created. Please login using these credentials, and update parent profile. <br/> Login email : " + parentmodel.Email;
                    body += "<br/> Login password : " + parentmodel.Password;
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

        // DELETE api/Parent/5
        [ResponseType(typeof(Parent))]
        public IHttpActionResult DeleteParent(int id)
        {
            Parent parent = db.Parents.Find(id);
            if (parent == null)
            {
                return NotFound();
            }
            parent.Status = false;
            db.Entry(parent).State = EntityState.Modified;
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

        private bool ParentExists(int id)
        {
            return db.Parents.Count(e => e.ParentID == id) > 0;
        }
        //[ResponseType(typeof(Parent))]
        //public IHttpActionResult GetParent(int id)
        //{
        //    Parent parent = db.Parents.Find(id);
        //    if (parent == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(parent);
        //}
    }
}
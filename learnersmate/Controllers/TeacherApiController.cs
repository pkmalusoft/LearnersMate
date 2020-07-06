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
    public class TeacherApiController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();
       
        // GET api/Teacher       
        public IHttpActionResult GetTeachers(int userid, int academicyearid, int schoolid)
        {
            //var teacherlist = db.Teachers.ToJsonArray();
            //var response = Request.CreateResponse(HttpStatusCode.OK);
            //response.Content = new StringContent(Json(teacherlist), Encoding.UTF8, "application/json");

            CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == academicyearid).FirstOrDefault();
            int companyacademicyearid = companyacademicyear.CompanyAcademicYearID;     
            var userroles = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == userid).FirstOrDefault();
            int roleid = userroles.CurrentRole.RoleID;
            var teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.TeacherID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 5:
                    teachers = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return Json(teachers);                   
        }

        // GET api/Teacher/5
        public IHttpActionResult GetTeacher(int id)
        {
            Teacher teacher = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.TeacherID == id).OrderBy(s => s.Name).FirstOrDefault();
            return Json(teacher);
        }      

        // PUT api/Teacher/5
        public IHttpActionResult PutTeacher(int id, TeacherModel teachermodel, string newlogo, string existingemail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != teachermodel.TeacherID)
            {
                return BadRequest();
            }
            if (teachermodel.Email != existingemail)
            {
                User teacherold = db.Users.Where(s => s.Email == teachermodel.Email).FirstOrDefault();
                if (teacherold != null)
                {                   
                    return Json("Email already exists");
                }
            }
           

            try
            {
                if (newlogo != "")
                {
                    teachermodel.Photo = newlogo;
                }

                User superadminuser = db.Users.Find(1);

                User user = db.Users.Find(teachermodel.UserID);
                user.Email = teachermodel.Email;
                user.Password = teachermodel.Password;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();

                Teacher teacher = db.Teachers.Find(teachermodel.TeacherID);
                teacher.Name = teachermodel.Name;
                teacher.HouseNo = teachermodel.HouseNo;
                teacher.BuildingName = teachermodel.BuildingName;
                teacher.Street = teachermodel.Street;
                teacher.Area = teachermodel.Area;
                teacher.Location = teachermodel.Location;
                teacher.CityID = teachermodel.CityID;
                teacher.CountryID = teachermodel.CountryID;
                teacher.PinCode = teachermodel.PinCode;
                teacher.Landline = teachermodel.Landline;
                teacher.Mobile = teachermodel.Mobile;
                teacher.Photo = teachermodel.Photo;               
                teacher.SchoolID = teachermodel.SchoolID;
                teacher.UserID = teachermodel.UserID;                
                teacher.Status = teachermodel.Status;
                db.Entry(teacher).State = EntityState.Modified;
                db.SaveChanges(); 
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TeacherExists(id))
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

        // POST api/Teacher
        [ResponseType(typeof(Teacher))]
        public IHttpActionResult PostTeacher(TeacherModel teachermodel, string newlogo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            User teacherold = db.Users.Where(s => s.Email == teachermodel.Email).FirstOrDefault();
            if (teacherold != null)
            {                
                return Json("Email already exists");
            }
            else
            {                
                if (newlogo != "")
                {
                    teachermodel.Photo = newlogo;
                }

                try
                {
                    User superadminuser = db.Users.Find(1);

                    User user = new User();
                    user.Email = teachermodel.Email;
                    user.Password = teachermodel.Password;
                    user.CanCreate = false;
                    user.CanEdit = false;
                    user.CanDelete = false;
                    user.CanPrint = false;
                    user.Status = false;
                    user.CreatedOn = DateTime.Now;
                    user.LastLoggedOn = null;
                    db.Users.Add(user);
                    db.SaveChanges();

                    Role role = db.Roles.Where(r => r.Name == "Teacher").FirstOrDefault();
                    UserRole userroles = new UserRole();
                    userroles.UserID = user.UserID;
                    userroles.RoleID = role.RoleID;
                    db.UserRoles.Add(userroles);
                    db.SaveChanges();

                    Teacher teacher = new Teacher();
                    teacher.Name = teachermodel.Name;
                    teacher.HouseNo = teachermodel.HouseNo;
                    teacher.BuildingName = teachermodel.BuildingName;
                    teacher.Street = teachermodel.Street;
                    teacher.Area = teachermodel.Area;
                    teacher.Location = teachermodel.Location;
                    teacher.CityID = teachermodel.CityID;
                    teacher.CountryID = teachermodel.CountryID;
                    teacher.PinCode = teachermodel.PinCode;
                    teacher.Landline = teachermodel.Landline;
                    teacher.Mobile = teachermodel.Mobile; 
					teacher.Photo = teachermodel.Photo; 
                    teacher.SchoolID = teachermodel.SchoolID;       
                    teacher.UserID = user.UserID;
                    teacher.Status = teachermodel.Status;
                    db.Teachers.Add(teacher);
                    db.SaveChanges();

                    user.Status = true;
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    string To = teachermodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                    CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                    string subject = "New Teacher Created";
                    string body = "Hi,";
                    body += "<br/> Teacher was created. Please login using these credentials, and update teacher profile. <br/> Login email : " + teachermodel.Email;
                    body += "<br/> Login password : " + teachermodel.Password;
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

        // DELETE api/Teacher/5
        [ResponseType(typeof(Teacher))]
        public IHttpActionResult DeleteTeacher(int id)
        {
            Teacher teacher = db.Teachers.Find(id);
            if (teacher == null)
            {
                return NotFound();
            }
            teacher.Status = false;
            db.Entry(teacher).State = EntityState.Modified;
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

        private bool TeacherExists(int id)
        {
            return db.Teachers.Count(e => e.TeacherID == id) > 0;
        }
        //[ResponseType(typeof(Teacher))]
        //public IHttpActionResult GetTeacher(int id)
        //{
        //    Teacher teacher = db.Teachers.Find(id);
        //    if (teacher == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(teacher);
        //}
    }
}
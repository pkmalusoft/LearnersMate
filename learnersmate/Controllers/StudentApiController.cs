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
    public class StudentApiController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();
       
        // GET api/Student       
        public IHttpActionResult GetStudents(int userid, int academicyearid, int schoolid)
        {
            //var studentlist = db.Students.ToJsonArray();
            //var response = Request.CreateResponse(HttpStatusCode.OK);
            //response.Content = new StringContent(Json(studentlist), Encoding.UTF8, "application/json");
            CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == academicyearid).FirstOrDefault();
            int companyacademicyearid = companyacademicyear.CompanyAcademicYearID;    
            var userroles = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == userid).FirstOrDefault();
            int roleid = userroles.CurrentRole.RoleID;
            var students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.SchoolID == 0).ToList();
            switch (roleid)
            {
                case 1:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).OrderBy(s => s.Name).ToList();
                    break;
                case 2:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 3:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.SchoolID == schoolid).OrderBy(s => s.Name).ToList();
                    break;
                case 4:
                    Parent parent = db.Parents.Where(p => p.UserID == userid).FirstOrDefault();
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.ParentID == parent.ParentID).OrderBy(s => s.Name).ToList();
                    break;
                case 5:
                    students = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.CurrentSchool.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid && s.UserID == userid).OrderBy(s => s.Name).ToList();
                    break;
                default:
                    break;
            }
            return Json(students);           
        }

        // GET api/Student/5
        public IHttpActionResult GetStudent(int id)
        {
            Student student = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.SchoolID == id).FirstOrDefault();
            return Json(student);
        }      

        // PUT api/Student/5
        public IHttpActionResult PutStudent(int id, StudentModel studentmodel, string newlogo, string existingemail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != studentmodel.StudentID)
            {
                return BadRequest();
            }
            if (studentmodel.Email != existingemail)
            {
                User studentold = db.Users.Where(s => s.Email == studentmodel.Email).FirstOrDefault();
                if (studentold != null)
                {                   
                    return Json("Email already exists");
                }
            }
           

            try
            {
                if (newlogo != "")
                {
                    studentmodel.Photo = newlogo;
                }

                User superadminuser = db.Users.Find(1);

                User user = db.Users.Find(studentmodel.UserID);
                user.Email = studentmodel.Email;
                user.Password = studentmodel.Password;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();

                Student student = db.Students.Find(studentmodel.StudentID);
                student.Name = studentmodel.Name;
                student.Mobile = studentmodel.Mobile;
                student.ClassID = studentmodel.ClassID;
                student.SectionID = studentmodel.SectionID;

                student.Photo = studentmodel.Photo;                
                student.SchoolID = studentmodel.SchoolID;
                student.ParentID = studentmodel.ParentID;
                student.UserID = studentmodel.UserID;                
                student.Status = studentmodel.Status;

                student.GuardianName = studentmodel.GuardianName;
                student.GuardianMobile = studentmodel.GuardianMobile;
                student.GuardianEmail = studentmodel.GuardianEmail;

                student.Parent2Name = studentmodel.Parent2Name;
                student.Parent2Mobile = studentmodel.Parent2Mobile;
                student.Parent2Email = studentmodel.Parent2Email;

                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StudentExists(id))
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

        // POST api/Student
        [ResponseType(typeof(Student))]
        public IHttpActionResult PostStudent(StudentModel studentmodel, string newlogo, int academicyearid)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            User studentold = db.Users.Where(s => s.Email == studentmodel.Email).FirstOrDefault();
            if (studentold != null)
            {                
                return Json("Email already exists");
            }
            else
            {                
                if (newlogo != "")
                {
                    studentmodel.Photo = newlogo;
                }

                try
                {
                    User superadminuser = db.Users.Find(1);

                    User user = new User();
                    user.Email = studentmodel.Email;
                    user.Password = studentmodel.Password;
                    user.CanCreate = false;
                    user.CanEdit = false;
                    user.CanDelete = false;
                    user.CanPrint = false;
                    user.Status = false;
                    user.CreatedOn = DateTime.Now;
                    user.LastLoggedOn = null;
                    db.Users.Add(user);
                    db.SaveChanges();


                    Role role = db.Roles.Where(r => r.Name == "Student").FirstOrDefault();
                    UserRole userroles = new UserRole();
                    userroles.UserID = user.UserID;
                    userroles.RoleID = role.RoleID;
                    db.UserRoles.Add(userroles);
                    db.SaveChanges();

                    Student student = new Student();
                    student.Name = studentmodel.Name;                   
                    student.Mobile = studentmodel.Mobile;
                    student.IdCard = studentmodel.IdCard;
                    student.ClassID = studentmodel.ClassID;
                    student.SectionID = studentmodel.SectionID;

					student.Photo = studentmodel.Photo;
                    student.SchoolID = studentmodel.SchoolID;                    
                    student.UserID = user.UserID;                    
                    student.Status = studentmodel.Status;
                    db.Students.Add(student);
                    db.SaveChanges();        
                                
                    School school = db.Schools.Find(studentmodel.SchoolID);

                    studentmodel.IdCard = "" + school.ShortName + "-" + student.StudentID.ToString("D" + 6);
                    db.Entry(student).State = EntityState.Modified;
                    db.SaveChanges();

                    user.Status = true;
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    string To = studentmodel.Email, WebsiteUrl, Ssl, UserID, Password, SMTPPort, Host;
                    CommanFunctions.AppSettings(out WebsiteUrl, out Ssl, out UserID, out Password, out SMTPPort, out Host);
                    string subject = "New Student Created";
                    string body = "Hi,";
                    body += "<br/> Student was created. Please login using these credentials, and update student profile. <br/> Login email : " + studentmodel.Email;
                    body += "<br/> Login password : " + studentmodel.Password;
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

        // DELETE api/Student/5
        [ResponseType(typeof(Student))]
        public IHttpActionResult DeleteStudent(int id)
        {
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return NotFound();
            }
            student.Status = false;
            db.Entry(student).State = EntityState.Modified;
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

        private bool StudentExists(int id)
        {
            return db.Students.Count(e => e.StudentID == id) > 0;
        }
        //[ResponseType(typeof(Student))]
        //public IHttpActionResult GetStudent(int id)
        //{
        //    Student student = db.Students.Find(id);
        //    if (student == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(student);
        //}
    }
}
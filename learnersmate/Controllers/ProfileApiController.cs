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
    public class ProfileApiController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();
            
        public IHttpActionResult GetProfileApi()
        {           
            try
            {
                apiheaderdata apidata = APIAuthorizeAttribute.GetAuthorize(Request.Headers.GetValues("Token").First());                
                CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == apidata.AcademicYearID).FirstOrDefault();
                int companyacademicyearid = companyacademicyear.CompanyAcademicYearID;
                UserRole userrole = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == apidata.UserID).FirstOrDefault();
                int roleid = userrole.RoleID;
                
                switch (roleid)
                {
                    case 1:
                        School school = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.SchoolID == apidata.SchoolID).FirstOrDefault();
                        SchoolModelApi schoolapi = new SchoolModelApi();
                        schoolapi.SchoolID = school.SchoolID;
                        schoolapi.Name = school.Name;
                        schoolapi.ShortName = school.ShortName;
                        schoolapi.HouseNo = school.HouseNo;
                        schoolapi.BuildingName = school.BuildingName;
                        schoolapi.Street = school.Street;
                        schoolapi.Area = school.Area;
                        schoolapi.Location = school.Location;
                        schoolapi.City = school.CurrentCity.Name;
                        schoolapi.Country = school.CurrentCountry.Name;
                        schoolapi.PinCode = school.PinCode;
                        schoolapi.Landline = school.Landline;
                        schoolapi.Mobile = school.Mobile;
                        schoolapi.RegNo = school.RegNo;
                        schoolapi.Logo = school.Logo;
                        schoolapi.Principal = school.Principal;
                        schoolapi.Status = school.Status;
                        schoolapi.Email = school.CurrentUser.Email;
                        schoolapi.Password = school.CurrentUser.Password;
                        return Json(schoolapi);
                    case 2:
                        school = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.SchoolID == apidata.SchoolID).FirstOrDefault();                        
                        schoolapi = new SchoolModelApi();
                        schoolapi.SchoolID = school.SchoolID;
                        schoolapi.Name = school.Name;
                        schoolapi.ShortName = school.ShortName;
                        schoolapi.HouseNo = school.HouseNo;
                        schoolapi.BuildingName = school.BuildingName;
                        schoolapi.Street = school.Street;
                        schoolapi.Area = school.Area;
                        schoolapi.Location = school.Location;
                        schoolapi.City = school.CurrentCity.Name;
                        schoolapi.Country = school.CurrentCountry.Name;
                        schoolapi.PinCode = school.PinCode;
                        schoolapi.Landline = school.Landline;
                        schoolapi.Mobile = school.Mobile;
                        schoolapi.RegNo = school.RegNo;
                        schoolapi.Logo = school.Logo;
                        schoolapi.Principal = school.Principal;                      
                        schoolapi.Status = school.Status;
                        schoolapi.Email = school.CurrentUser.Email;
                        schoolapi.Password = school.CurrentUser.Password;
                        return Json(schoolapi);
                        
                    case 3:
                        Teacher teacher = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                        TeacherModelApi teacherapi = new TeacherModelApi();
                        teacherapi.TeacherID = teacher.TeacherID;
                        teacherapi.Name = teacher.Name;
                        teacherapi.HouseNo = teacher.HouseNo;
                        teacherapi.BuildingName = teacher.BuildingName;
                        teacherapi.Street = teacher.Street;
                        teacherapi.Area = teacher.Area;
                        teacherapi.Location = teacher.Location;
                        teacherapi.City = teacher.CurrentCity.Name;
                        teacherapi.Country = teacher.CurrentCountry.Name;
                        teacherapi.PinCode = teacher.PinCode;
                        teacherapi.Landline = teacher.Landline;
                        teacherapi.Mobile = teacher.Mobile;
                        teacherapi.Photo = teacher.Photo;
                        teacherapi.School = teacher.CurrentSchool.Name;
                        teacherapi.LeavesToAvail = teacher.LeavesToAvail;
                        teacherapi.Salary = teacher.Salary;
                        teacherapi.Status = teacher.Status;                        
                        teacherapi.Email = teacher.CurrentUser.Email;
                        teacherapi.Password = teacher.CurrentUser.Password;
                        return Json(teacherapi);

                    case 4:
                        Parent parent = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                        ParentModelApi parentapi = new ParentModelApi();
                        parentapi.ParentID = parent.ParentID;
                        parentapi.Name = parent.Name;
                        parentapi.HouseNo = parent.HouseNo;
                        parentapi.BuildingName = parent.BuildingName;
                        parentapi.Street = parent.Street;
                        parentapi.Area = parent.Area;
                        parentapi.Location = parent.Location;
                        parentapi.City = parent.CurrentCity.Name;
                        parentapi.Country = parent.CurrentCountry.Name;
                        parentapi.PinCode = parent.PinCode;
                        parentapi.Landline = parent.Landline;
                        parentapi.Mobile = parent.Mobile;
                        parentapi.Photo = parent.Photo;
                        parentapi.School = parent.CurrentSchool.Name;
                        parentapi.Status = parent.Status;
                        parentapi.Email = parent.CurrentUser.Email;
                        parentapi.Password = parent.CurrentUser.Password;
                        return Json(parentapi);

                    case 5:
                        Student student = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Include(s => s.CurrentParent.CurrentUser).Include(s => s.CurrentParent.CurrentCity).Include(s => s.CurrentParent.CurrentCountry).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                        StudentModelApi studentapi = new StudentModelApi();
                        studentapi.StudentID = student.StudentID;
                        studentapi.Name = student.Name;
                        studentapi.IdCard = student.IdCard;
                        studentapi.Dob = student.Dob;
                        studentapi.Mobile = student.Mobile;
                        studentapi.Class = student.CurrentClass.Name;
                        studentapi.Section = student.CurrentSection.Name;
                        studentapi.SchoolName = student.CurrentSchool.Name;                                        
                        studentapi.ParentName = student.CurrentParent.Name;
                        studentapi.ParentHouseNo = student.CurrentParent.HouseNo;
                        studentapi.ParentBuildingName = student.CurrentParent.BuildingName;
                        studentapi.ParentStreet = student.CurrentParent.Street;
                        studentapi.ParentArea = student.CurrentParent.Area;
                        studentapi.ParentLocation = student.CurrentParent.Location;
                        studentapi.ParentCity = student.CurrentParent.CurrentCity.Name;
                        studentapi.ParentCountry = student.CurrentParent.CurrentCountry.Name;
                        studentapi.ParentPinCode = student.CurrentParent.PinCode;
                        studentapi.ParentLandline = student.CurrentParent.Landline;
                        studentapi.ParentMobile = student.CurrentParent.Mobile;
                        studentapi.ParentEmail = student.CurrentParent.CurrentUser.Email;
                        studentapi.ParentPinCode = student.CurrentParent.PinCode;
                        studentapi.GuardianName = student.GuardianName;
                        studentapi.GuardianMobile = student.GuardianMobile;
                        studentapi.GuardianEmail = student.GuardianEmail;
                        studentapi.Parent2Name = student.Parent2Name;
                        studentapi.Parent2Mobile = student.Parent2Mobile;
                        studentapi.Parent2Email = student.Parent2Email;
                        studentapi.Photo = student.Photo;
                        studentapi.Fee = student.Fee;
                        studentapi.FeeInstalments = student.FeeInstalments;
                        studentapi.Status = student.Status;
                        studentapi.Email = student.CurrentUser.Email;
                        studentapi.Password = student.CurrentUser.Password;
                        return Json(studentapi);
                      
                    case 6:
                        Employee employee = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                        EmployeeModelApi employeeapi = new EmployeeModelApi();
                        employeeapi.EmployeeID = employee.EmployeeID;
                        employeeapi.Name = employee.Name;
                        employeeapi.HouseNo = employee.HouseNo;
                        employeeapi.BuildingName = employee.BuildingName;
                        employeeapi.Street = employee.Street;
                        employeeapi.Area = employee.Area;
                        employeeapi.Location = employee.Location;
                        employeeapi.City = employee.CurrentCity.Name;
                        employeeapi.Country = employee.CurrentCountry.Name;
                        employeeapi.PinCode = employee.PinCode;
                        employeeapi.Landline = employee.Landline;
                        employeeapi.Mobile = employee.Mobile;
                        employeeapi.Photo = employee.Photo;
                        employeeapi.School = employee.CurrentSchool.Name;
                        employeeapi.LeavesToAvail = employee.LeavesToAvail;
                        employeeapi.Salary = employee.Salary;
                        employeeapi.Status = employee.Status;
                        employeeapi.Email = employee.CurrentUser.Email;
                        employeeapi.Password = employee.CurrentUser.Password;
                        return Json(employeeapi);

                    default:
                        break;
                }                

                return Json("Data is not availabe");

            }
            catch (System.Exception)
            {
                throw;
            }
        }

        [ResponseType(typeof(void))]
        public IHttpActionResult PutProfileApi(int id, string Name, string Photo, string Mobile)
        {
            apiheaderdata apidata = APIAuthorizeAttribute.GetAuthorize(Request.Headers.GetValues("Token").First());
            CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == apidata.AcademicYearID).FirstOrDefault();
            int companyacademicyearid = companyacademicyear.CompanyAcademicYearID;
            UserRole userrole = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == apidata.UserID).FirstOrDefault();
            int roleid = userrole.RoleID;
            var schools = db.Schools.Include(s => s.CurrentUser).Include(s => s.CurrentCompanyAcademicYear).Include(s => s.CurrentCity).Include(s => s.CurrentCountry).Where(s => s.CurrentCompanyAcademicYear.CompanyAcademicYearID == companyacademicyearid).Where(s => s.SchoolID == 0);
            switch (roleid)
            {
                case 1:
                    School school = db.Schools.Include(s => s.CurrentUser).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                    school.Name = Name;
                    school.Logo = Photo;
                    school.Mobile = Mobile;
                    db.Entry(school).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json("Modified Successfully");
                case 2:
                    school = db.Schools.Include(s => s.CurrentUser).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                    school.Name = Name;
                    school.Logo = Photo;
                    school.Mobile = Mobile;
                    db.Entry(school).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json("Modified Successfully");
                case 3:
                    Teacher teacher = db.Teachers.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                    teacher.Name = Name;
                    teacher.Photo = Photo;
                    teacher.Mobile = Mobile;
                    db.Entry(teacher).State = EntityState.Modified;
                    db.SaveChanges();
                    break;
                case 4:
                    Parent parent = db.Parents.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                    parent.Name = Name;
                    parent.Photo = Photo;
                    parent.Mobile = Mobile;
                    db.Entry(parent).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json("Modified Successfully");
                case 5:
                    Student student = db.Students.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Include(s => s.CurrentClass).Include(s => s.CurrentSection).Include(s => s.CurrentParent).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                    student.Name = Name;
                    student.Photo = Photo;
                    student.Mobile = Mobile;
                    db.Entry(student).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json("Modified Successfully");
                case 6:
                    Employee employee = db.Employees.Include(s => s.CurrentUser).Include(s => s.CurrentSchool).Where(s => s.UserID == apidata.UserID).FirstOrDefault();
                    employee.Name = Name;
                    employee.Photo = Photo;
                    employee.Mobile = Mobile;
                    db.Entry(employee).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json("Modified Successfully");

                default:
                    break;
            }            
          
            return Json("Error in Modifications");
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
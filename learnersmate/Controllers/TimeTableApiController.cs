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
    public class TimeTableApiController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();

        // GET api/TimeTable       
        public IHttpActionResult GetTimeTables(int userid, int academicyearid, int schoolid)
        {
            //var teacherlist = db.Teachers.ToJsonArray();
            //var response = Request.CreateResponse(HttpStatusCode.OK);
            //response.Content = new StringContent(Json(teacherlist), Encoding.UTF8, "application/json");

            CompanyAcademicYear companyacademicyear = db.CompanyAcademicYears.Include(c => c.CurrentCompany).Include(c => c.CurrentAcademicYear).Where(c => c.AcademicYearID == academicyearid).FirstOrDefault();
            int companyacademicyearid = companyacademicyear.CompanyAcademicYearID;     
            var userroles = db.UserRoles.Include(x => x.CurrentRole).Where(x => x.UserID == userid).FirstOrDefault();
            int roleid = userroles.CurrentRole.RoleID;
            School school = db.Schools.Find(schoolid);
            var timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.TimeTableID == 0).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
            switch (roleid)
            {
                case 1:
                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                case 2:

                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentSchool.SchoolID == schoolid).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                case 3:
                    Teacher teacher = db.Teachers.Where(t => t.UserID == userid).FirstOrDefault();
                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentTeacher.TeacherID == teacher.TeacherID).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                case 4:

                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentSchool.SchoolID == schoolid).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                case 5:
                    Student student = db.Students.Where(t => t.UserID == userid).FirstOrDefault();
                    timeTables = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.CurrentSchool.CompanyAcademicYearID == companyacademicyearid && t.CurrentClass.ClassID == student.ClassID).OrderBy(t => t.CurrentPeriod.PeriodID).ToList();
                    break;
                default:
                    break;
            }
            return Json(timeTables);                   
        }

        // GET api/TimeTable/5
        public IHttpActionResult GetTimeTable(int id)
        {
            TimeTable timeTable = db.TimeTables.Include(t => t.CurrentSchool).Include(t => t.CurrentClass).Include(t => t.CurrentPeriod).Include(t => t.CurrentTeacher).Include(t => t.CurrentSubject).Where(t => t.TimeTableID == 0).Where(t => t.TimeTableID == id).FirstOrDefault();
            return Json(timeTable);
        }

        // PUT api/TimeTable/5
        public IHttpActionResult PutTimeTable(int id, TimeTable timeTable, string existing)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != timeTable.TeacherID)
            {
                return BadRequest();
            }
            string name = timeTable.SchoolID.ToString() + timeTable.ClassID.ToString() + timeTable.PeriodID.ToString() + timeTable.TeacherID.ToString() + timeTable.SubjectID.ToString();
            if (name != existing)
            {
                TimeTable timeTableexist = db.TimeTables.Where(c => c.SchoolID == timeTable.SchoolID && c.ClassID == timeTable.ClassID && c.PeriodID == timeTable.PeriodID && c.TeacherID == timeTable.TeacherID && c.SubjectID == timeTable.SubjectID).FirstOrDefault();
                if (name != null)
                {
                    return Json("TimeTable already exists");
                }
            }
           

            try
            {
                db.Entry(timeTable).State = EntityState.Modified;
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TimeTableExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
           
            return Json("Modified Successfully");
        }

        // POST api/TimeTable
        [ResponseType(typeof(TimeTable))]
        public IHttpActionResult PostTimeTable(TimeTable timeTable)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            TimeTable timeTableexist = db.TimeTables.Where(c => c.SchoolID == timeTable.SchoolID && c.ClassID == timeTable.ClassID && c.PeriodID == timeTable.PeriodID && c.TeacherID == timeTable.TeacherID && c.SubjectID == timeTable.SubjectID).FirstOrDefault();
            if (timeTableexist != null)
            {
                return Json("TimeTable already exists");
            }
            else
            { 
                try
                {
                    db.TimeTables.Add(timeTable);
                    db.SaveChanges();
                }
                catch 
                {                    
                    return Json("Error in creating");
                }
            }

            return Json("Created Successfully");
        }

        // DELETE api/TimeTable/5
        [ResponseType(typeof(TimeTable))]
        public IHttpActionResult DeleteTimeTable(int id)
        {
            TimeTable timeTable = db.TimeTables.Find(id);
            if (timeTable == null)
            {
                return NotFound();
            }           
            db.TimeTables.Remove(timeTable);
            db.SaveChanges();
            return Json("Deleted Successfully");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TimeTableExists(int id)
        {
            return db.TimeTables.Count(e => e.TimeTableID == id) > 0;
        }
        
    }
}
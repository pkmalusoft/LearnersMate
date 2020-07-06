using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using learnersmate.Context;
using learnersmate.Models;

namespace learnersmate.Controllers
{
    public class AcademicYearApiController : ApiController
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: api/AcademicYearsApi
        public IHttpActionResult GetAcademicYears()
        {
            //return db.AcademicYears;
            return Json(db.AcademicYears.ToList());
        }

        // GET: api/AcademicYearsApi/5
        [ResponseType(typeof(AcademicYear))]
        public async Task<IHttpActionResult> GetAcademicYear(int id)
        {
            AcademicYear academicYear = await db.AcademicYears.FindAsync(id);
            if (academicYear == null)
            {
                return NotFound();
            }

            return Ok(academicYear);
        }

        // PUT: api/AcademicYearsApi/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAcademicYear(int id, AcademicYear academicYear)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != academicYear.AcademicYearID)
            {
                return BadRequest();
            }

            db.Entry(academicYear).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AcademicYearExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/AcademicYearsApi
        [ResponseType(typeof(AcademicYear))]
        public async Task<IHttpActionResult> PostAcademicYear(AcademicYear academicYear)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.AcademicYears.Add(academicYear);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = academicYear.AcademicYearID }, academicYear);
        }

        // DELETE: api/AcademicYearsApi/5
        [ResponseType(typeof(AcademicYear))]
        public async Task<IHttpActionResult> DeleteAcademicYear(int id)
        {
            AcademicYear academicYear = await db.AcademicYears.FindAsync(id);
            if (academicYear == null)
            {
                return NotFound();
            }

            db.AcademicYears.Remove(academicYear);
            await db.SaveChangesAsync();

            return Ok(academicYear);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AcademicYearExists(int id)
        {
            return db.AcademicYears.Count(e => e.AcademicYearID == id) > 0;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsCompanyAcademicYears")]
    public class CompanyAcademicYear
    {
        [Key]
        [Display(Name = "ID")]
        public int CompanyAcademicYearID { get; set; }
        public int CompanyID { get; set; }
        public int AcademicYearID { get; set; }

        public Company CurrentCompany { get; set; }
        public AcademicYear CurrentAcademicYear { get; set; }
        public virtual ICollection<School> Schools { get; set; } 
       
    }
}
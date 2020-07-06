using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsAcademicYears")]
    public class AcademicYear
    {
        [Key]
        [Display(Name = "ID")]
        public int AcademicYearID { get; set; }

        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "From")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime YearFrom { get; set; }

        [Display(Name = "To")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime YearTo { get; set; }
        public virtual ICollection<CompanyAcademicYear> CompanyAcademicYears { get; set; }
    }
}
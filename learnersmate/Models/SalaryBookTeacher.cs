using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsSalaryBookTeacher")]
    public class SalaryBookTeacher
    {
        [Key]
        [Display(Name = "ID")]
        public int SalaryBookID { get; set; }

        [Required]
        [Display(Name = "Teacher")]
        public int TeacherID { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }
               
        [Display(Name = "Date Of Paid")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> Dop{ get; set; }

        public Teacher CurrentTeacher { get; set; }
        
    }
}

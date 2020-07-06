using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsExams")]
    public class Exam
    {
        [Key]
        [Display(Name = "ID")]
        public int ExamID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }

        [Required]
        [Display(Name = "Subject")]
        public int SubjectID { get; set; }

        [Required]       
        [Display(Name = "Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> Date { get; set; }

        [Display(Name = "Remarks")]
        [MaxLength(1000)]
        public string Remarks { get; set; }

        public School CurrentSchool { get; set; }
        public Subject CurrentSubject { get; set; }

        public virtual ICollection<ExamPortion> ExamPortions { get; set; } 
    }
}

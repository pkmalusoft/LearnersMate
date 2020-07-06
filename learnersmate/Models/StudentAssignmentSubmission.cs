using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsStudentAssignmentSubmissions")]
    public class StudentAssignmentSubmission
    {
        [Key]
        public int StudentAssignmentSubmissionID { get; set; }

        [Required]
        [Display(Name = "Student Assignment")]
        public int StudentAssignmentID { get; set; }

        [Required]
        [Display(Name = "Student")]
        public int StudentID { get; set; }
        
        [Required]
        [MaxLength(4000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }
        
        [Display(Name = "Submitted Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> SubmittedDate { get; set; }

        public StudentAssignment CurrentStudentAssignment { get; set; }
        public Student CurrentStudent { get; set; }

    }
}
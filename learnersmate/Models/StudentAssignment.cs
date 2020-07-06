using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsStudentAssignments")]
    public class StudentAssignment
    {
        [Key]
        public int StudentAssignmentID { get; set; }

        [Required]
        [Display(Name = "Teacher")]
        public int TeacherID { get; set; }

        [Required]
        [Display(Name = "Class")]
        public int ClassID { get; set; }

        [Required]
        [Display(Name = "Section")]
        public int SectionID { get; set; }

        [Required]
        [Display(Name = "Subject")]
        public int SubjectID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [Required]
        [MaxLength(4000)]
        [Display(Name = "Detail")]
        public string Detail { get; set; }

        [Required]
        [Display(Name = "Assigned Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> AssignedDate { get; set; }

        [Required]
        [Display(Name = "End Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> EndDate { get; set; }               

        public Teacher CurrentTeacher { get; set; }
        public Class CurrentClass { get; set; }
        public Section CurrentSection { get; set; }
        public Subject CurrentSubject { get; set; }

        public virtual ICollection<StudentAssignmentSubmission> StudentAssignmentSubmissions { get; set; }

    }
}
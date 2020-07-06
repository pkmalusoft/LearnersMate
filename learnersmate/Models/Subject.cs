using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsSubjects")]
    public class Subject
    {
        [Key]
        [Display(Name = "ID")]
        public int SubjectID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Required]       
        [Display(Name = "Class")]
        public int ClassID { get; set; }

        public Class CurrentClass { get; set; }

        public virtual ICollection<Chapter> Chapters { get; set; }
        public virtual ICollection<TimeTable> TimeTables { get; set; }
        public virtual ICollection<Exam> Exams { get; set; }
        public virtual ICollection<StudentAssignment> StudentAssignments { get; set; }
    }
}

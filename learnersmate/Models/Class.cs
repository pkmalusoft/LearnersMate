using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsClasses")]
    public class Class
    {
        [Key]
        public int ClassID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        public virtual ICollection<Subject> Subjects { get; set; }                
        public virtual ICollection<Student> Students { get; set; }
        public virtual ICollection<TimeTable> TimeTables { get; set; }
        public virtual ICollection<StudentAssignment> StudentAssignments { get; set; }
    }
}
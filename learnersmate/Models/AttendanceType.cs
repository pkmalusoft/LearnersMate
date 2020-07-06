using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAttendanceTypes")]
    public class AttendanceType
    {
        [Key]
        [Display(Name = "ID")]
        public int AttendanceTypeID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }
      
        public virtual ICollection<TeacherAttendance> TeacherAttendances { get; set; }
        public virtual ICollection<StudentAttendance> StudentAttendances { get; set; }
    }
}

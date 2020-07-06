using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsEmployeeAttendances")]
    public class EmployeeAttendance
    {
        [Key]
        [Display(Name = "ID")]
        public int EmployeeAttendanceID { get; set; }

        [Display(Name = "Attendance Type")]
        public int AttendanceTypeID { get; set; }

        [Required]
        [Display(Name = "Attendance Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> AttendanceDate { get; set; }

        [Display(Name = "Employee")]
        public int EmployeeID { get; set; }

        [Display(Name = "Attendended By")]
        public int UserID { get; set; }

        [Display(Name = "Updated Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> UpdatedDate { get; set; }
      
        public AttendanceType CurrentAttendanceType { get; set; }
        public Employee CurrentEmployee { get; set; }
        public User CurrentUser { get; set; }

    }
}

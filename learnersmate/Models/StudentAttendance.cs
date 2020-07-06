using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsStudentAttendances")]
    public class StudentAttendance
    {
        [Key]
        [Display(Name = "ID")]
        public int StudentAttendanceID { get; set; }

        [Display(Name = "Attendance Type")]
        public int AttendanceTypeID { get; set; }

        [Required]
        [Display(Name = "Attendance Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> AttendanceDate { get; set; }

        [Display(Name = "Student")]
        public int StudentID { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Display(Name = "Attendended By")]
        public int UserID { get; set; }

        [Display(Name = "Updated Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> UpdatedDate { get; set; }

		[Display(Name = "%")]
        public decimal Percentage { get; set; }

        public AttendanceType CurrentAttendanceType { get; set; }
        public Student CurrentStudent { get; set; }
        public User CurrentUser { get; set; }

    }
}

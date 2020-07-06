using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsTeachers")]
    public class Teacher
    {
        [Key]
        public int TeacherID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }

        [Required]
        [Display(Name = "City")]
        public int CityID { get; set; }

        [Required]
        [Display(Name = "Country")]
        public int CountryID { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }
      
        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }    

        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }     

        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Leaves To Avail")]
        public int LeavesToAvail { get; set; }

        [Required]
        [Display(Name = "Salary")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Salary { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }
               
        public City CurrentCity { get; set; }
        public Country CurrentCountry { get; set; }
        public User CurrentUser { get; set; }       
        public School CurrentSchool { get; set; }

        public virtual ICollection<TimeTable> TimeTables { get; set; }
        public virtual ICollection<TeacherAttendance> TeacherAttendances { get; set; }
        public virtual ICollection<SalaryBookTeacher> SalaryBookTeachers { get; set; }
        public virtual ICollection<NotificationTeacher> NotificationTeachers { get; set; }
        public virtual ICollection<StudentAssignment> StudentAssignments { get; set; }
    }
}
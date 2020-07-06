using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsStudents")]
    public class Student
    {
        [Key]
        public int StudentID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Required]
        [Display(Name = "Date Of Birth")]        
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> Dob { get; set; }
      
        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }       

        [Required]
        [Display(Name = "Class")]       
        public int ClassID { get; set; }

        [Required]
        [Display(Name = "Section")]
        public int SectionID { get; set; }

                
        [Display(Name = "Guardian")]
        [MaxLength(100)]
        public string GuardianName { get; set; }

        [Display(Name = "Guardian Mobile")]
        [MaxLength(100)]
        public string GuardianMobile { get; set; }

        [Display(Name = "Guardian Email")]
        [MaxLength(100)]
        public string GuardianEmail { get; set; }

        [Display(Name = "Parent 2")]
        [MaxLength(100)]
        public string Parent2Name { get; set; }

        [Display(Name = "Parent 2 Mobile")]
        [MaxLength(100)]
        public string Parent2Mobile { get; set; }

        [Display(Name = "Parent 2 Email")]
        [MaxLength(100)]
        public string Parent2Email { get; set; }


        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }

        [Required]
        [Display(Name = "Parent")]
        public int ParentID { get; set; }     

        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Fees")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Fee { get; set; }

        [Required]
        [Display(Name = "Fee Instalments")]
        public int FeeInstalments { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }
               
        public User CurrentUser { get; set; }
        public School CurrentSchool { get; set; }
        public Class CurrentClass { get; set; }
        public Section CurrentSection { get; set; }        
        public Parent CurrentParent { get; set; }
        
        public virtual ICollection<StudentAttendance> StudentAttendances { get; set; }
        public virtual ICollection<NotificationStudent> NotificationStudents { get; set; }
        public virtual ICollection<StudentAssignmentSubmission> StudentAssignmentSubmissions { get; set; }
        public virtual ICollection<FeeBook> FeeBooks { get; set; }
        
    }
}
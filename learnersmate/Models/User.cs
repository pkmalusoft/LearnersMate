using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsUsers")]
    public class User
    {
        [Key]        
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        [MaxLength(100, ErrorMessage = "Email cannot be Greater than 100 Charaters")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        [MaxLength(20, ErrorMessage = "Password cannot be Greater than 10 Charaters")]
        public string Password { get; set; }

        [Display(Name = "Can Create")]
        public bool CanCreate { get; set; }

        [Display(Name = "Can Edit")]
        public bool CanEdit { get; set; }

        [Display(Name = "Can Delete")]
        public bool CanDelete { get; set; }

        [Display(Name = "Can Print")]
        public bool CanPrint { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Created On")]
        public DateTime CreatedOn { get; set; }

        [Display(Name = "Last Logged On")]
        public Nullable<System.DateTime> LastLoggedOn { get; set; }

        public virtual ICollection<UserRole> UserRoles { get; set; }
        public virtual ICollection<UserPagePermission> UserPagePermissions { get; set; }

        public virtual ICollection<School> Schools { get; set; }
        public virtual ICollection<Teacher> Teachers { get; set; }
        public virtual ICollection<Parent> Parents { get; set; }
        public virtual ICollection<Student> Students { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<TeacherAttendance> TeacherAttendances { get; set; }
        public virtual ICollection<StudentAttendance> StudentAttendances { get; set; }
        public virtual ICollection<Video> Videos { get; set; }

    }
}
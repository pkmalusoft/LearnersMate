using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsSchools")]
    public class School
    {
        [Key]
        public int SchoolID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Short Name")]
        [MaxLength(6)]
        public string ShortName { get; set; }
        
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

        [Display(Name = "Website")]
        [MaxLength(500)]
        public string Website { get; set; }

        [Display(Name = "Registeration No")]
        [MaxLength(500)]
        public string RegNo { get; set; }

        [Display(Name = "Logo")]
        [MaxLength(4000)]
        public string Logo { get; set; }

        [Required]
        [Display(Name = "Principal")]
        [MaxLength(100)]
        public string Principal { get; set; }

        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Academic Year")]
        public int CompanyAcademicYearID { get; set; }
      
        [Display(Name = "Status")]
        public bool Status { get; set; }

        public User CurrentUser { get; set; }
        public CompanyAcademicYear CurrentCompanyAcademicYear { get; set; }
        public City CurrentCity { get; set; }
        public Country CurrentCountry { get; set; }       
       
        public virtual ICollection<Teacher> Teachers { get; set; }
        public virtual ICollection<Parent> Parents { get; set; }
        public virtual ICollection<Student> Students { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<TimeTable> TimeTables { get; set; }
        public virtual ICollection<Exam> Exams { get; set; }
        public virtual ICollection<NotificationSchool> NotificationSchools { get; set; }
    }
}
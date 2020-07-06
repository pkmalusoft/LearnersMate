using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsCompanies")]
    public class Company
    {
        [Key]
        [Display(Name = "ID")]
       public int CompanyID { get; set; }

       [Required]
       [Display(Name = "Name")]
       [MaxLength(250)]
       public string Name { get; set; }       
               
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

       [Required]
       [Display(Name = "Mobile No")]
       [MaxLength(100)]
       public string Mobile { get; set; }
       
       [Display(Name = "Email")]
       [MaxLength(100)]
       public string Email { get; set; }

       [Display(Name = "Company Website")]
       [MaxLength(500)]
       public string Website { get; set; }

       [Display(Name = "Registeration No")]
       [MaxLength(500)]
       public string RegNo { get; set; }       
        
       [Display(Name = "Currency")]
       public int CurrencyID { get; set; }
      
       [Display(Name = "Default Language")]
       public bool DefaultLanguage { get; set; }

       [Display(Name = "Logo")]
       [MaxLength(4000)]
       public string Logo { get; set; }

       public City CurrentCity { get; set; }
       public Country CurrentCountry { get; set; }
       public Currency CurrentCurrency { get; set; }

       public virtual ICollection<CompanyAcademicYear> CompanyAcademicYears { get; set; }
       
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsCountries")]
    public class Country
    {
        [Key]
        public int CountryID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Code")]
        public string CountryCode { get; set; }  
   
        [Required]
        [MaxLength(100)]
        [Display(Name = "Nationality")]
        public string Nationality { get; set; }


        public virtual ICollection<Company> Companys { get; set; }
        public virtual ICollection<Currency> Currencys { get; set; }
        public virtual ICollection<School> Schools { get; set; }
        public virtual ICollection<Teacher> Teachers { get; set; }
        public virtual ICollection<Parent> Parents { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
    }
}

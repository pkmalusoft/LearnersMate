using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsRevenueTypes")]
    public class RevenueType
    {
        [Key]
        [Display(Name = "ID")]
        public int RevenueTypeID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]       
        public string Name { get; set; }
        
    }
}

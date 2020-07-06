using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsDiscountTypes")]
    public class DiscountType
    {
        [Key]
        [Display(Name = "ID")]
        public int DiscountTypeID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        public virtual ICollection<PurchaseInvoice> PurchaseInvoices { get; set; }      
    }
}
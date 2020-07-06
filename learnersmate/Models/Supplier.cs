using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsSuppliers")]
    public class Supplier
    {
        [Key]
        [Display(Name = "ID")]
        public int SupplierID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        public virtual ICollection<PurchaseInvoice> PurchaseInvoices { get; set; }      
    }
}
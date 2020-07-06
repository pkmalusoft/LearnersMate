using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsPurchaseInvoiceDetails")]
    public class PurchaseInvoiceDetail
    {
        [Key]
        public int PurchaseInvoiceDetailID { get; set; }

        [Required]
        [MaxLength(1000)]
        [Display(Name = "Description")]
        public string Description { get; set; }

        [Display(Name = "Purchase Invoice No")]
        public int PurchaseInvoiceID { get; set; }

        [Display(Name = "Quantity")]
        public int Quantity { get; set; }

        [Display(Name = "Unit")]
        public int PurchaseInvoiceDetailUnit { get; set; }

        [Display(Name = "Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Rate { get; set; }

        [Display(Name = "Rate FC")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal RateFC { get; set; }

        [Display(Name = "Value")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal DetailValue { get; set; }

        [Display(Name = "Value FC")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal DetailValueFC { get; set; }

        [Display(Name = "Tax %")]
        public int Tax { get; set; }

        [Display(Name = "Net Value")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal NetValue { get; set; }

        [Display(Name = "Account Head")]
        public int AccountHeadID { get; set; }

        [MaxLength(1000)]
        [Display(Name = "Job")]
        public string DetailJob { get; set; }

        [MaxLength(1000)]
        [Display(Name = "Products And Services")]
        public string ProductsServices { get; set; }

        [Display(Name = "Flag")]
        public bool Flag { get; set; }

        public PurchaseInvoice CurrentPurchaseInvoice { get; set; }
        //public AccountHead CurrentAccountHead { get; set; }
        
    }
}
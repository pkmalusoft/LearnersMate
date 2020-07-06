using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsPurchaseInvoices")]
    public class PurchaseInvoice
    {
        [Key]
        public int PurchaseInvoiceID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Invoice No")]
        public string InvoiceNo { get; set; }

        [Display(Name = "Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> InvoiceDate { get; set; }

        [Display(Name = "Supplier Name")]
        public int SupplierID { get; set; }

        [MaxLength(100)]
        [Display(Name = "External Reference")]
        public string ExternalReference { get; set; }

        [MaxLength(100)]
        [Display(Name = "Quotation No/Date")]
        public string QuotationNoDate { get; set; }

        [MaxLength(100)]
        [Display(Name = "LPO No/Date")]
        public string LPONoDate { get; set; }

        [Display(Name = "Currency")]
        public int CurrencyID { get; set; }

        [Display(Name = "Goods Received By")]
        public int EmployeeID { get; set; }

        [Display(Name = "Gross Total Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal GrossTotalAmount { get; set; }

        [Display(Name = "Discount Type")]
        public int DiscountTypeID { get; set; }

        [Display(Name = "Discount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Discount { get; set; }

        [Display(Name = "Vat Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal VatAmount { get; set; }

        [Display(Name = "Net Total Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal NetTotalAmount { get; set; }

        [MaxLength(2000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }

        [Display(Name = "Flag")]
        public bool Flag { get; set; }

        public Supplier CurrentSupplier { get; set; }
        public Employee CurrentEmployee { get; set; }
        public Currency CurrentCurrency { get; set; }
        public DiscountType CurrentDiscountType { get; set; }

        public virtual ICollection<PurchaseInvoiceDetail> PurchaseInvoiceDetails { get; set; }
    }
}
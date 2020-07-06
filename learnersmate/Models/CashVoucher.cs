using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsCashVouchers")]
    public class CashVoucher
    {
        [Key]
        public int CashVoucherID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Voucher No")]
        public string VoucherNo { get; set; }

        [Display(Name = "Voucher Type")]
        public int VoucherTypeID { get; set; }

        [Display(Name = "Employe")]
        public int EmployeeID { get; set; }

        [Display(Name = "Account Head")]
        public int AccountHeadID { get; set; }

        [Display(Name = "Voucher Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> VoucherDate { get; set; }

        [MaxLength(100)]
        [Display(Name = "Reference No")]
        public string ReferenceNo { get; set; }

        [Display(Name = "Reference Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> ReferenceDate { get; set; }

        [MaxLength(2000)]
        [Display(Name = "Narration")]
        public string Narration { get; set; }

        [Display(Name = "Total Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal TotalAmount { get; set; }

        [Display(Name = "Flag")]
        public bool Flag { get; set; }

        public VoucherType CurrentVoucherType { get; set; }
        public Employee CurrentEmployee { get; set; }

        public virtual ICollection<CashVoucherDetail> CashVoucherDetails { get; set; }
    }
}
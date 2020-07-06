using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsJournalVouchers")]
    public class JournalVoucher
    {
        [Key]
        public int JournalVoucherID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Voucher No")]
        public string VoucherNo { get; set; }       

        [Display(Name = "Voucher Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> VoucherDate { get; set; }

        [MaxLength(2000)]
        [Display(Name = "Narration")]
        public string Narration { get; set; }

        [Display(Name = "Debit Total Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal DebitTotalAmount { get; set; }

        [Display(Name = "Credit Total Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal CreditTotalAmount { get; set; }

        [Display(Name = "Diff Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal DiffTotalAmount { get; set; }

        [Display(Name = "Flag")]
        public bool Flag { get; set; }

        public VoucherType CurrentVoucherType { get; set; }
        public Employee CurrentEmployee { get; set; }

        public virtual ICollection<JournalVoucherDetail> JournalVoucherDetails { get; set; }
    }
}
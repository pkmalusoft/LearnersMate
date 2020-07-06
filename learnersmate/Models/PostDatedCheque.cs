using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsPostDatedCheques")]
    public class PostDatedCheque
    {
        [Key]
        public int PostDatedChequeID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Voucher No")]
        public string VoucherNo { get; set; }

        [Display(Name = "Transaction Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> TransactionDate { get; set; }

        [Display(Name = "Voucher Type")]
        public int VoucherTypeID { get; set; }

        [Display(Name = "Bank")]
        public int BankID { get; set; }

        [MaxLength(100)]
        [Display(Name = "Payer's Bank")]
        public string PayersBank { get; set; }

        [MaxLength(100)]
        [Display(Name = "Cheque No")]
        public string ChequeNo { get; set; }

        [Display(Name = "Cheque Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> ChequeDate { get; set; }

        [Display(Name = "Total Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal TotalAmount { get; set; }

        [MaxLength(2000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }

        [Display(Name = "Flag")]
        public bool Flag { get; set; }

        public VoucherType CurrentVoucherType { get; set; }     
        public Bank CurrentBank { get; set; }      
        public virtual ICollection<PostDatedChequeDetail> PostDatedChequeDetails { get; set; }
    }
}
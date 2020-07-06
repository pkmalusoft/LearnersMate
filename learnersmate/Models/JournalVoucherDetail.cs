using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsJournalVoucherDetails")]
    public class JournalVoucherDetail
    {
        [Key]
        public int JournalVoucherDetailID { get; set; }      

        [Display(Name = "Journal Voucher")]
        public int JournalVoucherID { get; set; }

        [Display(Name = "Account Head")]
        public int AccountHeadID { get; set; }

        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        [Display(Name = "Debit/Credit")]
        public int DebitCreditID { get; set; }

        [MaxLength(1000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }
             
        public JournalVoucher CurrentJournalVoucher { get; set; }      
        //public AccountHead CurrentAccountHead { get; set; }
        public virtual ICollection<JournalVoucherDetailAllocation> JournalVoucherDetailAllocations { get; set; }
        public DebitCredit CurrentDebitCredit { get; set; }
        
    }
}
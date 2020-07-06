using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsBankVoucherDetails")]
    public class BankVoucherDetail
    {
        [Key]
        public int BankVoucherDetailID { get; set; }      

        [Display(Name = "Bank Voucher")]
        public int BankVoucherID { get; set; }

        [Display(Name = "Account Head")]
        public int AccountHeadID { get; set; }

        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        [MaxLength(1000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }
             
        public BankVoucher CurrentBankVoucher { get; set; }      
        //public AccountHead CurrentAccountHead { get; set; }
        public virtual ICollection<BankVoucherDetailAllocation> BankVoucherDetailAllocations { get; set; }
        
    }
}
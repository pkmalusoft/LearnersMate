using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsCashVoucherDetails")]
    public class CashVoucherDetail
    {
        [Key]
        public int CashVoucherDetailID { get; set; }      

        [Display(Name = "Cash Voucher")]
        public int CashVoucherID { get; set; }

        [Display(Name = "Account Head")]
        public int AccountHeadID { get; set; }

        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        [MaxLength(1000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }
             
        public CashVoucher CurrentCashVoucher { get; set; }      
        //public AccountHead CurrentAccountHead { get; set; }
        public virtual ICollection<CashVoucherDetailAllocation> CashVoucherDetailAllocations { get; set; }
        
    }
}
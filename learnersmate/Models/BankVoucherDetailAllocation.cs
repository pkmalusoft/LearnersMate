using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsBankVoucherDetailAllocations")]
    public class BankVoucherDetailAllocation
    {
        [Key]
        public int BankVoucherDetailAllocationID { get; set; }
      
        [Display(Name = "Bank Voucher Detail")]
        public int BankVoucherDetailID { get; set; }

        [Display(Name = "Allocation Type")]
        public int AllocationTypeID { get; set; }

        [Display(Name = "Allocation Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        public BankVoucherDetail CurrentBankVoucherDetail { get; set; }
        public AllocationType CurrentAllocationType { get; set; }
        
    }
}
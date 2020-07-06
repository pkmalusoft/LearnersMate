using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsCashVoucherDetailAllocations")]
    public class CashVoucherDetailAllocation
    {
        [Key]
        public int CashVoucherDetailAllocationID { get; set; }
      
        [Display(Name = "Cash Voucher Detail")]
        public int CashVoucherDetailID { get; set; }

        [Display(Name = "Allocation Type")]
        public int AllocationTypeID { get; set; }

        [Display(Name = "Allocation Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        public CashVoucherDetail CurrentCashVoucherDetail { get; set; }
        public AllocationType CurrentAllocationType { get; set; }
        
    }
}
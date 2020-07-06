using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsJournalVoucherDetailAllocations")]
    public class JournalVoucherDetailAllocation
    {
        [Key]
        public int JournalVoucherDetailAllocationID { get; set; }
      
        [Display(Name = "Journal Voucher Detail")]
        public int JournalVoucherDetailID { get; set; }

        [Display(Name = "Allocation Type")]
        public int AllocationTypeID { get; set; }

        [Display(Name = "Allocation Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        public JournalVoucherDetail CurrentJournalVoucherDetail { get; set; }
        public AllocationType CurrentAllocationType { get; set; }
        
    }
}
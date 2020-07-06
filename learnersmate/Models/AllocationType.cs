using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsAllocationTypes")]
    public class AllocationType
    {
        [Key]
        public int AllocationTypeID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Type")]
        public string Name { get; set; }     

        [Display(Name = "Group")]
        public int AllocationGroupID { get; set; }

        public AllocationGroup CurrentAllocationGroup { get; set; }
        public virtual ICollection<BankVoucherDetailAllocation> BankVoucherDetailAllocations { get; set; }
        public virtual ICollection<CashVoucherDetailAllocation> CashVoucherDetailAllocations { get; set; }
        public virtual ICollection<JournalVoucherDetailAllocation> JournalVoucherDetailAllocations { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsVoucherTypes")]
    public class VoucherType
    {
        [Key]
        public int VoucherTypeID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }
        public virtual ICollection<BankVoucher> BankVouchers { get; set; }
        public virtual ICollection<CashVoucher> CashVouchers { get; set; }
        public virtual ICollection<PostDatedCheque> PostDatedCheques { get; set; }
    }
}
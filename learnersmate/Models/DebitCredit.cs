using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsDebitCredits")]
    public class DebitCredit
    {
        [Key]
        [Display(Name = "ID")]
        public int DebitCreditID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }
        public virtual ICollection<JournalVoucherDetail> JournalVoucherDetails { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAccountHeads")]
    public class AccountHead
    {
        [Key]
        [Display(Name = "ID")]
        public int AccountHeadID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

         [Required]
         [Display(Name = "Group")]
        public int AccountGroupID { get; set; }

        public AccountGroup CurrentAccountGroup { get; set; }
        public virtual ICollection<AccountJournalDetail> AccountJournalDetails { get; set; }
        public virtual ICollection<AccountOpening> AccountOpenings { get; set; }
    }
}
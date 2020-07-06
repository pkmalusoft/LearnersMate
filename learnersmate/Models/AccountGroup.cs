using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAccountGroups")]
    public class AccountGroup
    {
        [Key]
        [Display(Name = "ID")]
        public int AccountGroupID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }
       
        [Required]
        [Display(Name = "Category")]
        public int AccountCategoryID { get; set; } 

        public AccountCategory CurrentAccountCategory { get; set; }

        public virtual ICollection<AccountHead> AccountHeads { get; set; } 
    }
}
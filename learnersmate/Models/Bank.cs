using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsBanks")]
    public class Bank
    {
        [Key]
        public int BankID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }
             
        public virtual ICollection<PostDatedCheque> PostDatedCheques { get; set; }        
        public virtual ICollection<AccountBank> AccountBanks { get; set; }
    }
}
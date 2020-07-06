using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsBankDepositStatuses")]
    public class BankDepositStatus
    {
        [Key]
        public int BankDepositStatusID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Status")]
        public string Name { get; set; }        
    }
}
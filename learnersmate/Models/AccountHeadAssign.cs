using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAccountHeadAssign")]
    public class AccountHeadAssign
    {
        [Key]
        [Display(Name = "ID")]
        public int HeadAssignID { get; set; }

        [MaxLength(100)]
        [Display(Name = "Revenue Type")]
        public string RevenueType { get; set; }

        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Account Head")]
        public int AccountHeadID { get; set; }

    }
}
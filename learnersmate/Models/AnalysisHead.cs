using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAnalysisHeads")]
    public class AnalysisHead
    {
        [Key]
        [Display(Name = "ID")]
        public int AnalysisHeadID { get; set; }

        [MaxLength(100)]
        [Display(Name = "Head")]
        public string Name { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Code")]
        public string Code { get; set; }     

        [Required]
        [Display(Name = "Group")]
        public int AnalysisGroupID { get; set; }

        [Display(Name = "Branch")]
        public int BranchID { get; set; }

        public AnalysisGroup CurrentAnalysisGroup { get; set; }
        //public Branch CurrentBranch { get; set; }
        //public virtual ICollection<AccountJournalDetail> AccountJournalDetails { get; set; }
    }
}
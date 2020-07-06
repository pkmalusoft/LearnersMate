using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAccountJournalDetails")]
    public class AccountJournalDetail
    {
        [Key]
        [Display(Name = "ID")]
        public int AccountJournalDetailID { get; set; }

        [Display(Name = "Account Journal")]
        public int AccountJournalID { get; set; }
       
        [Display(Name = "Account Head")]
        public int AccountHeadID { get; set; }

        [Display(Name = "Analysis Head")]
        public Nullable<int> AnalysisHeadID { get; set; }       
      
        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        [MaxLength(4000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }

        public AccountJournal CurrentAccountJournal { get; set; }
        public AccountHead CurrentAccountHead { get; set; }
        //public AnalysisHead CurrentAnalysisHead { get; set; }       

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAccountOpenings")]
    public class AccountOpening
    {
        [Key]
        [Display(Name = "ID")]
        public int AccountOpeningID { get; set; }

        [Display(Name = "Branch")]
        public int BranchID { get; set; }

        [Display(Name = "Financial Year")]
        public int FinancialYearID { get; set; }

        [Display(Name = "Account Head")]
        public int AccountHeadID { get; set; }       

        [Display(Name = "Opening Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> OpeningDate { get; set; }

        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        [MaxLength(4000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }

        //public Branch CurrentBranch { get; set; }
        //public FinancialYear CurrentFinancialYear { get; set; }
        public AccountHead CurrentAccountHead { get; set; }
       

    }
}
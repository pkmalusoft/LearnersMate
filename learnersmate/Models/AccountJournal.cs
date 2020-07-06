using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAccountJournals")]
    public class AccountJournal
    {
        [Key]
        [Display(Name = "ID")]
        public int AccountJournalID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Voucher No")]
        public string VoucherNo { get; set; }

        [MaxLength(100)]
        [Display(Name = "Type")]
        public string VoucherType { get; set; }

        [Display(Name = "Transaction Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        [Range(typeof(DateTime), "1/1/1900", "1/1/3000")]
        public Nullable<System.DateTime> TransactionDate { get; set; }

        //[Display(Name = "Transaction Typ")]//CASH=1, BANK=2
        //public int TransactionTypeID { get; set; }

        //[Display(Name = "Project ID")]
        //public int ProjectID { get; set; }

        //[MaxLength(100)]
        //[Display(Name = "Project Name")]
        //public string ProjectName { get; set; }

        [Display(Name = "Branch")]
        public int BranchID { get; set; }

        [Display(Name = "Financial Year")]
        public int FinancialYearID { get; set; }

        [MaxLength(128)]
        [Display(Name = "User ID")]
        public string UserID { get; set; }

        [MaxLength(4000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; } 

        //public TransactionType CurrentTransactionType { get; set; }
        //public FinancialYear CurrentFinancialYear { get; set; }
        //public Branch CurrentBranch { get; set; }

        public virtual ICollection<AccountJournalDetail> AccountJournalDetails { get; set; }
        //public virtual ICollection<TenantContractDetailNew> TenantContractDetailsNew { get; set; }
        //public virtual ICollection<TenantContractPayment> TenantContractPayments { get; set; }
        //public virtual ICollection<TenantContractPayment> TenantContractPayments2 { get; set; }
        //public virtual ICollection<TenantContractPayment> TenantContractPayments3 { get; set; }
        //public virtual ICollection<TenantContractPayment> TenantContractPayments4 { get; set; }
        public virtual ICollection<AccountBank> AccountBanks { get; set; }
 
    }
}
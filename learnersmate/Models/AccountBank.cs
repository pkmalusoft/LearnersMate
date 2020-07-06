using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAccountBanks")]
    public class AccountBank
    {
        [Key]
        [Display(Name = "ID")]
        public int AccountBankID { get; set; }

        [Display(Name = "Bank")]
        public int BankID { get; set; }       

        [Display(Name = "Account Journal")]
        public int AccountJournalID { get; set; }

        [MaxLength(100)]
        [Display(Name = "Cheque No")]
        public string ChequeNo { get; set; }

        [Display(Name = "Cheque Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> ChequeDate { get; set; }

        public AccountJournal CurrentAccountJournal { get; set; }

    }
}
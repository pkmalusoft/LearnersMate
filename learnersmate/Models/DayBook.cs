using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    public class DayBook
    {
        [Display(Name = "Transaction Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> TransactionDate { get; set; }
      
        [MaxLength(100)]
        [Display(Name = "Type Voucher No")]
        public string VoucherNo { get; set; }

        [MaxLength(4000)]
        [Display(Name = "Detail Particulars")]
        public string DetailParticulars { get; set; }

        [MaxLength(100)]
        [Display(Name = "Debit Account")]
        public string DebitAccount { get; set; }

        [MaxLength(100)]
        [Display(Name = "Credit Account")]
        public string CreditAccount { get; set; }
        
      
        [Display(Name = "Debit")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public Nullable<decimal> Debit { get; set; }
      
        [Display(Name = "Credit")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public Nullable<decimal> Credit { get; set; }

        [Display(Name = "Debit Day Total")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public Nullable<decimal> DebitDayTotal { get; set; }

        [Display(Name = "Credit Day Total")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public Nullable<decimal> CreditDayTotal { get; set; }

        [Display(Name = "Debit Grand Total")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public Nullable<decimal> DebitGrandTotal { get; set; }

        [Display(Name = "Credit Grand Total")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public Nullable<decimal> CreditGrandTotal { get; set; }
        public int Length { get; internal set; }
    }
    public class DayBookList
    {
        public List<DayBook> DayBooks { get; set; }
    }
}
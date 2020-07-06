using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsScheduledTransactions")]
    public class ScheduledTransaction
    {
        [Key]
        public int ScheduledTransactionID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Entry Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> EntryDate { get; set; }

        [Display(Name = "Start Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> StartDate { get; set; }

        [Display(Name = "End Date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> EndDate { get; set; }
        
        [Display(Name = "Period")]
        public int PeriodID { get; set; }

        [Display(Name = "Frequency")]
        public int Frequency { get; set; }

        [MaxLength(100)]
        [Display(Name = "Branch")]
        public int BranchID { get; set; }

        [MaxLength(100)]
        [Display(Name = "Division")]
        public string Division { get; set; }       

        [Display(Name = "Debit Side Total Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal DebitSideTotalAmount { get; set; }

        [Display(Name = "Credit Side Total Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal CreditSideTotalAmount { get; set; }        

        [Display(Name = "Flag")]
        public bool Flag { get; set; }

       
    }
}
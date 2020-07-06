using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsPostDatedChequeDetails")]
    public class PostDatedChequeDetail
    {
        [Key]
        public int PostDatedChequeDetailID { get; set; }

        [Display(Name = "Post Dated Cheque")]
        public int PostDatedChequeID { get; set; }

        [Display(Name = "Received From")]
        //[ForeignKey("CurrentReceivedFrom")]
        //[DatabaseGeneratedAttribute(DatabaseGeneratedOption.None)]
        public int ReceivedFromID { get; set; }

        [Display(Name = "Account Head")]
        //[ForeignKey("CurrentAccountHead")]
        //[DatabaseGeneratedAttribute(DatabaseGeneratedOption.None)]
        public int AccountHeadID { get; set; }

        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }

        [MaxLength(1000)]
        [Display(Name = "Remarks")]
        public string Remarks { get; set; }     

        public PostDatedCheque CurrentPostDatedCheque { get; set; }
        //public AccountHead CurrentReceivedFrom { get; set; }
        //public AccountHead CurrentAccountHead { get; set; }      
        
    }
}
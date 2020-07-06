using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsFeeBook")]
    public class FeeBook
    {
        [Key]
        [Display(Name = "ID")]
        public int FeeBookID { get; set; }

        [Required]
        [Display(Name = "Student")]
        public int StudentID { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Amount { get; set; }
               
        [Display(Name = "Date Of Paid")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> Dop { get; set; }

        public Student CurrentStudent { get; set; }
    }
}

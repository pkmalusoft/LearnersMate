using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsUserPageViews")]
    public class UserPageView
    {
        [Key]        
        public int UserPageViewID { get; set; }
               
        [Display(Name = "User ID")]        
        public int UserID { get; set; }               
        
        [Display(Name = "Page Url")]
        [MaxLength(500)]
        public string PageUrl { get; set; }

        [Display(Name = "Date Accessed")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> DateAccessed { get; set; }
    }
}
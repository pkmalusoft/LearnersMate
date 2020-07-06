using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsUserPagePermissions")]
    public class UserPagePermission
    {
        [Key]        
        public int UserPagePermissionID { get; set; }

        [Display(Name = "User")]
        public int UserID { get; set; }

        [Display(Name = "Page Name")]
        [MaxLength(100)]
        public string PageName { get; set; }

        [Display(Name = "Page Url")]
        [MaxLength(100)]
        public string PageUrl { get; set; }

        [Display(Name = "Can View")]
        public bool CanView { get; set; }

        [Display(Name = "Can Create")]
        public bool CanCreate { get; set; }

        [Display(Name = "Can Edit")]
        public bool CanEdit { get; set; }

        [Display(Name = "Can Delete")]
        public bool CanDelete { get; set; }

        [Display(Name = "Can Print")]
        public bool CanPrint { get; set; }

        public User CurrentUser { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsUserRoles")]
    public class UserRole
    {
        [Key]
        public int UserRoleID { get; set; }

        [Required]
        [Display(Name = "User ID")]       
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Role ID")]
        public int RoleID { get; set; }

        public User CurrentUser { get; set; }
        public Role CurrentRole { get; set; }
        
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsTokens")]
    public class Token
    {
        [Key]
        public int TokenID { get; set; }
        public string TokenKey { get; set; }
        public DateTime IssuedOn { get; set; }
        public DateTime ExpiresOn { get; set; }
        public DateTime CreatedOn { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int UserID { get; set; }
        public int RoleID { get; set; }
        public int SchoolID { get; set; }
        public int AcademicYearID { get; set; }
        public string Company { get; set; }
        public string CompanyLogo { get; set; }

    }
}
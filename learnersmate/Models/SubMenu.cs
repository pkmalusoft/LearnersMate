using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using learnersmate.Models;

namespace learnersmate.Models
{
    [Table("smsSubMenu")]
    public class SubMenu
    {
        [Key]
        [Display(Name = "ID")]
        public int SubMenuID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Sub Menu Name2")]
        public string SubMenuName { get; set; }
       
        [MaxLength(100)]
        [Display(Name = "Sub Menu Name")]
        public string SubMenuName2 { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Controller")]
        public string Controller { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Action")]
        public string Action { get; set; }

        [Display(Name = "Main Menu Name")]
        public int MainMenuID { get; set; }

        [Display(Name = "Sub Menu Roles")]
        public string SubMenuRoles { get; set; }

        [Display(Name = "Sub Menu Status")]
        public bool SubMenuStatus { get; set; }

        [Display(Name = "Sub Menu Order")]
        public int SubMenuOrder { get; set; }

        public MainMenu CurrentMainMenu { get; set; }       
    }
}
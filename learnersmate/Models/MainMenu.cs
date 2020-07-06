using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsMainMenu")]
    public class MainMenu
    {
        [Key]
        [Display(Name = "ID")]
        public int MainMenuID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Main Menu Name")]
        public string MainMenuName { get; set; }

       
        [MaxLength(100)]
        [Display(Name = "Main Menu Name")]
        public string MainMenuName2 { get; set; }

        [Display(Name = "Main Menu Order")]
        public int MainMenuOrder { get; set; }

        public virtual ICollection<SubMenu> SubMenus { get; set; }
       
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{    
    public class MenuModel
    {
        public string MainMenuName { get; set; }
        public string MainMenuName2 { get; set; }
        public int MainMenuID { get; set; }
        public string SubMenuName { get; set; }
        public string SubMenuName2 { get; set; }
        public int SubMenuID { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public int RoleID { get; set; }
        public string RoleName { get; set; }
       
    }
}
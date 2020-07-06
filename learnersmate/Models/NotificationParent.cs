using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsNotificationParents")]
    public class NotificationParent
    {
        [Key]
        public int NotificationParentID { get; set; }

        [Display(Name = "Notification")]
        public int NotificationID { get; set; }
     
        [Display(Name = "Parent")]       
        public int ParentID { get; set; }

        public Notification CurrentNotification { get; set; }
        public Parent CurrentParent { get; set; }

    }
}

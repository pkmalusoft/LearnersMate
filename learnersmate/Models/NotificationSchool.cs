using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsNotificationSchools")]
    public class NotificationSchool
    {
        [Key]
        public int NotificationSchoolID { get; set; }

        [Display(Name = "Notification")]
        public int NotificationID { get; set; }
     
        [Display(Name = "School")]       
        public int SchoolID { get; set; }

        public Notification CurrentNotification { get; set; }
        public School CurrentSchool { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsNotificationEmployees")]
    public class NotificationEmployee
    {
        [Key]
        public int NotificationEmployeeID { get; set; }

        [Display(Name = "Task List")]
        public int NotificationID { get; set; }
     
        [Display(Name = "Employee")]       
        public int EmployeeID { get; set; }

        public Notification CurrentNotification { get; set; }
        public Employee CurrentEmployee { get; set; }

    }
}

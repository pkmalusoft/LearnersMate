using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsNotificationStudents")]
    public class NotificationStudent
    {
        [Key]
        public int NotificationStudentID { get; set; }

        [Display(Name = "Notification")]
        public int NotificationID { get; set; }
     
        [Display(Name = "Student")]       
        public int StudentID { get; set; }

        public Notification CurrentNotification { get; set; }
        public Student CurrentStudent { get; set; }

    }
}

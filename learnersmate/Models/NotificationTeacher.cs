using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsNotificationTeachers")]
    public class NotificationTeacher
    {
        [Key]
        public int NotificationTeacherID { get; set; }

        [Display(Name = "Notification")]
        public int NotificationID { get; set; }
     
        [Display(Name = "Teacher")]       
        public int TeacherID { get; set; }

        public Notification CurrentNotification { get; set; }
        public Teacher CurrentTeacher { get; set; }

    }
}

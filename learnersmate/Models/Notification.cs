using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsNotifications")]
    public class Notification
    {
        [Key]
        public int NotificationID { get; set; }

        [Required]
        [Display(Name = "Notification Type")]
        public int NotificationTypeID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        [MaxLength(4000)]
        [Display(Name = "Detail")]
        public string Detail { get; set; }

        [Display(Name = "Notified Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> NotifiedDate { get; set; }

        public NotificationType CurrentNotificationType { get; set; }

        public virtual ICollection<NotificationSchool> NotificationSchools { get; set; }
        public virtual ICollection<NotificationTeacher> NotificationTeachers { get; set; }
        public virtual ICollection<NotificationParent> NotificationParents { get; set; }
        public virtual ICollection<NotificationStudent> NotificationStudents { get; set; }
        public virtual ICollection<NotificationEmployee> NotificationEmployees { get; set; }
        
    }
}
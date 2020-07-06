using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsTaskStatuses")]
    public class TaskStatus
    {
        [Key]
        public int TaskStatusID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        public virtual ICollection<TaskList> TaskLists { get; set; }

    }
}

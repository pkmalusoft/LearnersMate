using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsTaskTypes")]
    public class TaskType
    {
        [Key]
        public int TaskTypeID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        public virtual ICollection<TaskList> TaskLists { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsTaskTaskLists")]
    public  class TaskList
    {
        [Key]
        public int TaskListID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }        

        [Display(Name = "Detail")]
        public string ListDetail { get; set; }

        [Display(Name = "Type")]
        public int TaskTypeID { get; set; }

        [Display(Name = "Priority")]
        public int TaskPriorityID { get; set; }

        [Display(Name = "Status")]
        public int TaskStatusID { get; set; }

        [Display(Name = "Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> ListDate { get; set; }

        public TaskType CurrentTaskType { get; set; }
        public TaskPriority CurrentTaskPriority { get; set; }
        public TaskStatus CurrentTaskStatus { get; set; }

        public virtual ICollection<TaskEmployee> TaskEmployees { get; set; }

    }
}

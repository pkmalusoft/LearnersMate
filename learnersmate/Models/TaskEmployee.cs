using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace learnersmate.Models
{
    [Table("smsTaskEmployees")]
    public class TaskEmployee
    {
        [Key]
        public int TaskEmployeeID { get; set; }

        [Display(Name = "Task List")]
        public int TaskListID { get; set; }
     
        [Display(Name = "Employee")]       
        public int EmployeeID { get; set; }

        public TaskList CurrentTaskList { get; set; }
        public Employee CurrentEmployee { get; set; }

    }
}

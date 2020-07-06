using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsPeriods")]
    public class Period
    {
        [Key]
        [Display(Name = "ID")]
        public int PeriodID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Time")]
        public string Time { get; set; }

        public virtual ICollection<TimeTable> TimeTables { get; set; }

    }
}

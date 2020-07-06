using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsCalendars")]
    public class Calendar
    {
        [Key]
        [Display(Name = "ID")]
        public int CalendarID { get; set; }
      
        [Display(Name = "Date")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM}", ApplyFormatInEditMode = true)]
        public DateTime Date { get; set; }
                
        [MaxLength(10)]
        [Display(Name = "Day Name")]
        public string DayName { get; set; }

        [MaxLength(100)]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [MaxLength(250)]
        [Display(Name = "Description")]
        public string Description { get; set; }
             
        [Display(Name = "IsHoliday")]
        public bool IsHoliday { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsTimeTables")]
    public class TimeTable
    {
        [Key]
        [Display(Name = "ID")]
        public int TimeTableID { get; set; }

        [Display(Name = "School")]
        public int SchoolID { get; set; }

        [Display(Name = "Class")]
        public int ClassID { get; set; }

        [Display(Name = "Section")]
        public int SectionID { get; set; }

        [Display(Name = "Period")]
        public int PeriodID { get; set; }		

        [Display(Name = "Teacher")]
        public int TeacherID { get; set; }

        [Display(Name = "Subject")]
        public int SubjectID { get; set; }

        [Display(Name = "Class Teacher")]
        public bool isClassTeacher { get; set; }

        public School CurrentSchool { get; set; }
        public Class CurrentClass { get; set; }
        public Section CurrentSection { get; set; }
        public Period CurrentPeriod { get; set; }       
        public Teacher CurrentTeacher { get; set; }
        public Subject CurrentSubject { get; set; }       
        
    }
}

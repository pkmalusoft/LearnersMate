using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsExamPortions")]
    public class ExamPortion
    {
        [Key]
        [Display(Name = "ID")]
        public int ExamPortionID { get; set; }

        [Required]
        [Display(Name = "Exam")]
        public int ExamID { get; set; }

        [Required]
        [Display(Name = "Chapter")]
        public int ChapterID { get; set; }

        [Required]
        [Display(Name = "Topic")]
        public int TopicID { get; set; }

        public Exam CurrentExam { get; set; }
        public Chapter CurrentChapter { get; set; }
        public Topic CurrentTopic { get; set; }

    }
}

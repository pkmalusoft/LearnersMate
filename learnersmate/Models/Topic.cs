using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsTopics")]
    public class Topic
    {
        [Key]
        [Display(Name = "ID")]
        public int TopicID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Chapter")]
        public int ChapterID { get; set; }

        public Chapter CurrentChapter { get; set; }

        public virtual ICollection<ExamPortion> ExamPortions { get; set; }       
    }
}

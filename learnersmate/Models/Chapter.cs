using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsChapters")]
    public class Chapter
    {
        [Key]
        [Display(Name = "ID")]
        public int ChapterID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Subject")]
        public int SubjectID { get; set; }

        public Subject CurrentSubject { get; set; }

        public virtual ICollection<Topic> Topics { get; set; }
        public virtual ICollection<ExamPortion> ExamPortions { get; set; }       
    }
}

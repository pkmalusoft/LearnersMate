using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsAnalysisGroups")]
    public class AnalysisGroup
    {
        [Key]
        [Display(Name = "ID")]
        public int AnalysisGroupID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Group")]
        public string Name { get; set; }

        public virtual ICollection<AnalysisHead> AnalysisHeads { get; set; } 
    }
}
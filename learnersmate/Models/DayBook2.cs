using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsDayBooks")]
    public class DayBook2
    {
        [Key]
        public int DayBookID { get; set; }

        [MaxLength(100)]
        public string Col1 { get; set; }

        [MaxLength(4000)]
        public string Col2 { get; set; }

        [MaxLength(100)]
        public string Col3 { get; set; }

        [MaxLength(100)]
        public string Col4 { get; set; }

        [MaxLength(100)]
        public string Col5 { get; set; }

        [MaxLength(100)]
        public string Col6 { get; set; }

        [MaxLength(100)]
        public string Col7 { get; set; }

        [MaxLength(100)]
        public string Col8 { get; set; }

        [MaxLength(4000)]
        public string Col9 { get; set; }

    }
    public class DayBookList2
    {
        public List<DayBook2> DayBooks2 { get; set; }
    }
}
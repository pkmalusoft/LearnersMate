using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace learnersmate.Models
{
    [Table("smsCashBooks")]
    public class CashBook
    {
        [Key]
        public int CashBookID { get; set; }

        [MaxLength(100)]
        public string Col1 { get; set; }

        [MaxLength(1000)]
        public string Col2 { get; set; }

        [MaxLength(100)]
        public string Col3 { get; set; }

        [MaxLength(100)]
        public string Col4 { get; set; }

        [MaxLength(100)]
        public string Col5 { get; set; }

        [MaxLength(1000)]
        public string Address { get; set; }

        [MaxLength(100)]
        public string FromToDate { get; set; }
       
        public int UserId { get; set; }

    }
    public class CashBookList
    {
        public List<CashBook> CashBooks { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsCurrencies")]
    public class Currency
    {
        [Key]
        public int CurrencyID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Country")]
        public int CountryID { get; set; }

        [Required]
        [Display(Name = "Symbol")]
        [MaxLength(50)]
        public string Symbol { get; set; }

        [Required]
        [Display(Name = "Decimals")]
        public short NoOfDecimals { get; set; }

       
        [Display(Name = "Monetary Unit")]
        [MaxLength(100)]
        public string MonetaryUnit { get; set; }        

        [Display(Name = "Status Base")]
        public bool StatusBaseCurrency { get; set; }

        [Required]
        [Display(Name = "Exchange Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal ExchangeRate { get; set; }

        public Country CurrentCountry { get; set; }
        public virtual ICollection<Company> Companys { get; set; }
        public virtual ICollection<PurchaseInvoice> PurchaseInvoices { get; set; }
    }
}
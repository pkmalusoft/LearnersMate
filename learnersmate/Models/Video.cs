using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    [Table("smsVideos")]
    public class Video
    {
        [Key]
        public int VideoID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }
       
        [Display(Name = "Description")]
        [MaxLength(4000)]
        public string Description { get; set; }

        [Required]
        [Display(Name = "File Ext")]
        [MaxLength(10)]
        public string FileExt { get; set; }

        [Required]
        [Display(Name = "Video")]
        [MaxLength(4000)]
        public string VideoPath { get; set; }
      
        [Display(Name = "Youtube Video")]
        [MaxLength(4000)]
        public string YoutubePath { get; set; }

        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }
                
        [Display(Name = "Date Of Upload")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime Dou { get; set; }

        public User CurrentUser { get; set; }       
    }
}
using System.ComponentModel.DataAnnotations;

namespace learnersmate.Models
{
    public class ForgotPasswordModel
    {
        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        [MaxLength(100, ErrorMessage = "Email cannot be Greater than 100 Charaters")]
        public string Email { get; set; }
    }

    public class ManageUserViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current Password")]
        [MaxLength(20, ErrorMessage = "Password cannot be Greater than 20 Charaters")]
        public string OldPassword { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "New Password")]
        [MaxLength(20, ErrorMessage = "Password cannot be Greater than 20 Charaters")]
        public string NewPassword { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password")]
        [MaxLength(20, ErrorMessage = "Password cannot be Greater than 20 Charaters")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class LoginViewModel
    {

        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        [MaxLength(100, ErrorMessage = "Email cannot be Greater than 100 Charaters")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        [MaxLength(20, ErrorMessage = "Password cannot be Greater than 20 Charaters")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }

        [Required]
        [Display(Name = "Academic Year")]
        public int AcademicYearID { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }

    }

    public class RegisterViewModel
    {

        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        [MaxLength(100, ErrorMessage = "Email cannot be Greater than 100 Charaters")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        [MaxLength(20, ErrorMessage = "Password cannot be Greater than 20 Charaters")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        [Required]
        [Display(Name = "Role")]
        public int RoleID { get; set; }

     
    }
    public class SelectRoleEditorViewModel
    {
        public SelectRoleEditorViewModel() { }     
        public SelectRoleEditorViewModel(Role role)
        {
            this.Name = role.Name;
        }

        public bool Selected { get; set; }

        [Required]
        public string Name { get; set; }      
       
    }
    public class RoleViewModel
    {
        public string Name { get; set; }
        
        public RoleViewModel() { }
        public RoleViewModel(Role role)
        {
            this.Name = role.Name;            
        }
    }


    public class EditRoleViewModel
    {
        public string OriginalRoleName { get; set; }
        public string RoleName { get; set; }
       

        public EditRoleViewModel() { }
        public EditRoleViewModel(Role role)
        {
            this.OriginalRoleName = role.Name;
            this.RoleName = role.Name;            
        }
    }
}

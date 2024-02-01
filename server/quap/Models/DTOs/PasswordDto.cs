using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs
{
    public class RegisterVerifyPasswordDto
    {
        [Required]
        public string Password { get; set; }
    }

    public class ChangePasswordDto
    {
        [Required]
        public string OldPassword { get; set; }
        [Required]
        public string NewPassword { get; set; }
    }
}

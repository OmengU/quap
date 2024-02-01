using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using quap.Data;
using quap.Models;
using quap.Models.DTOs;

namespace quap.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly QuizManagementDbContext _context;

        public AuthController(QuizManagementDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> CheckPasswordExists()
        {
            var existingPassword = await _context.Passwords.FindAsync(1);
            if (existingPassword != null)
            {
                return Ok("A password exists.");
            }
            else
            {
                return NotFound("No password set");
            }
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterVerifyPasswordDto dto)
        {
            var existingPassword = await _context.Passwords.FindAsync(1);
            if (existingPassword != null)
            {
                return BadRequest("A password is already registered.");
            }

            var hashedPassword = BCrypt.Net.BCrypt.HashPassword(dto.Password);

            var password = new Password
            {
                Id = 1,
                PasswordHash = hashedPassword
            };

            _context.Passwords.Add(password);
            await _context.SaveChangesAsync();

            return Ok("Password registered successfully.");
        }

        [HttpPost("verify")]
        public async Task<IActionResult> Verify([FromBody] RegisterVerifyPasswordDto model)
        {
            var storedPasswordHash = await _context.Passwords.FindAsync(1);
            if (storedPasswordHash == null) return NotFound("Password not set");

            if (BCrypt.Net.BCrypt.Verify(model.Password, storedPasswordHash.PasswordHash))
            {
                return Ok("Password verfied successfully");
            }
            else
            {
                return Unauthorized("Incorrect Password");
            }
        }

        [HttpPost("change-password")]
        public async Task<IActionResult> ChangePassword([FromBody] ChangePasswordDto dto)
        {
            var storedPasswordHash = await _context.Passwords.FindAsync(1);

            if (storedPasswordHash == null) return NotFound("Password not set");

            if (BCrypt.Net.BCrypt.Verify(dto.OldPassword, storedPasswordHash.PasswordHash))
            {
                storedPasswordHash.PasswordHash = BCrypt.Net.BCrypt.HashPassword(dto.NewPassword);
                _context.Passwords.Update(storedPasswordHash);
                await _context.SaveChangesAsync();

                return Ok("Password was successfully changed");
            }
            else
            {
                return Unauthorized("Old password is not correct");
            }
        }

    }
}

using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs.GameDTOs
{
    public class PlayerDto
    {
        public Guid PlayerId { get; set; }
        public string Name { get; set; }
        public string Icon { get; set; }
        public float Score { get; set; }
    }

    public class CreatePlayerDto
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public string Icon { get; set; }
    }
}

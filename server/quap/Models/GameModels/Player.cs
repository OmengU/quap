using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace quap.Models.GameModels
{
    public class Player
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid PlayerId { get; set; }
        public string Name { get; set; }
        public string Icon { get; set; }
        public float Score { get; set; } = 0;

        public Guid GameId { get; set; }
        public Game Game { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace quap.Models.GameModels
{
    public class Game
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid GameId { get; set; }
        public List<Player> Players { get; set; } = new List<Player>();
        public int NPlayers { get; set; } = 0;
        public Quiz Quiz { get; set; }

    }
}

using quap.Models.GameModels;

namespace quap.Models.DTOs.GameDTOs
{
    public class GameDto
    {
        public Guid GameId { get; set; }
        public List<Player> Players { get; set; }
        public int NPlayers { get; set; }
        public QuizDto Quiz { get; set; }
        public bool Current { get; set; }
    }
}

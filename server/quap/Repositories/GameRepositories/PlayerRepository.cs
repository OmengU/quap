using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;
using quap.Repositories.GameRepositories.IRepositories;

namespace quap.Repositories.GameRepositories
{
    public class PlayerRepository : IPlayerRepository
    {
        public Task<Player> AddScore(Guid playerId, float scoreToAdd)
        {
            throw new NotImplementedException();
        }

        public Task<Player> CreatePlayer(CreatePlayerDto dto)
        {
            throw new NotImplementedException();
        }

        public Task DeletePlayer(Guid playerId)
        {
            throw new NotImplementedException();
        }

        public Task<Player> GetAll(Guid gameId)
        {
            throw new NotImplementedException();
        }
    }
}

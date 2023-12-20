using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;

namespace quap.Repositories.GameRepositories.IRepositories
{
    public interface IPlayerRepository
    {
        Task<Player> GetAll(Guid gameId);
        Task<Player> CreatePlayer(CreatePlayerDto dto);
        Task<Player> AddScore(Guid playerId, float scoreToAdd);
        Task DeletePlayer(Guid playerId);
    }
}

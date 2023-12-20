using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;
using System.Collections.Generic;

namespace quap.Repositories.GameRepositories.IRepositories
{
    public interface IPlayerRepository
    {
        Task<IEnumerable<Player>> GetAll(Guid gameId);
        Task<Player> CreatePlayer(CreatePlayerDto dto);
        Task<Player> AddScore(Guid playerId, float scoreToAdd);
        Task DeletePlayer(Guid playerId);
    }
}

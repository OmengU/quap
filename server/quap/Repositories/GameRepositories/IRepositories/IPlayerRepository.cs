using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;
using System.Collections.Generic;

namespace quap.Repositories.GameRepositories.IRepositories
{
    public interface IPlayerRepository
    {
        Task<IEnumerable<Player>> GetAll(Guid gameId);
        Task<Player> CreatePlayer(CreatePlayerDto dto, Guid gameId);
        Task<Player> AddScore(Guid playerId, int scoreToAdd);
        Task DeletePlayer(Guid playerId);
    }
}

﻿using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;

namespace quap.Repositories.GameRepositories.IRepositories
{
    public interface IGameRepository
    {
        Task<Game> CreateGame(Guid quizId);

        Task<Game> AddPlayer(Player player);

        Task DeleteGame(Guid gameId);

        Task<GameDto> GetCurrentGame();
    }
}

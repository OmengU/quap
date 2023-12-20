using AutoMapper;
using Microsoft.EntityFrameworkCore;
using quap.Data;
using quap.Models;
using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;
using quap.Repositories.GameRepositories.IRepositories;

namespace quap.Repositories.GameRepositories
{
    public class GameRepository : IGameRepository
    {
        private readonly QuizManagementDbContext _context;
        private readonly IMapper _mapper;

        public GameRepository(QuizManagementDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task<Game> AddPlayer(Guid gameId, Player player)
        {
            Game game = await _context.Games.FirstOrDefaultAsync(g => g.GameId.Equals(gameId));
            if (game == null) return null;

            game.Players.Add(player);
            _context.SaveChangesAsync();

            return game;
        }

        public async Task<Game> CreateGame(Guid quizId)
        {
            Game game = new Game();
            Quiz quiz = await _context.Quizzes.FirstOrDefaultAsync(q => q.QuizId.Equals(quizId));

            if (quiz == null) return null;

            game.Quiz = quiz;

            _context.Games.Add(game);
            _context.SaveChangesAsync();

            return game;
        }

        public async Task DeleteGame(Guid gameId)
        {
            Game game = await _context.Games.FirstOrDefaultAsync(g => g.GameId.Equals(gameId));
            if (game != null)
            {
                _context.Games.Remove(game);
            }
        }
    }
}

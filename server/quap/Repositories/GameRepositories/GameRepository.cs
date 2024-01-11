using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;
using quap.Data;
using quap.Models;
using quap.Models.DTOs;
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
            await _context.SaveChangesAsync();

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
                await _context.SaveChangesAsync();
            }
        }

        public async Task<Guid> GetCurrentGameId()
        {
            Game game = await _context.Games.FirstOrDefaultAsync(g => g.Current.Equals(true));
            Guid gameId = game.GameId;

            if (gameId == null) return Guid.Empty;
            return gameId;
        }

        public async Task<GameDto> GetCurrentGame()
        {
            GameDto game = _mapper.Map<GameDto>(await _context.Games.Include(g => g.Quiz).FirstOrDefaultAsync(g => g.Current.Equals(true)));
            game.Quiz.Questions = await _context.Questions.Where(q => q.QuizId == game.Quiz.QuizId).ProjectTo<QuestionDto>(_mapper.ConfigurationProvider).ToListAsync();
            return game;
        }
    }
}

using AutoMapper;
using Microsoft.EntityFrameworkCore;
using quap.Data;
using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;
using quap.Repositories.GameRepositories.IRepositories;
using System.Collections.Generic;

namespace quap.Repositories.GameRepositories
{
    public class PlayerRepository : IPlayerRepository
    {
        private readonly QuizManagementDbContext _context;
        private readonly IMapper _mapper;

        public PlayerRepository(QuizManagementDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task<Player> AddScore(Guid playerId, float scoreToAdd)
        {
            Player player = await _context.Players.FirstOrDefaultAsync(p => p.PlayerId.Equals(playerId));
            if (player == null) return null;

            player.Score += scoreToAdd;

            await _context.SaveChangesAsync();
            return player;
        }

        public async Task<Player> CreatePlayer(CreatePlayerDto dto, Guid gameId)
        {
            Player player = _mapper.Map<Player>(dto);
            player.GameId = gameId;
            _context.Players.Add(player);
            await _context.SaveChangesAsync();

            return player;
        }

        public async Task DeletePlayer(Guid playerId)
        {
            Player player = await _context.Players.FirstOrDefaultAsync(p =>  p.PlayerId.Equals(playerId));
            if (player != null)
            {
                _context.Players.Remove(player);
            }
        }

        public async Task<IEnumerable<Player>> GetAll(Guid gameId) => await _context.Players.Where(p => p.GameId == gameId).ToListAsync();
    }
}

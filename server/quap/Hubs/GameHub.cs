using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;
using quap.Repositories.GameRepositories.IRepositories;
using quap.Repositories.IRepositories;

namespace quap.Hubs
{
    public class GameHub: Hub
    {
        private readonly IMapper _mapper;
        private readonly IPlayerRepository _playerRepository;
        private readonly IGameRepository _gameRepository;
        private readonly IQuizRepository _quizRepository;

        public GameHub(IMapper mapper, IPlayerRepository playerRepository, IGameRepository gameRepository, IQuizRepository quizRepository)
        {
            _mapper = mapper;
            _playerRepository = playerRepository;
            _gameRepository = gameRepository;
            _quizRepository = quizRepository;
        }

        public async Task RegisterPlayer(Guid gameId, CreatePlayerDto dto)
        {
            Player createdPlayer = await _playerRepository.CreatePlayer(dto, gameId);
            await _gameRepository.AddPlayer(gameId, createdPlayer);

            await Clients.All.SendAsync("playerAdded", _mapper.Map<PlayerDto>(createdPlayer));
        }
    }
}

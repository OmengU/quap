using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using quap.Data;
using quap.Models;
using quap.Models.DTOs;
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
        private readonly QuizManagementDbContext _context;

        private int _currentQuestionIndex = 0;
        private Timer _questionTimer;
        private List<Question> _questions;
        private Game _game;

        public GameHub(IMapper mapper, IPlayerRepository playerRepository, IGameRepository gameRepository, IQuizRepository quizRepository, QuizManagementDbContext context)
        {
            _mapper = mapper;
            _playerRepository = playerRepository;
            _gameRepository = gameRepository;
            _quizRepository = quizRepository;
            _context = context;
            _questions = _context.Games.FirstOrDefault(g => g.Current == true).Quiz.Questions.ToList();
            _game = _context.Games.FirstOrDefault(g => g.Current == true);
        }

        public async Task RegisterPlayer(Guid gameId, CreatePlayerDto dto)
        {
            Player createdPlayer = await _playerRepository.CreatePlayer(dto, gameId);
            await _gameRepository.AddPlayer(gameId, createdPlayer);

            await Groups.AddToGroupAsync(Context.ConnectionId, createdPlayer.PlayerId.ToString());

            await Clients.All.SendAsync("playerAdded", _mapper.Map<PlayerDto>(createdPlayer));
            await Clients.Group(createdPlayer.PlayerId.ToString()).SendAsync("addedYou", createdPlayer.PlayerId);
        }

        private async Task SendQuestion()
        {
            if (_currentQuestionIndex < _questions.Count)
            {
                await Clients.All.SendAsync("newQuestion", _mapper.Map<SendQuestionDto>(_questions[_currentQuestionIndex]));
            }
            else
            {
                _questionTimer.Dispose();
                await Clients.All.SendAsync("endGame");
            }
        }

        public async Task StartGame()
        {
            await SendQuestion();

            _questionTimer = new Timer(async _ => await RequestScores(), null, TimeSpan.FromSeconds(Convert.ToDouble(_questions[_currentQuestionIndex].TimeLimit)), TimeSpan.FromSeconds(Convert.ToDouble(_questions[_currentQuestionIndex].TimeLimit)));
            _currentQuestionIndex++;
        }

        public async Task RequestScores()
        {
            _questionTimer.Change(Timeout.Infinite, Timeout.Infinite);

            await Clients.All.SendAsync("topPlayers", _game.Players.OrderByDescending(p => p.Score).Take(3).ToList());

            foreach(Player player in  _game.Players)
            {
                await Clients.Group(player.PlayerId.ToString()).SendAsync("resultRecieved", player.Score);
            }
        }

        public async Task NextQuestion()
        {
            await SendQuestion();

            _questionTimer.Change(TimeSpan.FromSeconds(Convert.ToDouble(_questions[_currentQuestionIndex].TimeLimit)), TimeSpan.FromSeconds(Convert.ToDouble(_questions[_currentQuestionIndex].TimeLimit)));
            _currentQuestionIndex++;
        }

        public async Task UpdateScore(Guid playerId, Guid[] optionIds)
        {
            Player player = await _context.Players.FirstOrDefaultAsync(p => p.PlayerId.Equals(playerId));

            // add player to group if they have no score in order to be able send stuff to them
            if (player.Score == 0) await Groups.AddToGroupAsync(Context.ConnectionId, playerId.ToString());

            List<Option> options = new List<Option>();

            foreach(Guid optionId in optionIds)
            {
                options.Add(await _context.Options.FirstOrDefaultAsync(o => o.OId.Equals(optionId)));
            }

            if (options.All(o => o.IsCorrect))
            {
                await _playerRepository.AddScore(playerId, (int)_questions[_currentQuestionIndex].Points);
            }
            
        }
    }
}

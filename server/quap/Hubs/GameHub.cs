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

        private static int _currentQuestionIndex = 0;
        private Timer _questionTimer;
        private static List<Question> _questions;
        private static Game _game;

        public GameHub(IMapper mapper, IPlayerRepository playerRepository, IGameRepository gameRepository, IQuizRepository quizRepository, QuizManagementDbContext context)
        {
            _mapper = mapper;
            _playerRepository = playerRepository;
            _gameRepository = gameRepository;
            _quizRepository = quizRepository;
            _context = context;
        }

        public override async Task OnConnectedAsync()
        {
            _game = _mapper.Map<Game>(await _gameRepository.GetCurrentGame());
            _questions = _game.Quiz.Questions;

            //await Console.Out.WriteLineAsync(_questions[1].QuestionName);

            await base.OnConnectedAsync();
        }

        public async Task RegisterPlayer(CreatePlayerDto dto)
        {
            Player createdPlayer = await _playerRepository.CreatePlayer(dto);
            await _gameRepository.AddPlayer(createdPlayer);

            await Groups.AddToGroupAsync(Context.ConnectionId, createdPlayer.PlayerId.ToString());

            await Clients.All.SendAsync("playerAdded", _mapper.Map<PlayerDto>(createdPlayer));
            await Clients.Group(createdPlayer.PlayerId.ToString()).SendAsync("addedYou", createdPlayer.PlayerId);
        }

        private async Task SendQuestion()
        {
            await Console.Out.WriteLineAsync(_questions[1].QuestionName);
            if (_currentQuestionIndex < _questions.Count)
            {
                await Clients.All.SendAsync("newQuestion", _mapper.Map<SendQuestionDto>(_questions[_currentQuestionIndex]));
            }
            else
            {
               // _questionTimer.Dispose();
                await Clients.All.SendAsync("endGame", _game.Players.OrderByDescending(p => p.Score).ToList());
            }
        }

        public async Task StartGame()
        {
            _currentQuestionIndex = 0;
            await SendQuestion();

            //_questionTimer = new Timer(async _ => await RequestScores(), null, TimeSpan.FromSeconds(Convert.ToDouble(_questions[_currentQuestionIndex].TimeLimit)), TimeSpan.FromSeconds(Convert.ToDouble(_questions[_currentQuestionIndex].TimeLimit)));
            _currentQuestionIndex++;
        }

        public async Task EndGame()
        {
            await _gameRepository.DeleteGame(_game.GameId);
            await _context.SaveChangesAsync();
            _game = null;
            _questions = null;
        }

        public async Task RequestScores()
        {
            //_questionTimer.Change(Timeout.Infinite, Timeout.Infinite);

            var playersWithScore = _game.Players.Where(p => p.Score > 0).ToList();
            var topPlayers = playersWithScore.Count < 3
                ? playersWithScore.Concat(_game.Players.Except(playersWithScore).OrderBy(p => Guid.NewGuid()).Take(3 - playersWithScore.Count)).ToList()
                : playersWithScore.OrderByDescending(p => p.Score).Take(3).ToList();

            await Clients.All.SendAsync("topPlayers", topPlayers);

            foreach (Player player in  _game.Players)
            {
                await Clients.Group(player.PlayerId.ToString()).SendAsync("resultRecieved", player.Score);
            }
        }

        public async Task NextQuestion()
        {
            await SendQuestion();

            //_questionTimer.Change(TimeSpan.FromSeconds(Convert.ToDouble(_questions[_currentQuestionIndex].TimeLimit)), TimeSpan.FromSeconds(Convert.ToDouble(_questions[_currentQuestionIndex].TimeLimit)));
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
                await _playerRepository.AddScore(playerId, (int)_questions[_currentQuestionIndex-1].Points);
                //await Clients.Group(player.PlayerId.ToString()).SendAsync("correctResult");
            }
            await Clients.Group(player.PlayerId.ToString()).SendAsync("submitRecieved");

        }
    }
}

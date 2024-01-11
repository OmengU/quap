using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using quap.Models;
using quap.Models.DTOs.GameDTOs;
using quap.Models.GameModels;
using quap.Repositories.GameRepositories.IRepositories;
using System.Net;
using System.Net.Sockets;

namespace quap.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GameController : ControllerBase
    {
        private readonly IGameRepository _gameRepository;

        public GameController(IGameRepository gameRepository)
        {
            _gameRepository = gameRepository;
        }

        [HttpPost("{quizId}")]
        public async Task<ActionResult<Game>> StartGame(Guid quizId)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            try
            {
                Game game = await _gameRepository.CreateGame(quizId);
                return Ok(game);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("active")]
        public async Task<ActionResult<Guid>> GetActiveGame()
        {
            Guid gameId = await _gameRepository.GetCurrentGameId();
            return Ok(gameId);
        }
        [HttpGet("ip")]
        public string GetIPAddress()
        {
            string ipAddress = string.Empty;

            foreach (IPAddress ip in Dns.GetHostAddresses(Dns.GetHostName()))
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    ipAddress = ip.ToString();
                    break;
                }
            }

            return ipAddress;
        }
        [HttpGet("current")]
        public async Task<ActionResult<GameDto>> GetCurrentGame()
        {
            GameDto game = await _gameRepository.GetCurrentGame();
            return Ok(game);
        }
        [HttpDelete("{gameId}")]
        public async Task DeleteGame(Guid gameId)
        {
            await _gameRepository.DeleteGame(gameId);
        }

    }
}

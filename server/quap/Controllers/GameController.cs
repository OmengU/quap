﻿using Microsoft.AspNetCore.Cors;
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
    [EnableCors("DynamicCorsPolicy")]
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
            try
            {
                GameDto game = await _gameRepository.GetCurrentGame();
                if(game == null)
                {
                    return NotFound("Game not found");
                }
                return Ok(game);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }
        [HttpDelete("{gameId}")]
        public async Task DeleteGame(Guid gameId)
        {
            await _gameRepository.DeleteGame(gameId);
        }

    }
}

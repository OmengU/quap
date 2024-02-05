using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using quap.Models.DTOs;
using quap.Models;
using quap.Repositories.IRepositories;

namespace quap.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly IOptionRepository _optionRepository;
        private readonly IQuestionRepository _questionRepository;
        private readonly IQuizRepository _quizRepository;
        private readonly IMapper _mapper;

        public QuestionController(IOptionRepository optionRepository, IQuestionRepository questionRepository, IQuizRepository quizRepository, IMapper mapper)
        {
            _optionRepository = optionRepository;
            _questionRepository = questionRepository;
            _quizRepository = quizRepository;
            _mapper = mapper;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Question>> GetQuestionById(Guid id)
        {
            try
            {
                var result = _mapper.Map<QuestionDto>(await _questionRepository.GetQuestionById(id));
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}/options")]
        public async Task<ActionResult<Option>> GetAllOptions(Guid id)
        {
            try
            {
                var result = _mapper.Map<IEnumerable<OptionDto>>(await _optionRepository.GetOptionsByQuestionId(id));
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("{quizid}")]
        public async Task<ActionResult<QuestionDto>> AddQuestion(Guid quizid)
        {
            try
            {
                var question = await _quizRepository.AddQuestion(quizid);
                if (question == null)
                {
                    return NotFound();
                }
                return Ok(_mapper.Map<QuestionDto>(question));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("{id}")]
        public async Task<IActionResult> UpdateQuestion(Guid id, [FromBody] CreateUpdateQuestionDto dto)
        {
            try
            {
                var question = await _questionRepository.UpdateQuestion(id, dto);
                if (question == null)
                {
                    return NotFound();
                }
                return Ok(_mapper.Map<QuestionDto>(question));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteQuestion(Guid id)
        {
            try
            {
                await _questionRepository.DeleteQuestion(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}

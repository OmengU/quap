using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using quap.Models.DTOs;
using quap.Repositories.IRepositories;

namespace quap.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OptionController : ControllerBase
    {
        private readonly IOptionRepository _optionRepository;
        private readonly IQuestionRepository _questionRepository;
        private readonly IQuizRepository _quizRepository;
        private readonly IMapper _mapper;

        public OptionController(IOptionRepository optionRepository, IQuestionRepository questionRepository, IQuizRepository quizRepository, IMapper mapper)
        {
            _optionRepository = optionRepository;
            _questionRepository = questionRepository;
            _quizRepository = quizRepository;
            _mapper = mapper;
        }

        [HttpPost("{questionid}")]
        public async Task<ActionResult<QuestionDto>> AddOption(Guid questionid)
        {
            try
            {
                var option = await _questionRepository.AddOption(questionid);
                if (option == null)
                {
                    return NotFound();
                }
                return Ok(_mapper.Map<OptionDto>(option));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("{id}")]
        public async Task<IActionResult> UpdateOption(Guid id, [FromBody] CreateUpdateOptionDto dto)
        {
            try
            {
                var option = await _optionRepository.UpdateOption(id, dto);
                if (option == null)
                {
                    return NotFound();
                }
                return Ok(_mapper.Map<OptionDto>(option));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteOption(Guid id)
        {
            try
            {
                await _optionRepository.DeleteOption(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

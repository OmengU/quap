using AutoMapper;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using quap.Data;
using quap.Models;
using quap.Models.DTOs;
using quap.Repositories.IRepositories;

namespace quap.Controllers
{
    [Route("api/[controller]")]
    [EnableCors("DynamicCorsPolicy")]
    [ApiController]
    public class QuizController : ControllerBase
    {
        private readonly IOptionRepository _optionRepository;
        private readonly IQuestionRepository _questionRepository;
        private readonly IQuizRepository _quizRepository;
        private readonly IMapper _mapper;

        public QuizController(IOptionRepository optionRepository, IQuestionRepository questionRepository, IQuizRepository quizRepository, IMapper mapper, QuizManagementDbContext context)
        {
            _optionRepository = optionRepository;
            _questionRepository = questionRepository;
            _quizRepository = quizRepository;
            _mapper = mapper;
        }


        [HttpGet]
        public async Task<ActionResult<Quiz>> GetAllQuizzes()
        {
            try
            {
                var quizzes = _mapper.Map<IEnumerable<QuizOverviewDto>>(await _quizRepository.GetAll());
                return Ok(quizzes);
            } catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("{id}/questions")]
        public async Task<ActionResult<Question>> GetAllQuestions(Guid id)
        {
            try
            {
                var result = _mapper.Map<IEnumerable<QuestionDto>>(await _questionRepository.GetAll(id));
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Quiz>> GetQuizById(Guid id)
        {
            try
            {
                var result = _mapper.Map<QuizDto>(await _quizRepository.GetQuizById(id));
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public async Task<ActionResult<Quiz>> CreateQuiz([FromBody] CreateUpdateQuizDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            try
            {
                Quiz quiz = await _quizRepository.CreateQuiz(_mapper.Map<Quiz>(dto));
                return Ok(quiz);
            } catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("{id}")]
        public async Task<IActionResult> UpdateQuiz(Guid id, [FromBody] CreateUpdateQuizDto dto)
        {
            try
            {
                var quiz = await _quizRepository.UpdateQuiz(id, dto);
                if (quiz == null)
                {
                    return NotFound();
                }
                return Ok(_mapper.Map<QuizDto>(quiz));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteQuiz (Guid id)
        {
            try
            {
                await _quizRepository.DeleteQuiz(id);
                return NoContent();
            }catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

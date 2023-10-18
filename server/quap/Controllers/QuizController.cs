using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using quap.Models;
using quap.Models.DTOs;
using quap.Repositories.IRepositories;

namespace quap.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuizController : ControllerBase
    {
        private readonly IOptionRepository _optionRepository;
        private readonly IQuestionRepository _questionRepository;
        private readonly IQuizRepository _quizRepository;
        private readonly IMapper _mapper;

        public QuizController(IOptionRepository optionRepository, IQuestionRepository questionRepository, IQuizRepository quizRepository, IMapper mapper)
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
                var result = await _quizRepository.GetAll();
                return Ok(result);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("/questions")]
        public async Task<ActionResult<Question>> GetAllQuestions()
        {
            try
            {
                var result = await _questionRepository.GetAll();
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
                var result = await _quizRepository.GetQuizById(id);
                return Ok(result);
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPost]
        public async Task<ActionResult<Quiz>> CreateQuiz([FromBody]CreateUpdateQuizDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            try
            {
                Quiz quiz = await _quizRepository.CreateQuiz(_mapper.Map<Quiz>(dto));
                return Ok(quiz);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPatch("{id}/addquestion")]
        public async Task<ActionResult<QuizDto>> AddQuestion(Guid id, [FromBody] CreateUpdateQuestionDto dto)
        {
            try
            {
                var quiz = await _quizRepository.AddQuestion(id, _mapper.Map<Question>(dto));
                if(quiz == null)
                {
                    return NotFound();
                }
                return Ok(_mapper.Map<QuizDto>(quiz));
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPatch("{id}/addoption")]
        public async Task<ActionResult<Question>> AddOption(Guid id, [FromBody] CreateUpdateOptionDto dto)
        {
            try
            {
                var question = await _questionRepository.AddOption(id, _mapper.Map<Option>(dto));
                if(question == null)
                {
                    return NotFound();
                }
                return Ok(question);
            }catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

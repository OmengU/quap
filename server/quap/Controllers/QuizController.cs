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
                var quizzes = _mapper.Map<IEnumerable<QuizOverviewDto>>(await _quizRepository.GetAll());
                return Ok(quizzes);
            } catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("/questions/{id}")]
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
        [HttpGet("options/{id}")]
        public async Task<ActionResult<Option>> GetAllOptions(Guid id)
        {
            try
            {
                var result = _mapper.Map<IEnumerable<OptionDto>>(await _optionRepository.GetOptionsByQuestionId(id));
                return Ok(result);
            } catch (Exception ex)
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
        [HttpGet("question/{id}")]
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
        //[HttpPatch("{id}/addquestion")]
        //public async Task<ActionResult<QuizDto>> AddQuestion(Guid id, [FromBody] CreateUpdateQuestionDto dto)
        //{
        //    try
        //    {
        //        var quiz = await _quizRepository.AddQuestion(id, _mapper.Map<Question>(dto));
        //        if(quiz == null)
        //        {
        //            return NotFound();
        //        }
        //        return Ok(_mapper.Map<QuizDto>(quiz));
        //    }
        //    catch(Exception ex)
        //    {
        //        return BadRequest(ex.Message);
        //    }
        //}

        [HttpPatch("{id}/addquestion")]
        public async Task<ActionResult<QuestionDto>> AddQuestion(Guid id)
        {
            try
            {
                var question = await _quizRepository.AddQuestion(id);
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
        [HttpPatch("{id}/addoption")]
        public async Task<ActionResult<QuestionDto>> AddOption(Guid id)
        {
            try
            {
                var option = await _questionRepository.AddOption(id);
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

        [HttpPatch("updatequestion/{id}")]
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

        [HttpPatch("{optionid}/togglecorrect")]
        public async Task<IActionResult> ToggleComplete(Guid optionId)
        {
            try
            {
                await _optionRepository.ToggleCorrect(optionId);
                return NoContent();
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("{optionid}/settext")]
        public async Task<IActionResult> ChangeText(Guid optionId, [FromBody] string text)
        {
            try
            {
                var option = await _optionRepository.SetText(optionId, text);
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

        [HttpDelete("deletequiz/{id}")]
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
        [HttpDelete("deletequestion/{id}")]
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
        [HttpDelete("deleteoption/{optionid}")]
        public async Task<ActionResult> DeleteOption(Guid OptionId)
        {
            try
            {
                await _optionRepository.DeleteOption(OptionId);
                return NoContent();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

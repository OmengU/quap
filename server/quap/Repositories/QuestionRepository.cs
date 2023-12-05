using AutoMapper;
using Microsoft.EntityFrameworkCore;
using quap.Data;
using quap.Models;
using quap.Models.DTOs;
using quap.Repositories.IRepositories;

namespace quap.Repositories
{
    public class QuestionRepository : IQuestionRepository
    {
        private readonly QuizManagementDbContext _context;
        private readonly IMapper _mapper;
        private readonly IOptionRepository _optionRepository;

        public QuestionRepository(QuizManagementDbContext context, IMapper mapper, IOptionRepository optionRepository)
        {
            _context = context;
            _mapper = mapper;
            _optionRepository = optionRepository;
        }
        public async Task<Option> AddOption(Guid Id)
        {
            Question question = await _context.Questions.FirstOrDefaultAsync(q => q.QuestionId == Id);
            if (question != null)
            {
                Option option = new Option { };
                question.Options.Add(option);
                question.NOptions++;

                await _context.SaveChangesAsync();
                return option;
            }
            return null;
        }

        public async Task<Question> CreateQuestion(Question question)
        {
            _context.Questions.Add(question);
            await _context.SaveChangesAsync();
            return question;
        }

        public async Task DeleteQuestion(Guid Id)
        {
            Question question = _context.Questions.FirstOrDefault(q => q.QuestionId == Id);
            _context.Questions.Remove(question);
            await _context.SaveChangesAsync();
        }

        public async Task<Question> GetQuestionById(Guid Id) => await _context.Questions.Include(q => q.Options).FirstOrDefaultAsync(q => q.QuestionId == Id);

        public async Task<Question> UpdateQuestion(Guid Id, CreateUpdateQuestionDto question)
        {
            Question newQuestion = await _context.Questions.FirstOrDefaultAsync(q => q.QuestionId.Equals(Id));

            if (newQuestion != null)
            {
                newQuestion.QuestionName = question.QuestionName;
                newQuestion.TimeLimit = question.TimeLimit;
                newQuestion.Points = question.Points;
                newQuestion.Type = question.Type;

                await _context.SaveChangesAsync();
                return newQuestion;
            }
            return null;
        }
        public async Task<IEnumerable<Question>> GetAll(Guid id) => await _context.Questions.Include(q => q.Options).Where(q => q.QuizId == id).ToListAsync();
    }
}

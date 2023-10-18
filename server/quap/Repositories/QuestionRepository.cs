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

        public QuestionRepository(QuizManagementDbContext context)
        {
            _context = context;
        }
        public async Task<Question> AddOption(Guid Id, Option option)
        {
            Question question = await _context.Questions.FirstOrDefaultAsync(q => q.QuestionId == Id);
            if (question == null)
            {
                question.Options.Add(option);
                question.NOptions++;

                await _context.SaveChangesAsync();
                return question;
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

        public async Task<Question> GetQuestionById(Guid Id)
        {
            return await _context.Questions.FirstOrDefaultAsync(q => q.QuestionId == Id);
        }

        public Task<Question> UpdateQuestion(Guid Id, CreateUpdateQuestionDto option)
        {
            throw new NotImplementedException();
        }
        public async Task<IEnumerable<Question>> GetAll() => await _context.Questions.ToListAsync();
    }
}

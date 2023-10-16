using Microsoft.EntityFrameworkCore;
using quap.Data;
using quap.Models;
using quap.Models.DTOs;
using quap.Repositories.IRepositories;

namespace quap.Repositories
{
    public class QuizRepository : IQuizRepository
    {
        private readonly QuizManagementDbContext _context;

        public QuizRepository(QuizManagementDbContext context)
        {
            _context = context;
        }
        public async Task<Quiz> AddQuestion(Guid id, Question question)
        {
            Quiz quiz = await _context.Quizzes.FirstOrDefaultAsync(q => q.QuizId == id);
            if (quiz == null)
            {
                quiz.Questions.Add(question);
                quiz.NQuestions++;

                await _context.SaveChangesAsync();
                return quiz;
            }
            return null;
        }

        public async Task<Quiz> CreateQuiz(Quiz quiz)
        {
            _context.Quizzes.Add(quiz);
            await _context.SaveChangesAsync();
            return quiz;
        }

        public async Task DeleteQuiz(Guid id)
        {
            Quiz quiz = await _context.Quizzes.FirstOrDefaultAsync(q => q.QuizId == id);
            _context.Questions.Remove(quiz);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Quiz>> GetAll() => await _context.Quizzes.ToListAsync();

        public async Task<Quiz> GetQuizById(Guid id) => await _context.Quizzes.FirstOrDefaultAsync(q => q.QuizId == id);

        public Task<Quiz> UpdateQuiz(Guid Id, CreateUpdateQuizDto quiz)
        {
            throw new NotImplementedException();
        }
    }
}

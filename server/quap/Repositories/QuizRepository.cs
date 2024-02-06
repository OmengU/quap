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
        public async Task<Question> AddQuestion(Guid id)
        {
            Quiz quiz = await _context.Quizzes.FirstOrDefaultAsync(q => q.QuizId == id);
            if (quiz != null)
            {
                Question question = new Question { };
                quiz.Questions.Add(question);
                quiz.NQuestions++;

                await _context.SaveChangesAsync();
                return question;
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
            _context.Quizzes.Remove(quiz);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Quiz>> GetAll()
        {
            var quizzes = await _context.Quizzes.Include(q => q.Questions).OrderBy(q => q.CreationDate).ToListAsync();
            foreach (var quiz in quizzes)
            {
                foreach (var question in quiz.Questions)
                {
                    question.Options = await _context.Options.Where(o => o.QuestionId == question.QuestionId).ToListAsync();
                }
            }
            return quizzes;
        }

        public async Task<Quiz> GetQuizById(Guid id) => await _context.Quizzes.Include(q => q.Questions).FirstOrDefaultAsync(q => q.QuizId == id);

        public async Task<Quiz> UpdateQuiz(Guid Id, CreateUpdateQuizDto quiz)
        {
            Quiz newQuiz = await _context.Quizzes.FirstOrDefaultAsync(q => q.QuizId.Equals(Id));

            if (newQuiz != null)
            {
                newQuiz.Name = quiz.Name;
                newQuiz.Description = quiz.Description;

                await _context.SaveChangesAsync();
                return newQuiz;
            }
            return null;
        }
    }
}

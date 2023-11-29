using quap.Models;
using quap.Models.DTOs;

namespace quap.Repositories.IRepositories
{
    public interface IQuizRepository
    {
        Task<Quiz> GetQuizById(Guid id);
        Task<Quiz> CreateQuiz(Quiz quiz);
        Task<Quiz> UpdateQuiz(Guid Id, CreateUpdateQuizDto quiz);
        Task DeleteQuiz(Guid id);
        Task<Quiz> AddQuestion(Guid id);
        Task<IEnumerable<Quiz>> GetAll();
    }
}

using Microsoft.EntityFrameworkCore;
using quap.Models;
using quap.Models.DTOs;

namespace quap.Repositories.IRepositories
{
    public interface IQuestionRepository
    {
        Task<Question> GetQuestionById(Guid Id);
        Task<Question> CreateQuestion(Question question);
        Task<Question> UpdateQuestion(Guid Id, CreateUpdateQuestionDto question);
        Task DeleteQuestion(Guid Id);
        Task<Question> AddOption(Guid Id, Option option);
        Task<IEnumerable<Question>> GetAll(Guid id);

    }
}

using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
using quap.Data;
using quap.Models;
using quap.Models.DTOs;
using quap.Repositories.IRepositories;

namespace quap.Repositories
{
    public class OptionRepository : IOptionRepository
    {
        private readonly QuizManagementDbContext _context;

        public OptionRepository(QuizManagementDbContext context)
        {
            _context = context;
        }

        public async Task<Option> CreateOption(Option option)
        {
            _context.Options.Add(option);
            await _context.SaveChangesAsync();
            return option;
        }

        public async Task DeleteOption(Guid Id)
        {
            Option option = await _context.Options.FirstOrDefaultAsync(o => o.OId == Id);
            Question question = await _context.Questions.FirstOrDefaultAsync(question => question.QuestionId == option.QuestionId);
            _context.Options.Remove(option);
            question.NOptions--;
            await _context.SaveChangesAsync();
        }

        public async Task<Option> GetOptionById(Guid Id)
        {
            return await _context.Options.FirstOrDefaultAsync(o => o.OId == Id);
        }

        public async Task<IEnumerable<Option>> GetOptionsByQuestionId(Guid QuestionId) => await _context.Options.Where(o => o.QuestionId == QuestionId).OrderBy(q => q.CreationDate).ToListAsync();

        public async Task<Option> UpdateOption(Guid Id, CreateUpdateOptionDto option)
        {
            Option newOption = await _context.Options.FirstOrDefaultAsync(o => o.OId.Equals(Id));

            if(option != null)
            {
                newOption.OptionText = option.OptionText;
                newOption.IsCorrect = option.IsCorrect;

                await _context.SaveChangesAsync();
                return newOption;
            }
            return null;
        }
    }
}

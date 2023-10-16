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
            _context.Options.Remove(option);
            await _context.SaveChangesAsync();
        }

        public async Task<Option> GetOptionById(Guid Id)
        {
            return await _context.Options.FirstOrDefaultAsync(o => o.OId == Id);
        }

        public async Task<Option> GetOptionByQuestionId(Guid QuestionId)
        {
            return await _context.Options.FirstOrDefaultAsync(o => o.QuestionId == QuestionId);
        }

        public async Task<Option> UpdateOption(Guid Id, UpdateOptionDto option)
        {
            Option newOption = await _context.Options.FirstOrDefaultAsync(o => o.OId.Equals(Id));

            if(option != null)
            {
                //still tba requires mapper (will do next time)
                return null;
            }
            return null;
        }
    }
}

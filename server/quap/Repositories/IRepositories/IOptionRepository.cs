﻿using quap.Models;
using quap.Models.DTOs;

namespace quap.Repositories.IRepositories
{
    public interface IOptionRepository
    {
        Task<Option> GetOptionById(Guid Id);
        Task<Option> CreateOption(Option option);
        Task<Option> UpdateOption(Guid Id, CreateUpdateOptionDto option);
        Task DeleteOption(Guid Id);
        Task<IEnumerable<Option>> GetOptionsByQuestionId(Guid QuestionId);
        Task ToggleCorrect(Guid Id);
        Task<Option> SetText(Guid id, string text);
    }
}

﻿using quap.Models;
using quap.Models.DTOs;

namespace quap.Repositories.IRepositories
{
    public interface IOptionRepository
    {
        Task<Option> GetOptionById(Guid Id);
        Task<Option> CreateOption(Option option);
        Task<Option> UpdateOption(Guid Id, UpdateOptionDto option);
        Task DeleteOption(Guid Id);
        Task<Option> GetOptionByQuestionId(Guid QuestionId);
    }
}

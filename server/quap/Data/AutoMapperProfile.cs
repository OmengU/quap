using AutoMapper;
using quap.Models;
using quap.Models.DTOs;

namespace quap.Data
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile() 
        {
            CreateMap<Option, OptionDto>();
            CreateMap<Option, OptionDto>().ReverseMap();

            CreateMap<Option, CreateUpdateOptionDto>();
            CreateMap<Option, CreateUpdateOptionDto>().ReverseMap();

            CreateMap<Question,  QuestionDto>();
            CreateMap<Question, QuestionDto>().ReverseMap();

            CreateMap<Question, CreateUpdateQuestionDto>();
            CreateMap<Question, CreateUpdateQuestionDto>().ReverseMap();

            CreateMap<Quiz, QuizDto>();
            CreateMap<Quiz, QuizDto>().ReverseMap();

            CreateMap<Quiz, CreateUpdateQuizDto>();
            CreateMap<Quiz, CreateUpdateQuizDto>().ReverseMap();
        }
    }
}

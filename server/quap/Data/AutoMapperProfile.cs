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

            CreateMap<Question, QuestionDto>().ForMember(dest => dest.QuestionId, opt => opt.MapFrom(src => src.QuestionId));
            CreateMap<Question, QuestionDto>().ReverseMap().ForMember(dest => dest.QuestionId, opt => opt.MapFrom(src => src.QuestionId));

            CreateMap<Question, CreateUpdateQuestionDto>();
            CreateMap<Question, CreateUpdateQuestionDto>().ReverseMap();

            CreateMap<Quiz, QuizDto>().ForMember(dest => dest.QuizId, opt => opt.MapFrom(src => src.QuizId));
            CreateMap<Quiz, QuizDto>().ReverseMap().ForMember(dest => dest.QuizId, opt => opt.MapFrom(src => src.QuizId));

            CreateMap<Quiz, QuizOverviewDto>();
            CreateMap<Quiz, QuizOverviewDto>().ReverseMap();

            CreateMap<Quiz, CreateUpdateQuizDto>();
            CreateMap<Quiz, CreateUpdateQuizDto>().ReverseMap();
        }
    }
}

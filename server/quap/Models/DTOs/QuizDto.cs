using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs
{
    public class QuizDto
    {
        public Guid QuizId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int NQuestions { get; set; }
        public List<QuestionDto> Questions { get; set; }
    }

    public class CreateUpdateQuizDto
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public string Description { get; set; }
    }
    public class QuizOverviewDto
    {
        public Guid QuizId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int NQuestions { get; set; }
    }
}

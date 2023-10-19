using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs
{
    public class QuizDto
    {
        public Guid QuizId { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public int NQuestions { get; set; }
        public List<QuestionDto> Questions { get; set; }
    }

    public class CreateUpdateQuizDto
    {
        [Required]
        public string name { get; set; }
        [Required]
        public string description { get; set; }
    }
}

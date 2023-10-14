using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs
{
    public class QuizDto
    {
        public string name { get; set; }
        public string description { get; set; }
        public int NQuestions { get; set; }
        public List<Question> Questions { get; set; }
    }

    public class CreateQuizDto
    {
        [Required]
        public string name { get; set; }
        [Required]
        public string description { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs
{
	public class QuestionDto
	{
		public int NOptions { get; set; }
		public List<Option> Options { get; set; }
		public QType Type { get; set; }
		public int TimeLimit { get; set; }
		public int Points { get; set; }
		public Guid QuizId { get; set; }
	}
	public class CreateUpdateQuestionDto
	{

        [Required]
        public QType Type { get; set; }
        [Required]
        public int TimeLimit { get; set; }
        [Required]
        public int Points { get; set; }
    }
}

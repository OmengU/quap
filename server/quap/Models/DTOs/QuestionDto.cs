using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs
{
	public class QuestionDto
	{
		public Guid QuestionId { get; set; }
		public string QuestionName { get; set; }
		public int NOptions { get; set; }
		public List<OptionDto> Options { get; set; }
		public QType Type { get; set; }
		public int TimeLimit { get; set; }
		public int Points { get; set; }
		public Guid QuizId { get; set; }
	}
	public class CreateUpdateQuestionDto
	{

		[Required]
		public string QuestionName { get; set; }
		[Required]
        public QType Type { get; set; }
        [Required]
        public int TimeLimit { get; set; }
        [Required]
        public int Points { get; set; }
    }
}

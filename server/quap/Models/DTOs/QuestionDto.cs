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
}

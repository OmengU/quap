using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace quap.Models
{
	public enum QType
	{
		SingleChoice, MultipleChoice
	}
	public class Question
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public Guid QuestionId { get; set; }
		public int NOptions { get; set; } = 0;
		public List<Option> Options { get; set; } = new List<Option>();
		public QType Type { get; set;}
		public int TimeLimit { get; set; }
		public int Points { get; set; }

		public Guid QuizId { get; set; }
		public Quiz Quiz { get; set; }


	}
}

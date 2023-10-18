using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace quap.Models
{
	public class Quiz
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public Guid QuizId { get; set; }
		public string Name { get; set; }
		public string Description { get; set; }
		public int NQuestions { get; set; } = 0;
		public List<Question> Questions { get; set; } = new List<Question>();
	}
}

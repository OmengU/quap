using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace quap.Models
{
	public class Quiz
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public Guid QuizId { get; set; }
		public int NQuestions { get; set; }
		public List<Question> Questions { get; set; }
	}
}

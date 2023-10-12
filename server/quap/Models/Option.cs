using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace quap.Models
{
	public class Option
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public Guid OId { get; set; }
		public string OptionText { get; set; }
		public bool IsCorrect {  get; set; }

		public Guid QuestionId { get; set; }
		public Question Question { get; set; }
	}
}

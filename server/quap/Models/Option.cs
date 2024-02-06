using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace quap.Models
{
	public class Option
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public Guid OId { get; set; }
		public string OptionText { get; set; } = String.Empty;
		public bool IsCorrect { get; set; } = false;
        public DateTime CreationDate { get; set; } = DateTime.Now.ToUniversalTime();

        public Guid QuestionId { get; set; }
		public Question Question { get; set; }
	}
}

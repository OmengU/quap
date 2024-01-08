using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs
{
	public class OptionDto
	{
		public Guid OId { get; set; }
		public string OptionText { get; set; }

		public bool IsCorrect { get; set; }

		public Guid QuestionId { get; set; }

	}
	public class CreateUpdateOptionDto
	{
        [Required]
        public string OptionText { get; set; }

        [Required]
        public bool IsCorrect { get; set; }
    }

	public class SendOptionDto
	{
        public Guid OId { get; set; }
        public string OptionText { get; set; }
    }
}

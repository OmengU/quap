using System.ComponentModel.DataAnnotations;

namespace quap.Models.DTOs
{
	public class OptionDto
	{
		[Required]
		public string OptionText { get; set; }

		[Required]
		public bool IsCorrect { get; set; }

		[Required]
		public Guid QuestionId { get; set; }

	}
	public class CreateUpdateOptionDto
	{
        [Required]
        public string OptionText { get; set; }

        [Required]
        public bool IsCorrect { get; set; }
    }
}

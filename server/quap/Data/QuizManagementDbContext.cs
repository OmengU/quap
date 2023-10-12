using EntityFramework.Exceptions.PostgreSQL;
using Microsoft.EntityFrameworkCore;
using quap.Models;

namespace quap.Data
{
	public class QuizManagementDbContext : DbContext
	{
		public QuizManagementDbContext(DbContextOptions<QuizManagementDbContext> options) : base(options) { }
		public DbSet<Quiz> Quizzes { get; set; }
		public DbSet <Question> Questions { get; set; }
		public DbSet<Option> Options { get; set; }
		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			optionsBuilder.UseExceptionProcessor();
		}
	}
}

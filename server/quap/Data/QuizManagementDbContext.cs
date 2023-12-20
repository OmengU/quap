using EntityFramework.Exceptions.PostgreSQL;
using Microsoft.EntityFrameworkCore;
using quap.Models;
using quap.Models.GameModels;

namespace quap.Data
{
	public class QuizManagementDbContext : DbContext
	{
		public QuizManagementDbContext(DbContextOptions<QuizManagementDbContext> options) : base(options) { }
		public DbSet<Quiz> Quizzes { get; set; }
		public DbSet <Question> Questions { get; set; }
		public DbSet<Option> Options { get; set; }

		public DbSet<Player> Players { get; set; }
		public DbSet<Game> Games { get; set; }
		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			optionsBuilder.UseExceptionProcessor();
		}
        protected override void OnModelCreating(ModelBuilder builder)
		=> builder.HasPostgresEnum<QType>();
    }
}

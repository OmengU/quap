
using Microsoft.EntityFrameworkCore;
using Npgsql;
using quap.Data;
using quap.Models;
using quap.Repositories;
using quap.Repositories.IRepositories;
using System.Text.Json.Serialization;

namespace quap
{
	public class Program
	{
		public static void Main(string[] args)
		{
			var builder = WebApplication.CreateBuilder(args);

			// Add services to the container.

			builder.Services.AddControllers();
			// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
			builder.Services.AddEndpointsApiExplorer();
			builder.Services.AddSwaggerGen();
			builder.Services.AddAutoMapper(typeof(Program).Assembly);

            var dataSourceBuilder = new NpgsqlDataSourceBuilder(builder.Configuration.GetConnectionString("QuizManagementDbContextConnection"));
            dataSourceBuilder.MapEnum<QType>();
            var dataSource = dataSourceBuilder.Build();

            builder.Services.AddScoped<IQuizRepository, QuizRepository>();
            builder.Services.AddScoped<IQuestionRepository, QuestionRepository>();
            builder.Services.AddScoped<IOptionRepository, OptionRepository>();
			builder.Services.AddDbContext<QuizManagementDbContext>(options => options.UseNpgsql(dataSource));

            var app = builder.Build();

			// Configure the HTTP request pipeline.
			if (app.Environment.IsDevelopment())
			{
				app.UseSwagger();
				app.UseSwaggerUI();
			}

			app.UseHttpsRedirection();

			app.UseAuthorization();


			app.MapControllers();

			app.Run();
		}
	}
}
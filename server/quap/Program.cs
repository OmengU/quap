
using Microsoft.EntityFrameworkCore;
using Npgsql;
using quap.Data;
using quap.Hubs;
using quap.Models;
using quap.Repositories;
using quap.Repositories.GameRepositories;
using quap.Repositories.GameRepositories.IRepositories;
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
			builder.Services.AddSignalR();

            var dataSourceBuilder = new NpgsqlDataSourceBuilder(builder.Configuration.GetConnectionString("QuizManagementDbContextConnection"));
            dataSourceBuilder.MapEnum<QType>();
            var dataSource = dataSourceBuilder.Build();

            builder.Services.AddScoped<IQuizRepository, QuizRepository>();
            builder.Services.AddScoped<IQuestionRepository, QuestionRepository>();
            builder.Services.AddScoped<IOptionRepository, OptionRepository>();
			builder.Services.AddScoped<IGameRepository, GameRepository>();
			builder.Services.AddScoped<IPlayerRepository, PlayerRepository>();
            builder.Services.AddDbContext<QuizManagementDbContext>(options => options.UseNpgsql(dataSource));

            builder.Services.AddCors(options =>
            {
                options.AddPolicy("DynamicCorsPolicy", builder =>
                {
                    builder.AllowAnyHeader()
                           .AllowAnyMethod()
                           .AllowCredentials()
                           .SetIsOriginAllowed(origin => true);
                });
            });

            var app = builder.Build();

			// Configure the HTTP request pipeline.
			if (app.Environment.IsDevelopment())
			{
				app.UseSwagger();
				app.UseSwaggerUI();
			}

			app.UseHttpsRedirection();

			app.UseAuthorization();

			app.UseCors("DynamicCorsPolicy");


			app.MapControllers();
			app.MapHub<GameHub>("/Game");

			app.Run();
		}
	}
}
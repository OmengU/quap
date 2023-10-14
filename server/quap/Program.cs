
using Microsoft.EntityFrameworkCore;
using Npgsql;
using quap.Data;
using quap.Models;

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

            var dataSourceBuilder = new NpgsqlDataSourceBuilder(builder.Configuration.GetConnectionString("QuizManagementDbContextConnection"));
            dataSourceBuilder.MapEnum<QType>();
            var dataSource = dataSourceBuilder.Build();

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
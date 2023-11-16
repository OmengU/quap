using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace quap.Migrations
{
    /// <inheritdoc />
    public partial class addQuestionNameMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "QuestionName",
                table: "Questions",
                type: "text",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "QuestionName",
                table: "Questions");
        }
    }
}

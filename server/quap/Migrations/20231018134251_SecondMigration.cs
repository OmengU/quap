using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace quap.Migrations
{
    /// <inheritdoc />
    public partial class SecondMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "name",
                table: "Quizzes",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "description",
                table: "Quizzes",
                newName: "Description");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name",
                table: "Quizzes",
                newName: "name");

            migrationBuilder.RenameColumn(
                name: "Description",
                table: "Quizzes",
                newName: "description");
        }
    }
}

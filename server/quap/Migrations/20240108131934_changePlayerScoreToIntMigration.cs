using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace quap.Migrations
{
    /// <inheritdoc />
    public partial class changePlayerScoreToIntMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "Score",
                table: "Players",
                type: "integer",
                nullable: false,
                oldClrType: typeof(float),
                oldType: "real");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<float>(
                name: "Score",
                table: "Players",
                type: "real",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer");
        }
    }
}

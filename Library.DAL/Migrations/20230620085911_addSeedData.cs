using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Library.DAL.Migrations
{
    public partial class addSeedData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Students",
                columns: new[] { "ID", "CreatedDate", "FirstName", "Gender", "LastName", "ModifiedDate", "Status" },
                values: new object[,]
                {
                    { 1, new DateTime(2023, 6, 20, 11, 59, 10, 875, DateTimeKind.Local).AddTicks(612), "Alperen", 1, "Bozkurt", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 1 },
                    { 2, new DateTime(2023, 6, 20, 11, 59, 10, 875, DateTimeKind.Local).AddTicks(1333), "Yusuf", 1, "Bozkurt", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 1 },
                    { 3, new DateTime(2023, 6, 20, 11, 59, 10, 875, DateTimeKind.Local).AddTicks(1338), "Kaan", 1, "Gülla.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 1 },
                    { 4, new DateTime(2023, 6, 20, 11, 59, 10, 875, DateTimeKind.Local).AddTicks(1339), "Umut", 1, "Turhan", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 1 }
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "ID", "CreatedDate", "ModifiedDate", "Password", "Role", "Status", "UserName" },
                values: new object[,]
                {
                    { 1, new DateTime(2023, 6, 20, 11, 59, 10, 872, DateTimeKind.Local).AddTicks(7319), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "$2a$11$w9SHb1CPFa0q/YJMl2ZOfO9JAhmFPvYYu99hxmdW3ty39QnW3rshy", 1, 1, "Administrator" },
                    { 2, new DateTime(2023, 6, 20, 11, 59, 10, 874, DateTimeKind.Local).AddTicks(470), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "$2a$11$KD1lDq9I4BJK3Y2PFWsZSeFOCykkbvuMKlEtrGRGnAYVxcWsucZxm", 2, 1, "alperen" }
                });

            migrationBuilder.InsertData(
                table: "StudentDetail",
                columns: new[] { "ID", "BirthDay", "CreatedDate", "ModifiedDate", "PhoneNumber", "SchoolNumber", "Status", "StudentID" },
                values: new object[,]
                {
                    { 1, new DateTime(1997, 12, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2023, 6, 20, 11, 59, 10, 875, DateTimeKind.Local).AddTicks(1824), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "100", 1, 1 },
                    { 2, new DateTime(1992, 12, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2023, 6, 20, 11, 59, 10, 875, DateTimeKind.Local).AddTicks(2481), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "101", 1, 2 },
                    { 3, new DateTime(1990, 12, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2023, 6, 20, 11, 59, 10, 875, DateTimeKind.Local).AddTicks(2485), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "102", 1, 3 },
                    { 4, new DateTime(1999, 12, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2023, 6, 20, 11, 59, 10, 875, DateTimeKind.Local).AddTicks(2486), new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "103", 1, 4 }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "StudentDetail",
                keyColumn: "ID",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "StudentDetail",
                keyColumn: "ID",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "StudentDetail",
                keyColumn: "ID",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "StudentDetail",
                keyColumn: "ID",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "ID",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "ID",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Students",
                keyColumn: "ID",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Students",
                keyColumn: "ID",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Students",
                keyColumn: "ID",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Students",
                keyColumn: "ID",
                keyValue: 4);
        }
    }
}

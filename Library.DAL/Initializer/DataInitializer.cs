using Library.MODEL.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.DAL.Initializer
{
    public class DataInitializer
    {
        public static void Seed(ModelBuilder modelBuilder)
        {
            string password1 = BCrypt.Net.BCrypt.HashPassword("123");
            string password2 = BCrypt.Net.BCrypt.HashPassword("1234");

            modelBuilder.Entity<AppUser>().HasData(
                new AppUser
                {
                    ID = 1,
                    UserName = "Administrator",
                    Password = password1,
                    Role = MODEL.Enums.Role.admin
                },
                new AppUser
                {
                    ID = 2,
                    UserName = "alperen",
                    Password = password2,
                    Role = MODEL.Enums.Role.user
                }
                );


            modelBuilder.Entity<Student>().HasData(
                new Student() { ID = 1, FirstName = "Alperen", LastName = "Bozkurt", Gender = MODEL.Enums.Gender.Erkek },
                new Student() { ID = 2, FirstName = "Yusuf", LastName = "Bozkurt", Gender = MODEL.Enums.Gender.Erkek },
                new Student() { ID = 3, FirstName = "Kaan", LastName = "Gülla.", Gender = MODEL.Enums.Gender.Erkek },
                new Student() { ID = 4, FirstName = "Umut", LastName = "Turhan", Gender = MODEL.Enums.Gender.Erkek }
                );

            modelBuilder.Entity<StudentDetail>().HasData(
                new StudentDetail() { ID = 1, StudentID = 1, SchoolNumber = "100", BirthDay = new DateTime(1997, 12, 17) },
                new StudentDetail() { ID = 2, StudentID = 2, SchoolNumber = "101", BirthDay = new DateTime(1992, 12, 17) },
                new StudentDetail() { ID = 3, StudentID = 3, SchoolNumber = "102", BirthDay = new DateTime(1990, 12, 17) },
                new StudentDetail() { ID = 4, StudentID = 4, SchoolNumber = "103", BirthDay = new DateTime(1999, 12, 17) }
            );
        }
    }
}

using Library.BLL.RepositoryPattern.Interfaces;
using Library.DAL.Context;
using Library.MODEL.Dto;
using Library.MODEL.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.BLL.RepositoryPattern.Base
{
    public class BookRepository : Repository<Book>, IBookRepository
    {
        public BookRepository(MyDbContext db) : base(db)
        {
        }

        public List<BookDto> GetBooks()
        {
            return table.Where(b => b.Status != MODEL.Enums.DataStatus.Deleted).Include(x => x.Author).Include(x => x.BookType).Select(
                 x => new BookDto()
                 {
                     ID = x.ID,
                     BookName = x.Name,
                     PageCount = x.PageCount,
                     AuthorFullName = $"{x.Author.FirstName} {x.Author.LastName}",
                     BookTypeName = x.BookType.Name
                 }
               ).ToList();
        }
    }
}

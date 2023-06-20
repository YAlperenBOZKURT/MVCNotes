using Library.BLL.RepositoryPattern.Base;
using Library.BLL.RepositoryPattern.Interfaces;
using Library.DAL.Context;
using Library.MODEL.Dto;
using Library.MODEL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.BLL.RepositoryPattern.Concrete
{
    public class BookTypeRepository : Repository<BookType>, IBookTypeRepository
    {
        public BookTypeRepository(MyDbContext db) : base(db)
        {
        }

        public List<BookTypeDto> SelectBookTypeDto()
        {
            return table.Where(x => x.Status != MODEL.Enums.DataStatus.Deleted).Select(x =>
           new BookTypeDto()
           {
               ID = x.ID,
               Name = x.Name,
           }
           ).ToList();
        }
    }
}

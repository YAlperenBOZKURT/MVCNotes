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
    public class AuthorRepository : Repository<Author>, IAuthorRepository
    {
        public AuthorRepository(MyDbContext db) : base(db)
        {
        }

        public List<AuthorDto> SelectAuthorDto()
        {
            return table.Where(x => x.Status != MODEL.Enums.DataStatus.Deleted).Select(x =>
             new AuthorDto()
             {
                 ID = x.ID,
                 FirstName = x.FirstName,
                 LastName = x.LastName
             }
             ).ToList();
        }
    }
}

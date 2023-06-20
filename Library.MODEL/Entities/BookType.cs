using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MODEL.Entities
{
    public class BookType : BaseEntity
    {
        public string Name { get; set; }

        // Relational Propery
        public virtual List<Book> Books { get; set; }
    }
}

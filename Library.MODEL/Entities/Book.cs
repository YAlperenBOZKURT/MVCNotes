using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MODEL.Entities
{
    public class Book : BaseEntity
    {
        public string Name { get; set; }
        public string PageCount { get; set; }
        public int AuthorID { get; set; }
        public int BookTypeID { get; set; }

        // Relational Propery
        public virtual Author Author { get; set; }
        public virtual BookType BookType { get; set; }
        public virtual List<Operation> Operations { get; set; }

    }
}

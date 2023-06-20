using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MODEL.Dto
{
    public class BookDto
    {
        public int ID { get; set; }
        public string BookName { get; set; }
        public string PageCount { get; set; }
        public string AuthorFullName { get; set; }
        public string BookTypeName { get; set; }
    }
}

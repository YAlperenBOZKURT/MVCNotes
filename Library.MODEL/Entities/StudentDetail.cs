using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MODEL.Entities
{
    public class StudentDetail : BaseEntity
    {
        public DateTime BirthDay { get; set; }
        public string PhoneNumber { get; set; }
        public string SchoolNumber { get; set; }
        public int StudentID { get; set; }

        // Relational Propery

        public virtual Student Student { get; set; }
    }
}

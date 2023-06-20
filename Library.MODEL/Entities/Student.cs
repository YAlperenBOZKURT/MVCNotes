using Library.MODEL.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MODEL.Entities
{
    public class Student : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Gender Gender { get; set; }


        // Relational Propery
        public virtual List<Operation> Operations { get; set; }
        public virtual StudentDetail StudentDetail { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MODEL.Entities
{
    public class Operation : BaseEntity
    {
        public int StudentID { get; set; }
        public int BookID { get; set; }

        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        // Relational Propery
        public virtual Student Student { get; set; }
        public virtual Book Book { get; set; }
    }
}

using Library.MODEL.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MAP.Configurations
{
    public class OperationConfiguration : IEntityTypeConfiguration<Operation>
    {
        public void Configure(EntityTypeBuilder<Operation> builder)
        {
            builder.Ignore(x => x.ID); 
            builder.HasKey(x => new { x.StudentID, x.BookID }); 
            builder.ToTable("Operasyonlar"); 
            builder.Property(x => x.StartDate).HasColumnType("datetime"); 
            builder.HasOne(s => s.Student).WithMany(o => o.Operations).HasForeignKey(o => o.StudentID); 
            builder.HasOne(b => b.Book).WithMany(o => o.Operations).HasForeignKey(o => o.BookID); 
        }
    }
}

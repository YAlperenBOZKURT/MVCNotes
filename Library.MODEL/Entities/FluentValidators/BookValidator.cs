using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MODEL.Entities.FluentValidators
{
    public class BookValidator : AbstractValidator<Book>
    {
        public BookValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Please Fill").MaximumLength(15).WithMessage("Max 15 Char");

            When(x => x.Name == "Deneme", () =>
            {
                RuleFor(x => x.PageCount).Must(y => y == "50").WithMessage("if name is deneme, page count must be 50");
            });

            RuleFor(x => x.PageCount).Must(y => int.TryParse(y, out int value) && value > 50).WithMessage("Please enter numbers!");
        }
    }
}

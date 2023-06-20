using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.MODEL.Entities.FluentValidators
{
    public class AuthorValidator : AbstractValidator<Author>
    {
        public AuthorValidator()
        {
            RuleFor(x => x.FirstName).NotEmpty().NotNull().WithMessage("Please Fill").MaximumLength(15).WithMessage("Max 15 char");
        }
    }
}

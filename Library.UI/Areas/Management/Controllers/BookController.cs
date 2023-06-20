using Library.BLL.RepositoryPattern.Interfaces;
using Library.DAL.Context;
using Library.MODEL.Dto;
using Library.MODEL.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Library.UI.Areas.Management.Controllers
{
    [Area("Management")]
    [Authorize(Policy = "AdminPolicy")]
    public class BookController : Controller
    {
        IBookRepository _bookRepository;
        IAuthorRepository _authorRepository;
        IBookTypeRepository _bookTypeRepository;
        public BookController(IBookRepository repoBook, IAuthorRepository repoAuthor, IBookTypeRepository bookTypeRepository)
        {
            _bookRepository = repoBook;
            _authorRepository = repoAuthor;
            _bookTypeRepository = bookTypeRepository;
        }
        public IActionResult BookList()
        {
            List<BookDto> books = _bookRepository.GetBooks();
            return View(books);
        }

        public IActionResult Create()
        {

            List<AuthorDto> authors = _authorRepository.SelectAuthorDto();
            List<BookTypeDto> bookTypes = _bookTypeRepository.SelectBookTypeDto();
            return View((new Book(), authors, bookTypes));
        }



        [HttpPost]
        public IActionResult Create([Bind(Prefix = "Item1")] Book book)
        {

            if (!ModelState.IsValid)
            {
                List<AuthorDto> authors = _authorRepository.SelectAuthorDto();
                List<BookTypeDto> bookTypes = _bookTypeRepository.SelectBookTypeDto();
                return View((book, authors, bookTypes));
            }
            _bookRepository.Add(book);
            return RedirectToAction("BookList", "Book", new { area = "Management" });
        }

        public IActionResult delete(int ID)
        {
            _bookRepository.Delete(ID);
            return RedirectToAction("BookList", "Book", new { area = "Management" });
        }

        public IActionResult Edit(int ID)
        {

            Book book = _bookRepository.GetById(ID);
            List<AuthorDto> authors = _authorRepository.SelectAuthorDto();
            List<BookTypeDto> bookTypes = _bookTypeRepository.SelectBookTypeDto();

            return View((book, authors, bookTypes));
        }



        [HttpPost]
        public IActionResult Edit([Bind(Prefix = "Item1")] Book book)
        {

            _bookRepository.Update(book);
            return RedirectToAction("BookList", "Book", new { area = "Management" });
        }
    }
}

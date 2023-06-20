using Library.BLL.RepositoryPattern.Interfaces;
using Library.MODEL.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Library.UI.Areas.Management.Controllers
{
    [Area("Management")]
    [Authorize(Policy = "AdminPolicy")]
    public class AuthorController : Controller
    {


        IAuthorRepository _repository;
        public AuthorController(IAuthorRepository RepoAuthor)
        {

            _repository = RepoAuthor;
        }

        public IActionResult AuthorList()
        {

            List<Author> authors = _repository.GetActives();
            return View(authors);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Author author)
        {

            if (!ModelState.IsValid)
            {
                return View(author);
            }
            _repository.Add(author);
            return RedirectToAction("AuthorList", "Author", new { area = "Management" });
        }


        public IActionResult Edit(int ID)
        {
            Author author = _repository.GetById(ID);
            return View(author);
        }

        [HttpPost]
        public IActionResult Edit(Author author)
        {

            _repository.Update(author);
            return RedirectToAction("AuthorList", "Author", new { area = "Management" });
        }

        public IActionResult Delete(int ID) 
        {

            _repository.Delete(ID);
            return RedirectToAction("AuthorList", "Author", new { area = "Management" });
        }
    }
}


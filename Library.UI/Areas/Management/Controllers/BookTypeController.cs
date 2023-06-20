using Library.BLL.RepositoryPattern.Interfaces;
using Library.DAL.Context;
using Library.MODEL.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Library.UI.Areas.Management.Controllers
{
    [Area("Management")]
    [Authorize(Policy = "AdminPolicy")]
    public class BookTypeController : Controller
    {

        IBookTypeRepository _repository;
        public BookTypeController(IBookTypeRepository repoBookType)
        {

            _repository = repoBookType;
        }
        public IActionResult BookTypeList()
        {
            List<BookType> bookTypes = _repository.GetAll();
            return View(bookTypes);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(BookType bookType)
        {

            if (!ModelState.IsValid)
            {
                return View(bookType);
            }
            _repository.Add(bookType);
            return RedirectToAction("BookTypeList", "BookType", new { area = "Management" });

        }

        public IActionResult Edit(int ID)
        {

            BookType bookType = _repository.GetById(ID);
            return View(bookType);
        }

        [HttpPost]
        public IActionResult Edit(BookType bookType)
        {

            _repository.Update(bookType);
            return RedirectToAction("BookTypeList", "BookType", new { area = "Management" });
        }

        public IActionResult HardDelete(int ID)
        {

            _repository.SpecialDelete(ID);
            return RedirectToAction("BookTypeList", "BookType", new { area = "Management" });
        }
    }
}
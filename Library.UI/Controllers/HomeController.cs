using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Library.UI.Controllers
{
    public class HomeController : Controller
    {
        [Authorize(Policy = "UserPolicy")]
        public IActionResult Index()
        {
            return View();
        }
    }
}

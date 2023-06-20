using Library.BLL.RepositoryPattern.Interfaces;
using Library.MODEL.Entities;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using System;

namespace Library.UI.Controllers
{
    public class AuthController : Controller
    {

        IRepository<AppUser> _repoUser;
        public AuthController(IRepository<AppUser> repoUser)
        {

            _repoUser = repoUser;
        }
        public IActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Login(AppUser user)
        {
            if (_repoUser.Any(x => x.UserName == user.UserName && x.Status != MODEL.Enums.DataStatus.Deleted))
            {
                AppUser selectedUser = _repoUser.Default(x => x.UserName == user.UserName && x.Status != MODEL.Enums.DataStatus.Deleted);
                bool isValid = BCrypt.Net.BCrypt.Verify(user.Password, selectedUser.Password);
                if (isValid)
                {
                    List<Claim> claims = new List<Claim>()
                    {
                        new Claim("userName", selectedUser.UserName),
                        new Claim("userId", selectedUser.ID.ToString()),
                        new Claim("role", selectedUser.Role.ToString())
                    };

                    ClaimsIdentity identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                    await HttpContext.SignInAsync(principal);
                    if (selectedUser.Role == MODEL.Enums.Role.admin)
                    {
                        return RedirectToAction("Index", "Home", new { area = "Management" });
                    }
                    else if (selectedUser.Role == MODEL.Enums.Role.user)
                    {
                        return RedirectToAction("Index", "Home", null);
                    }
                }
            }
            return View();
        }

        public async Task<IActionResult> LogOut()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Login");
        }
    }
}

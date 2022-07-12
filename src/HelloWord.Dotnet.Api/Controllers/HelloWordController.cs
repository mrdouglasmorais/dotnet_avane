using System;
using Microsoft.AspNetCore.Mvc;

namespace HelloWord.Dotnet.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HelloWordController: ControllerBase
    {
        [HttpGet]
        public ActionResult Index() => Ok(String.Format("Hellow Word! Now is {0}", DateTime.Now.ToString()));
    }
}
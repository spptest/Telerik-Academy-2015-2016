using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LikesDemos.Startup))]
namespace LikesDemos
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

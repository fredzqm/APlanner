using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(APlanner.Startup))]
namespace APlanner
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

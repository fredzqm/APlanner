using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Data.Entity;
using Microsoft.Data.Entity.Metadata;
using Microsoft.Framework.OptionsModel;

namespace APlanner.Models
{
    // Add profile data for application users by adding properties to the APlannerUser class
    public class APlannerUser : IdentityUser
    {

    }

    public class APlannerDbContext : IdentityDbContext<APlannerUser>
    {

        public DbSet<People> people { get; set; }
        public DbSet<SPlan> plans { get; set; }


        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            // Customize the ASP.NET Identity model and override the defaults if needed.
            // For example, you can rename the ASP.NET Identity table names and more.
            // Add your customizations after calling base.OnModelCreating(builder);
        }
    }
}

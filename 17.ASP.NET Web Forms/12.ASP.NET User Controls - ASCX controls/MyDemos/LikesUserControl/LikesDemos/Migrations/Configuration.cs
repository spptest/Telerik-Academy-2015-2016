namespace LikesDemos.Migrations
{
    using Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<LikesDemos.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(LikesDemos.Models.ApplicationDbContext context)
        {
            if (context.Posts.Any())
            {
                return;
            }

            Post post1 = new Post() { Title = "My first post", Text = "Lorem lorem lorem" };
            Post post2 = new Post() { Title = "Second post", Text = "2 Loremcho" };

            context.Posts.Add(post1);
            context.Posts.Add(post2);
            context.SaveChanges();

            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
        }
    }
}

using LikesDemos.Models;

namespace LikesDemos
{
    public class BasePage : System.Web.UI.Page
    {
        public ApplicationDbContext dbContext { get; set; }

        public BasePage()
        {
            this.dbContext = new ApplicationDbContext();
        }
    }
}
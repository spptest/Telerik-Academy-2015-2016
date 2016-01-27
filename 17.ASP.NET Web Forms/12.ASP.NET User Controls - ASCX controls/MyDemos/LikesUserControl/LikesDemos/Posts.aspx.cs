using LikesDemos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace LikesDemos
{
    public partial class Posts : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable ListView1_GetData()
        {
            return this.dbContext.Posts;
        }

        protected int GetLikesCount(Post post)
        {
            int likes = post.Likes.Count(p => p.Value == true);
            int hates = post.Likes.Count(p => p.Value == false);
            return likes - hates;
        }

        protected int GetCurrentUserVote(Post post)
        {
            string userId = this.User.Identity.GetUserId();
            Like like = this.dbContext.Likes.FirstOrDefault(l => l.PostID == post.PostID && l.UserID == userId);
            if (like != null)
            {
                if (like.Value)
                {
                    return 1;
                }
                else
                {
                    return -1;
                }
            } 
            else
            {
                return 0;
            }
        }

        protected void LikesUserControl_Like(object sender, LikeEventArgs e)
        {
            Post post = this.dbContext.Posts.Find(e.DataID);
            string userId = this.User.Identity.GetUserId();

            Like like = this.dbContext.Likes.FirstOrDefault(l => l.UserID == userId && l.PostID == post.PostID);
            if (like == null)
            {
                like = new Like()
                {
                    UserID = userId,
                    Post = post
                };

                post.Likes.Add(like);
            }

            like.Value = e.LikeValue;
            this.dbContext.SaveChanges();

            this.DataBind();
        }
    }
}
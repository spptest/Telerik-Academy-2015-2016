using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LikesDemos.Models
{
    public class Post
    {
        public Post()
        {
            this.Likes = new HashSet<Like>();
        }

        public int PostID { get; set; }

        public string Title { get; set; }

        public string Text { get; set; }

        public virtual ICollection<Like> Likes { get; set; }

    }
}
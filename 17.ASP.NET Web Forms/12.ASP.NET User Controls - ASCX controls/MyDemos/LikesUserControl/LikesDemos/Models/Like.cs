using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LikesDemos.Models
{
    public class Like
    {
        public int LikeID { get; set; }

        public bool Value { get; set; }

        public string UserID { get; set; }

        public virtual ApplicationUser User { get; set; }

        public int PostID { get; set; }

        public virtual Post Post { get; set; }
    }
}
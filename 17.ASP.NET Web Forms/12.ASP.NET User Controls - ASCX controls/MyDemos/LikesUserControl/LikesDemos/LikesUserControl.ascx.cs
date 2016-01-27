using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LikesDemos
{
    public class LikeEventArgs : EventArgs
    {
        public bool LikeValue { get; set; }

        public int DataID { get; set; }

        public LikeEventArgs(bool likeValue, int dataID)
        {
            this.LikeValue = likeValue;
            this.DataID = dataID;
        }
    }

    public partial class LikesUserControl : System.Web.UI.UserControl
    {
        public delegate void LikeEventHadler(object sender, LikeEventArgs e);

        public event LikeEventHadler Like;

        public int LikesCount { get; set; }

        public int DataID { get; set; }

        public int CurretUserVote { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.LabelLikesCount.Text = this.LikesCount.ToString();

            // Disable Like/Hate Button
            if (this.CurretUserVote == 1)
            {
                this.ButtonLike.Visible = false;
            } 
            else if (this.CurretUserVote == -1)
            {
                this.ButtonHate.Visible = false;
            }
        }

        protected void ButtonLike_Command(object sender, CommandEventArgs e)
        {
            bool likeValue = e.CommandName == "like" ? true : false;
            int dataID = int.Parse(e.CommandArgument.ToString());
            this.Like(this, new LikeEventArgs(likeValue, dataID));
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task2
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var idQueryString = this.Request.QueryString["id"];

            if (idQueryString != null)
            {
                Server.Transfer("EmployeeDetails.aspx", true);
            }
        }
    }
}
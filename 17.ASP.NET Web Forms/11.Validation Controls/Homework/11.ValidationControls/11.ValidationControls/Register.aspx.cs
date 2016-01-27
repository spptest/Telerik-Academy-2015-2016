using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _11.ValidationControls
{
    public partial class Register : System.Web.UI.Page
    {
        private List<string> maleOptions = new List<string> { "BMW", "Toyota" };
        private List<string> femaleOptions = new List<string> { "Lavazza", "New Brazil" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                DropDownList dropDownList = new DropDownList();

                var selectedGenderValue = this.CheckBoxListGender.SelectedValue;
                List<string> options;
                if (selectedGenderValue == "m")
                {
                    options = this.maleOptions;
                }
                else
                {
                    options = this.femaleOptions;
                }

                foreach (var option in options)
                {
                    dropDownList.Items.Add(new ListItem(option));
                }

                this.PlaceHolderGenderOptions.Controls.Add(dropDownList);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.Page.Validate("LogonInfo");
            this.Page.Validate("PersonalInfo");
            this.Page.Validate("AddressInfo");

            if (!this.CheckBoxAccept.Checked)
            {
                var val = new CustomValidator()
                {
                    ErrorMessage = "Please agree to our terms.",
                    Display = ValidatorDisplay.None,
                    IsValid = false,
                    ValidationGroup = "LogonInfo"
                };
                this.Page.Validators.Add(val);
            }
        }

        //public void CheckCheckBox(object sender, ServerValidateEventArgs e)
        //{
        //    var checkBox = sender as CheckBox;
        //    if (checkBox.Checked)
        //    {
        //        e.IsValid = true;
        //    }
        //    else
        //    {
        //        e.IsValid = false;
        //    }
        //}
    }
}
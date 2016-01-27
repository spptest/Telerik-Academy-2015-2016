<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="_11.ValidationControls.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="LabelUsername" runat="server" Text="Username:"></asp:Label> <br />
        <asp:TextBox ID="TextBoxUsername" runat="server" ValidationGroup="LogonInfo"></asp:TextBox> <br />
        <asp:Label ID="LabelPassword" runat="server" Text="Password:"></asp:Label> <br />
        <asp:TextBox ID="TextBoxPassword" runat="server" ValidationGroup="LogonInfo"></asp:TextBox> <br />
        <asp:Label ID="LabelRepeatPassword" runat="server" Text="Repeat password"></asp:Label> <br />
        <asp:TextBox ID="TextBoxRepeatPassword" runat="server" ValidationGroup="LogonInfo"></asp:TextBox> <br />

        <asp:Label ID="LabelFirstName" runat="server" Text="Frist name:"></asp:Label> <br />
        <asp:TextBox ID="TextBoxFirstName" runat="server" ValidationGroup="PersonalInfo"></asp:TextBox> <br />
        <asp:Label ID="LabelLastName" runat="server" Text="Last name:"></asp:Label> <br />
        <asp:TextBox ID="TextBoxLastName" runat="server" ValidationGroup="PersonalInfo"></asp:TextBox> <br />
        <asp:Label ID="LabelAge" runat="server" Text="Age:"></asp:Label> <br />
        <asp:TextBox ID="TextBoxAge" runat="server" type="number" ValidationGroup="PersonalInfo"></asp:TextBox> <br />
        <asp:Label ID="LabelEmail" runat="server" Text="Email:"></asp:Label> <br />
        <asp:TextBox ID="TextBoxEmail" runat="server" ValidationGroup="PersonalInfo"></asp:TextBox> <br />

        <asp:Label ID="LabelAddress" runat="server" Text="Local address:"></asp:Label> <br />
        <asp:TextBox ID="TextBoxAddress" runat="server" ValidationGroup="AddressInfo"></asp:TextBox> <br />
        <asp:Label ID="LabelPhone" runat="server" Text="Phone:"></asp:Label> <br />
        <asp:TextBox ID="TextBoxPhone" runat="server" ValidationGroup="AddressInfo"></asp:TextBox> <br /> 

        <asp:CheckBoxList ID="CheckBoxListGender" runat="server" AutoPostBack="true" RepeatDirection="Horizontal">
            <asp:ListItem Value="m">Male</asp:ListItem>
            <asp:ListItem Value="f">Female</asp:ListItem>
        </asp:CheckBoxList> <br /> 

        <asp:PlaceHolder ID="PlaceHolderGenderOptions" runat="server"></asp:PlaceHolder> <br />

        <asp:CheckBox ID="CheckBoxAccept" runat="server" Text="Accept Terms" />
        <asp:Label ID="LabelAccept" runat="server" Text="I accept"></asp:Label> <br />

        <asp:Button ID="Button1" runat="server" Text="Sumibt" OnClick="Button1_Click" />

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="LogonInfo" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Username is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="LogonInfo" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="LogonInfo" runat="server" ControlToValidate="TextBoxRepeatPassword" ErrorMessage="Confirm password is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="PersonalInfo" runat="server" ControlToValidate="TextBoxFirstName" ErrorMessage="Firstname is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="PersonalInfo" runat="server" ControlToValidate="TextBoxLastName" ErrorMessage="Lastname is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="PersonalInfo" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="AddressInfo" runat="server" ControlToValidate="TextBoxAddress" ErrorMessage="Addredd is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="AddressInfo" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="Phone is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="PersonalInfo" runat="server" ControlToValidate="TextBoxAge" ErrorMessage="Age is required" ForeColor="Red" Display="None" EnableClientScript="false"></asp:RequiredFieldValidator>

        <asp:CompareValidator ID="CompareValidator1" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxRepeatPassword" runat="server" ValidationGroup="LogonInfo" ErrorMessage="Passwords does not match" Text="*" Display="None" EnableClientScript="false"></asp:CompareValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ValidationGroup="PersonalInfo" ControlToValidate="TextBoxAge" ErrorMessage="Age should be bigger than 18 and smaller than 81" Text="*" Display="None" EnableClientScript="false" MinimumValue="18" MaximumValue="81"></asp:RangeValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="PersonalInfo" ControlToValidate="TextBoxEmail" runat="server" ErrorMessage="Invalid Email address" Text="*" Display="None" EnableClientScript="false" ValidationExpression="^[-!#$%&'*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&'*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9])*(\.[a-zA-Z](-?[a-zA-Z0-9])*)+$"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="AddressInfo" ControlToValidate="TextBoxPhone" runat="server" ErrorMessage="Invalid phone number" Text="*" Display="None" EnableClientScript="false" ValidationExpression="^08[789]\d{7}$"></asp:RegularExpressionValidator>
        
        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" ValidationGroup="LogonInfo" />
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" ValidationGroup="PersonalInfo" />
        <asp:ValidationSummary ID="ValidationSummary3" ForeColor="Red" runat="server" ValidationGroup="AddressInfo" />
    </div>
    </form>
</body>
</html>

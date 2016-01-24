<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="Task2.EmployeeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" >
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>

            <ItemTemplate>
                <ul>
                    <li><%# Eval("Title") %></li>
                    <li><%# Eval("LastName") %></li>
                    <li><%# Eval("FirstName") %></li>
                    <li><%# Eval("Address") %></li>
                </ul>
            </ItemTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT * FROM [Employees] e WHERE e.EmployeeID = @employeeId">
        </asp:SqlDataSource>

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Employees.aspx">Back to employees list</asp:HyperLink>
    </div>
    </form>
</body>
</html>

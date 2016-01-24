<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Task2.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ListView ID="ListView1" runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="EmployeeID" 
            DataSourceID="SqlDataSourceNorthwindEmployees">
            
            <LayoutTemplate>
                <ul>
                    <span runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>

            <ItemTemplate>
                <li>
                    <a href="?id=<%# Eval("EmployeeID") %>"><%# Eval("FirstName") %> <%# Eval("LastName") %></a>
                </li>
            </ItemTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSourceNorthwindEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName] FROM [Employees]"></asp:SqlDataSource>

    </div>
    </form>
</body>
</html>

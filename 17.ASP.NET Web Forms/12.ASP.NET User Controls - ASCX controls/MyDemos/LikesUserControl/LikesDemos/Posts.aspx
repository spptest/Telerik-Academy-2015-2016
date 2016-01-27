<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Posts.aspx.cs" Inherits="LikesDemos.Posts" %>

<%@ Register Src="~/LikesUserControl.ascx" TagPrefix="uc" TagName="LikesUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Posts</h1>
    <hr />

    <asp:ListView ID="ListView1" runat="server"
        SelectMethod="ListView1_GetData"
        ItemType="LikesDemos.Models.Post"
        >
        <ItemTemplate>
            <div>
                <h2><%# Item.Title %></h2>
                <p><%# Item.Text %></p>
                <uc:LikesUserControl runat="server" id="LikesUserControl"
                    LikesCount=<%# this.GetLikesCount(Item) %>
                    DataID="<%# Item.PostID %>"
                    OnLike="LikesUserControl_Like"
                    CurretUserVote="<%# this.GetCurrentUserVote(Item) %>"
                     />
            </div>
        </ItemTemplate>
    </asp:ListView>

</asp:Content>

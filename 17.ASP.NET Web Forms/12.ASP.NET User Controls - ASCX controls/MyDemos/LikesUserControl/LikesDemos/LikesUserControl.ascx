<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LikesUserControl.ascx.cs" Inherits="LikesDemos.LikesUserControl" %>

<asp:Button ID="ButtonLike" runat="server" Text="Like" CommandName="like" CommandArgument="<%# this.DataID %>" OnCommand="ButtonLike_Command" />
<asp:Label ID="LabelLikesCount" runat="server"></asp:Label>
<asp:Button ID="ButtonHate" runat="server" Text="Hate" CommandName="hate" CommandArgument="<%# this.DataID %>" OnCommand="ButtonLike_Command" />
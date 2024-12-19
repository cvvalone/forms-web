<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="FIRSTWEB.userlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="card">
            <div class="card-body">
                <div class="card-title">
                    <div class="card-img">
                        <img src="img/user.png" />
                    </div>
                    <div class="signup-title">
                        <h3>Member Login</h3>
                    </div>
                    <div class="signup-title-info">
                        <h4>Login to your account by filling the form below.</h4>
                    </div>
                    <div class="separator">
                        <hr />
                    </div>
                </div>
                <div class="form-item">
                    <label class="form-label">Member ID</label>
                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                </div>
                <div class="form-item">
                    <label class="form-label">Password</label>
                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-button">
                    <asp:Button ID="Button1" class="login-button" runat="server" Text="Log in" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" class="signup-button" runat="server" Text="Sign up" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

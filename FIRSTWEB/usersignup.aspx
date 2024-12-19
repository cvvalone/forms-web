<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="FIRSTWEB.usersignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/signup.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-title">
                <div class="card-img">
                    <img src="img/usersignup.png" />
                </div>
                <div class="signup-title">
                    <h3>User Registration</h3>
                </div>
                <div class="signup-title-info">
                    <h4>Create account by filling the form below.</h4>
                </div>
                <div class="separator">
                    <hr />
                </div>
            </div>
            <div class="card-body">
                <div class="two-card-form">

                    <div class="form-item">
                        <label class="form-label">Full Name</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                    </div>

                    <div class="form-item">
                        <label class="form-label">Date of Birth</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                    </div>

                </div>

                <div class="two-card-form">

                    <div class="form-item">
                        <label class="form-label">Contact No</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No"></asp:TextBox>
                    </div>

                    <div class="form-item">
                        <label class="form-label">Email ID</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                    </div>

                </div>

                <div class="three-card-form">
                    <div class="form-item">
                        <label class="form-label">State</label>
                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Select" Value="select"></asp:ListItem>
                            <asp:ListItem Text="Albania" Value="Albania"></asp:ListItem>
                            <asp:ListItem Text="Andorra" Value="Andorra"></asp:ListItem>
                            <asp:ListItem Text="Armenia" Value="Armenia"></asp:ListItem>
                            <asp:ListItem Text="Austria" Value="Austria"></asp:ListItem>
                            <asp:ListItem Text="Azerbaijan" Value="Azerbaijan"></asp:ListItem>
                            <asp:ListItem Text="Belarus" Value="Belarus"></asp:ListItem>
                            <asp:ListItem Text="Belgium" Value="Belgium"></asp:ListItem>
                            <asp:ListItem Text="Bosnia and Herzegovina" Value="Bosnia and Herzegovina"></asp:ListItem>
                            <asp:ListItem Text="Bulgaria" Value="Bulgaria"></asp:ListItem>
                            <asp:ListItem Text="Croatia" Value="Croatia"></asp:ListItem>
                            <asp:ListItem Text="Cyprus" Value="Cyprus"></asp:ListItem>
                            <asp:ListItem Text="Czech Republic" Value="Czech Republic"></asp:ListItem>
                            <asp:ListItem Text="Denmark" Value="Denmark"></asp:ListItem>
                            <asp:ListItem Text="Estonia" Value="Estonia"></asp:ListItem>
                            <asp:ListItem Text="Finland" Value="Finland"></asp:ListItem>
                            <asp:ListItem Text="France" Value="France"></asp:ListItem>
                            <asp:ListItem Text="Georgia" Value="Georgia"></asp:ListItem>
                            <asp:ListItem Text="Germany" Value="Germany"></asp:ListItem>
                            <asp:ListItem Text="Greece" Value="Greece"></asp:ListItem>
                            <asp:ListItem Text="Hungary" Value="Hungary"></asp:ListItem>
                            <asp:ListItem Text="Iceland" Value="Iceland"></asp:ListItem>
                            <asp:ListItem Text="Ireland" Value="Ireland"></asp:ListItem>
                            <asp:ListItem Text="Italy" Value="Italy"></asp:ListItem>
                            <asp:ListItem Text="Kazakhstan" Value="Kazakhstan"></asp:ListItem>
                            <asp:ListItem Text="Kosovo" Value="Kosovo"></asp:ListItem>
                            <asp:ListItem Text="Latvia" Value="Latvia"></asp:ListItem>
                            <asp:ListItem Text="Liechtenstein" Value="Liechtenstein"></asp:ListItem>
                            <asp:ListItem Text="Lithuania" Value="Lithuania"></asp:ListItem>
                            <asp:ListItem Text="Luxembourg" Value="Luxembourg"></asp:ListItem>
                            <asp:ListItem Text="Malta" Value="Malta"></asp:ListItem>
                            <asp:ListItem Text="Moldova" Value="Moldova"></asp:ListItem>
                            <asp:ListItem Text="Monaco" Value="Monaco"></asp:ListItem>
                            <asp:ListItem Text="Montenegro" Value="Montenegro"></asp:ListItem>
                            <asp:ListItem Text="Netherlands" Value="Netherlands"></asp:ListItem>
                            <asp:ListItem Text="North Macedonia" Value="North Macedonia"></asp:ListItem>
                            <asp:ListItem Text="Norway" Value="Norway"></asp:ListItem>
                            <asp:ListItem Text="Poland" Value="Poland"></asp:ListItem>
                            <asp:ListItem Text="Portugal" Value="Portugal"></asp:ListItem>
                            <asp:ListItem Text="Romania" Value="Romania"></asp:ListItem>
                            <asp:ListItem Text="San Marino" Value="San Marino"></asp:ListItem>
                            <asp:ListItem Text="Serbia" Value="Serbia"></asp:ListItem>
                            <asp:ListItem Text="Slovakia" Value="Slovakia"></asp:ListItem>
                            <asp:ListItem Text="Slovenia" Value="Slovenia"></asp:ListItem>
                            <asp:ListItem Text="Spain" Value="Spain"></asp:ListItem>
                            <asp:ListItem Text="Sweden" Value="Sweden"></asp:ListItem>
                            <asp:ListItem Text="Switzerland" Value="Switzerland"></asp:ListItem>
                            <asp:ListItem Text="Turkey" Value="Turkey"></asp:ListItem>
                            <asp:ListItem Text="Ukraine" Value="Ukraine"></asp:ListItem>
                            <asp:ListItem Text="United Kingdom" Value="United Kingdom"></asp:ListItem>
                            <asp:ListItem Text="Vatican City" Value="Vatican City"></asp:ListItem>

                        </asp:DropDownList>
                    </div>

                    <div class="form-item">
                        <label class="form-label">City</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="City"></asp:TextBox>
                    </div>

                    <div class="form-item">
                        <label class="form-label">Pin Code</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

                <div class="one-card-form">
                    <div class="form-item">
                        <label class="form-label">Full Adress</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Email ID" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                </div>

                <div class="form-badge">
                    <span class="badge">Account Credentials</span>
                </div>

                <div class="two-card-form">
                    <div class="form-item">
                        <label class="form-label">User ID</label>
                        <div class="mb-3">
                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="User ID"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-item">
                        <label class="form-label">Password</label>
                        <div class="mb-3">
                            <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-button">
                    <asp:Button ID="Button1" class="button" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                </div>

            </div>
        </div>
        <a href="homepage.aspx"><< Back to Home</a><br>
        <br />
    </div>
</asp:Content>

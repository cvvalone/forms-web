<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanager.aspx.cs" Inherits="FIRSTWEB.adminmembermanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/membermanagment.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="left-part">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <div class="card-img">
                            <img src="img/user.png" />
                        </div>
                        <div class="profile-title">
                            <h3>Member Details</h3>
                        </div>
                        <div class="profile-title-info">
                            <h4>You can manipulate members by filling their id and press Go.</h4>
                        </div>
                        <div class="separator">
                            <hr />
                        </div>
                    </div>

                    <div class="manipulations-card-form">

                        <div class="form-item">
                            <label class="form-label">Member ID</label>
                            <div class="input-group">
                                <div class="textbox">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                                <div class="go-button">
                                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Go" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Full Name</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Account Status</label>
                            <div class="status-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="true"></asp:TextBox>
                                <div class="status-buttons">
                                    <asp:LinkButton class="succsess" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><svg fill="#000000" width="800px" height="800px" viewBox="0 0 96 96" xmlns="http://www.w3.org/2000/svg"><title/><g><path d="M58.3945,32.1563,42.9961,50.625l-5.3906-6.4629a5.995,5.995,0,1,0-9.211,7.6758l9.9961,12a5.9914,5.9914,0,0,0,9.211.0059l20.0039-24a5.9988,5.9988,0,1,0-9.211-7.6875Z"/>
<path d="M48,0A48,48,0,1,0,96,48,48.0512,48.0512,0,0,0,48,0Zm0,84A36,36,0,1,1,84,48,36.0393,36.0393,0,0,1,48,84Z"/>
</g>
</svg></asp:LinkButton>
                                    <asp:LinkButton class="warning" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><svg fill="#000000" width="800px" height="800px" viewBox="0 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg">
<title>pause</title>
<path d="M5.92 24.096q0 0.832 0.576 1.408t1.44 0.608h4.032q0.832 0 1.44-0.608t0.576-1.408v-16.16q0-0.832-0.576-1.44t-1.44-0.576h-4.032q-0.832 0-1.44 0.576t-0.576 1.44v16.16zM18.016 24.096q0 0.832 0.608 1.408t1.408 0.608h4.032q0.832 0 1.44-0.608t0.576-1.408v-16.16q0-0.832-0.576-1.44t-1.44-0.576h-4.032q-0.832 0-1.408 0.576t-0.608 1.44v16.16z"></path>
</svg></asp:LinkButton>
                                    <asp:LinkButton class="danger" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><svg width="800px" height="800px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <title>Close-Circle</title>
    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <g id="Close-Circle">
            <rect id="Rectangle" fill-rule="nonzero" x="0" y="0" width="24" height="24">

</rect>
            <circle id="Oval" stroke="#0C0310" stroke-width="2" stroke-linecap="round" cx="12" cy="12" r="9">

</circle>
            <line x1="14.1213" y1="9.87866" x2="9.8787" y2="14.1213" id="Path" stroke="#0C0310" stroke-width="2" stroke-linecap="round">

</line>
            <line x1="9.87866" y1="9.87866" x2="14.1213" y2="14.1213" id="Path" stroke="#0C0310" stroke-width="2" stroke-linecap="round">

</line>
        </g>
    </g>
</svg></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mane-card-form">

                        <div class="form-item">
                            <label class="form-label">DOB</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="DOB" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Contact No</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact No" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Email ID</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Email ID" TextMode="Email" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="three-card-form">
                        <div class="form-item">
                            <label class="form-label">State</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="State" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">City</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Pin Code</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Pin Code" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="one-card-form">
                        <div class="form-item">
                            <label class="form-label">Full Postal Adress</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Full Postal Adress" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-button">
                        <div class="danger">
                            <asp:Button ID="Button2" class="button" runat="server" Text="Delete User Permamently" OnClick="Button2_Click" />
                        </div>
                    </div>
                    <a href="homepage.aspx"><< Back to Home</a><br />
                </div>
            </div>
        </div>

        <div class="right-part">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <div class="profile-title">
                            <h3>Member List</h3>
                        </div>
                        <div class="profile-title-info">
                            <h4>You can see all members there.</h4>
                        </div>
                    </div>
                    <div class="table-view">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eHouseDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                            </Columns>
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanager.aspx.cs" Inherits="FIRSTWEB.adminpublishermanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/realtormanager.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="left-part">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <div class="card-img">
                            <img src="img/publisher.png" />
                        </div>
                        <div class="profile-title">
                            <h3>Owner Details</h3>
                        </div>
                        <div class="profile-title-info">
                            <h4>You can add, update and delete owners, by filling their info below.</h4>
                        </div>
                        <div class="separator">
                            <hr />
                        </div>
                    </div>

                    <div class="two-card-form">
                        <div class="form-item">
                            <label class="form-label">Owner ID</label>
                            <div class="input-group">
                                <div class="textbox">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                </div>
                                <div class="go-button">
                                    <asp:Button ID="Button1" class="btn" runat="server" Text="Go" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>

                        <div class="form-item">
                            <label class="form-label">Owner Name</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Owner Name"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-button">
                        <div class="succsess">
                            <asp:Button ID="Button2" class="btn btn-lg btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                        </div>

                        <div class="warning">
                            <asp:Button ID="Button3" class="btn btn-lg btn-primary" runat="server" Text="Update" OnClick="Button3_Click" />
                        </div>
                        <div class="danger">
                            <asp:Button ID="Button4" class="btn btn-lg btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                        </div>
                    </div>
                    <a href="homepage.aspx"><< Back to Home</a><br>
                </div>
            </div>
        </div>

        <div class="right-part">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <div class="profile-title">
                            <h3>Owner List</h3>
                        </div>
                        <div class="profile-title-info">
                            <h4>List of registered owners</h4>
                        </div>
                    </div>

                    <div class="table-view">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eHouseDBConnectionString %>" SelectCommand="SELECT * FROM [owner_master_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="owner_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="owner_id" HeaderText="owner_id" ReadOnly="True" SortExpression="owner_id" />
                                <asp:BoundField DataField="owner_name" HeaderText="owner_name" SortExpression="owner_name" />
                            </Columns>
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

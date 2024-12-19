<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminapartamentissuing.aspx.cs" Inherits="FIRSTWEB.adminapartamentissuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/apartamentissuing.css" rel="stylesheet" />
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
                            <img src="img/apartment.png" />
                        </div>
                        <div class="profile-title">
                            <h3>Apartament Issuing</h3>
                        </div>
                        <div class="profile-title-info">
                            <h4>You can reserve or return apartaments for users.</h4>
                        </div>
                        <div class="separator">
                            <hr />
                        </div>
                    </div>

                    <div class="two-card-form">
                        <div class="form-item">
                            <label class="form-label">Member ID</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                        </div>

                        <div class="form-item">
                            <label class="form-label">Apartament ID</label>
                            <div class="input-group">
                                <div class="textbox">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Apartament ID"></asp:TextBox>
                                </div>
                                <div class="go-button">
                                    <asp:Button ID="Button1" class="btn btn-secondary" runat="server" Text="Go" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="two-card-form">
                        <div class="form-item">
                            <label class="form-label">Member Name</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-item">
                            <label class="form-label">Apartament Name</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Apartament Name" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="two-card-form">
                        <div class="form-item">
                            <label class="form-label">Reserve Date</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="form-item">
                            <label class="form-label">Due Date</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-button">
                        <div class="succsess">
                            <asp:Button ID="Button2" class="button" runat="server" Text="Return" OnClick="Button2_Click" />
                        </div>

                        <div class="warning">
                            <asp:Button ID="Button3" class="button" runat="server" Text="Reserve" OnClick="Button3_Click" />
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
                            <h3>Issued Apartament List</h3>
                        </div>
                        <div class="profile-title-info">
                            <h4>All apartament`s issued by users</h4>
                        </div>
                    </div>
                    <div class="table-view">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eHouseDBConnectionString %>" SelectCommand="SELECT * FROM [apartament_issue_tbl]"></asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                    <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                    <asp:BoundField DataField="apartament_id" HeaderText="Apartament ID" SortExpression="apartament_id" />
                                    <asp:BoundField DataField="apartament_adress" HeaderText="Apartament Name" SortExpression="apartament_adress" />
                                    <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                    <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

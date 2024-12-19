<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewapartament.aspx.cs" Inherits="FIRSTWEB.viewapartament" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/viewapartament.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="container">
            <div class="card-title">
                <div class="profile-title">
                    <h3>Apartament Inventory List</h3>
                </div>
                <div class="profile-title-info">
                    <h4>You can see whole apartaments in availible</h4>
                </div>
                <div class="separator">
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="false"></asp:Panel>
                </div>
            </div>
            <div class="table-view">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eHouseDBConnectionString %>" SelectCommand="SELECT * FROM [apartament_master_tbl]"></asp:SqlDataSource>
                <asp:GridView class="table table-borderless" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="apartament_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="view-item">
                                    <div class="view-item-img">
                                        <asp:Image class="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("apartament_imgs_link") %>' />
                                    </div>
                                    <div class="view-item-info">
                                        <div class="item-cost">
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("apartament_cost") %>' Font-Bold="True"></asp:Label>
                                            &nbsp;$
                                        </div>
                                        <div class="item-name">
                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("apartament_name") %>'></asp:Label>
                                            &nbsp;
                                        </div>
                                        <div class="col-12">
                                            Realtor -
                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("realtor_name") %>'></asp:Label>
                                            &nbsp;| Furniture -
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("furniture") %>'></asp:Label>
                                            &nbsp;| Equipment -
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("equipment") %>'></asp:Label>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                Publish Date -
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                &nbsp;|
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("apartament_floor") %>'></asp:Label>
                                                &nbsp;floor |
                                                                <asp:Label ID="Label14" runat="server" Font-Bold="True" Text='<%# Eval("count_of_rooms") %>'></asp:Label>
                                                &nbsp;rooms
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                Advantages -
                                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("advantages") %>'></asp:Label>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                Description -
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" Text='<%# Eval("apartament_description") %>'></asp:Label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>

            <a href="homepage.aspx"><< Back to Home</a><br>
            <br />
        </div>
    </div>
</asp:Content>

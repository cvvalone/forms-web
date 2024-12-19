<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminapartamentinventory.aspx.cs" Inherits="FIRSTWEB.adminapartamentinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/apartamentinventory.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imageview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="left-part">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <div class="card-img">
                            <img src="apartamentsInventory/apartments.png" id="imageview" />
                        </div>
                        <div class="profile-title">
                            <h3>Apartaments Details</h3>
                        </div>
                        <div class="profile-title-info">
                            <h4>You can manipulate apartaments, by filling their id below.</h4>
                        </div>
                        <div class="separator">
                            <hr />
                        </div>
                    </div>

                    <div class="card-file-upload">
                        <asp:FileUpload class="file-upload" onchange="readURL(this)" ID="FileUpload1" runat="server" />
                        <label for="ContentPlaceHolder1_FileUpload1">Upload File</label>
                    </div>

                    <div class="apartament-info">

                        <div class="form-item">
                            <label class="form-label">Apartament ID</label>
                            <div class="input-group">
                                <div class="textbox">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Apartament ID"></asp:TextBox>
                                </div>
                                <div class="go-button">
                                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Go" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Apartament Name</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Apartament Name"></asp:TextBox>
                        </div>
                    </div>

                    <div class="mane-info">

                        <div class="form-item">
                            <label class="form-label">Count of Rooms</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Count of Rooms"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Contact No</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact No"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Email ID</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>

                    <div class="split-select-info">
                        <div class="first-column">
                            <div class="form-item">
                                <label class="form-label">Language</label>
                                <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="English" Value="English" />
                                    <asp:ListItem Text="Ukrainian" Value="Ukrainian" />
                                    <asp:ListItem Text="French" Value="French" />
                                    <asp:ListItem Text="German" Value="German" />
                                    <asp:ListItem Text="Urdu" Value="Urdu" />
                                </asp:DropDownList>
                            </div>

                            <div class="form-item">
                                <label class="form-label">Realtor Name</label>
                                <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                    <asp:ListItem Text="Realtor 1" Value="Realtor 1" />
                                    <asp:ListItem Text="Realtor 2" Value="Realtor 2" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="second-column">
                            <div class="form-item">
                                <label class="form-label">Owner Name</label>
                                <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                                    <asp:ListItem Text="Owner 1" Value="Owner 1" />
                                    <asp:ListItem Text="Owner 2" Value="Owner 2" />
                                </asp:DropDownList>
                            </div>
                            <div class="form-item">
                                <label class="form-label">Publish Date</label>
                                <asp:TextBox class="form-control" ID="TextBox5" TextMode="Date" runat="server" placeholder="Date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="third-column">
                            <div class="form-item">
                                <label class="form-label">Advantages</label>
                                <asp:ListBox ID="ListBox1" class="form-control" runat="server" SelectionMode="Multiple" Rows="5">
                                    <asp:ListItem Text="Convenient Location" Value="Convenient Location" />
                                    <asp:ListItem Text="Safety" Value="Safety" />
                                    <asp:ListItem Text="Comfort and Living Conditions" Value="Comfort Conditions" />
                                    <asp:ListItem Text="Building Infrastructure" Value="Building Infrastructure" />
                                    <asp:ListItem Text="Economic Advantages" Value="Economic Advantages" />
                                    <asp:ListItem Text="Additional Services" Value="Additional Services" />
                                    <asp:ListItem Text="View from the Windows" Value="View from the Windows" />
                                    <asp:ListItem Text="Neighbors and Community" Value="Neighbors and Community" />
                                </asp:ListBox>
                            </div>
                        </div>
                    </div>

                    <div class="three-card-form">
                        <div class="form-item">
                            <label class="form-label">Apartament Floor</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Apartament Floor" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Apartament Cost</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Apartament Cost" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Adress</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Adress"></asp:TextBox>
                        </div>
                    </div>

                    <div class="three-card-form">
                        <div class="form-item">
                            <label class="form-label">Furniture</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Furniture"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Equipment</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Equipment"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label class="form-label">Issued Apartament</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Issued Apartaments" TextMode="Number" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="one-card-item">
                        <div class="form-item">
                            <label class="form-label">Apartament Description</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Apartament Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-button">
                        <div class="col-4">
                            <div class="succsess">
                                <asp:Button ID="Button2" class="button" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="warning">
                                <asp:Button ID="Button3" class="button" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="danger">
                                <asp:Button ID="Button4" class="button" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>
                    </div>
                    <a href="homepage.aspx"><< Back to Home</a><br>
                    <br />
                </div>
            </div>
        </div>

        <div class="right-part">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <div class="profile-title">
                            <h3>Apartament Inventory List</h3>
                        </div>
                        <div class="profile-title-info">
                            <h4>There you can see all added apartaments</h4>
                        </div>
                    </div>
                    <div class="inventory-list">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eHouseDBConnectionString %>" SelectCommand="SELECT * FROM [apartament_master_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="apartament_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="apartament_id" HeaderText="ID" ReadOnly="True" SortExpression="apartament_id">
                                    <ControlStyle Font-Bold="True" />
                                    <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("apartament_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Realtor -
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("realtor_name") %>'></asp:Label>
                                                            &nbsp;| Advantages -
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("advantages") %>'></asp:Label>
                                                            &nbsp;| Language -
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Owner -
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("owner_name") %>'></asp:Label>
                                                            &nbsp;| Furniture -
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("furniture") %>'></asp:Label>
                                                            &nbsp;| Equipment -
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("equipment") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Publish Date -
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                            &nbsp;| Apartament floor -
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("apartament_floor") %>'></asp:Label>
                                                            &nbsp;| Apartament Cost -
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("apartament_cost") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Description -
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" Text='<%# Eval("apartament_description") %>'></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-2">
                                                    <asp:Image class="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("apartament_imgs_link") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>

    </div>
</asp:Content>

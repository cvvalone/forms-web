<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="FIRSTWEB.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/home.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section class="banner">
        <h1 class="visually-hidden">EHouse apartament marketplace</h1>
        <div class="container banner-body">
            <h2 class="visually-hidden">Explanation of EHouse</h2>
            <div class="banner-info">
                <h3 class="banner-title">EHouse - your best choise</h3>
                <h4 class="banner-primary-text">With our realtors you can find your place from your dreams. Our task is to help you find what you are looking for easily.</h4>
                <asp:Button ID="Button1" class="banner-button button" runat="server" Text="Sign Up" OnClick="Button1_Click" />
            </div>
            <div class="banner-image">
                <img src="img/header%20image.png" />
            </div>
        </div>
    </section>

    <section class="features">
        <div class="container">
            <h1 class="visually-hidden">EHouse features</h1>
            <div class="feature-title-body">
                <h2 class="visually-hidden">Features Title</h2>
                <h3 class="feature-title">Our features</h3>
                <h4 class="feature-title-text">Our 3 primary features</h4>
            </div>
            <div class="features-body">
                <div class="feature-item">
                    <h2 class="visually-hidden">First feature</h2>
                    <img class="feature-image" src="img/firstColPng.png" />
                    <h4>Prime Locations</h4>
                    <p>Our apartments are strategically located in the most sought-after neighborhoods, providing easy access to essential amenities, public transportation, shopping centers, dining options, and vibrant entertainment hubs.</p>
                </div>
                <div class="feature-item">
                    <h2 class="visually-hidden">Second feature</h2>
                    <img class="feature-image" src="img/Modern%20Designs.png" />
                    <h4>Modern Designs</h4>
                    <p>Each apartment is thoughtfully designed with contemporary aesthetics and functional layouts. From open-concept living spaces to stylish kitchens and luxurious bathrooms, every detail is crafted to create an inviting and comfortable atmosphere.</p>
                </div>
                <div class="feature-item">
                    <h2 class="visually-hidden">Third feature</h2>
                    <img class="feature-image" src="img/amenities.png" />
                    <h4>Premium Amenities</h4>
                    <p>Experience a superior lifestyle with our wide range of premium amenities. Many of our properties feature state-of-the-art fitness centers, swimming pools, rooftop terraces, and co-working spaces. Additionally, residents can enjoy 24/7 concierge services, secure parking.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="apartament-carousel">
        <div class="container carousel">
            <h1 class="visually-hidden">EHouse apartament carousel</h1>
            <div class="carousel-title-body">
                <h2 class="visually-hidden">Features Title</h2>
                <h3 class="carousel-title">Apartament`s in availible</h3>
                <h4 class="carousel-title-text">Discover the most popular apartaments of the day</h4>
            </div>
            <div class="list-body">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eHouseDBConnectionString %>" SelectCommand="SELECT * FROM [apartament_master_tbl]"></asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" RepeatLayout="Table" DataKeyField="apartament_id" RepeatColumns="3" ItemStyle-CssClass="data-list-item" CssClass="data-list-table" CellPadding="0" CellSpacing="0" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="list-item-body">
                            <div class="list-item-image">
                                <asp:Image class="list-image" ID="Image1" runat="server" ImageUrl='<%# Eval("apartament_imgs_link") %>' />
                            </div>
                            <div class="list-item-cost">
                                <div class="row">
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("apartament_cost") %>'></asp:Label>
                                    &nbsp;$
                                </div>
                                <div class="list-item-name">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("apartament_name") %>'></asp:Label>
                                    &nbsp;
                                </div>
                                <div class="list-item-info">
                                    Realtor -
                <asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("realtor_name") %>'></asp:Label>
                                    &nbsp;| Furniture -
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("furniture") %>'></asp:Label>
                                    &nbsp;| Equipment -
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("equipment") %>'></asp:Label>
                                </div>
                            </div>
                            <div class="list-item-info">
                                Publish Date -
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                &nbsp;|
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("apartament_floor") %>'></asp:Label>
                                &nbsp;floor |
                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Text='<%# Eval("count_of_rooms") %>'></asp:Label>
                                &nbsp;rooms
                            </div>
                            <div class="row">
                                Advantages -
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("advantages") %>'></asp:Label>

                            </div>
                            <div class="row">
                                Description -
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" Text='<%# Eval("apartament_description") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </section>



    <section class="processes">
        <div class="container">
            <h1 class="visually-hidden">EHouse processes</h1>
            <div class="feature-title-body">
                <h2 class="visually-hidden">Features Title</h2>
                <h3 class="feature-title">Our process</h3>
                <h4 class="feature-title-text">We have a 3 Simple 3 Step Process</h4>
            </div>
            <h1 class="visually-hidden">EHouse processes</h1>
            <div class="features-body">
                <div class="feature-item">
                    <h2 class="visually-hidden">First process</h2>
                    <img class="feature-image" src="img/signUp.png" />
                    <h4>Sign Up</h4>
                    <p class="text-justify">Go to our's homepage and click on the "Sign Up" button located at the top right corner of the homepage. Complete the registration form by entering your name, email address, and creating a password. Make sure to check the box agreeing to our terms and conditions.</p>
                </div>
                <div class="feature-item">
                    <h2 class="visually-hidden">Second process</h2>
                    <img class="feature-image" src="img/findApart.png" />
                    <h4>Find an Apartament</h4>
                    <p class="text-justify">Use your registered email and password to log in to your Ehouse account. Then review the curated list of apartments that match your criteria. Click on individual listings to view detailed descriptions, photos, and virtual tours.</p>
                </div>
                <div class="feature-item">
                    <h2 class="visually-hidden">Third process</h2>
                    <img class="feature-image" src="img/realtor.png" />
                    <h4>Contact with realtors</h4>
                    <p class="text-justify">Choose the apartment listings you are interested in and click on the "Contact Realtor" button available on each listing page. Provide your name, preferred contact method (email or phone), and any specific questions or requests you have about the apartment.</p>
                </div>
            </div>
        </div>
    </section>



    <div class="upButton">
        <a class="to-top" href="#top">&#9650;</a>
    </div>
</asp:Content>

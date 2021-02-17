<%@ Page Title="Customer Homepage" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="CustomerHomepage.aspx.vb" Inherits="MyNewSystem.CustomerHomepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 20%;
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            left: 4px;
            margin-left: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!--ModelSlider.css for customer home page-->
    <link href="Css/ModelSlider.css" rel="stylesheet" />
    <!--lightslider.css for customer home page-->
    <link href="Css/lightslider.css" rel="stylesheet" type="text/css" />
    <!--Jquery.js javascript for customer home page-->
    <script src="Js/Jquery.js" type="text/javascript"></script>
    <!--lightslider.js javascript for customer home page-->
    <script src="Js/lightslider.js" type="text/javascript"></script>
    <!--Tab-icon-->
    <section class="auto-style1">
        <ul id="autoWidth" class="cs-hidden">
            <!--1------------------------------------>
            <li class="item-a">
                <!--box-slider--------------->
                <div class="box">
                    <!--img-box---------->
                    <div class="slide-img">
                        <img alt="1" src="../Images/Model/1.jpg">
                        <!--overlayer---------->
                        <div class="overlay">
                            <!--buy-btn------>
                            <a href="CustomerProduct.aspx" class="buy-btn">Shop Now</a>
                        </div>
                    </div>
                    <!--detail-box--------->
                    <div class="detail-box">
                        <!--type-------->
                        <div class="type">
                            <a href="#">Model 1</a>
                            <span>New Arrival</span>
                        </div>
                        <!--price-------->
                        <a href="#" class="price">RM23.00</a>
                    </div>
                </div>
            </li>
            <!--2------------------------------------>
            <li class="item-b">
                <!--box-slider--------------->
                <div class="box">
                    <!--img-box---------->
                    <div class="slide-img">
                        <img alt="2" src="../Images/Model/2.jpg">
                        <!--overlayer---------->
                        <div class="overlay">
                            <!--buy-btn------>
                            <a href="CustomerProduct.aspx" class="buy-btn">Shop Now</a>
                        </div>
                    </div>
                    <!--detail-box--------->
                    <div class="detail-box">
                        <!--type-------->
                        <div class="type">
                            <a href="#">Model 2</a>
                            <span>New Arrival</span>
                        </div>
                        <!--price-------->
                        <a href="#" class="price">RM20.00</a>
                    </div>
                </div>
            </li>
            <!--3------------------------------------>
            <li class="item-c">
                <!--box-slider--------------->
                <div class="box">
                    <!--img-box---------->
                    <div class="slide-img">
                        <img alt="3" src="../Images/Model/3.jpg">
                        <!--overlayer---------->
                        <div class="overlay">
                            <!--buy-btn------>
                            <a href="CustomerProduct.aspx" class="buy-btn">Shop Now</a>
                        </div>
                    </div>
                    <!--detail-box--------->
                    <div class="detail-box">
                        <!--type-------->
                        <div class="type">
                            <a href="#">Model 3</a>
                            <span>New Arrival</span>
                        </div>
                        <!--price-------->
                        <a href="#" class="price">RM26.00</a>
                    </div>
                </div>
            </li>
            <!--4------------------------------------>
            <li class="item-d">
                <!--box-slider--------------->
                <div class="box">
                    <!--img-box---------->
                    <div class="slide-img">
                        <img alt="4" src="../Images/Model/4.jpg">
                        <!--overlayer---------->
                        <div class="overlay">
                            <!--buy-btn------>
                            <a href="CustomerProduct.aspx" class="buy-btn">Shop Now</a>
                        </div>
                    </div>
                    <!--detail-box--------->
                    <div class="detail-box">
                        <!--type-------->
                        <div class="type">
                            <a href="#">Model 4</a>
                            <span>New Arrival</span>
                        </div>
                        <!--price-------->
                        <a href="#" class="price">RM27.00</a>
                    </div>
                </div>
            </li>
            <!--5------------------------------------>
            <li class="item-e">
                <!--box-slider--------------->
                <div class="box">
                    <!--img-box---------->
                    <div class="slide-img">
                        <img alt="5" src="../Images/Model/5.jpg">
                        <!--overlayer---------->
                        <div class="overlay">
                            <!--buy-btn------>
                            <a href="CustomerProduct.aspx" class="buy-btn">Shop Now</a>
                        </div>
                    </div>
                    <!--detail-box--------->
                    <div class="detail-box">
                        <!--type-------->
                        <div class="type">
                            <a href="#">Model 5</a>
                            <span>New Arrival</span>
                        </div>
                        <!--price-------->
                        <a href="#" class="price">RM26.00</a>
                    </div>
                </div>
            </li>
            <!--6------------------------------------>
            <li class="item-f">
                <!--box-slider--------------->
                <div class="box">
                    <!--img-box---------->
                    <div class="slide-img">
                        <img alt="6" src="../Images/Model/6.jpg">
                        <!--overlayer---------->
                        <div class="overlay">
                            <!--buy-btn------>
                            <a href="CustomerProduct.aspx" class="buy-btn">Shop Now</a>
                        </div>
                    </div>
                    <!--detail-box--------->
                    <div class="detail-box">
                        <!--type-------->
                        <div class="type">
                            <a href="#">Model 6</a>
                            <span>New Arrival</span>
                        </div>
                        <!--price-------->
                        <a href="#" class="price">RM30.00</a>
                    </div>
                </div>
            </li>
            <!--7------------------------------------>
            <li class="item-g">
                <!--box-slider--------------->
                <div class="box">
                    <!--img-box---------->
                    <div class="slide-img">
                        <img alt="7" src="../Images/Model/7.jfif">
                        <!--overlayer---------->
                        <div class="overlay">
                            <!--buy-btn------>
                            <a href="CustomerProduct.aspx" class="buy-btn">Shop Now</a>
                        </div>
                    </div>
                    <!--detail-box--------->
                    <div class="detail-box">
                        <!--type-------->
                        <div class="type">
                            <a href="#">Model 7</a>
                            <span>New Arrival</span>
                        </div>
                        <!--price-------->
                        <a href="#" class="price">RM33.00</a>
                    </div>
                </div>
            </li>
            <!--8------------------------------------>
            <li class="item-h">
                <!--box-slider--------------->
                <div class="box">
                    <!--img-box---------->
                    <div class="slide-img">
                        <img alt="8" src="../Images/Model/8.jfif">
                        <!--overlayer---------->
                        <div class="overlay">
                            <!--buy-btn------>
                            <a href="CustomerProduct.aspx" class="buy-btn">Shop Now</a>
                        </div>
                    </div>
                    <!--detail-box--------->
                    <div class="detail-box">
                        <!--type-------->
                        <div class="type">
                            <a href="#">Model 8</a>
                            <span>New Arrival</span>
                        </div>
                        <!--price-------->
                        <a href="#" class="price">RM43.00</a>
                    </div>
                </div>
            </li>
        </ul>
    </section>
    <!--script-link----------->
    <script type="text/javascript" src="Js/script.js"></script>
</asp:Content>

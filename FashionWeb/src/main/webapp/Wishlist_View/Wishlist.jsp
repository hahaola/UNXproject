<%@page import="DAO.FashionDAO"%>
<%@page import="DAO.LoginDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Wishlist</title>
        <!-- icon logo in title bar -->
        <link rel="icon" href="../img/icon_group.png" type="image/icon">
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="../css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="../css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="../css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="../css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="../css/style.css"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">



        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> CoCou@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
                    </ul>
                    <ul class="header-links pull-right">

                        <c:set var="user" value="${NAME}" scope="session"/>
                        <c:if test="${empty user}">

                            <li><a href="../login.jsp"><i class="fa fa-user-o"></i> Login</a></li>
                            </c:if>
                            <c:if test="${not empty user}">
                            <li>                            
                                <div class="dropdown">
                                    <button  onclick="hamDropdown()" class="nut_dropdown">
                                        <i class="bi bi-person"></i>
                                        Hello ${user.username}
                                    </button>
                                    <div class="noidung_dropdown">
                                        <a id="dropItem" href="../UpdateAccount?AID=${user.accID}" style="font-size: 14px" >Manager Account</a>
                                        <a id="dropItem" href="../BillShowServlet?AID=${user.accID}" style="margin-bottom:-20px;font-size: 14px">View Bill</a>
                                        <hr class="solid" style="border-top: 1px solid #D9D9D9;">
                                        <c:if test="${user.roleID == 'R01'}">
                                            <a class="nav-link" href="../AdminHome"style="margin-top: -20px;margin-bottom: -20px; font-size: 14px">Admin Page</a>
                                        </c:if>
                                        <hr class="solid" style="border-top: 1px solid #D9D9D9;">
                                        <a id="dropItem" href="../LogoutServlet" style="margin-top: -20px; font-size: 14px">Logout</a>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="../HomeServlet" class="logo">
                                    <img src="../img/logoGoodTaste.png" alt="" style="width:100px; height:100px">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="SearchProductServlet" method="post">
                                    <select class="input-select" name="category" onchange="window.location.href = this.value">
                                        <option value="0" selected>All Categories</option>
                                        <%
                                            FashionDAO dao = new FashionDAO();
                                            List<category> cl = dao.getAllCategory();
                                        %>    
                                        <% for (category c : cl) {%>
                                        <option value="StoreCategoryServlet?page=1&cid=<%=c.getCategoryID()%>&sort=all"><%=c.getCategoryName()%></option>
                                        <%}%>
                                    </select>
                                    <input class="input" placeholder="Search here" name="search" value=""> <!-- Thêm value search ở đây -->
                                    <button class="search-btn" name="action" value="search" type="submit">
                                        <a style="color: #000000">Search</a>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
                                <div>
                                    <a href="http://localhost:8080/FashionWeb/Wishlist_View/Wishlist.jsp">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Your Wishlist</span>
                                        <div class="qty" id='wishlist_qty'>0</div>
                                    </a>
                                </div>
                                <!-- /Wishlist -->

                                <!-- Cart -->

                                <div>
                                    <a href="../ShowCart">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <c:set var="number" value="numberCart" scope="session"/>
                                        <div class="qty">
                                            <c:if test="${not empty numberCart}">
                                                ${numberCart.size()}
                                            </c:if>
                                            <c:if test="${empty numberCart}">
                                                0
                                            </c:if>
                                        </div>

                                    </a>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->


        <!-- Wishlist Content -->
        <div class="mt-3">
            <h2 class="text-center m-3 text-decoration-underline">My Wishlist</h2>
            <div class="row justify-content-center" id="wishlist_content">

            </div>
        </div>


        <script>
            function hamDropdown() {
                document.querySelector(".noidung_dropdown").classList.toggle("hienThi");
            }
        </script>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
            $(document).ready(function ()
            {
                displayWishlist();
                displayNumberWishlist();
                
                //---------------------------------------
                setInterval(displayNumberWishlist, 3000);
                setInterval(displayWishlist, 3000);
                //--------------------------------------
            });

            function displayNumberWishlist()
            {
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:8080/FashionWeb/GetAllWishlist',
                    data: {
                        user: '${NAME.accID}'
                    },
                    error: function ()
                    {
                        console.log('ERROR');
                    },
                    success: function (data)
                    {
//                        console.log(data);
                        $('#wishlist_qty').empty();
                        $('#wishlist_qty').append(data.length);
                    }
                });
            }

            function displayWishlist()
            {

                const formatter = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND',
                    // These options are needed to round to whole numbers if that's what you want.
                    //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
                    //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
                });
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:8080/FashionWeb/GetAllWishlist',
                    data: {
                        user: '${NAME.accID}'
                    },
                    error: function ()
                    {
                        console.log('ERROR');
                    },
                    success: function (data)
                    {
                        $('#wishlist_content').empty();
                        console.log(data.length);
                        if (data.length > 0)
                        {
                            for (var i = 0; i < data.length; i++)
                            {
                                $('#wishlist_content').append(
                                        "<div class='col-md-8 m-3 border' id='wishlist-"+data[i].wishlist.id+"'>\n\
                                                    <div class='row'>\n\
                                                        <div class='col-md-4'>\n\
                                                            <img src='../" + data[i].product.image + "' alt='' style='width:200px; height:200px'>\n\
                                                        </div>\n\
                                                        <div class='col-md-4 d-flex align-items-center'>\n\
                                                            <div>\n\
                                                                <h3>" + data[i].product.nameP + "</h3>\n\
                                                                <p>Category: " + data[i].categoryName + "</p>\n\
                                                                <p>Rating: " + data[i].product.rating + "</p>\n\
                                                                <p>Add date: " + data[i].wishlist.dateAdd + "</p>\n\
                                                            </div>\n\
                                                        </div>\n\
                                                        <div class='col-md-4'>\n\
                                                            <div class='d-flex justify-content-end mt-2'>\n\
                                                                <button type='button' class='btn-close' onclick='removeWishlist(" + data[i].wishlist.id + ")'></button>\n\
                                                            </div>\n\
                                                        <div class='d-flex justify-content-center align-self-center mt-5'>\n\
                                                            <div>\n\
                                                                <h5 class='text-center'>" + formatter.format(data[i].product.price) + "</h5>\n\
                                                                <a href='../CartServlet?id=" + data[i].product.PID + "' class='btn btn-primary'>Add to cart</a>\n\
                                                            </div>\n\
                                                        </div>\n\
                                                        </div>\n\
                                                    </div>\n\
                                                </div>");
                            }
                        }
                    }
                });
            }

            function removeWishlist(id)
            {
                console.log(id);
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/FashionWeb/RemoveFromWishlist',
                    data: {
                        wishlist: id,
                    },
                    error: function ()
                    {
                        console.log('ERROR');
                    },
                    success: function (data)
                    {
//                        console.log(data);
                        $('#wishlist-'+id).remove();
                    }
                });
            }

        </script>
</html>


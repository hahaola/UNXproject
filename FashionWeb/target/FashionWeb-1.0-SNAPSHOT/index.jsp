<%@page import="DAO.FashionDAO"%>
<%@page import="model.category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Home</title>
        <!-- icon logo in title bar -->
        <link rel="icon" href="img/icon_group.png" type="image/icon type">
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link  type="text/css" rel="stylesheet" href="css/AdminStyle.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style>
            *{
                margin:0;
                padding:0;
            }
            .loader
            {
                position: fixed;
                top:0;
                left:0;
                background: lightgrey;
                height: 100%;
                width: 100%;
                display:flex;
                justify-content: center;
                align-items: center;
            }

            .main
            {
                display: none;

            }
            @keyframes vanish
            {
                100%
                {
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>

    </head>

    <body>

        <div class="loader">
            <img src="img/loading.gif" alt="alt" style="width:2000px; height: 1000px"/>
        </div>
        <section class="main">
            <div class="parallax">

                <div class="body">
                    <jsp:include page="header.jsp"></jsp:include>

                    ${message}
                    <!-- SECTION -->
                    <div class="section">
                        <!-- container -->
                        <div class="container">
                            <!-- row -->
                            <div class="row">

                                <%
                                    FashionDAO dao = new FashionDAO();
                                    List<category> cl = dao.getThreeCategory();

                                    for (category c : cl) {
                                %>
                                <!-- shop -->
                                <!--                                <div class="col-md-4 col-xs-6">
                                                                    <div class="shop">
                                                                        <div class="shop-img">
                                                                            <img style="height:230px" src="./img/vietnamese_food.jpg" alt="combo" style="z-index:10">
                                                                        </div>-->
                                <!--                                        <div class="shop-body">
                                                                            <h3><%= c.getCategoryName()%><br>Category</h3>
                                                                            <a href="StoreCategoryServlet?page=1&cid=<%= c.getCategoryID()%>&sort=all" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>  taọ thêm 1 jsp cho combo 
                                                                        </div>-->
                            </div>
                        </div>
                        <!-- /shop -->
                        <%}%>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /SECTION -->

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">

                        <!-- section title -->
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">New Products</h3>
                            </div>
                        </div>
                        <!-- /section title -->

                        <!-- Products tab & slick -->
                        <div class="col-md-12">
                            <div class="row">
                                <div class="products-tabs">
                                    <!-- tab -->
                                    <div id="tab1" class="tab-pane active">
                                        <div class="products-slick" data-nav="#slick-nav-1">
                                            <!-- product -->
                                            <c:forEach items="${listP}" var="p">
                                                <c:if test="${p.stock == true}">
                                                    <div class="product">
                                                        <div class="product-img">
                                                            <img style="height: 230px" src="${p.image}">
                                                            <div class="product-label">
                                                                <span class="new">NEW</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-body">
                                                            <h3 class="product-name"><a href="Detail?pid=${p.PID}">${p.nameP}</a></h3>
                                                            <h4 class="product-price">                                            
                                                                <fmt:setLocale value = "vi_VN"/>
                                                                <fmt:formatNumber value = "${p.price / 2}" type = "currency"/>
                                                                <del class="product-old-price">                                                                
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${p.price}" type = "currency"/>
                                                                </del>
                                                            </h4>
                                                            <div class="product-rating">
                                                                <i style="color: #000000; z-index: 1">${p.rating}</i>
                                                                <c:forEach var="i" begin="1" end="${p.rating}">
                                                                    <i class="fa fa-star"></i>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${p.rating < 5 && p.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                                                    <c:when test="${p.rating < 4 && p.rating >=3}">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:when>
                                                                    <c:when test="${p.rating < 3 && p.rating >=2}">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:when>
                                                                    <c:when test="${p.rating < 2 && p.rating >=1}">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:when>
                                                                    <c:when test="${p.rating == 0 && p.rating < 1}">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <div class="product-btns">
                                                                <button><a class="add-to-wishlist" href="AddToWishlist?id=${p.PID}"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></a></button>
                                                                <button><a class="quick-view" href="Detail?pid=${p.PID}"><i class="fa fa-eye"></i><span class="tooltipp">View</span></a></button>
                                                            </div>
                                                        </div>
                                                        <div class="add-to-cart">
                                                            <a href="CartServlet?id=${p.PID}" class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>Ordered</a>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <!-- /product -->
                                        </div>
                                        <div id="slick-nav-1" class="products-slick-nav"></div>
                                    </div>
                                    <!-- /tab -->
                                </div>
                            </div>
                        </div>
                        <!-- Products tab & slick -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /SECTION -->

            <!-- HOT DEAL SECTION -->
            <div id="hot-deal" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="hot-deal">
                                <ul class="hot-deal-countdown">
                                    <li>
                                        <div>
                                            <h3 id="day"></h3>
                                            <span>Days</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <h3 id="hours"></h3>
                                            <span>Hours</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <h3 id="mins"></h3>
                                            <span>Mins</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <h3 id="sec"></h3>
                                            <span>Secs</span>
                                        </div>
                                    </li>

                                </ul>
                                <div><h3 id="Notice" style="color: #FFF; text-shadow: 2px 2px #ff0000;"></h3></div>
                                <h2 class="text-uppercase">Hot deal this week</h2>
                                <p>New Clothes to 50% OFF</p>
                                <a class="primary-btn cta-btn" href="Work_In_Progress.jsp">Shop now</a> <!-- tạo 1 hotdeal jsp -->
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /HOT DEAL SECTION -->


            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">

                        <!-- section title -->
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">Top Rating</h3>
                                <div class="section-nav">
                                    <ul class="section-tab-nav tab-nav">
                                        <li class="active"><a data-toggle="tab" href="#tab2">Highest Rating</a></li>
                                        <li><a data-toggle="tab" href="#tab2">Most purchase</a></li>
                                        <li><a data-toggle="tab" href="#tab2">Most find</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /section title -->

                        <!-- Products tab & slick -->
                        <div class="col-md-12">
                            <div class="row">
                                <div class="products-tabs">
                                    <!-- tab -->
                                    <div id="tab2" class="tab-pane fade in active">
                                        <div class="products-slick" data-nav="#slick-nav-2">
                                            <c:forEach items="${rateP}" var="p">
                                                <c:if test="${p.stock == true}">
                                                    <div class="product">
                                                        <div class="product-img">
                                                            <img style="height: 230px" src="${p.image}">
                                                            <c:forEach items="${listP}" var="newP">
                                                                <c:if test="${p.PID == newP.PID}">
                                                                    <div class="product-label">
                                                                        <span class="sale">-50%</span>
                                                                        <span class="new">NEW</span>
                                                                    </div>
                                                                </c:if>

                                                            </c:forEach>
                                                        </div>
                                                        <div class="product-body">
                                                            <h3 class="product-name"><a href="Detail?pid=${p.PID}">${p.nameP}</a></h3>


                                                            <c:forEach items="${listP}" var="np">
                                                                <c:choose>
                                                                    <c:when test="${np.PID == p.PID}">
                                                                        <h4 class="product-price">
                                                                            <fmt:setLocale value = "vi_VN"/>
                                                                            <fmt:formatNumber value = "${p.price / 2}" type = "currency"/>
                                                                            <del class="product-old-price">
                                                                                <fmt:setLocale value = "vi_VN"/>
                                                                                <fmt:formatNumber value = "${p.price}" type = "currency"/>
                                                                            </del>
                                                                        </h4>
                                                                    </c:when >   
                                                                </c:choose>
                                                            </c:forEach>

                                                            <c:forEach items="${oldProduct}" var="onp">
                                                                <c:choose>
                                                                    <c:when test="${onp.PID == p.PID}">
                                                                        <h4 class="product-price">
                                                                            <fmt:setLocale value = "vi_VN"/>
                                                                            <fmt:formatNumber value = "${p.price}" type = "currency"/>
                                                                        </h4>
                                                                    </c:when >   
                                                                </c:choose>
                                                            </c:forEach>  

                                                            <div class="product-rating">
                                                                <i style="color: #000000; z-index: 1">${p.rating}</i>
                                                                <c:forEach var="i" begin="1" end="${p.rating}">
                                                                    <i class="fa fa-star"></i>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${p.rating < 5 && p.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                                                    <c:when test="${p.rating < 4 && p.rating >=3}">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:when>
                                                                    <c:when test="${p.rating < 3 && p.rating >=2}">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:when>
                                                                    <c:when test="${p.rating < 2 && p.rating >=1}">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:when>
                                                                    <c:when test="${p.rating == 0 && p.rating < 1}">
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <div class="product-btns">
                                                                <button><a class="add-to-wishlist" href="AddToWishlist?id=${p.PID}"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></a></button>
                                                                <button><a class="quick-view" href="Detail?pid=${p.PID}"><i class="fa fa-eye"></i><span class="tooltipp">View</span></a></button>
                                                            </div>
                                                        </div>
                                                        <div class="add-to-cart">
                                                            <a href="CartServlet?id=${p.PID}" class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>Ordered</a>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>

                                        </div>
                                        <div id="slick-nav-2" class="products-slick-nav"></div>
                                    </div>
                                    <!-- /tab -->
                                </div>
                            </div>
                        </div>
                        <!-- /Products tab & slick -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /SECTION -->

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-4 col-xs-6">
                            <div class="section-title">
                                <h4 class="title">Top Rate T-Shirt</h4>
                                <div class="section-nav">
                                    <div id="slick-nav-3" class="products-slick-nav"></div>
                                </div>
                            </div>

                            <div class="products-widget-slick" data-nav="#slick-nav-3">

                                <div>
                                    <c:forEach items="${ratePAF1}" var="half1">
                                        <c:if test="${half1.stock == true}">
                                            <!-- product widget -->
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="${half1.image}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="Detail?pid=${half1.PID}">${half1.nameP}</a></h3>
                                                        <c:forEach items="${listP}" var="np">
                                                            <c:choose>
                                                                <c:when test="${np.PID == half1.PID}">
                                                                <h4 class="product-price">                                                                
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${half1.price / 2}" type = "currency"/>
                                                                    <del class="product-old-price">
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half1.price}" type = "currency"/>
                                                                    </del>
                                                                </h4>
                                                            </c:when >   
                                                        </c:choose>
                                                    </c:forEach>

                                                    <c:forEach items="${oldProduct}" var="onp">
                                                        <c:choose>
                                                            <c:when test="${onp.PID == half1.PID}">
                                                                <h4 class="product-price">
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${half1.price}" type = "currency"/>
                                                                </h4>
                                                            </c:when >   
                                                        </c:choose>
                                                    </c:forEach>  
                                                </div>
                                            </div>
                                            <!-- /product widget -->
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <div>
                                    <c:if test="${ratePAF2 !=null}">
                                        <c:forEach items="${ratePAF2}" var="half2">
                                            <c:if test="${half2.stock == true}">
                                                <!-- product widget -->
                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <img src="${half2.image}" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="Detail?pid=${half2.PID}">${half2.nameP}</a></h3>

                                                        <c:forEach items="${listP}" var="np">
                                                            <c:choose>
                                                                <c:when test="${np.PID == half2.PID}">
                                                                    <h4 class="product-price"> 
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half2.price / 2}" type = "currency"/>
                                                                        <del class="product-old-price">
                                                                            <fmt:setLocale value = "vi_VN"/>
                                                                            <fmt:formatNumber value = "${half2.price}" type = "currency"/>
                                                                        </del>
                                                                    </h4>
                                                                </c:when >   
                                                            </c:choose>
                                                        </c:forEach>

                                                        <c:forEach items="${oldProduct}" var="onp">
                                                            <c:choose>
                                                                <c:when test="${onp.PID == half2.PID}">
                                                                    <h4 class="product-price">
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half2.price}" type = "currency"/>
                                                                    </h4>
                                                                </c:when >   
                                                            </c:choose>
                                                        </c:forEach>  
                                                    </div>
                                                </div>
                                                <!-- /product widget -->
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-xs-6">
                            <div class="section-title">
                                <h4 class="title">Top Rate Pants's</h4>
                                <div class="section-nav">
                                    <div id="slick-nav-4" class="products-slick-nav"></div>
                                </div>
                            </div>

                            <div class="products-widget-slick" data-nav="#slick-nav-4">
                                <div>
                                    <c:forEach items="${ratePIF1}" var="half1">
                                        <c:if test="${half1.stock == true}">
                                            <!-- product widget -->
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="${half1.image}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="Detail?pid=${half1.PID}">${half1.nameP}</a></h3>
                                                        <c:forEach items="${listP}" var="np">
                                                            <c:choose>
                                                                <c:when test="${np.PID == half1.PID}">
                                                                <h4 class="product-price">
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${half1.price / 2}" type = "currency"/>
                                                                    <del class="product-old-price">
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half1.price}" type = "currency"/>
                                                                    </del>
                                                                </h4>
                                                            </c:when >   
                                                        </c:choose>
                                                    </c:forEach>

                                                    <c:forEach items="${oldProduct}" var="onp">
                                                        <c:choose>
                                                            <c:when test="${onp.PID == half1.PID}">
                                                                <h4 class="product-price">
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${half1.price}" type = "currency"/>
                                                                </h4>
                                                            </c:when >   
                                                        </c:choose>
                                                    </c:forEach>  
                                                </div>
                                            </div>
                                            <!-- /product widget -->
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <div>
                                    <c:if test="${ratePIF2 !=null}">
                                        <c:forEach items="${ratePIF2}" var="half2">
                                            <c:if test="${half2.stock == true}">
                                                <!-- product widget -->
                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <img src="${half2.image}" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="Detail?pid=${half2.PID}">${half2.nameP}</a></h3>

                                                        <c:forEach items="${listP}" var="np">
                                                            <c:choose>
                                                                <c:when test="${np.PID == half2.PID}">
                                                                    <h4 class="product-price">
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half2.price / 2}" type = "currency"/>
                                                                        <del class="product-old-price">
                                                                            <fmt:setLocale value = "vi_VN"/>
                                                                            <fmt:formatNumber value = "${half2.price}" type = "currency"/>
                                                                        </del>
                                                                    </h4>
                                                                </c:when >   
                                                            </c:choose>
                                                        </c:forEach>

                                                        <c:forEach items="${oldProduct}" var="onp">
                                                            <c:choose>
                                                                <c:when test="${onp.PID == half2.PID}">
                                                                    <h4 class="product-price">
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half2.price}" type = "currency"/>
                                                                    </h4>
                                                                </c:when >   
                                                            </c:choose>
                                                        </c:forEach>  
                                                    </div>
                                                </div>
                                                <!-- /product widget -->
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                </div>
                            </div>
                        </div>

                        <div class="clearfix visible-sm visible-xs"></div>

                        <div class="col-md-4 col-xs-6">
                            <div class="section-title">
                                <h4 class="title">Top Rate Hat's</h4>
                                <div class="section-nav">
                                    <div id="slick-nav-5" class="products-slick-nav"></div>
                                </div>
                            </div>

                            <div class="products-widget-slick" data-nav="#slick-nav-5">
                                <div>
                                    <c:forEach items="${ratePINF1}" var="half1">
                                        <c:if test="${half1.stock == true}">
                                            <!-- product widget -->
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="${half1.image}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="Detail?pid=${half1.PID}">${half1.nameP}</a></h3>
                                                        <c:forEach items="${listP}" var="np">
                                                            <c:choose>
                                                                <c:when test="${np.PID == half1.PID}">
                                                                <h4 class="product-price">
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${half1.price / 2}" type = "currency"/>
                                                                    <del class="product-old-price">
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half1.price}" type = "currency"/>
                                                                    </del>
                                                                </h4>
                                                            </c:when >   
                                                        </c:choose>
                                                    </c:forEach>

                                                    <c:forEach items="${oldProduct}" var="onp">
                                                        <c:choose>
                                                            <c:when test="${onp.PID == half1.PID}">
                                                                <h4 class="product-price">
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${half1.price}" type = "currency"/>
                                                                </h4>
                                                            </c:when >   
                                                        </c:choose>
                                                    </c:forEach>  
                                                </div>
                                            </div>
                                            <!-- /product widget -->
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <div>
                                    <c:if test="${ratePINF2 !=null}">
                                        <c:forEach items="${ratePINF2}" var="half2">
                                            <c:if test="${half2.stock == true}">
                                                <!-- product widget -->
                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <img src="${half2.image}" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="Detail?pid=${half2.PID}">${half2.nameP}</a></h3>

                                                        <c:forEach items="${listP}" var="np">
                                                            <c:choose>
                                                                <c:when test="${np.PID == half2.PID}">
                                                                    <h4 class="product-price">
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half2.price / 2}" type = "currency"/>
                                                                        <del class="product-old-price">
                                                                            <fmt:setLocale value = "vi_VN"/>
                                                                            <fmt:formatNumber value = "${half2.price}" type = "currency"/>
                                                                        </del>
                                                                    </h4>
                                                                </c:when >   
                                                            </c:choose>
                                                        </c:forEach>

                                                        <c:forEach items="${oldProduct}" var="onp">
                                                            <c:choose>
                                                                <c:when test="${onp.PID == half2.PID}">
                                                                    <h4 class="product-price">
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <fmt:formatNumber value = "${half2.price / 2}" type = "currency"/>}
                                                                    </h4>
                                                                </c:when >   
                                                            </c:choose>
                                                        </c:forEach>  
                                                    </div>
                                                </div>
                                                <!-- /product widget -->
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>

    </div>
    <!-- /SECTION -->
</section>

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>
<script>
    // Set the date we're counting down to
    var countDownDate = new Date();
    countDownDate.setDate(countDownDate.getDate() + 7);

    // Update the count down every 1 second
    var x = setInterval(function () {

        // Get today's date and time
        var now = new Date().getTime();

        // Find the distance between now and the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Output the result in an element with id="demo"
        document.getElementById("day").innerHTML = days;
        document.getElementById("hours").innerHTML = hours;
        document.getElementById("mins").innerHTML = minutes;
        document.getElementById("sec").innerHTML = seconds;

        // If the count down is over, write some text 
        if (distance <= 0) {
            document.getElementById("day").innerHTML = 0;
            document.getElementById("hours").innerHTML = 0;
            document.getElementById("mins").innerHTML = 0;
            document.getElementById("sec").innerHTML = 0;
            clearInterval(x);
            document.getElementById("Notice").innerHTML = "HOT DEAL IS OVER <(＿　＿)>";
        }
    }, 1000);
</script>


<script>
    const loader = document.querySelector('.loader');
    const main = document.querySelector('.main');
    function init()
    {
        setTimeout(() => {
            loader.style.opacity = 0;
            loader.style.display = 'none';

            main.style.display = 'block';
            setTimeout(() => (main.style.opacity = 1), 100);
        }, 2500);
    }

    init();
</script>

<script>

</script>
</body>

</html>

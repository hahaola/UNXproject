<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>${productD.nameP} Detail Page</title>

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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- Product main img -->
                        <div class="col-md-5 col-md-push-0">
                            <div id="product-main-img">
                                <div class="product-preview">
                                    <img src="${productD.image}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${productD.nameP}</h2>
                            <div>
                                <div class="product-rating">
                                    <i style="color: #000000; z-index: 1">${productD.rating}</i>
                                    <c:forEach var="i" begin="1" end="${productD.rating}">
                                        <i class="fa fa-star"></i>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${productD.rating < 5 && productD.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                        <c:when test="${productD.rating < 4 && productD.rating >=3}">
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </c:when>
                                        <c:when test="${productD.rating < 3 && productD.rating >=2}">
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </c:when>
                                        <c:when test="${productD.rating < 2 && productD.rating >=1}">
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </c:when>
                                        <c:when test="${productD.rating == 0 && productD.rating < 1}">
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <a class="review-link" href="#">10 Review(s) | Add your review</a>
                            </div>

                            <div>
                                <c:forEach items="${PNew}" var="np">
                                    <c:choose>
                                        <c:when test="${np.PID == productD.PID}">
                                            <h4 class="product-price">${productD.price/2} <del class="product-old-price">${productD.price}</del></h4>
                                            </c:when >   
                                        </c:choose>
                                    </c:forEach>

                                <c:forEach items="${POld}" var="onp">
                                    <c:choose>
                                        <c:when test="${onp.PID == productD.PID}">
                                            <h4 class="product-price">${productD.price}</h4>
                                        </c:when >   
                                    </c:choose>
                                </c:forEach>    

                                <span class="product-available">In Stock</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

                            <div class="add-to-cart">
                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i><a href="CartServlet?id=${productD.PID}">Ordered</a></button>
                            </div>

                            <ul class="product-links">
                                <li>Category:</li>
                                    <c:forEach items="${allC}" var="cList">
                                        <c:if test="${productD.categoryID == cList.categoryID}">
                                        <li><a href="StoreCategoryServlet?page=1&cid=${productD.categoryID}&sort=all">${cList.categoryName}</a></li>
                                        </c:if>
                                    </c:forEach>
                            </ul>

                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                                <li><a data-toggle="tab" href="#tab2">Details</a></li>
                                <li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->

                                <!-- tab2  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab2  -->

                                <!-- tab3  -->
                                <div id="tab3" class="tab-pane fade in">
                                    <div class="row">
                                        <!-- Rating -->
                                        <div class="col-md-3">
                                            <div id="rating">
                                                <div class="rating-avg">
                                                    <span>${productD.rating}</span>
                                                    <c:forEach var="i" begin="1" end="${productD.rating}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:choose>
                                                        <c:when test="${productD.rating < 5 && productD.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                                        <c:when test="${productD.rating < 4 && productD.rating >=3}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${productD.rating < 3 && productD.rating >=2}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${productD.rating < 2 && productD.rating >=1}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${productD.rating == 0 && productD.rating < 1}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <ul class="rating">
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: 80%;"></div>
                                                        </div>
                                                        <span class="sum">3</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: 60%;"></div>
                                                        </div>
                                                        <span class="sum">2</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Rating -->

                                        <!-- Reviews -->
                                        <div class="col-md-6">
                                            <div id="reviews">
                                                <ul class="reviews">
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="reviews-pagination">
                                                    <li class="active">1</li>
                                                    <li><a href="#">2</a></li>
                                                    <li><a href="#">3</a></li>
                                                    <li><a href="#">4</a></li>
                                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Reviews -->

                                        <!-- Review Form -->
                                        <div class="col-md-3">
                                            <div id="review-form">
                                                <form class="review-form">
                                                    <input class="input" type="text" placeholder="Your Name">
                                                    <input class="input" type="email" placeholder="Your Email">
                                                    <textarea class="input" placeholder="Your Review"></textarea>
                                                    <div class="input-rating">
                                                        <span>Your Rating: </span>
                                                        <div class="stars">
                                                            <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                            <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                            <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                            <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                            <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                        </div>
                                                    </div>
                                                    <button class="primary-btn">Submit</button>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- /Review Form -->
                                    </div>
                                </div>
                                <!-- /tab3  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->


        <!--Relate product-->
        <!-- Section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">Related Products</h3>
                        </div>
                    </div>

                    <c:forEach items="${relatePNew}" var="rpn">
                        <c:if test="${rpn.stock == true}">
                            <!-- product -->
                            <div class="col-md-3 col-xs-6">
                                <div class="product">
                                    <div class="product-img">
                                        <img style="height: 230px" src="${rpn.image}" alt="">
                                        <div class="product-label">
                                            <span class="sale">-50%</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <c:forEach items="${allC}" var="cList">
                                            <c:if test="${rpn.categoryID == cList.categoryID}">
                                                <p class="product-category">${cList.categoryName}</p>
                                            </c:if>
                                        </c:forEach>

                                        <h3 class="product-name"><a href="Detail?pid=${rpn.PID}">${rpn.nameP}</a></h3>

                                        <h4 class="product-price">${rpn.price/2} <del class="product-old-price">${rpn.price}</del></h4>

                                        <div class="product-rating">
                                            <i style="color: #000000; z-index: 15">${rpn.rating}</i>
                                            <c:forEach var="i" begin="1" end="${rpn.rating}">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${rpn.rating < 5 && rpn.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                                <c:when test="${rpn.rating < 4 && rpn.rating >=3}">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </c:when>
                                                <c:when test="${rpn.rating < 3 && rpn.rating >=2}">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </c:when>
                                                <c:when test="${rpn.rating < 2 && rpn.rating >=1}">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </c:when>
                                                <c:when test="${rpn.rating == 0 && rpn.rating < 1}">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="product-btns">
                                            <button><a class="add-to-wishlist" href="Work_In_Progress.jsp"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></a></button>
                                            <button><a class="quick-view" href="Detail?pid=${rpn.PID}"><i class="fa fa-eye"></i><span class="tooltipp">View</span></a></button>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <a href="CartServlet?id=${rpn.PID}" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Ordered</a>
                                    </div>
                                </div>
                            </div>
                            <!-- /product -->
                        </c:if>
                    </c:forEach>

                    <c:forEach items="${relatePOld}" var="rpo">
                        <c:if test="${rpo.stock == true}">
                            <!-- product -->
                            <div class="col-md-3 col-xs-6">
                                <div class="product">
                                    <div class="product-img">
                                        <img style="height: 230px" src="${rpo.image}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <c:forEach items="${allC}" var="cList">
                                            <c:if test="${rpo.categoryID == cList.categoryID}">
                                                <p class="product-category">${cList.categoryName}</p>
                                            </c:if>
                                        </c:forEach>

                                        <h3 class="product-name"><a href="Detail?pid=${rpo.PID}">${rpo.nameP}</a></h3>

                                        <h4 class="product-price">${rpo.price}</h4>

                                        <div class="product-rating">
                                            <i style="color: #000000; z-index: 15">${rpo.rating}</i>
                                            <c:forEach var="i" begin="1" end="${rpo.rating}">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${rpo.rating < 5 && rpo.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                                <c:when test="${rpo.rating < 4 && rpo.rating >=3}">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </c:when>
                                                <c:when test="${rpo.rating < 3 && rpo.rating >=2}">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </c:when>
                                                <c:when test="${rpo.rating < 2 && rpo.rating >=1}">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </c:when>
                                                <c:when test="${rpo.rating == 0 && rpo.rating < 1}">
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="product-btns">
                                            <button><a class="add-to-wishlist" href="Work_In_Progress.jsp"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></a></button>
                                            <button><a class="quick-view" href="Detail?pid=${rpo.PID}"><i class="fa fa-eye"></i><span class="tooltipp">View</span></a></button>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <a href="CartServlet?id=${rpo.PID}" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Ordered</a>
                                    </div>
                                </div>
                            </div>
                            <!-- /product -->
                        </c:if>
                    </c:forEach>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /Section -->

        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
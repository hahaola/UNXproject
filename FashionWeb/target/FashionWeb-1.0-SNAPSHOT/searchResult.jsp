<%@page import="java.text.NumberFormat"%>
<%@page import="DAO.FashionDAO"%>
<%@page import="model.Product"%>
<%@page import="model.category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Store Page</title>

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
            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="breadcrumb-tree">
                                <li><a href="HomeServlet">Home</a></li>
                                <li><a href="HomeStoreServlet?page=1&sort=all">Categories</a></li>
                                <c:if test="${not empty cid}">
                                    <c:forEach items="${categoryList}" var="cList">
                                        <c:if test="${cid == cList.categoryID}">
                                        <li><a href="StoreCategoryServlet?page=1&cid=${cid}&sort=all">${cList.categoryName}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Categories</h3>
                            <div class="checkbox-filter">
                                <div>
                                    <a href="HomeStoreServlet?page=1&sort=all" style="font-size: 18px">All Categories</a>
                                </div>
                                <%
                                    FashionDAO d = new FashionDAO();
                                    List<category> cl = d.getAllCategory();
                                %>
                                <%  for (int i = 0; i < cl.size(); i++) {%>
                                <div>
                                    <a href="StoreCategoryServlet?page=1&cid=<%=cl.get(i).getCategoryID()%>&sort=all" id="categoriesStyle" style="font-size: 18px"><%=cl.get(i).getCategoryName()%></a>
                                </div>
                                <% }%>
                            </div>
                        </div>
                        <hr class="solid" style="border-top: 3px solid #bbb;">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">New Product</h3> 
                            <%
                                List<Product> pl = d.getNewProduct();
                                Locale vn = new Locale("vi", "VN");
                                NumberFormat vndFormat = NumberFormat.getCurrencyInstance(vn);
                            %>
                            <%  for (Product p : pl) {%>
                            <% if (p.isStock() == true) {%>
                            <div class="product-widget">

                                <div class="product-img">
                                    <img src="<%=p.getImage()%>" alt="">
                                </div>
                                <div class="product-body">      
                                    <%  for (category c : cl) {%>
                                    <% if (p.getCategoryID().equals(c.getCategoryID())) {%>
                                    <p class="product-category"><%= c.getCategoryName()%></p>
                                    <%}%>
                                    <% }%>
                                    <h3 class="product-name"><a href="Detail?pid=<%=p.getPID()%>"><%=p.getNameP()%></a></h3>
                                    <h4 class="product-price"> <%= vndFormat.format(p.getPrice() / 2)%> <del class="product-old-price"> <%=vndFormat.format(p.getPrice())%> </del></h4>
                                </div>
                            </div>
                            <%}%>
                            <% }%>

                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">

                        <!-- store products -->
                        <div class="row">
                            <!-- product -->


                            <c:forEach items="${listP}" var="product" >
                                <c:if test="${product.stock == true}">
                                    <div class="col-md-4 col-xs-6">
                                        <div class="product">
                                            <div class="product-img">
                                                <img style="height: 230px" src="${product.image}" alt="">
                                                <div class="product-label">
                                                    <c:forEach items="${newP}" var="np">
                                                        <c:if test="${product.PID == np.PID}">
                                                            <span class="sale">-50%</span>
                                                            <span class="new">NEW</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="Detail?pid=${product.PID}">${product.nameP}</a></h3>
                                                    <c:forEach items="${newP}" var="np">
                                                        <c:if test="${product.PID == np.PID}">
                                                        <h4 class="product-price">
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value = "${product.price/2}" type = "currency"/> 
                                                            <del class="product-old-price">
                                                                <fmt:setLocale value = "vi_VN"/>
                                                                <fmt:formatNumber value = "${product.price}" type = "currency"/> 
                                                            </del>
                                                        </h4>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${oldP}" var="op">
                                                    <c:if test="${product.PID == op.PID}">
                                                        <h4 class="product-price">
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value = "${product.price}" type = "currency"/> 
                                                        </h4>
                                                    </c:if>
                                                </c:forEach>

                                                <div class="product-rating">
                                                    <i style="color: #000000; z-index: 15">${product.rating}</i>
                                                    <c:forEach var="i" begin="1" end="${product.rating}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:choose>
                                                        <c:when test="${product.rating < 5 && product.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                                        <c:when test="${product.rating < 4 && product.rating >=3}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${product.rating < 3 && product.rating >=2}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${product.rating < 2 && product.rating >=1}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${product.rating == 0 && product.rating < 1}">
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
                                                    <button><a class="quick-view" href="Detail?pid=${product.PID}"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></a></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <a href="CartServlet?id=${product.PID}" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Ordered</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <!-- /product -->
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">
                            <c:if test="${pageSize > 1}">
                                <ul class="store-pagination">
                                    <c:if test="${page >= 1}">
                                        <li><a href="SearchProductServlet?page=${page}&search=${search}"><i class="fa fa-angle-left"></i></a></li>
                                            </c:if>
                                            <c:if test="${page < 1}">
                                        <li><a href="SearchProductServlet?page=${page}&search=${search}"><i class="fa fa-angle-left"></i></a></li>
                                            </c:if>

                                    <c:forEach var="i" begin="1" end="${pageSize}">
                                        <li><a href="SearchProductServlet?page=${i}&search=${search}">${i}</a></li>
                                        </c:forEach>

                                    <c:if test="${page < pageSize}">
                                        <li><a href="SearchProductServlet?page=${page+1}&search=${search}"><i class="fa fa-angle-right"></i></a></li>
                                            </c:if>
                                            <c:if test="${page >= pageSize}">
                                        <li><a href="SearchProductServlet?page=${page}&search=${search}"><i class="fa fa-angle-right"></i></a></li>
                                            </c:if>
                                </ul>
                            </c:if>
                        </div>
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

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


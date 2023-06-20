<%@page import="DAO.FashionDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <link rel="icon" href="img/icon_group.png" type="image/icon type">

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css
              <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!--Icon bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

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

            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="breadcrumb-header">Checkout</h3>
                            <ul class="breadcrumb-tree">
                                <li><a href="HomeServlet">Home</a></li>
                                <li class="active">Checkout</li>
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

                        <div class="col-md-7">
                            <!-- Billing Details -->
                            <div class="billing-details">
                                <div class="section-title">
                                    <h3 class="title">Billing address</h3>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="first-name" placeholder="First Name">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="last-name" placeholder="Last Name">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="address" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="city" placeholder="City">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="country" placeholder="Country">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="zip-code" placeholder="ZIP Code">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="tel" name="tel" placeholder="Telephone">
                                </div>
                            </div>
                            <!-- /Billing Details -->
                        </div>

                        <!-- Order Details -->
                        <div class="col-md-5 order-details">
                            <div class="section-title text-center">
                                <h3 class="title">Your Order</h3>
                            </div>
                            <div class="order-summary">
                                <div class="order-col">
                                    <div><strong>PRODUCT</strong></div>

                                    <div><strong>Total</strong></div>

                                </div>
                                <div class="order-products">
                                <c:set value="${listP}" var="list"/>
                                <c:forEach items="${list}" var="p">
                                    <div class="order-col">
                                        <div>${p.nameP}</div>
                                        <div>
                                            <a href="SubtractCartServlet?id=${p.PID}"><button class="btnSub">-</button></a> 
                                            <strong>${p.quantity}</strong>
                                            <a href="CartServlet?id=${p.PID}"><button class="btnAdd">+</button></a>
                                        </div>
                                        <div>
                                            <a href="RemoveProduct?id=${p.PID}">
                                                <button type="button" id="buttonDelete">
                                                    <span><i class="bi bi-trash"></i></span>
                                                </button>
                                            </a>
                                        </div>
                                        <div>
                                            <%
                                                FashionDAO d = new FashionDAO();
                                                List<Product> cl = d.getNewProduct();
                                                List<Product> allP = d.getAllProduct();
                                                List<String> arr = new ArrayList<>();
                                                for (int i = 0; i < allP.size(); i++) {
                                                    for (int j = 0; j < cl.size(); j++) {
                                                        if (allP.get(i).getPID().equals(cl.get(j).getPID())) {
                                                            arr.add(allP.get(i).getPID());
                                                        }
                                                    }
                                                }

                                                for (int i = 0; i < allP.size(); i++) {
                                                    for (int j = 0; j < arr.size(); j++) {
                                                        if (allP.get(i).getPID().equals(arr.get(j))) {
                                                            allP.remove(i);
                                                        }
                                                    }
                                                }
                                                request.setAttribute("cl", cl);
                                                request.setAttribute("oldP", allP);
                                            %>
                                            <c:forEach items="${cl}" var="c">
                                                <c:if  test="${p.PID == c.getPID()}">
                                                    <p>${(p.price/2) * p.quantity}</p>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${oldP}" var="old">
                                                <c:if  test="${p.PID == old.getPID()}">
                                                    <p>${(p.price * 1.0) * p.quantity}</p>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="order-col">
                                <div>Shiping</div>
                                <div><strong>FREE</strong></div>
                            </div>
                            <div class="order-col">
                                <div><strong>TOTAL</strong></div>
                                <div><strong class="order-total">${total}</strong></div>
                            </div>
                        </div>

                        <div class="payment-method">
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-1" value="bank_direct">
                                <label for="payment-1">
                                    <span></span>
                                    Visa Payment
                                </label>
                                <div class="caption">
                                    <form action="">
                                        <table style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>Card number:</th>
                                                    <th>Expiration date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="text" name="visa"></td>
                                                    <td>
                                                        <input type="month" placeholder="MM">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br>
                                        Security Code: <input type="number" name="visa">

                                    </form>
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-2" value="cheque">
                                <label for="payment-2">
                                    <span></span>
                                    Cheque Payment
                                </label>
                                <div class="caption">
                                    <form action=""> 
                                        <table style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>Date</th>
                                                    <th>Pay:</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="date">
                                                    </td>
                                                    <td><input type="text" name="pay"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br> <input type="number" placeholder="VND">
                                    </form>
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-3" value="Paypal">
                                <label for="payment-3">
                                    <span></span>
                                    MasterCard Payment
                                </label>
                                <div class="caption">
                                    <form action="">
                                        <table style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>Card number:</th>
                                                    <th>Expiration date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="text" name="master"></td>
                                                    <td>
                                                        <input type="month" placeholder="MM">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br>
                                        Security Code: <input type="number" name="master">

                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="input-checkbox">
                            <input type="checkbox" id="terms">
                            <label for="terms">
                                <span></span>
                                I've read and accept the <a href="TermAndCondition.jsp" class="termsAndConditions">terms & conditions</a>
                            </label>
                        </div>
                        <a href="PayServlet" class="primary-btn order-submit">Place order</a>
                    </div>
                    <!-- /Order Details -->
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


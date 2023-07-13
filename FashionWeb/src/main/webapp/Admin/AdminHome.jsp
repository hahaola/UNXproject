<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="DAO.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link  type="text/css" rel="stylesheet" href="css/AdminStyle.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <title>Admin Page</title>

    </head>
    <body id="mainAdmin">   
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="AdminHome">
                <img src="img/logoGoodTaste.png" alt="" width="35" class="d-inline-block align-text-top">
                ADMIN PAGE
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <div class="nav nav-tabs" id="tab-nav" roll="tablist">
                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">
                        Account
                    </button>

                    <a href="AdminShowProduct?page=1" class="nav-link">Product</a>
                    <a href="AdminShowCategory" class="nav-link">Category</a>

                    <button class="nav-link" id="nav-bill-tab" data-bs-toggle="tab" data-bs-target="#nav-bill" type="button" role="tab" aria-controls="nav-bill" aria-selected="false">
                        Bill Order
                    </button>

                    <button class="nav-link" id="nav-chart-tab" data-bs-toggle="tab" data-bs-target="#nav-chart" type="button" role="tab" aria-controls="nav-chart" aria-selected="false">
                        Chart
                    </button>
                </div>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Hello ${NAME.username}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                            <li><a class="dropdown-item" href="AdminUpdateAccount?accID=${NAME.accID}">Update Account</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li class="nav-item">
                                <a class="dropdown-item" href="HomeServlet">Home Page</a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a  href="AdminAddNewAccount.jsp" class="dropdown-item">Create New Account</a></li>
                            <li><a  href="AdminAddNewProduct.jsp" class="dropdown-item">Add New Product</a></li>
                            <li><a  href="AdminAddCategory.jsp" class="dropdown-item">Add New Category</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                        </ul>
                    </li>
                </ul>

            </div>
        </nav>

        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active p-1" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <div class="container-lg mt-3">
                    <div class="row justify-content-center">
                        <div class="col-md-10">
                            <div>
                                <table class="table table-primary table-bordered border-light table-hover shadow-lg">
                                    <thead class="table-light">
                                        <tr class="text-center">
                                            <td>Account ID</td>
                                            <td>UserName</td>
                                            <td>Password</td>
                                            <td>Full name</td>
                                            <td>Role</td>
                                            <td>Status</td>
                                            <td colspan="2">Action</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="u" value="${USERLIST}" scope="session"/>
                                        <c:forEach items="${u}" var="ul"> 
                                            <c:if test="${ul.accID != NAME.accID}">
                                                <c:if test="${ul.roleID == 'R02'}">
                                                    <tr>
                                                        <td class="text-center">${ul.accID}</td>

                                                        <td class="text-center">${ul.username}</td>

                                                        <td class="text-center">${ul.password}</td>

                                                        <td class="text-center"> ${ul.fullname}</td>

                                                        <c:set var="role" value="${role}" scope="session"/>
                                                        <c:forEach items="${role}" var="role">
                                                            <c:if test="${role.RID == ul.roleID}">
                                                                <td class="text-center">${role.getRname()}</td>
                                                            </c:if>
                                                        </c:forEach>

                                                        <c:if test="${ul.isStatus == true}">
                                                            <td class="text-center">Active</td>
                                                        </c:if>
                                                        <c:if test="${ul.isStatus == false}">
                                                            <td class="text-center">Inactive</td>
                                                        </c:if>

                                                        <td class="text-center d-grid gap-2">
                                                            <a class="btn btn-outline-danger" href="AdminDeleteAccount?accID=${ul.accID}">Delete</a>
                                                            <a class="btn btn-outline-success" href="AdminRecoverAccount?accID=${ul.accID}">Recover</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>

            <div class="tab-pane fade p-3" id="nav-bill" role="tabpanel" aria-labelledby="nav-bill-tab">

                <div class="container-lg mt-5">
                    <div class="row justify-content-center">
                        <div class="col-lg">
                            <div>
                                <table class="table table-primary table-bordered border-light table-hover shadow-lg">
                                    <thead class="table-light">
                                        <tr class="text-center">
                                            <td>Order ID</td>
                                            <td>Account ID</td>
                                            <td>Total</td>
                                            <td>Date Order</td>
                                            <td>Is Ship</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${billOrder}" var="order">
                                            <tr>
                                                <td class="text-center"><a href="AdminDetailBillServlet?oid=${order.OID}" class="text-decoration-none text-danger fw-bold">${order.OID}</a></td>
                                                    <c:set var="u" value="${USERLIST}" scope="session"/>
                                                    <c:forEach items="${u}" var="ul">
                                                        <c:if test="${ul.accID == order.accID}">
                                                        <td class="text-center">${ul.fullname}</td>
                                                    </c:if>
                                                </c:forEach>

                                                <td class="text-center"> 
                                                    <fmt:setLocale value = "vi_VN"/>
                                                    <fmt:formatNumber value = "${order.totalBill}" type = "currency"/>
                                                </td>
                                                <td class="text-center">${order.dateOrder}</td>
                                                <td class="text-center" id="shipping-${order.OID}">
                                                    <c:if test="${order.isIsShip() == false}">

                                                        <a onclick="shippingActive('${order.OID}')"><img src="img/shipping.png" alt="alt" style="width: 24px"/></a>
                                                        </c:if>
                                                        <c:if test="${order.isIsShip() ==true}">
                                                        <a><img src="img/shipping-success.png" alt="alt" style="width: 24px"/></a>
                                                        </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>                
                    </div>
                </div>
            </div>

            <div class="tab-pane fade p-3" id="nav-chart" role="tabpanel" aria-labelledby="nav-chart-tab">

                <div class="container-lg mt-5">
                    <div class="row justify-content-center">
                        <div class="col-lg bg-light">
                            <canvas id="myChart"></canvas>
                        </div>                
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <script scr="js/script.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.4.0/axios.min.js" integrity="sha512-uMtXmF28A2Ab/JJO2t/vYhlaa/3ahUOgj1Zf27M5rOo8/+fcTUVH0/E0ll68njmjrLqOBjXM3V9NiPFL5ywWPQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="js/chart/chart-area.js"></script>
        <script>
                                                            function shippingActive(id)
                                                            {
                                                                $('#shipping-' + id).empty().append("<a><img src=\"img/shipping-success.png\" alt=\"alt\" style=\"width: 24px\"/></a>")
                                                                $.ajax({
                                                                    type: 'POST',
                                                                    url: 'http://localhost:8080/FashionWeb/AdminChangeOrderShip',
                                                                    data: {
                                                                        oid: id,
                                                                        isShip: true
                                                                    },
                                                                    error: function ()
                                                                    {
                                                                        console.log("ERROR");
                                                                    },
                                                                    success: function (data)
                                                                    {
                                                                        console.log("SUCCESS");
                                                                    }
                                                                })
                                                            }
        </script>
    </body>
</html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link  type="text/css" rel="stylesheet" href="css/AdminStyle.css"/>
        <title>Page Detail Order ${id}</title>
    </head>
    <body id="mainAdmin">
        <jsp:include page="AdminHeader.jsp"></jsp:include>

            <div class="container-lg mt-5">
                <div class="row justify-content-center">
                    <div class="col-lg">
                        <div>
                            <h5 class="fs-1">Detail Order ${id}</h5>
                    </div>
                    <div>
                        <table class="table table-primary table-bordered border-light table-hover">
                            <thead class="table-light">
                                <tr class="text-center">
                                    <td>Order ID</td>
                                    <td>Product ID</td>
                                    <td>Quantity</td>
                                    <td>Total</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${orderList}" var="order">
                                    <tr>
                                        <td class="text-center">${order.OID}</td>
                                        <td class="text-center"> ${order.pid}</td>
                                        <td class="text-center">${order.getOquantity()}</td>
                                        <td class="text-center">
                                            <fmt:setLocale value = "vi_VN"/>
                                            <fmt:formatNumber value = "${order.totalMoney}" type = "currency"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
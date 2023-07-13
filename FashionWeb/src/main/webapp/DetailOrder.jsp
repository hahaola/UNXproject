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
        <title>Page Detail Order ${id}</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Source+Code+Pro:200');

            body  {
                background-image: url('https://static.pexels.com/photos/414171/pexels-photo-414171.jpeg');
                background-size:cover;
                -webkit-animation: slidein 100s;
                animation: slidein 100s;

                -webkit-animation-fill-mode: forwards;
                animation-fill-mode: forwards;

                -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;

                -webkit-animation-direction: alternate;
                animation-direction: alternate;
            }

            @-webkit-keyframes slidein {
                from {
                    background-position: top;
                    background-size:3000px;
                }
                to {
                    background-position: -100px 0px;
                    background-size:2750px;
                }
            }

            @keyframes slidein {
                from {
                    background-position: top;
                    background-size:3000px;
                }
                to {
                    background-position: -100px 0px;
                    background-size:2750px;
                }

            }
        </style>
    </head>
    <body>
        <jsp:include page="headerBill.jsp"></jsp:include>
            <div class="center" >
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
                                                <fmt:formatNumber value = "${order.totalMoney}" type = "currency"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>                
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <script>
            var particles = document.getElementById("particles");

            function main() {
                var np = document.documentElement.clientWidth / 29;
                particles.innerHTML = "";
                for (var i = 0; i < np; i++) {
                    var w = document.documentElement.clientWidth;
                    var h = document.documentElement.clientHeight;
                    var rndw = Math.floor(Math.random() * w) + 1;
                    var rndh = Math.floor(Math.random() * h) + 1;
                    var widthpt = Math.floor(Math.random() * 8) + 3;
                    var opty = Math.floor(Math.random() * 5) + 2;
                    var anima = Math.floor(Math.random() * 12) + 8;

                    var div = document.createElement("div");
                    div.classList.add("particle");
                    div.style.marginLeft = rndw + "px";
                    div.style.marginTop = rndh + "px";
                    div.style.width = widthpt + "px";
                    div.style.height = widthpt + "px";
                    div.style.background = "white";
                    div.style.opacity = opty;
                    div.style.animation = "move " + anima + "s ease-in infinite ";
                    particles.appendChild(div);
                }
            }
            window.addEventListener("resize", main);
            window.addEventListener("load", main);

        </script>
    </body>
</html>

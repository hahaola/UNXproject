<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>Bill Page</title>
        <style>
            @import url(//fonts.googleapis.com/css?family=Lato:300:400);

            body {
                margin:0;
            }

            h1 {
                font-family: 'Lato', sans-serif;
                font-weight:300;
                letter-spacing: 2px;
                font-size:48px;
            }
            p {
                font-family: 'Lato', sans-serif;
                letter-spacing: 1px;
                font-size:14px;
                color: #333333;
            }

            .header {
                position:relative;
                text-align:center;
                background: linear-gradient(60deg, rgba(84,58,183,1) 0%, rgba(0,172,193,1) 100%);
                color:white;
            }

            .inner-header {
                height:65vh;
                width:100%;
                margin: 0;
                padding: 0;
            }



            .waves {
                position:relative;
                width: 100%;
                height:15vh;
                margin-bottom:-7px; /*Fix for safari gap*/
                min-height:100px;
                max-height:150px;
            }

            .content {
                position:relative;
                height:20vh;
                text-align:center;
                background-color: white;
            }

            /* Animation */

            .parallax > use {
                animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
            }
            .parallax > use:nth-child(1) {
                animation-delay: -2s;
                animation-duration: 7s;
            }
            .parallax > use:nth-child(2) {
                animation-delay: -3s;
                animation-duration: 10s;
            }
            .parallax > use:nth-child(3) {
                animation-delay: -4s;
                animation-duration: 13s;
            }
            .parallax > use:nth-child(4) {
                animation-delay: -5s;
                animation-duration: 20s;
            }
            @keyframes move-forever {
                0% {
                    transform: translate3d(-90px,0,0);
                }
                100% {
                    transform: translate3d(85px,0,0);
                }
            }
            /*Shrinking for mobile*/
            @media (max-width: 768px) {
                .waves {
                    height:40px;
                    min-height:40px;
                }
                .content {
                    height:30vh;
                }
                h1 {
                    font-size:24px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="headerBill.jsp"></jsp:include>

            <div class="header">

                <!--Content before waves-->
                <div class="inner-header flex">
                    <div >

                        <div class="container-lg">
                            <div class="row justify-content-center">
                                <div class="col-lg-12 mt-5">
                                    <div>
                                        <table class="table table-primary table-bordered border-light table-hover">
                                            <thead class="table-dark">
                                                <tr class="text-center">
                                                    <td>Order ID</td>
                                                    <td>Total</td>
                                                    <td>Date Order</td>
                                                    <td>Address</td>
                                                    <td>Is Paid</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${billOrder}" var="order">
                                                <tr>
                                                    <td class="text-center"><a href="DetailBillServlet?oid=${order.OID}" class="text-decoration-none text-danger fw-bold">${order.OID}</a></td>
                                                    <td class="text-center">                                             
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "${order.totalBill}" type = "currency"/></td>
                                                    <td class="text-center">${order.dateOrder}</td>
                                                    <td class="text-center">${order.address}</td>
                                                    <td class="text-center">${order.isShip == true? 'Paid' : 'Not Yet'}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>                
                        </div>
                    </div>
                </div>
            </div>

            <!--Waves Container-->
            <div>
                <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                     viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
                <defs>
                <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
                </defs>
                <g class="parallax">
                <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
                <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
                <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
                <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
                </g>
                </svg>
            </div>
            <!--Waves end-->

        </div>
        <!--Header ends-->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </body>
</html>

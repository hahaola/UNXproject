<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <title>JSP Page</title>

        <style>
            body {
                font-family: 'Josefin Sans', sans-serif;
                box-sizing: border-box;
            }
            .container-fluid{
                height: 100%;
                margin: 0;
                padding: 0;
                width: 100%;
                background: #FFF;
            }
            /* ============= Animation background ========= */
            .background {
                background: linear-gradient(132deg, #FC415A, #591BC5, #212335);
                background-size: 400% 400%;
                animation: Gradient 15s ease infinite;
                position: relative;
                height: 100vh;
                width: 100%;
                overflow: hidden;
                padding:0;
                margin:0px;
            }
            .cube {
                position: absolute;
                top: 80vh;
                left: 45vw;
                width: 10px;
                height: 10px;
                border: solid 1px #D7D4E4;
                transform-origin: top left;
                transform: scale(0) rotate(0deg) translate(-50%, -50%);
                animation: cube 12s ease-in forwards infinite;
            }
            .cube:nth-child(2n) {
                border-color: #FFF ;
            }
            .cube:nth-child(2) {
                animation-delay: 2s;
                left: 25vw;
                top: 40vh;
            }
            .cube:nth-child(3) {
                animation-delay: 4s;
                left: 75vw;
                top: 50vh;
            }
            .cube:nth-child(4) {
                animation-delay: 6s;
                left: 90vw;
                top: 10vh;
            }
            .cube:nth-child(5) {
                animation-delay: 8s;
                left: 10vw;
                top: 85vh;
            }
            .cube:nth-child(6) {
                animation-delay: 10s;
                left: 50vw;
                top: 10vh;
            }
            /* ================= Header ============ */
            header{
                position: absolute;
                top:0%;
                left: 0%;
                width:100%;
                margin: 0;
                padding: 0;
            }
            /* navbar */
            nav{
                color: #FFF;
                float: right;
                margin:30px 90px;
            }
            nav ul{
                list-style: none;
            }
            nav ul li {
                float: left;
                transition: .3s;
            }
            nav ul li a{
                text-decoration: none;
                color: #EFEEF5;
                transition: .5;
                font-size: 15px;
                margin-left:16px;
            }
            nav ul li:hover a{
                text-decoration: none;
                color: #591BC5;
                ;
            }
            nav ul li:hover{
                height: 45px;
                padding-top: 30px;
                margin-top: -30px;
                background: #EFEEF5;
                text-decoration: none;
                transform: skew(15deg);
            }
            /* Logo */
            .logo{
                width: 35px;
                height: 35px;
                background: #EFEEF5;
                margin: 40px 63px;
                float: left;
                transform: rotate(-30deg);
            }
            .logo span{
                color: #591BC5;
                font-size: 2em;
                line-height: 1.4;
                padding-left: 5px;
                font-weight: bold;
            }
            /* Header content & title & button*/
            .header-content{
                margin-top:5%;
                color:  #EFEEF5;
            }
            .header-content h1{
                text-transform: uppercase;
                font-size: 3em;
                letter-spacing: 1px;
            }
            .header-content p {
                font-size: 20px;
                line-height: 1.5;
                margin: 20px auto;
            }
            .header-content button{
                width: 200px;
                margin:20px 10px;
                color: #591BC5;
                font-size: 17px;
                border:1px solid #EFEEF5;
                font-weight: 500;
                background: #EFEEF5;
                border-radius: 20px;
                padding: 10px;
                cursor:pointer;
                transition: .3s;
            }
            .header-content button:hover{
                border-radius: 0;
            }
            /* Animate Background*/
            @keyframes Gradient {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }
            @keyframes cube {
                from {
                    transform: scale(0) rotate(0deg) translate(-50%, -50%);
                    opacity: 1;
                }
                to {
                    transform: scale(20) rotate(960deg) translate(-50%, -50%);
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body>

        <div class="container-fluid">
            <!-- Background animtion-->
            <div class="background">
                <div class="cube"></div>
                <div class="cube"></div>
                <div class="cube"></div>
                <div class="cube"></div>
                <div class="cube"></div>
            </div>
            <!-- header -->
            <header>
                <section class="header-content">

                    <div class="container-md">

                        <div class="possition-relative">
                            <div class="position-absolute top-0 start-50 translate-middle-x">
                                <div class="alert alert-warning alert-dismissible fade ${show} text-center" role="alert" style="width:500px">
                                    ${ERROR}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-lg-6 rounded-3" >
                                <h2 class="text-light text-center mt-4">Reset Password</h2>
                                <h5 class="text-light">Email: ${acc.email}</h5>
                                <form action="ChangePassword" method="POST">
                                    <div>
                                        <label class="my-2 text-light">New Password</label>
                                        <input type="password" class="form-control border-dark" value="" name="pass">
                                    </div>
                                    <div>
                                        <label class="my-2 text-light">Confirm Password</label>
                                        <input type="password" class="form-control border-dark" value="" name="cpass">
                                    </div>
                                    <div class="gap-3">
                                        <div class="my-2">
                                            <button type="submit" name="btnAction" value="login" class="btn btn-outline-light">Reset Password</button>
                                        </div>

                                    </div>                         
                                </form> 
                            </div>
                        </div>
                    </div>
                </section>
            </header>   
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    </body>
</html>

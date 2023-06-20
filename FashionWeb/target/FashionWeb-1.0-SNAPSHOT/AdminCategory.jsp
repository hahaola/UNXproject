<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link  type="text/css" rel="stylesheet" href="css/AdminStyle.css"/>
        <title>Category Page</title>
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
                    <a href="AdminHome" class="nav-link">Account</a>

                    <a href="AdminShowProduct?page=1" class="nav-link">Product</a>
                    <a href="AdminShowCategory" class="nav-link active">Category</a>

                    <a href="AdminHome" class="nav-link">Bill Order</a>

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

        <div class="container-mb mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div>
                        <table class="table table-primary table-bordered border-light table-hover">
                            <thead class="table-light">
                                <tr class="text-center">
                                    <td>Category ID</td>
                                    <td>Category Name</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="p" value="${categoryList}" scope="session"/>
                                <c:forEach items="${p}" var="product">
                                    <tr>
                                        <td class="text-center">${product.categoryID}</td>
                                        <td class="text-center">${product.categoryName}</td>

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

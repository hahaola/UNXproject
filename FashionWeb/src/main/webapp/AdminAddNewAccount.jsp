<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link  type="text/css" rel="stylesheet" href="css/AdminStyle.css"/>
        <title>Add New Product Page</title>
    </head>
    <body id="mainAdmin">
        <div class="container mt-5">
            <div class="possition-relative">
                <div class="position-absolute top-0 start-50 translate-middle-x">
                    <div class="alert alert-warning alert-dismissible fade ${show} text-center" role="alert" style="width:500px">
                        ${MESSAGE}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-6 shadow-lg bg-light bg-opacity-75 rounded-3">
                    <div class="text-center mx-3">
                        <h2 class="text-primary">Add New Account</h2>
                    </div>
                    <form action="AdminAddNewAccount" method="post" >
                        <div class="mt-3">
                            <label class="form-label text-dark">Username</label>
                            <input type="text" class="form-control border border-2" name="username" value="" required>                                
                        </div>

                        <div class="my-3">
                            <label class="form-label text-dark">Password</label>
                            <input type="password" class="form-control border border-2" name="password" value="" required>                                                                
                        </div>

                        <div class="my-3">
                            <label class="form-label text-dark">Full Name</label>
                            <input type="text" class="form-control border border-2" name="fullname" value="" required>                                                                
                        </div>
                        
                        <div class="my-3">
                            <label class="form-label text-dark">Email</label>
                            <input type="email" class="form-control border border-2" name="email" value="" required>                                                                
                        </div>

                        <div class="text-center my-3">
                            <button type="submit" class="btn btn-outline-primary" name="submit">Add</button>
                            <a class="btn btn-outline-danger" href="AdminHome">Cancel Add New</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>

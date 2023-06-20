<%@page import="java.util.*"%>
<%@page import="DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link  type="text/css" rel="stylesheet" href="css/AdminStyle.css"/>
        <title>Add New Category Page</title>
    </head>
    <body id="mainAdmin">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="possition-relative">
                    <div class="position-absolute top-0 start-50 translate-middle-x">
                        <div class="alert alert-warning alert-dismissible fade ${show} text-center" role="alert" style="width:500px">
                            ${MESSAGE}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 border border-3 rounded-3 bg-light shadow-lg bg-opacity-75">
                    <div class="text-center">
                        <h2 class="text-dark">Add new category</h2>
                    </div>
                    <form action="AdminAddCategory" method="post">

                        <div class="my-3">
                            <label class="form-label">Category Name </label>
                            <input type="text" class="form-control" name="nameC">                                                                
                        </div>

                        <div class="text-center mb-3">
                            <button type="submit" class="btn btn-outline-primary" >Add New Category</button>
                            <a class="btn btn-outline-secondary" name="submit" href="AdminHome">Cancel Add New</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>                    
    </body>
</html>


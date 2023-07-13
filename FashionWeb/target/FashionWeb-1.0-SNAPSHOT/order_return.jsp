<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VNPAY RESPONSE</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <div class="container-md mt-5">
            <div class="row justify-content-center">
                <div class="table-responsive col-md-8">
                    <div class="header clearfix mb-3">
                        <h3 class="text-muted">VNPAY RESPONSE</h3>
                    </div>
                    <div class="form-group mb-3 row justify-content-between">
                        <label class="col-md-5">Merchant Transaction Code:</label>
                        <label class="col-md-5">${vnp_TxnRef}</label>
                    </div>    
                    <div class="form-group mb-3 row justify-content-between">
                        <label class="col-md-5">Amount:</label>
                        <label class="col-md-5">${vnp_Amount}</label>
                    </div>  
                    <div class="form-group mb-3 row justify-content-between">
                        <label class="col-md-5">Order info:</label>
                        <label class="col-md-5">${vnp_OrderInfo}</label>
                    </div> 
                    <div class="form-group mb-3 row justify-content-between">
                        <label class="col-md-5" >VNPAY Transaction Code:</label>
                        <label class="col-md-5">${vnp_TransactionNo}</label>
                    </div> 
                    <div class="form-group mb-3 row justify-content-between">
                        <label class="col-md-5">Bank Code:</label>
                        <label class="col-md-5">${vnp_BankCode}</label>
                    </div> 
                    <div class="form-group mb-3 row justify-content-between">
                        <label class="col-md-5">Pay Date:</label>
                        <label class="col-md-5">${vnp_PayDate}</label>
                    </div> 
                    <div class="form-group mb-3 row justify-content-between">
                        <label class="col-md-5">Payment Status:</label>

                        <c:if test="${signValue == 1}">
                            <c:if test="${vnp_TransactionStatus eq '00'}">
                                <label class="col-md-5">Success</label>
                            </c:if>
                            <c:if test="${vnp_TransactionStatus != '00'}">
                                <label class="col-md-5">Failed</label>
                            </c:if>
                        </c:if>
                        <c:if test="${signValue == -1 }">
                            <label class="col-md-5">invalid signature </label>
                        </c:if>
                    </div> 
                    <div class="form-group  mb-3">
                        <a href="HomeServlet" class="btn btn-primary">Return to homepage</a>
                    </div>
                </div>
            </div>

        </div>  

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>

    </body>
</html>

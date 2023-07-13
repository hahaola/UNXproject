
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <title>Term & Condition</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1 class="text-primary"> Terms & Conditions</h1>
                <p class= "text-secondary">This page is the demo of the assignment, so don't worry</p>
                <form>
                    <div class="my-2">
                        <input class="form-check-input" name="check" type="checkbox" value="" id="checkBox"  onclick="displayFunc()">
                        <label class="form-check-label fs-6" for="checkBox">Accept the terms and conditions</label>
                    </div>
                </form>
                <div>
                    <img style="display: none;" src="img/Have_a_nice_day.jpg" alt="Have a nice day" class="img-fluid" id="image">
                </div>
                <div>                
                    <a class="btn btn-outline-primary my-3" href="HomeServlet">Return to home page.</a>
                </div>
            </div>
        </div>
        <form action="ajaxServlet" method="post">
            <input name="test"/>
            <button type="submit" id="show">show</button>
        </form>



        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->
        <script>
                            function displayFunc()
                            {
                                var check = document.getElementById("checkBox");
                                var img = document.getElementById("image");
                                console.log(check);
                                if (check.checked === true)
                                {
                                    img.style.display = "block";
                                } else
                                {
                                    img.style.display = "none";
                                }
                            }
        </script>

        <!--        <script>
                    $('#show').on('click', function()
                    {
                        $.ajax({
                           type: 'get',
                           url: 'http://localhost:8080/FashionWeb/ajaxServlet',
                           data:{},
                           error: function()
                           {
                               console.log('error');
                           },
                           success: function(data){
                               console.log(data);
                           }
                        });
                    })
                </script>-->
    </body>
</html>

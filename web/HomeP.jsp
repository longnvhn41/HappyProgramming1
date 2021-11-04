<%-- 
    Document   : HomeP
    Created on : Sep 29, 2021, 7:51:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- <title>@ViewData["Title"] - Exercise</title> -->
        <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="~/css/classlayout.css" />
        <link href="css/ImgHomePage.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="../Jquery/Jquery_core/jquery_min/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <style>
            #sign{
                clear: both;
                display: flex;
            }
            #login {

            }
            #signup{
                background-color: chocolate;
                color: white;
            }

        </style>
          <jsp:include page="Header.jsp"></jsp:include>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/HomeP/pexels-roberto-nickson-2559941.jpg" alt="First slide">
                    <div class="text" style="font-size: 80px">Happy Programming</div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/HomeP/pexels-james-wheeler-417074.jpg" alt="Second slide">
                    <div class="text" style="font-size: 40px">“Chúng ta tạo nên máy tính (hệ thống) như xây một thành phố vậy: trải qua thời gian, không có kế hoạch cụ thể, bắt đầu từ các phế tích”</div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/HomeP/pexels-roberto-nickson-2775196.jpg"  alt="Third slide">
                    <div class="text" style="font-size: 40px">Một lập trình viên mất một tháng để làm xong việc thì với 2 lập trình viên sẽ là 2 tháng</div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="content d-flex">
            <div
                style="height: 500px;border: 5px solid white; background-color: #c1c9d6"
                class="left col-lg-9"
                >
                <div class="item active">
                    <img src="images/HomeP/pexels-james-wheeler-417074.jpg" alt="Los Angeles" style="width:100%; height: 300px">
                </div>
            </div>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="images/HomeP/pexels-james-wheeler-417074.jpg" alt="Los Angeles" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="images/HomeP/pexels-roberto-nickson-2559941.jpg" alt="Chicago" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="images/HomeP/pexels-roberto-nickson-2775196.jpg" alt="New york" style="width:100%;">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
    <script src="~/js/site.js" asp-append-version="true"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
    <!-- @await RenderSectionAsync("Scripts", required: false) -->
</body> 
</html>

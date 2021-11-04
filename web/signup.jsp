<%-- 
    Document   : signup
    Created on : Sep 23, 2021, 12:15:23 AM
    Author     : Nguyen Van Long
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Colorlib Templates">
        <meta name="author" content="Colorlib">
        <meta name="keywords" content="Colorlib Templates">

        <!-- Title Page-->
        <title>Sign Up</title>

        <!-- Icons font CSS-->
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Vendor CSS-->
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/signup.css" rel="stylesheet" media="all">
    </head>
    <body>

        <%
            String mess = (String) request.getAttribute("mess");
            String alert = (String) request.getAttribute("alert");
            String alert1 = (String) request.getAttribute("alert1");
        %>
        <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
            <div class="wrapper wrapper--w680">
                <div class="card card-4">
                    <div class="card-body">
                        <h2 class="title">Registration Form </h2>

                        <c:if test="${mess!=null}">
                            <h4 style="color: red; margin-bottom: 30px"><%=mess%></h4>
                        </c:if>

                        <c:if test="${alert!=null}">
                            <h4 style="color: red; margin-bottom: 30px"><%=alert%></h4>
                        </c:if>
                            
                         <c:if test="${alert1!=null}">
                            <h4 style="color: red; margin-bottom: 30px"><%=alert1%></h4>
                        </c:if>
                            
                        <form action="UserController?service=Signup" method="POST">
                            <div class="input-group">
                                <label class="label">Full name</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <input class="input--style-4" type="text" value="${sessionScope.user.name}" name="fullname">

                                </div>
                            </div>

                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Email</label>
                                        <input class="input--style-4" type="email" value="${sessionScope.user.email}" name="email">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Phone Number</label>
                                        <input class="input--style-4" type="text" value="${sessionScope.user.phone}" name="phone">
                                    </div>
                                </div>
                            </div>
                            <div class="input-group">
                                <label class="label">Username</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <input class="input--style-4" type="text" value="${sessionScope.user.account}" name="username">

                                </div>
                            </div>
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Password</label>
                                        <input class="input--style-4" type="password" value="${sessionScope.user.password}" name="password">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Confirm Password</label>
                                        <input class="input--style-4" type="password" value="${sessionScope.user.password}" name="rpassword">
                                    </div>
                                </div>
                            </div>

                            <div class="row row-space">
                                <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Birthday</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" value="${sessionScope.user.dob}" name="birthday">
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Gender</label>
                                        <div class="p-t-10">
                                            <label class="radio-container m-r-45">Male
                                                <input type="radio" ${sessionScope.user.gender==1?"checked":""} name="gender" value="1">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio-container">Female
                                                <input type="radio" ${sessionScope.user.gender==0?"checked":""} name="gender" value="0">
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="input-group">
                                <label class="label">Address</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <input class="input--style-4" type="text" value="${sessionScope.user.address}" name="address">

                                </div>
                            </div>
                           
                            <div class="p-t-15">
                                <button class="btn btn--radius-2 btn--blue" type="submit">Sign up</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Jquery JS-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Vendor JS-->
        <script src="vendor/select2/select2.min.js"></script>
        <script src="vendor/datepicker/moment.min.js"></script>
        <script src="vendor/datepicker/daterangepicker.js"></script>

        <!-- Main JS-->
        <script src="js/global.js"></script>

    </body>
</html>

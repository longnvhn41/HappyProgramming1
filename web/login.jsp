<%-- 
    Document   : login
    Created on : Sep 23, 2021, 2:04:27 AM
    Author     : Tri
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login V11</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/login_util.css">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <!--===============================================================================================-->
    </head>
    <body>
        <%
            String thongbao=(String)request.getAttribute("thongbao");
            String usernameC=null;
            String passwordC=null;
            Cookie cookies[] = request.getCookies();
            for(Cookie c : cookies){
                if(c.getName().equals("userC")){
                    usernameC = c.getValue();
                }
                if(c.getName().equals("passC")){
                    passwordC = c.getValue();
                }
            }
        %>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
                    <form action="login" method="POST" class="login100-form validate-form" >
                        <span class="login100-form-title p-b-55">
                            Login
                        </span>
                        <c:if test="${thongbao!=null}">
                            <h4 style="color: #e0a800; margin-bottom: 30px"><%=thongbao%></h4>
                        </c:if>
                        <div class="wrap-input100 validate-input m-b-16" >
                            <input class="input100" type="text" name="username" value="<%=usernameC!=null? usernameC : ""%>" placeholder="Username">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <span class="lnr lnr-envelope"></span>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
                            <input class="input100" type="password" name="password" value="<%=passwordC!=null? passwordC : ""%>" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <span class="lnr lnr-lock"></span>
                            </span>
                        </div>

                        <div class="contact100-form-checkbox m-l-4">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                            <label class="label-checkbox100" for="ckb1">
                                Remember me
                            </label>
                        </div>

                        <div class="container-login100-form-btn p-t-25">
                            <button type="submit" class="login100-form-btn">
                                Login
                            </button>
                        </div>
                        <div class="text-center w-full p-t-1150">
                            <a class="txt1 bo1 hov1" href="forgetPass.jsp">
                                <i style="font-size:15px" class="fa">&#xf084;</i>
                                Forgot your password							
                            </a>
                        </div>
                        <div class="text-center w-full p-t-115">
                            <span class="txt1">
                                Not a member?
                            </span>

                            <a class="txt1 bo1 hov1" href="signup.jsp">
                                Sign up now							
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>




        <!--===============================================================================================-->	
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>

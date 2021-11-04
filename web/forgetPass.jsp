<%-- 
    Document   : forgetPass
    Created on : Sep 29, 2021, 11:42:33 PM
    Author     : GHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            background-image: url(https://anhdephd.com/wp-content/uploads/2018/08/hinh-anh-dep.jpg);

        }
        .container{
            background-color: #fbe9e9;
            height: 150px;
            width: 320px;
            text-align: center;
            position: absolute;
            left: 50%;
            top: 50%;
            padding: 30px;
            border: 1px dashed;
            border-color: red;
            transform: translate(-50%, -90%);
            .h4{
                padding-bottom: 10px;
            }  
        }
    </style>
    <body>

        <div class="container">
            <form action="forgetPass" method="POST">
                <h4 style="color: red">${mess}</h4> 
                <h4 style="color: red">${alert}</h4> 
                Email: <input type="text" name="email"/><br>
                <input style="margin-top: 15px" type="submit" value="submit"/>
            </form>
        </div>


    </body>
</html>

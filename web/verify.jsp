<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
        <link href="css/verify.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

        
        <div class="container">
            
            <h3>We already send a verification  code to your email.</h3>
            <h4 style="color: red">${alert1}</h4> 
            <div>
                <c:if test="${alert!=null}">
                    <p style="color: red">${alert}</p>
                </c:if>
            </div>
            <form action="UserController?service=checkCode" method="post">
                <input class="iput" type="text" name="authcode" >
                <input type="submit" value="verify">
            </form>
        </div>
        

    </body>
</html>


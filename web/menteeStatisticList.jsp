<%-- 
    Document   : menteeStatisticList
    Created on : Nov 7, 2021, 9:36:24 PM
    Author     : GHC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic Request</title>
    </head>
    <body>
        <form action="" method="POST">
            Total request: ${total} <br/>
            Total finish hours: ${totalHour} <br/>
            Total mentor: ${totalMentor}
        </form>
    </body>
</html>

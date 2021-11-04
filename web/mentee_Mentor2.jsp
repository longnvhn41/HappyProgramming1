<%-- 
    Document   : mentee_Mentor
    Created on : Oct 20, 2021, 1:40:10 PM
    Author     : Nguyen Van Long
--%>,

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    
    </head>
    <body>

        <%
            ResultSet rs = (ResultSet) request.getAttribute("ketQua");
        %>
        <c:if test="<%=rs != null%>">
            
                <table border="1">
                    <thead>
                        <tr>
                            <th>ID Request</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Skill Name</th>
                            <th>Introduction</th>
                            <th>Status</th>
                            <th>Change Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%while (rs.next()) {%>
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getInt(8) == 3 ? "Register to become Mentor" : "Mentor"%></td>
                            <td>
                                <a style="text-decoration: none; color: #007bff" href="UserController?service=handleMentor&email=<%=rs.getString(3)%>"> Accept |</a>
                                <a style="text-decoration: none; color: red" href="UserController?service=handleMentor2&email=<%=rs.getString(3)%>"> Reject</a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            
        </c:if>


    </body>
</html>

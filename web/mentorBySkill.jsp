<%-- 
    Document   : adminMentorList
    Created on : Oct 13, 2021, 11:16:31 PM
    Author     : Tri
--%>
<%@page import="entity.Invitation"%>
<%@page import="dao.RatingDAO"%>
<%@page import="entity.User"%>
<%@page import="dao.InvitationDao"%>
<%@page import="context.DBConnect"%>
<%@page import="dao.RequestHandleDao"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Boostrap CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--Boostrap JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--Boostrap Table CSS-->
        <link rel="stylesheet" href="http://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

        <!--Boostrap Table JS-->
        <script src="http://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>


        <title>Happy Programming</title>

        <!--Custom CSS-->
        <link rel="stylesheet" href="css/template.css" />

    </head>
    <body>
        <%
            DBConnect dBConnect = new DBConnect();
            ResultSet rs = (ResultSet) request.getAttribute("ketQua");
            RatingDAO dao = new RatingDAO(dBConnect);
            
        %>
        <div class="body-container">
            <%@include file="headerNew.jsp" %>
            <!--Thay code vao day-->
            <div class="main-content">
                <div class="mentor-table-container" style="padding: 40px">
                    <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID Mentor</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Description</th>
                                <th>Rate</th>
                                <th>Sum Request</th>
                                <th>Invitation</th>

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
                                <%
                                    int countRate = dao.getAverageRating(rs.getInt(1));
                                    request.setAttribute("rate", countRate);
                                %>
                                <td>${rate}&#9733;</td>
                                <c:set var="mentorID" value="<%=rs.getString(3)%>"/>
                                <c:set var="rqID" value="${ID}"/>
                                <%
                                    String mentorEmail = (String) pageContext.getAttribute("mentorID");
                                    InvitationDao invi = new InvitationDao(dBConnect);
                                    int id = invi.getUserByEmail(mentorEmail);
                                    int count = invi.countRequestByMentor(id);
                                    request.setAttribute("countRq", count);

                                %>
                                <td>${countRq}</td>

                                <td>
                                    <%
                                        String rq=request.getAttribute("ID").toString();
                                        int idrq=Integer.parseInt(rq);
                                        Invitation invitation=invi.getInvitationByMentorRequest(id, idrq);
                                        if(invitation==null){
                                    %>
                                    <form action="UserController" method="POST">
                                        <input type="hidden" value="<%=rs.getInt(1)%>" name="mentorID">
                                        <input type="hidden" value="${ID}" name="requestID">
                                        <input type="hidden" name="service" value="addInvitation">
                                        <input style="width: 100px;" class="mb-1 btn btn-danger" type="submit" value="Invite" id="submit">
                                    </form>
                                            <%
                                                }else{
                                            %>
                                            Invited
                                            <%
                                            }
                                            %>

                                </td>

                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <%@include file="Footer.jsp" %>
        </div>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>
</html>

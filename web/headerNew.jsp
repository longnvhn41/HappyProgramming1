<%-- 
    Document   : headerNew
    Created on : Oct 13, 2021, 11:22:42 PM
    Author     : Tri
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Custom CSS-->
        <link rel="stylesheet" href="css/template.css" />

        <title>Header</title>
    </head>
    <body>
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark" style="background-color: #272727; font-family: Nunito Sans, Arial, sans-serif;">
            <a class="navbar-brand" style="margin-right: 4rem" href="homepage.jsp">Happy Programming</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto" style="flex: auto; justify-content: space-between">

                    <li class="nav-item dropdown">
                        <c:if test="${sessionScope.user!=null}">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <b>
                                    <c:choose>
                                        <c:when test="${sessionScope.user.role==0}">Mentor</c:when>
                                        <c:when test="${sessionScope.user.role==1}">Mentee</c:when>
                                        <c:when test="${sessionScope.user.role==2}">Admin</c:when>
                                    </c:choose>
                                </b>
                                actions
                            </a>

                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:choose>
                                    <c:when test="${sessionScope.user.role==0}">
                                        <!--Mentor-->
                                        <a class="dropdown-item" href="#">Mentor Stuff</a>
                                    </c:when>

                                    <c:when test="${sessionScope.user.role==1}">
                                        <!--Mentee-->
                                       <a class="dropdown-item" href="RequestController?service=createRequest&id=${sessionScope.user.id}">Create a request</a>
                                        <a class="dropdown-item" href="UserController?service=becomeMentor&id=${sessionScope.user.id}">Register as a Mentor</a>
                                         <a class="dropdown-item" href="UserController?service=mentorByList">Mentor List Suggestion</a>
                                    </c:when>

                                    <c:when test="${sessionScope.user.role==2}">
                                        <!--Admin-->
                                        <a class="dropdown-item" href="SkillController?action=adminSkillList">Manage Skills</a>
                                        <a class="dropdown-item" href="AdminMentorList">Manage Mentors</a>
                                        <a class="dropdown-item" href="UserController?service=displayMentee_mentor">Manage Become Mentor Request</a>
                                    </c:when>
                                </c:choose>
                                <!--<div class="dropdown-divider"></div>-->
                            </div>
                        </c:if>
                    </li>

                    <li class="nav-item dropdown">
                        <!--Logged In-->
                        <c:if test="${sessionScope.user!=null}">
                            <a style="padding-right: 30px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope.user.name}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="UserController?service=userProfile&user=${sessionScope.user.account}">Update Profile</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="UserController?service=logout">Logout</a>
                            </div>
                        </c:if>

                        <!--Haven't Logged In-->
                        <c:if test="${sessionScope.user==null}">
                            <a style="padding-right: 30px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                You haven't logged in
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="login.jsp">Login</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="signup.jsp">Register</a>
                            </div>
                        </c:if>
                    </li>
                </ul>
            </div>
        </nav>
    </body>
</html>

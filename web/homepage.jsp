<%-- 
    Document   : homepage
    Created on : Sep 24, 2021, 2:21:52 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Happy Programming</title>

    </head>
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        #main{

        }
        #header{
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 50px;
            background-color: #21130d;
        }
        #nav{

        }
        #nav li{
            display: inline-block;
        }
        #nav li a{
            color: #fff;
            text-decoration: none;
            line-height: 50px;
            padding: 0 25px;
            display: inline-block;

        }
        #nav li:hover a{
            color: #000;
            background-color: #ccc;
        }
        html{
            font-family: Arial;
        }
        #slider{
            position: relative;
            margin-top: 50px;
            padding-top: 65%;
            background: url(images/background.jpg) top center / cover no-repeat;
        }
        #slider .text-content{
            position: absolute;
            bottom: 700px;
            color: #fff;
            left: 0;
            right: 0;

            text-align: center;
        }
        #slider .text-heading{
            font-weight: 400;
            font-size: 30px;
        }
        #slider .text-description{
            font-size: 20px;
        }
        #footer{
            padding: 60px 20px;
            text-align: center;
            background-color: #21130d;
            color: #fff;
        }
        .avatar {
            vertical-align: middle;
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }
    </style>
    <body>

        <div id="main">
            <div id="header">
                <ul id=nav>
                    <li><a href="#">Happy Programming</a></li>
                        <c:if test="${sessionScope.user==null}">
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="signup.jsp">Signup</a></li>
                        <li><a href="#">Contact</a></li>                        
                        </c:if>

                    <c:if test="${sessionScope.user!=null}">
                        <li><a href="#" style="padding-right:0">Hello: ${sessionScope.user.account}                              
                            </a></li>
                        <li><a href="#">Contact</a></li>
<!--                        <li><a href="UserController?service=userProfile&user=${sessionScope.user.account}"
                           style="padding: 0 8px"><img src="${sessionScope.user.ava}" alt="Avatar" class="avatar"></a></li>-->
                        
                        <!-- Phân quyền cho mentee = 1-->
                        <c:if test="${sessionScope.user.role==1}">
                            <li><a href="RequestController?service=statisticRequestAfter">Mentee Dashboard</a></li>
<!--                            <li><a href="UserController?service=becomeMentor&id=${sessionScope.user.id}">Become Mentor</a></li>-->
                            <li><a href="UserController?service=logout">Logout</a>
                            </c:if>
                            
                                <!-- Phân quyền cho mentor = 0-->
                            <c:if test="${sessionScope.user.role==0}">
                            <li><a href="#">Request of student</a></li>
                            <li><a href="#">Request</a></li>
                            <li><a href="UserController?service=logout">Logout</a>
                            </c:if>
                            
                                <!-- Phân quyền cho admin = 2--> 
                            <c:if test="${sessionScope.user.role==2}">
                                <!--                            <li><a href="#">Manager User</a></li>
                                                            <li><a href="#">Request</a></li>-->
                                <!--                            <li><a href="#">Contact</a></li>-->
                            <li><a href="template.jsp">Admin Dasboard</a></li>
                            <!--                            <li><a href="SkillController?action=adminSkillList">Skill list</a></li>-->
                        </c:if>

                        <!--                        <li><a href="UserController?service=logout">Logout</a></li>-->

                    </c:if>

                </ul>
            </div>

            <div id=slider>
                <div class="text-content">
                    <h2 class="text-heading">What Are The Advantages Of Online Learning?</h2>
                    <div class="text-description">1. Efficiency
                        Online learning offers teachers an efficient way to deliver lessons to students. Online learning has a number of tools such as videos, PDFs, podcasts, and teachers can use all these tools as part of their lesson plans. By extending the lesson plan beyond traditional textbooks to include online resources, teachers are able to become more efficient educators.

                    </div>

                </div>

            </div>

            <div id="content">

            </div>

            <div id="footer">
                <div>©2021 Web học lập trình uy tín hàng đầu Việt Nam - Được tài trợ bởi SWP291</div>

            </div>
        </div>

    </body>
</html>

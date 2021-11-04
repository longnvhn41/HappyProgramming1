<%-- 
    Document   : showUser
    Created on : Sep 27, 2021, 11:01:21 PM
    Author     : Nguyen Van Long
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Boostrap CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--Boostrap JS-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <title>Happy Programming</title>

        <!--Custom CSS-->
        <link rel="stylesheet" href="css/showuser.css" />
        
    </head>
    <body>
        <div class="body-container">
            <%@include file="headerNew.jsp" %>
            <!--Thay code vao day-->
            <div class="main-content">
                <div class="container rounded mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                <img src="${sessionScope.user.ava}" alt="Avatar" class="avatar" ></div>
                        </div>
                        <div class="col-md-5 border-right">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h1 class="text-right">USER PROFILE</h1>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-6"><label class="labels">ID</label><input type="number" class="form-control"  value="${sessionScope.user.id}" readonly></div>
                                    <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" value="${sessionScope.u.name}"readonly ></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label class="labels">Account</label><input type="text" class="form-control" value="${sessionScope.user.account}"readonly></div>
                                    <div class="col-md-12"><label class="labels">Password</label><input type="password" class="form-control" value="${sessionScope.user.password}" readonly></div>
                                    <div class="col-md-12"><label class="labels">Email</label><input type="email" class="form-control" value="${sessionScope.user.email}"readonly ></div>
                                    <div class="col-md-12"><label class="labels">Phone</label><input type="number" class="form-control" value="${sessionScope.user.phone}" readonly></div>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" value="${sessionScope.user.address}"readonly></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6"><label class="labels">Date of birth</label><input type="datetime" class="form-control" value="${sessionScope.user.dob}"readonly ></div>
                                    <div class="col-md-6"><label class="labels">Gender</label><input type="text" class="form-control" value="${sessionScope.user.gender==1? "Male" : "Female"}"readonly >                                       
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6 text-center"><a href="UserController?service=update&id=${sessionScope.u.id}"><button class="btn btn-primary profile-button" type="submit">Update Profile</button></a></div>
                                    <div class="col-md-6 text-center"><a href="changePass.jsp"><button class="btn btn-primary profile-button" type="button">Change password</button></a></div>             
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>

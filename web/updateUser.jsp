<%-- 
    Document   : updateUser
    Created on : Sep 28, 2021, 12:41:45 AM
    Author     : Nguyen Van Long
--%>

<%@page import="entity.User"%>
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
        <link href="css/updateuser.css" rel="stylesheet" media="all">
        <title>Happy Programming</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("us");
            String title = "Update";
        %>
        <form action="UserController" method="POST"> 
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
                                    <h2 class="text-right">UPDATE USER PROFILE</h2>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-6"><label class="labels" for="id">ID</label><input type="number" name="id" class="form-control"  value="<%=user.getId()%>" readonly></div>
                                    <div class="col-md-6"><label class="labels" for="name">Name</label><input type="text" name="name" class="form-control" value="<%=user.getName()%>" ></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label class="labels" for="account">Account</label><input type="text" name="acc" class="form-control" value="<%=user.getAccount()%>"></div>
                                    <div class="col-md-12"><label class="labels" for="password">Password</label><input type="password" name="pass" class="form-control" value="${sessionScope.user.password}" readonly></div>
                                    <div class="col-md-12"><label class="labels" for="email">Email</label><input type="email" name="email" class="form-control" value="<%=user.getEmail()%>" ></div>
                                    <div class="col-md-12"><label class="labels" for="phone">Phone</label><input type="number" name="phone" class="form-control" value="<%=user.getPhone()%>" ></div>
                                    <div class="col-md-12"><label class="labels" for="address">Address</label><input type="text" name="address" class="form-control" value="<%=user.getAddress()%>"></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6"><label class="labels" for="dob">Date of birth</label><input type="datetime" name="dob" class="form-control" value="<%=user.getDob()%>" ></div>
                                    <div class="col-md-6"><label class="labels" for="sex">Gender</label>
                                        <input type="radio" name="sex" value="1"  ${sessionScope.user.gender==1?"checked":""}/> Male
                                        <input type="radio" name="sex" value="0"  ${sessionScope.user.gender==0?"checked":""} /> Female
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6 text-center"><button class="btn btn-primary profile-button" type="submit" value="Update">Update</button></div>
                                    <input type="hidden" name="service" value="updated" />        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="Footer.jsp" %>
        </div>
        </form>
    </body>
</html>

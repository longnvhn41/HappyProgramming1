<%-- 
    Document   : template
    Created on : Oct 13, 2021, 11:16:31 PM
    Author     : Tri
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

        <!-- Font Awesome Icon Library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Happy Programming</title>

        <!--Custom CSS-->
        <link rel="stylesheet" href="css/template.css" />
        <link rel="stylesheet" href="css/rateMentor.css" />
    </head>
    <body>
        <div class="body-container">
            <%@include file="headerNew.jsp" %>
            <!--Thay code vao day-->
            <div class="main-content">
                <div class="mentor-info-section">
                    <h2>Mentor Information</h2>
                    <div class="mentor-info">
                        <div style="height: 100%">
                            <img class="mentor-avatar" src="images/3.png" alt="avatar">
                        </div>
                        <div class="mentor-info-text">
                            <h3><b>${requestScope.mentor.name}</b></h3>
                            <p><b>Email: </b>${requestScope.mentor.email}</p>
                            <p><b>Phone: </b>${requestScope.mentor.phone}</p>
                            <p><b>Birthday: </b>${requestScope.mentor.dob}</p>
                            <p><b>Gender: </b>${requestScope.mentor.gender==1?"Male":"Female"}</p>
                            <p><b>Address: </b>${requestScope.mentor.address}</p>
                        </div>
                    </div>
                </div>
                <div class="rating-section">
                    <div class="name-and-stars">
                        <h3>Comments & Ratings</h3>
                        <div class="stars">
                            <span style="padding-right: 10px">Average: </span>
                            <span class="checked" style="padding-right: 10px">${averageStars}/5</span>
                            <span class="fa fa-star ${averageStars>=1?"checked":""}"></span>
                            <span class="fa fa-star ${averageStars>=2?"checked":""}"></span>
                            <span class="fa fa-star ${averageStars>=3?"checked":""}"></span>
                            <span class="fa fa-star ${averageStars>=4?"checked":""}"></span>
                            <span class="fa fa-star ${averageStars>=5?"checked":""}"></span>
                        </div>
                    </div>

                    <c:if test="${hasPermission}">
                        <div class="your-rating-section">
                            <c:if test="${hasRated}">
                                <h4>Your Rating</h4>
                                <div class="your-rating">
                                    <div class="name-and-stars">
                                        <p class="rater-name"><b>${hasRated?user.name:"Rating"}</b></p>
                                        <div class="stars">
                                            <span class="checked" style="padding-right: 10px">${currentUserRating.stars}/5</span>
                                            <span class="fa fa-star ${currentUserRating.stars>=1?"checked":""}"></span>
                                            <span class="fa fa-star ${currentUserRating.stars>=2?"checked":""}"></span>
                                            <span class="fa fa-star ${currentUserRating.stars>=3?"checked":""}"></span>
                                            <span class="fa fa-star ${currentUserRating.stars>=4?"checked":""}"></span>
                                            <span class="fa fa-star ${currentUserRating.stars>=5?"checked":""}"></span>
                                        </div>
                                    </div>
                                    <p>${currentUserRating.comment}</p>
                                    <div class="rating-button-group">
                                        <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#editModal">Edit</button>
                                        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#deleteConfirmModal" style="color: #272727">Delete</button>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${!hasRated}">
                                <h4>Write a Rating</h4>
                                <div class="your-rating">
                                    <form action="RateMentor?mentorId=${requestScope.mentor.id}&action=addRating" method="POST">
                                        <div class="name-and-stars">
                                            <p class="rater-name"><b>Pick a rating for mentor</b></p>
                                            <div class="rating" >
                                                <label>
                                                    <input type="radio" name="stars" value="1" />
                                                    <span class="icon">★</span>
                                                </label>
                                                <label>
                                                    <input type="radio" name="stars" value="2" />
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                </label>
                                                <label>
                                                    <input type="radio" name="stars" value="3" />
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>   
                                                </label>
                                                <label>
                                                    <input type="radio" name="stars" value="4" />
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                </label>
                                                <label>
                                                    <input type="radio" name="stars" value="5" />
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                </label>
                                            </div>
                                        </div>
                                        <label for="yourComment">Comment:</label>
                                        <textarea id="yourComment" name="yourComment" rows="4" cols="50" style="width: 100%; height: 100px"></textarea>
                                        <div class="rating-button-group">
                                            <input type="submit" class="btn btn-dark" value="Add Rating">
                                            <button type="button" class="btn btn-link" style="color: #272727" data-dismiss="modal">Cancel</button>
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </c:if>
                    <div class="other-ratings">
                        <h4>Mentees Ratings</h4>
                        <ul class="other-ratings-list">
                            <c:forEach items="${requestScope.ratings}" var="rating">
                                <li>
                                    <div class="other-rating">
                                        <div class="name-and-stars">
                                            <p class="rater-name"><b>${rating.menteeName}</b></p>
                                            <div class="stars">
                                                <span class="checked" style="padding-right: 10px">${rating.stars}/5</span>
                                                <span class="fa fa-star ${rating.stars>=1?"checked":""}"></span>
                                                <span class="fa fa-star ${rating.stars>=2?"checked":""}"></span>
                                                <span class="fa fa-star ${rating.stars>=3?"checked":""}"></span>
                                                <span class="fa fa-star ${rating.stars>=4?"checked":""}"></span>
                                                <span class="fa fa-star ${rating.stars>=5?"checked":""}"></span>
                                            </div>
                                        </div>
                                        <p>${rating.comment}</p>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <c:if test="${hasPermission && hasRated}">
                <!-- Modal -->
                <!-- Delete Confirm Modal -->
                <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Confirm Deletion</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="RateMentor?mentorId=${requestScope.mentor.id}&action=deleteRating" method="POST">
                                    <div class="modal-body">
                                        Are you sure want to delete your rating & comment ?
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-danger" value="Delete">
                                        <button type="button" class="btn btn-link" style="color: #272727" data-dismiss="modal">Cancel</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Edit Modal -->
                <div class="modal fade bd-example-modal-lg" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Edit Rating & Comment</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="RateMentor?mentorId=${requestScope.mentor.id}&action=editRating" method="POST">
                                    <div class="modal-body">
                                        <div class="name-and-stars">
                                            <p class="rater-name"><b>Rating</b></p>
                                            <div class="rating" >
                                                <label>
                                                    <input type="radio" name="stars" ${currentUserRating.stars==1?"checked":""} value="1" />
                                                    <span class="icon">★</span>
                                                </label>
                                                <label>
                                                    <input type="radio" name="stars" ${currentUserRating.stars==2?"checked":""} value="2" />
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                </label>
                                                <label>
                                                    <input type="radio" name="stars" ${currentUserRating.stars==3?"checked":""} value="3" />
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>   
                                                </label>
                                                <label>
                                                    <input type="radio" name="stars" ${currentUserRating.stars==4?"checked":""} value="4" />
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                </label>
                                                <label>
                                                    <input type="radio" name="stars" ${currentUserRating.stars==5?"checked":""} value="5" />
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                    <span class="icon">★</span>
                                                </label>
                                            </div>
                                        </div>
                                        <label for="yourComment">Comment:</label>
                                        <textarea id="yourComment" name="yourComment" rows="4" cols="50" style="width: 100%; height: 300px">${currentUserRating.comment}</textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-dark" value="Save">
                                        <button type="button" class="btn btn-link" style="color: #272727" data-dismiss="modal">Cancel</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>

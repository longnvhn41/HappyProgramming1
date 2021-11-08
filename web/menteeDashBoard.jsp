<%-- 
    Document   : menteeDashBoard
    Created on : Nov 8, 2021, 2:22:45 AM
    Author     : Nguyen Van Long
--%>

<%@page import="dao.InvitationDao"%>
<%@page import="dao.RatingDAO"%>
<%@page import="context.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="css/menteeDB.css" rel="stylesheet" type="text/css"/>



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
          <![endif]-->

        <style type="text/css">

        </style>
        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    theme: "light2",
                    title: {
                        text: "Site Traffic"
                    },
                    axisX: {
                        valueFormatString: "DD MMM",
                        crosshair: {
                            enabled: true,
                            snapToDataPoint: true
                        }
                    },
                    axisY: {
                        title: "Number of Visits",
                        includeZero: true,
                        crosshair: {
                            enabled: true
                        }
                    },
                    toolTip: {
                        shared: true
                    },
                    legend: {
                        cursor: "pointer",
                        verticalAlign: "bottom",
                        horizontalAlign: "left",
                        dockInsidePlotArea: true,
                        itemclick: toogleDataSeries
                    },
                    data: [{
                            type: "line",
                            showInLegend: true,
                            name: "Total Visit",
                            markerType: "square",
                            xValueFormatString: "DD MMM, YYYY",
                            color: "#F08080",
                            dataPoints: [
                                {x: new Date(2017, 0, 3), y: 650},
                                {x: new Date(2017, 0, 4), y: 700},
                                {x: new Date(2017, 0, 5), y: 710},
                                {x: new Date(2017, 0, 6), y: 658},
                                {x: new Date(2017, 0, 7), y: 734},
                                {x: new Date(2017, 0, 8), y: 963},
                                {x: new Date(2017, 0, 9), y: 847},
                                {x: new Date(2017, 0, 10), y: 853},
                                {x: new Date(2017, 0, 11), y: 869},
                                {x: new Date(2017, 0, 12), y: 943},
                                {x: new Date(2017, 0, 13), y: 970},
                                {x: new Date(2017, 0, 14), y: 869},
                                {x: new Date(2017, 0, 15), y: 890},
                                {x: new Date(2017, 0, 16), y: 930}
                            ]
                        },
                        {
                            type: "line",
                            showInLegend: true,
                            name: "Unique Visit",
                            lineDashType: "dash",
                            dataPoints: [
                                {x: new Date(2017, 0, 3), y: 510},
                                {x: new Date(2017, 0, 4), y: 560},
                                {x: new Date(2017, 0, 5), y: 540},
                                {x: new Date(2017, 0, 6), y: 558},
                                {x: new Date(2017, 0, 7), y: 544},
                                {x: new Date(2017, 0, 8), y: 693},
                                {x: new Date(2017, 0, 9), y: 657},
                                {x: new Date(2017, 0, 10), y: 663},
                                {x: new Date(2017, 0, 11), y: 639},
                                {x: new Date(2017, 0, 12), y: 673},
                                {x: new Date(2017, 0, 13), y: 660},
                                {x: new Date(2017, 0, 14), y: 562},
                                {x: new Date(2017, 0, 15), y: 643},
                                {x: new Date(2017, 0, 16), y: 570}
                            ]
                        }]
                });
                chart.render();

                function toogleDataSeries(e) {
                    if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                        e.dataSeries.visible = false;
                    } else {
                        e.dataSeries.visible = true;
                    }
                    chart.render();
                }

            }
        </script>
    </head>
    <body class="skin-black">
        <%            ResultSet rs = (ResultSet) request.getAttribute("ketQua");
        %>
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="homepage.jsp" class="logo">
                HappyProgramming
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">

                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span>${sessionScope.user.name} <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Account</li>



                                <li class="divider"></li>

                                <li>
                                    <a href="UserController?service=userProfile&user=${sessionScope.user.account}">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                        Profile
                                    </a>

                                </li>                             

                                <li>
                                    <a href="UserController?service=logout"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">                                    
                            <img src="images/2.png" class="img-circle" alt="User Image"/>
                        </div>
                        <div class="pull-left info">
                            <p>Hello, ${sessionScope.user.account}</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="menteeDashBoard.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="RequestController?service=createRequest&id=${sessionScope.user.id}">
                                <i class="fa fa-gavel"></i> <span>Create a request</span>
                            </a>
                        </li>

                        <li>
                            <a href="UserController?service=becomeMentor&id=${sessionScope.user.id}">
                                <i class="fa fa-globe"></i> <span>Register as a Mentor</span>
                            </a>
                        </li>

                        <li>
                            <a href="UserController?service=mentorByList">
                                <i class="fa fa-glass"></i> <span>Mentor List Suggestion</span>
                            </a>
                        </li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <aside class="right-side">

                <!-- Main content -->
                <section class="content">

                    <form action="" method="POST">
                        <div class="row" style="margin-bottom:5px;">


                            <div class="col-md-3">
                                <div class="sm-st clearfix">
                                    <span class="sm-st-icon st-red"><i class="fa fa-check-square-o"></i></span>
                                    <div class="sm-st-info">

                                        <span> ${total}</span>
                                        Total request:
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="sm-st clearfix">
                                    <span class="sm-st-icon st-violet"><i class="fa fa-envelope-o"></i></span>
                                    <div class="sm-st-info">
                                        <span>${totalHour}</span>
                                        Total finish hours:
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="sm-st clearfix">
                                    <span class="sm-st-icon st-blue"><i class="fa fa-dollar"></i></span>
                                    <div class="sm-st-info">
                                        <span>${totalMentor}</span>
                                        Total mentor:
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="sm-st clearfix">
                                    <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                                    <div class="sm-st-info">
                                        <span>1922</span>
                                        Total Documents
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>

                    <!-- Main row -->
                    <div class="row">

                        <div class="col-md-8">
                            <!--earning graph start-->
                            <section class="panel">
                                <header class="panel-heading">
                                    Earning Graph
                                </header>
                                <div class="panel-body">
                                    <!--                                    <canvas id="linechart" width="600" height="330"></canvas>-->
<!--                                    <div id="chartContainer" style="height: 400; width: 600;"></div>
                                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>-->
                                    <div id="chartContainer" style="height: 100%; width: 100%;"></div>
                                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                                </div>
                            </section>
                            <!--earning graph end-->

                        </div>
                        <div class="col-lg-4">

                            <!--chat start-->
                            <section class="panel">
                                <header class="panel-heading">
                                    Notifications
                                </header>
                                <div class="panel-body" id="noti-box">

                                    <div class="alert alert-block alert-danger">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Well come! Happy Programming</strong> In the system there are all: ${skills} skills.
                                    </div>
                                    <div class="alert alert-success">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Now: </strong> In the system there are all: ${mentee} mentees.
                                    </div>
                                    <div class="alert alert-info">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Start learning: </strong> In the system there are all: ${mentor} mentors.
                                    </div>
                                    <div class="alert alert-warning">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Warning!</strong> There are a number of scam sites out there, so be careful when searching.
                                    </div>


                                    <div class="alert alert-block alert-danger">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Oh snap!</strong> Change a few things up and try submitting again.
                                    </div>
                                    <div class="alert alert-success">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Well done!</strong> You successfully read this important information.
                                    </div>
                                    <div class="alert alert-info">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Heads up!</strong> This alert needs your attention, but it's not super important.
                                    </div>
                                    <div class="alert alert-warning">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Warning!</strong> Best check yo self, you're not looking too good.
                                    </div>



                                </div>
                            </section>



                        </div>


                    </div>
                    <div class="row">

                        <div class="col-md-8">
                            <section class="panel">
                                <header class="panel-heading">
                                    List of Mentors
                                </header>
                                <div class="panel-body table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID Mentor</th>
                                                <th>Mentor Name</th>
                                                <th>Framework</th>                                               
                                                <th>Email</th>                                                
                                                <th>Rate</th>
                                                <th>Comment</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%while (rs.next()) {%>
                                            <tr>
                                                <td><%=rs.getInt(1)%></td>
                                                <td><%=rs.getString(2)%></td>
                                                <td><%=rs.getString(3)%></td>                                               
                                                <td><%=rs.getString(4)%></td>
                                                <%
                                                    DBConnect dBConnect = new DBConnect();
                                                    RatingDAO dao = new RatingDAO(dBConnect);
                                                    int countRate = dao.getAverageRating(rs.getInt(1));
                                                    request.setAttribute("rate", countRate);
                                                %>                                                
                                                <td>${rate}&#9733;</td>
                                                <%
                                                    InvitationDao invi = new InvitationDao(dBConnect);
                                                    double menteeComment = invi.countComment(rs.getInt(1));
                                                    double comment = invi.rateting(rs.getInt(1));
                                                    double result = Math.round((comment / menteeComment) * 100);
                                                    request.setAttribute("result", result);
                                                %>
                                                <td><span class="badge badge-info">${result}%</span></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </section>


                        </div><!--end col-6 -->
                        <div class="col-md-4">
                            <section class="panel">
                                <header class="panel-heading">
                                    Twitter Feed
                                </header>
                                <div class="panel-body">
                                    <div class="twt-area">
                                        <form action="#" method="post">
                                            <textarea class="form-control" name="profile-tweet" placeholder="Share something on Twitter.." rows="3"></textarea>

                                            <div class="clearfix">
                                                <button class="btn btn-sm btn-primary pull-right" type="submit">
                                                    <i class="fa fa-twitter"></i>
                                                    Tweet
                                                </button>
                                                <a class="btn btn-link btn-icon fa fa-location-arrow" data-original-title="Add Location" data-placement="bottom" data-toggle="tooltip" href=
                                                   "#" style="text-decoration:none;" title=""></a>
                                                <a class="btn btn-link btn-icon fa fa-camera" data-original-title="Add Photo" data-placement="bottom" data-toggle="tooltip" href="#"
                                                   style="text-decoration:none;" title=""></a>
                                            </div>
                                        </form>
                                    </div>
                                    <ul class="media-list">

                                    </ul>
                                </div>
                            </section>
                        </div>

                    </div>

                    <!-- row end -->
                </section><!-- /.content -->





                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js/jquery.min.js" type="text/javascript"></script>

        <!-- jQuery UI 1.10.3 -->
        <script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

        <script src="js/plugins/chart.js" type="text/javascript"></script>

        <!-- datepicker
        <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
        <!-- Bootstrap WYSIHTML5
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
        <!-- iCheck -->
        <script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- calendar -->
        <script src="js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

        <!-- Director App -->
        <script src="js/Director/app.js" type="text/javascript"></script>

        <!-- Director dashboard demo (This is only for demo purposes) -->
        <script src="js/Director/dashboard.js" type="text/javascript"></script>

        <!-- Director for demo purposes -->
        <script type="text/javascript">
            $('input').on('ifChecked', function (event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().addClass('highlight');
                $(this).parents('li').addClass("task-done");
                console.log('ok');
            });
            $('input').on('ifUnchecked', function (event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().removeClass('highlight');
                $(this).parents('li').removeClass("task-done");
                console.log('not');
            });

        </script>
        <script>
            $('#noti-box').slimScroll({
                height: '400px',
                size: '5px',
                BorderRadius: '5px'
            });

            $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
                checkboxClass: 'icheckbox_flat-grey',
                radioClass: 'iradio_flat-grey'
            });
        </script>
        <script type="text/javascript">
            $(function () {
                "use strict";
                //BAR CHART
                var data = {
                    labels: ["January", "February", "March", "April", "May", "June", "July"],
                    datasets: [
                        {
                            label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [65, 59, 80, 81, 56, 55, 40]
                        },
                        {
                            label: "My Second dataset",
                            fillColor: "rgba(151,187,205,0.2)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(151,187,205,1)",
                            data: [28, 48, 40, 19, 86, 27, 90]
                        }
                    ]
                };
                new Chart(document.getElementById("linechart").getContext("2d")).Line(data, {
                    responsive: true,
                    maintainAspectRatio: false,
                });

            });
            // Chart.defaults.global.responsive = true;
        </script>
    </body>
</html>

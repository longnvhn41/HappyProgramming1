
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin | Danh sách kỹ năng</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <style>
            button{width: 110px;}
            td{
                text-align: center;
            }
        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                  
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->

                    <div class="container-fluid">



                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Danh sách kỹ năng</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table border="1" class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>ID</th>
                                                <th>TÊN</th>
                                                <th>CẬP NHẬT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%int stt = 1;%>
                                            <c:forEach items="${all}" var="o">
                                                <tr>
                                                    <td><%out.println(stt++);%></td>
                                                    <td>${o.id}</td>
                                                    <td>${o.name}</td>
                                                    
                                                    <td><a href="SkillController?action=adminUpdateSkill&skillID=${o.id}">Cập nhật</a></td>
                                                    
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->
                <a href="adminCreateSkill.jsp">
                    Create Skill
                </a>
                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                      
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                      
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <a href="login.jsp">logout</a>
                        </button>
                    </div>
                  
                    <div class="modal-footer">
                     
                   
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
        <script>
                                                            var table, select;
                                                            $(document).ready(addFilter());
                                                            function addFilter() {
                                                                table = $('#dataTable').DataTable({
                                                                    initComplete: function () {
                                                                        this.api().columns([3]).every(function () {
                                                                            var column = this;
                                                                            select = $('<select class="w-auto custom-select custom-select-sm form-control form-control-sm">\n\
                                                    <option value=""><th>Tất cả trạng thái<th></option>\n\
                                                </select>').on('change', function () {
                                                                                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                                                                column.search(val ? '^' + val + '$' : '', true, false).draw();
                                                                            });
                                                                            select.append('<option value="Kích hoạt">Kích hoạt</option>');
                                                                            select.append('<option value="Không kích hoạt">Không kích hoạt</option>');
                                                                            $('<label id="myLabel" class=" mr-4">Trạng thái: </label>').prependTo($('#dataTable_filter'));
                                                                            $(select).appendTo($('#myLabel'));
                                                                        });
                                                                    }
                                                                });
                                                            }
        </script>

       

    </body>
</html>

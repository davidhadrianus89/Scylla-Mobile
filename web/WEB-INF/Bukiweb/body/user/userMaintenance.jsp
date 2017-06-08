<link href="../css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">

<script src="../js/plugins/jeditable/jquery.jeditable.js"></script>
<script src="../js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../js/plugins/dataTables/dataTables.tableTools.min.rev.js"></script>

<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
    
    $(document).ready(function () {
        $('#tabel1').dataTable();
    });
    
    function showMessage(response) {
        if(response !== ""){
            swal("Information!", response, "info");
        }
    }
    
    function update(userId){
        $('#test1').load("updateUser?userId=" + userId);
    }
    
    function hapus(userId){
        swal({
                title: "Are you sure?",
                text: "You will not be able to recover this User : " + userId + " !" ,
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Delete it!",
                cancelButtonText: "No, Cancel plx!",
                closeOnConfirm: false,
                closeOnCancel: false},
            function (isConfirm) {
                if (isConfirm) {
                    $("#test1").load("deleteUser?userId=" + userId);
                } else {
                    swal("Cancelled", "Your User is safe :)", "error");
                }
        });   
    }

</script>

<style type="text/css">     
    #tabel1{ width: 100%; overflow-y: hidden !important; overflow-x: auto !important; -ms-overflow-style: -ms-autohiding-scrollbar; -webkit-overflow-scrolling: touch !important; }
</style>



<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <div class="col-sm-12">
            <div class="panel panel-info" style="font-family: Trebuchet MS">
                <div class="panel-heading">
                    USER MAINTENANCE
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h2>LIST USER</h2>
                        </div>
                        <div class="ibox-content" style="font-family: Trebuchet MS">

                            <div id="alerts"></div>
                            <div id="div_box" class="form-group" style="overflow-x: auto;">
                                <table class="table table-striped table-bordered table-hover " id="tabel1" >
                                    <thead>
                                        <tr>
                                            <th>Code</th>
                                            <th>Name</th>
                                            <th>Address</th>
                                            <th>Role</th>
                                            <th>Last Login</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                        <c:forEach var="user" items="${listUser}" varStatus="i">            
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.fullName}</td>
                                            <td>${user.address}</td>
                                            <td>${user.roles.name}</td>
                                            <td>${user.lastLogin}</td>
                                            <td>${user.status}</td>
                                            <td><button onclick="update('${user.id}')"><i class="fa fa-edit" ></i></button>
                                                &nbsp;&nbsp;<button onclick="hapus('${user.id}')"><i class="fa fa-trash-o" ></i></button>    </td>

                                        </tr>
                                        </c:forEach>
                                    </tbody>

                                </table>
                            </div>
                            <div class="form-group" >
                                <a href="#" class="btn btn-w-m btn-outline btn-primary" type="button" onclick="loadPage('addUser')" id="save" ><i class="fa fa-save"> ADD NEW</i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>showMessage('${response}');</script>
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

    function update(groupId){

        $('#test1').load("updateGroup?groupId=" + groupId);
    }

    function hapus(groupId){

    swal({
    title: "Are you sure?",
            text: "You will not be able to recover this Group : " + groupId + " !",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, Delete it!",
            cancelButtonText: "No, Cancel plx!",
            closeOnConfirm: false,
            closeOnCancel: false},
            function (isConfirm) {
            if (isConfirm) {
                
                $("#test1").load("deleteGroup?groupId=" + groupId);
            } else {
                swal("Cancelled", "Your Group is safe :)", "error");
                }
            }
    );
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
                    GROUP MAINTENANCE
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h2>LIST GROUP</h2>
                        </div>
                        <div class="ibox-content" style="font-family: Trebuchet MS">

                            <div id="alerts"></div>
                            <div id="div_box" class="form-group" style="overflow-x: auto;">
                                <table class="table table-striped table-bordered table-hover " id="tabel1" >
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Group Name</th>
                                            <th>Status</th>
                                            <th>Description</th>
                                            <th>Action</th>

                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                        <c:forEach var="group" items="${listGroup}" varStatus="i">        
                                            <tr>
                                                <td>${i.count}</td>
                                                <td>${group.groupId}</td>
                                                <td>${group.status}</td>
                                                <td>${group.desc}</td>
                                                <td><button onclick="update('${group.groupId}')"><i class="fa fa-edit" ></i></button>
                                                    &nbsp;&nbsp;<button onclick="hapus('${group.groupId}')"><i class="fa fa-trash-o" ></i></button>    </td>
                                                    </c:forEach>

                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            <div class="form-group" >
                                <a href="#" class="btn btn-w-m btn-outline btn-primary" type="button" onclick="loadPage('addGroup')" id="save" ><i class="fa fa-save"> ADD NEW</i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

                
                
<script>showMessage('${response}');</script>
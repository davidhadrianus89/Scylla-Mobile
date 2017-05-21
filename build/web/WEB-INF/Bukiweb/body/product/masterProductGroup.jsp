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
        if (response !== "") {
            swal("Information!", response, "info");
        }
    }
    
    function addnew(){
//        $("#titlemodal").val("Add New Group");
        document.getElementById("titlemodal").innerHTML = "Add New Group";
        
        var groupid = document.getElementById("groupid");
        var sellerid = document.getElementById("sellerid");
        var groupname = document.getElementById("groupname");
        var description = document.getElementById("groupdesc");

        groupid.value = "";
        sellerid.value = "";
        groupname.value = "";
        description.value = "";
        
        $("#btnupdate").hide(); 
        $("#btnsave").show();
        
        $("#divgroup").hide();
        $("#dividseller").hide();
    }
    
    function save() {

        $("#test1").load("addGroupProduct" + "?" + $("form").serialize() + "&act=1");
        $('#modal-group').modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    }

    function update() {
                
        document.getElementById("groupid").disabled = false;
        document.getElementById("sellerid").disabled = false;
        $("#test1").load("editGroupProduct" + "?" + $("form").serialize());
        $('#modal-group').modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    }

    function hapus(groupId) {

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
                $("#test1").load("deleteGroupProduct?groupid=" + groupId);
            } else {
                swal("Cancelled", "Your Group is safe :)", "error");
            }
        }
        );
    }

    function selectRow(groupId, sellerId, groupName, groupDesc) {

        $("#divgroup").hide();
        $("#dividseller").hide();
        $("#btnupdate").show();
        $("#btnsave").hide();
        
        var groupid = document.getElementById("groupid");
        var sellerid = document.getElementById("sellerid");
        var groupname = document.getElementById("groupname");
        var description = document.getElementById("groupdesc");

        groupid.value = groupId;
        sellerid.value = sellerId;
        groupname.value = groupName;
        description.value = groupDesc;

    }

</script>

<c:if test="${pesan != null}">
    <script>showMessage('${pesan}');</script>
</c:if>

<style type="text/css">
    #tabel1{ width: 100%; overflow-y: hidden !important; overflow-x: auto !important; -ms-overflow-style: -ms-autohiding-scrollbar; -webkit-overflow-scrolling: touch !important; }
</style>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <div class="col-sm-12">
            <div class="panel panel-info" style="font-family: Trebuchet MS">
                <div class="panel-heading">
                    PRODUCT GROUP MAINTENANCE
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h2>MASTER PRODUCT GROUP</h2>
                        </div>
                        <div class="ibox-content" style="font-family: Trebuchet MS">

                            <div id="alerts"></div>
                            <div id="div_box" class="form-group" style="overflow-x: auto;">
                                <table class="table table-striped table-bordered table-hover " id="tabel1" >
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Group ID</th>
                                            <th>Seller ID</th>
                                            <th>Group Name</th>
                                            <th>Description</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                        <c:forEach var="group" items="${list_group}" varStatus="i">        
                                            <tr>
                                                <td>${i.count}</td>
                                                <td>${group.groupid}</td>
                                                <td>${group.sellerid}</td>
                                                <td>${group.groupname}</td>
                                                <td>${group.description}</td>
                                                <td>
                                                    <a data-toggle="modal" onclick="selectRow('${group.groupid}', '${group.sellerid}', '${group.groupname}', '${group.description}')" class="btn btn-sm btn-outline btn-primary" href="#modal-group">
                                                        <i class="fa fa-paste" ></i> 
                                                        Edit
                                                    </a>
                                                    &nbsp;&nbsp;
                                                    <a data-toggle="modal" onclick="hapus('${group.groupid}')" class="btn btn-sm btn-outline btn-danger" href="#">
                                                        <i class="fa fa-trash" ></i> 
                                                        Delete
                                                    </a>
                                                </td>
                                            </c:forEach>

                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            <a data-toggle="modal" onclick="addnew()" class="btn btn-sm btn-outline btn-primary" href="#modal-group">
                                <i class="fa fa-paste" ></i> 
                                Add New
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="modal-group" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h2 class="modal-title" id="titlemodal">Edit Group Product</h2>
            </div>
            <form id="form" name="form" role="form" method="get" action="#">
                <div class="modal-body">
                    <div class="form-group" id="divgroup">
                        <label>Group ID</label> 
                        <input id="groupid" name="groupid" placeholder="" class="form-control" required disabled>
                    </div>
                    <div class="form-group" id="dividseller">
                        <label>Seller ID</label> 
                        <input id="sellerid" name="sellerid" placeholder="" class="form-control" required disabled>
                    </div>
                    <div class="form-group">
                        <label>Group Name</label> 
                        <input id="groupname" name="name" placeholder="Enter group name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label> 
                        <textarea id="groupdesc" name="desc" placeholder="Description.." class="form-control" required style="width: 240px; height: 117px;"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closemodal" class="btn btn-outline btn-danger" data-dismiss="modal"> <i class="fa fa-close" ></i> Close</button>
                    <button id="btnupdate" type="button" onclick="update()" class="btn btn-outline btn-primary"><i class="fa fa-save" ></i> Save</button>
                    <button id="btnsave" type="button" onclick="save()" class="btn btn-outline btn-primary"><i class="fa fa-save" ></i> Save</button>
                </div>
            </form>

        </div>
    </div>
</div>

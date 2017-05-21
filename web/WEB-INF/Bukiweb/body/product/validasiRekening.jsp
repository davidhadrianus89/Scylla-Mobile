<%-- 
    Document   : LaporanRealisasi
    Created on : Jun 30, 2016, 9:15:29 AM
    Author     : dpti
--%>

<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<link href="../css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">

<script src="../js/plugins/select2/select2.full.min.js"></script>
<script src="../js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="../js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../js/plugins/dataTables/dataTables.tableTools.min.js"></script>

<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

    function retrieve() {
        $('#div_table').load("uploadFile?" + $("form").serialize());
    }
    function upload() {
        var fileControl = document.getElementById('file');
        if (fileControl.files.length == 0) {
            alert('Send Message: Please Select File');
            return false;
        }
        var formData = new FormData();
        formData.append('file', fileControl.files[0]);
        jQuery.ajax({
            url: 'uploadFile',
            type: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: function (data, status, xhr) {
                if (data !== '0') {
                    swal("Warning!", data  , "error");
                    document.getElementById('div_table').hidden = true;
                } else {
                    document.getElementById('div_table').hidden = false;
                    $('#div_table').load("dataValidasi");
                }
            },
            error: function (xhr, status, e) {
                swal("Warning!", "500 - Internal Server Error. " + status  , "error");
            }
        });
    }
    function showMessage(pesan) {
        $('#myModal').modal('hide');
        swal({
            title: "Information",
            text: pesan,
            type: "warning",
            showCancelButton: false,
            confirmButtonColor: "#2E9AFE",
            confirmButtonText: "OKK!",
            closeOnConfirm: true, },
                function (isConfirm) {
                    if (isConfirm) {

                    }
                });
    }

</script>

<c:if test="${pesan != null}">
    <script>showMessage('${pesan}');</script>
</c:if>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <div class="col-sm-12">
            <div class="panel panel-info" style="font-family: Trebuchet MS">
                <div class="panel-heading">
                    VALIDASI REKENING
                    <c:forEach var="data" items="${listData}" varStatus="i">

                        ${i.count}
                        ${data.acno}
                        ${data.name}
                        ${data.status}

                    </c:forEach>
                </div> 
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h2>VALIDASI REKENING</h2>
                        </div>
                        <div class="ibox-content" style="font-family: Trebuchet MS">
                            <form id="form" method="POST" name="form" class="form-horizontal" enctype="multipart/form-data" action="uploadFile">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Upload File</label>
                                    <input type="file" class="btn btn-primary" accept=".xlsx" id="file" name="file" value="Browse"  />        
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-2 col-sm-offset-2 input-group-sm m-b-n-sm">
                                        <button onclick="upload()"class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-search" ></i> Upload</button>
                                    </div>
                                </div>
                            </form>
                            <hr>
                            <div id="alerts"></div>
                            <div id="div_table" >                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

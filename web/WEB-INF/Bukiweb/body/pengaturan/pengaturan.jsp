<%-- 
    Document   : pengaturan
    Created on : Sep 2, 2016, 1:05:52 PM
    Author     : DPTI
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
    function save() {

        if (document.getElementById('validation2').value === "") {
            alert('Email Cannot Be Null');
            document.getElementById('validation2').onfocus = true;
            return false;
        }

        if (document.getElementById('validation3').value === "") {
            alert('Phone Cannot Be Null');
            document.getElementById('validation3').onfocus = true;
            return false;
        }

        $("#test1").load("savePengaturan" + "?" + $("form").serialize());
    }

    function showMessage() {
        $('#myModal').modal('hide');
        swal({
            title: "Change Password Success!",
            text: "Please Login with your new password..",
            type: "info",
            showCancelButton: false,
            confirmButtonColor: "#2E9AFE",
            confirmButtonText: "OKK!",
            closeOnConfirm: true, },
                function (isConfirm) {
                    if (isConfirm) {
                        window.location.href = "login";
                    }
                });
    }

    function changePass(password) {

        if (document.getElementById('validation4').value === "") {
            alert('Current Passowrd Cannot Be Null');
            document.getElementById('validation4').onfocus = true;

            return false;
        }

        if (document.getElementById('validation5').value === "") {
            alert('New Passord Cannot Be Null');
            document.getElementById('validation5').onfocus = true;
            return false;
        }

        if (document.getElementById('validation6').value === "") {
            alert('Confirm Password Cannot Be Null');
            document.getElementById('validation6').onfocus = true;
            return false;
        }

        if (document.getElementById('validation4').value != password) {
            alert('Current Password Not Correct!');
            document.getElementById('validation6').onfocus = true;
            return false;
        }

        if (document.getElementById('validation5').value != document.getElementById('validation6').value) {
            alert('Confirm Password Doesnt match with New Password');
            document.getElementById('validation6').onfocus = true;
            return false;
        }

        var pass = $("#validation5").val();
        var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
        if (pass.length < 8) {
            alert("Password minimum have 8 characters.");
            return false;
        }
        
        if(!regularExpression.test(pass)) {
            alert("Password should contain atleast one Number and one Special Character.");
            return false;
        }
//        $('#myModal').modal('hide');
        $("#test1").load("changePass" + "?" + $("form").serialize());

    }
</script>


<c:if test="${pesan == 'okk'}">
    <script>showMessage();</script>
</c:if>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <div class="col-sm-12">
            <div class="panel panel-info" style="font-family: Trebuchet MS">
                <div class="panel-heading">
                    PENGATURAN
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        ${pesan}

                        <div class="ibox-content" style="font-family: Trebuchet MS">
                            <form id="form"  class="form-horizontal" method="post">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Username</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input maxlength="10" readonly="" name="user" type="text" class="form-control" value="${userid}" disabled="disabled" required="required" />
                                    </div>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <button class="btn btn-w-m btn-outline btn-primary" type="button" data-toggle="modal" data-target="#myModal"><i class="fa fa-user" ></i> GANTI PASSWORD</button>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input maxlength="40" name="email" id="validation2" type="text" class="form-control" value="${email}" disabled="disabled" required="required" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Phone</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input maxlength="40" name="phone" id="validation3" type="text" class="form-control" value="${phone}" disabled="disabled" onkeypress="return isNumberKey(event)" required="required"/>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <br/>
                                        <button class="btn btn-w-m btn-outline btn-primary editData" type="button"><i class="fa fa-edit" ></i> EDIT</button>
                                        &nbsp;&nbsp;&nbsp;<button onclick="save()" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->

<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">

            <form id="form" class="form-horizontal" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">GANTI PASSWORD</h4>
                </div>
                <input type="hidden" name="user" value="${userid}"/>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Current Password</label>
                        <div class="col-sm-6 input-group-sm m-b-n-sm">
                            <input  id="validation4" maxlength="10" name="curPass" type="password" class="form-control" required="required"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">New Password</label>
                        <div class="col-sm-6 input-group-sm m-b-n-sm">
                            <input  id="validation5" maxlength="10" name="newPass" type="password" class="form-control" required="required"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">Confirm New Password</label>
                        <div class="col-sm-6 input-group-sm m-b-n-sm">
                            <input  id="validation6" maxlength="10" name="confirmPass" type="password" class="form-control" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button onclick="changePass('${password}')" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-w-m btn-outline btn-primary" data-dismiss="modal" onclick="reset()"><i class="fa fa-close">CLOSE</i></button>
                </div>
            </form>
        </div>
    </div>

</div>
</div>

<script type="text/javascript">

    $(document).on('click', '.editData', function () {
        $("input").prop('disabled', false);
    });
</script>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">

    function showMessage(response) {
        if (response !== "") {
            swal("Attention!", response, "error");
        }
    }

    function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    function save(URL) {
        if (document.getElementById('validation1').value === "") {
            alert('Username Cannot Be Null');
            document.getElementById('validation1').onfocus = true;
            return false;
        }

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

        if (document.getElementById('select1').value === "-") {
            alert('Please Select Group');
            document.getElementById('select1').onfocus = true;
            return false;
        }

        if (document.getElementById('select2').value === "-") {
            alert('Please Select Status User');
            document.getElementById('select2').onfocus = true;
            return false;
        }

        var email = $("#validation2").val();
        if (validateEmail(email) === false) {
            alert('Email Not Valid!');
            document.getElementById('validation2').onfocus = true;
            return false;
        }
        
        
        $("#test1").load("saveUser" + "?" + $("form").serialize());
    }
</script>

<script>showMessage('${pesan}');</script>

<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
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
                            <h2>ADD USER</h2>                                   
                        </div>

                        <div class="ibox-content" style="font-family: Trebuchet MS">
                            <form id="form" name="form" class="form-horizontal" method="post">
                                <input type="hidden" name="action" value="save"/>    
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Principle</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <select id="select1" name="group" class="form-control" required="">
                                            <option selected="" value="-" disabled="disabled" >-- Choose Principle --</option>
                                            <c:forEach var="group" items="${listGroup}">
                                                <option value="${group.groupId}">${group.groupId}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Member</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <select id="select1" name="group" class="form-control" required="">
                                            <option selected="" value="-" disabled="disabled" >-- Choose Member --</option>
                                            <c:forEach var="group" items="${listGroup}">
                                                <option value="${group.groupId}">${group.groupId}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Nama User</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation1" maxlength="20" name="user" type="text" class="form-control" required="required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Posisition</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation1" maxlength="20" name="user" type="text" class="form-control" required="required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Username</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation1" maxlength="20" name="user" type="text" class="form-control" required="required" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation2" maxlength="100" name="email" type="text" class="form-control" required="required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Password</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation2" maxlength="100" name="email" type="text" class="form-control" required="required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Re-Type Password</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation2" maxlength="100" name="email" type="text" class="form-control" required="required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Role</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <select id="select2" name="status" class="form-control" required="">
                                            <option selected="" value="-" disabled="disabled">-- Choose Role --</option>
                                            <option value="1" >User Maker</option>
                                            <option value="2" >User Checker</option>
                                            <option value="3" >User Approval</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Status Active</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <select id="select2" name="status" class="form-control" required="">
                                            <option selected="" value="-" disabled="disabled">-- Choose Status --</option>
                                            <option value="1" >Aktif</option>
                                            <option value="2" >Tidak Aktif</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <br/>
                                        <button onclick="save()" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE</button>
                                        &nbsp;&nbsp;&nbsp;<button class="btn btn-w-m btn-outline btn-primary" type="reset" onclick="reset()"><i class="fa fa-times" ></i> RESET</button>
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

<!-- Mainly scripts -->
<!--<script src="../js/jquery-2.1.1.js"></script>
<script src="../js/bootstrap.min.js"></script>-->
<!--<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>-->

<!-- Custom and plugin javascript -->
<!--<script src="../js/inspinia.js"></script>
<script src="../js/plugins/pace/pace.min.js"></script>-->
<script src="../js/plugins/select2/select2.full.min.js"></script>

<script>
                                            $(".select2_demo_3").select2({
                                                allowClear: true
                                            });
</script>
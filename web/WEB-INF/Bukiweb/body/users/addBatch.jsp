<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="../js/plugins/datapicker/bootstrap-datepicker.js"></script>
<link href="../css/plugins/clockpicker/clockpicker.css" rel="stylesheet" >
<link href="../css/plugins/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet">
<script src="../js/plugins/clockpicker/clockpicker.js"></script>
<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">

    $('.clockpicker').clockpicker();

    $(document).ready(function () {
        $('#tanggal').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            format: 'yyyy-mm-dd'
        });
    });
    
    function showMessage(response) {
        if(response !== ""){
            swal("Attention!", response, "error");
        }
    }

    function save() {
       
        if (document.getElementById('validation2').value === "") {
            alert('Schedule Name Cannot Be Null');
            document.getElementById('validation2').onfocus = true;
            return false;
        }

        if (document.getElementById('validation4').value === "") {
            alert('Timer Cannot Be Null');
            document.getElementById('validation4').onfocus = true;
            return false;
        }

        if (document.getElementById('validation5').value === "") {
            alert('Description Cannot Be Null');
            document.getElementById('validation5').onfocus = true;
            return false;
        }

        $("#test1").load("saveBatch" + "?" + $("form").serialize());
    }
</script>


<script>showMessage('${pesan}')</script>

<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <div class="col-sm-12">
            <div class="panel panel-info" style="font-family: Trebuchet MS">
                <div class="panel-heading">
                    BATCH MAINTENANCE
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h2>INPUT SCHEDULER</h2>                                   
                        </div>

                        <div class="ibox-content" style="font-family: Trebuchet MS">
                            <form id="form" name="form" class="form-horizontal" method="post">
                                <input name="actionType" type="hidden" value="save" />
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Schedule Name</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation2" maxlength="10" name="scheduleName" type="text" class="form-control" required="required"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Schedule Type</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <select class="select form-control m-b-n-sm" name="scheduleType" required="required">
                                            <option value="-" selected="" disabled="">-- Choose Schedule Type --</option>
                                            <option value="3">3 - SORBOR</option>
                                            <option value="4">4 - PAYROLL</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Timer</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <div class="input-group clockpicker" data-autoclose="true">
                                            <input type="text" id="validation4" name = "timer" class="form-control" value="08:00" onkeypress="return false;" >
                                            <span class="input-group-addon">
                                                <span class="fa fa-clock-o"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Description</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation5" maxlength="40" name="description" type="text" class="form-control" required="required"/>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <br/>
                                        <button onclick="save()" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE</button>
                                        &nbsp;&nbsp;&nbsp;<button class="btn btn-w-m btn-outline btn-primary" type="reset"><i class="fa fa-times" ></i> RESET</button>
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
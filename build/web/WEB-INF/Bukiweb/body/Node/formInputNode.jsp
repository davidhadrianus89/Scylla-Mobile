<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
    function checkNode(URL) {
        if (document.getElementById('validation1').value == "") {
            alert('NODEID CANNOT BE NULL');
            document.getElementById('validation1').onfocus = true;
            return false;
        }
        if (document.getElementById('validation2').value == "") {
            alert('NODE NAME CANNOT BE NULL');
            document.getElementById('validation2').onfocus = true;
            return false;
        }
        if (document.getElementById('validation3').value == "") {
            alert('VERSION VALUE CANNOT BE NULL');
            document.getElementById('validation3').onfocus = true;
            return false;
        }
        if (document.getElementById('validation4').value == "") {
            alert('IP SERVER VALUE CANNOT BE NULL');
            document.getElementById('validation4').onfocus = true;
            return false;
        }
        if (document.getElementById('validation5').value == "") {
            alert('URL CANNOT BE NULL');
            document.getElementById('validation5').onfocus = true;
            return false;
        }
        if (document.getElementById('validation6').value == "") {
            alert('SECURE NODE CANNOT BE NULL');
            document.getElementById('validation6').onfocus = true;
            return false;
        }
        if (document.getElementById('validation7').value == "") {
            alert('DESKRIPSI NODE CANNOT BE NULL');
            document.getElementById('validation7').onfocus = true;
            return false;
        }
        $("#test1").load(URL + "?" + $("form").serialize());
    }
</script>

<script type="text/javascript">
    $("#validation1").on("keypress", function (event) {
        var validationForm = /[A-Za-z0-9]/g;

        var key = String.fromCharCode(event.which);

        if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
            return true;
        }
        return false;
    });
//    $('#validation1').on("paste", function (e) {
//        e.preventDefault();
//    });
    $("#validation1").on('keyup', function (e) {
        $(this).val($(this).val().toUpperCase());
    });

    $("#validation2").on("keypress", function (event) {
        var validationForm = /[A-Za-z0-9 ]/g;

        var key = String.fromCharCode(event.which);

        if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
            return true;
        }
        return false;
    });

    $("#validation2").on('keyup', function (e) {
        $(this).val($(this).val().toUpperCase());
    });

    $("#validation3").on("keypress", function (event) {
        var validationForm = /[0-9.]/g;

        var key = String.fromCharCode(event.which);

        if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
            return true;
        }
        return false;
    });
//    $('#validation3').on("paste", function (e) {
//        e.preventDefault();
//    });

    $("#validation4").on("keypress", function (event) {
        var validationForm = /[0-9.:]/g;

        var key = String.fromCharCode(event.which);

        if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
            return true;
        }
        return false;
    });
//    $('#validation4').on("paste", function (e) {
//        e.preventDefault();
//    });

    $("#validation5").on("keypress", function (event) {
        var validationForm = /[0-9/A-Za-z]/g;

        var key = String.fromCharCode(event.which);

        if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
            return true;
        }
        return false;
    });
//    $('#validation5').on("paste", function (e) {
//        e.preventDefault();
//    });

    $("#validation6").on("keypress", function (event) {
        var validationForm = /[0-9 A-Za-z]/g;

        var key = String.fromCharCode(event.which);

        if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
            return true;
        }
        return false;
    });
//    $('#validation6').on("paste", function (e) {
//        e.preventDefault();
//    });

    $("#validation7").on("keypress", function (event) {
        var validationForm = /[0-9 A-Za-z]/g;

        var key = String.fromCharCode(event.which);

        if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
            return true;
        }
        return false;
    });
//    $('#validation7').on("paste", function (e) {
//        e.preventDefault();
//    });
</script>
<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <div class="col-sm-12">
            <div class="panel panel-info" style="font-family: Trebuchet MS">
                <div class="panel-heading">
                    ${form_name} - ${verson}
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>NODE MAINTENANCE</h5>                                   
                        </div>

                        ${pesan}

                        <div class="ibox-content" style="font-family: Trebuchet MS">
                            <form id="form" class="form-horizontal" method="post">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Node ID</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation1" maxlength="10" name="nodeid" type="text" placeholder="ONLY UPPERCASE AND NUMBERS" class="form-control" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Node Name</label>
                                    <div class="col-sm-6 input-group-sm m-b-n-sm">
                                        <input id="validation2" maxlength="100" required="required" name="nodename" type="text" class="text-uppercase form-control" placeholder="ONLY UPPERCASE, NUMBERS AND SPACE">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <label class="col-sm-2 control-label">Node Status</label>
                                        <script type="text/javascript">
                                            function cekrdb1() {
                                                document.getElementById("optNull").disabled = false;
//                                                document.getElementById("optNull").hidden = false;
                                            }

                                            function cekrdb2() {
                                                document.getElementById("optNull").disabled = true;
//                                                document.getElementById("optNull").hidden = true;
                                            }

                                        </script>
                                        <div class="col-sm-10">
                                            <input checked=""  required="required" onchange="cekrdb1()" value="0" id="optionsRadios1" name="nodestatus" type="radio"> Parent Node
                                        </div>
                                        <div class="col-sm-10">
                                            <input required="required" onchange="cekrdb2()" value="1" id="optionsRadios2" name="nodestatus" type="radio"> Child of Parent Node
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="form-group">
                                    <div>
                                        <label class="col-sm-2 control-label">Parent Node</label>
                                        <div class="col-sm-8 input-group-sm m-b-n-sm">
                                            <select class="select2_demo_3 form-control m-b-n-sm" name="parentnode" required="required">
                                                <option id="optNull" value="null">NULL</option>
                                                <c:forEach var="parent" items="${parent}" >
                                                    <option value="${parent.get(0)}">${parent.get(0)} <label class="col-sm-2 control-label"> / </label>${parent.get(1)}</option>
                                                </c:forEach>
                                            </select>                                           
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Version</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input id="validation3" maxlength="12" required="" name="version" type="text" placeholder="Only Numbers and Point" class="form-control" value="01.0.000.000">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">IP Server Function</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input id="validation4" maxlength="20" required="" name="ipserver" type="text" placeholder="Only Numbers, Point and Colon" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">URL</label>
                                    <div class="col-sm-6 input-group-sm m-b-n-sm">
                                        <input id="validation5" maxlength="100" required="" name="nodeurl" type="text" placeholder="Only Letters, Numbers and Slash" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Secure Node</label>
                                    <div class="col-sm-10 input-group-sm m-b-n-sm">
                                        <input id="validation6" maxlength="100" name="securenode" required="" type="text" placeholder="Only Letters, Numbers and Space" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Deskripsi Node</label>
                                    <div class="col-sm-10 input-group-sm m-b-n-sm">
                                        <input id="validation7" maxlength="250" required="" name="descnode" type="text" placeholder="Only Letters, Numbers, and Space" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button onclick="checkNode('NDADD1')" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE</button>
                                        <button class="btn btn-w-m btn-outline btn-primary" type="reset"><i class="fa fa-times" ></i> RESET</button>
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
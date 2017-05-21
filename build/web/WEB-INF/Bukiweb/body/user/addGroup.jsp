<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">
    function showMessage(response) {
        if(response !== ""){
            swal("Attention!", response, "error");
        }
    }
    
    function save() {
        
        $("#test1").load("saveGroup" + "?" + $("form").serialize());
    }
</script>

<script>showMessage('${pesan}')</script>

<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
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
                            <h2>INPUT GROUP</h2>                                   
                        </div>

                        <div class="ibox-content" style="font-family: Trebuchet MS">
                            <form id="form" name="form" class="form-horizontal" method="get" action="#">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Group Id</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input maxlength="10" name="groupId"  type="text" class="form-control" required="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Description</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input maxlength="100" name="description"  type="text" class="form-control" required="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Fitur</label>
                                    <!--<label class="col-sm-2 control-label">Maintenance</label>-->

                                    <div class="col-sm-2">
                                        <label class="checkbox-inline"> 
                                            <input type="checkbox" name="menu" value="U01" id="inlineCheckbox1"> Maintenance </label> 
                                    </div>

                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" value="U02" id="inlineCheckbox2"> Management </label> 
                                    </div>


                                </div>
                                
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline"> 
                                            <input type="checkbox" name="menu" value="U03" id="inlineCheckbox1"> Group Maintenance </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" value="U04" id="inlineCheckbox2"> User Maintenance </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" value="U05" id="inlineCheckbox3"> Batch Maintenance </label>
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

<script src="../js/plugins/select2/select2.full.min.js"></script>

<script>
                                            $(".select2_demo_3").select2({
                                                allowClear: true
                                            });
</script>
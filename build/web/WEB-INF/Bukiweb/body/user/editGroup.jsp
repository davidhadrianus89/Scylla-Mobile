<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="treeMenu" value="${menu}" />

<script type="text/javascript">
    function save() {
        $("#test1").load("doUpdateGroup" + "?" + $("form").serialize());
    }
    
    function resetForm(){
        document.getElementById("validation2").value="";
        document.getElementById("inlineCheckbox1").checked = false;
        document.getElementById("inlineCheckbox2").checked = false;
        document.getElementById("inlineCheckbox3").checked = false;
        document.getElementById("inlineCheckbox4").checked = false;
        document.getElementById("inlineCheckbox5").checked = false;
        document.getElementById("inlineCheckbox6").checked = false;
        document.getElementById("inlineCheckbox7").checked = false;
        document.getElementById("inlineCheckbox8").checked = false;
        document.getElementById("inlineCheckbox9").checked = false;
        document.getElementById("inlineCheckbox10").checked = false;
        document.getElementById("inlineCheckbox11").checked = false;
        document.getElementById("inlineCheckbox12").checked = false;
        document.getElementById("inlineCheckbox13").checked = false;
        document.getElementById("inlineCheckbox14").checked = false;
    }
</script>

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
                            <h2>UPDATE GROUP</h2>                                   
                        </div>

                        ${pesan}

                        <div class="ibox-content" style="font-family: Trebuchet MS">
                            <form id="form" name="form" class="form-horizontal" method="get" action="#">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Group Id</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input maxlength="10" name="groupId" value="${groupId}" type="text" class="form-control" readonly="" required=""/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Description</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input maxlength="100" name="description" id="validation2" value="${desc}" type="text" class="form-control" required=""/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Fitur</label>

                                    <div class="col-sm-2">
                                        <label class="checkbox-inline"> 
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M05')}">checked</c:if> value="M05" id="inlineCheckbox1"> Maintenance </label> 
                                    </div>
                                    
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M06')}">checked</c:if> value="M06" id="inlineCheckbox2"> Management </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M07')}">checked</c:if> value="M07" id="inlineCheckbox3"> Group Maintenance </label>
                                    </div>
                                    <div class="col-sm-2">    
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M08')}">checked</c:if>  value="M08" id="inlineCheckbox4"> User Maintenance</label>    
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>

                                    <div class="col-sm-2">
                                        <label class="checkbox-inline"> 
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M09')}">checked</c:if> value="M09" id="inlineCheckbox5"> Batch Maintenance </label> 
                                    </div>
<!--                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M10')}">checked</c:if> value="M10" id="inlineCheckbox6"> Validasi Rekening </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M11')}">checked</c:if> value="M11" id="inlineCheckbox7"> Upload SP2D </label>
                                    </div>
                                    <div class="col-sm-2">    
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M12')}">checked</c:if> value="M12" id="inlineCheckbox8"> Approve SP2D </label>    
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline"> 
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M13')}">checked</c:if> value="M13" id="inlineCheckbox9"> Pending Payroll </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M14')}">checked</c:if> value="M14" id="inlineCheckbox10"> Download Dokumen </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M15')}">checked</c:if> value="M15" id="inlineCheckbox2"> Upload SOR </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M16')}">checked</c:if> value="M16" id="inlineCheckbox11"> Update ACK </label>
                                    </div>
                                    
                                </div>
                                    
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>
                                    <div class="col-sm-2">  
                                        <label class="checkbox-inline"> 
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M95')}">checked</c:if> value="M95" id="inlineCheckbox1"> Laporan </label> 
                                    </div>
                                </div>    
                                    
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline"> 
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M96')}">checked</c:if> value="M96" id="inlineCheckbox12"> Group Maintenance </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M97')}">checked</c:if> value="M97" id="inlineCheckbox13"> User Maintenance </label> 
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="menu" <c:if test="${fn:contains(treeMenu,'M98')}">checked</c:if> value="M98" id="inlineCheckbox14"> Batch Maintenance </label>
                                    </div>
                                        
                                </div>    -->

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <br/>
                                        <button onclick="save()" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> UPDATE</button>
                                        &nbsp;&nbsp;&nbsp;<button class="btn btn-w-m btn-outline btn-primary" type="button" onclick="resetForm()"><i class="fa fa-times" ></i> RESET</button>
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
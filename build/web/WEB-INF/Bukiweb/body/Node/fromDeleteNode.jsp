<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sweet Alert -->
<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<script src="../js/plugins/select2/select2.full.min.js"></script>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <!--<div class="col-sm-12">-->

        <!--</div>-->
        <div class="col-sm-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    ${form_name} - ${verson}
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>NODE MAINTENANCE</h5>                                   
                        </div>
                        <div class="ibox-tools">
                            <p>${pesan}</p>
                        </div>
                        <div class="ibox-content">
                            <form class="form-horizontal" method="post">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Node ID</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">

                                        <select id="nodeid" onchange="loadNode('NDDEL?node=' + this.value)" class="select2_demo_3  form-control m-b" name="nodeid">
                                            <option>--Pilih Node ID--</option>
                                            <c:forEach var="node" items="${node}" >
                                                <option value="${node.get(0)}">${node.get(0)} || ${node.get(1)}</option>
                                            </c:forEach>
                                        </select> 
                                    </div>
                                </div>
                                <div id="forup">
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Node Name</label>
                                        <div class="col-sm-6 input-group-sm m-b-n-sm">
                                            <c:if test="">

                                            </c:if>
                                            <input disabled="" value="" name="nodename" type="text" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div>
                                            <label class="col-sm-2 control-label">Node Status</label>
                                            <div class="col-sm-10">
                                                <input disabled="" value="0" id="optionsRadios1" name="nodestatus" type="radio"> Parent Node

                                            </div>
                                            <div class="col-sm-10">

                                                <input disabled="" value="1" id="optionsRadios2" name="nodestatus" type="radio"> Child of Parent Node
                                            </div>
                                        </div>                                    
                                    </div>
                                    <div class="form-group">
                                        <div>
                                            <label class="col-sm-2 control-label">Parent Node</label>
                                            <div class="col-sm-8 input-group-sm m-b-n-sm">

                                                <select disabled="" id="parentnodeid" class="form-control m-b" name="parentnode" >
                                                    <option disabled="" id="optNull" value="null"></option>

                                                </select>                                           
                                            </div>
                                        </div>                                    
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Version</label>
                                        <div class="col-sm-4 input-group-sm m-b-n-sm">
                                            <input disabled="" value="" name="version" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">IP Server Function</label>
                                        <div class="col-sm-4 input-group-sm m-b-n-sm">
                                            <input disabled="" value="" name="ipserver" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">URL</label>
                                        <div class="col-sm-6">
                                            <input disabled="" required="" name="nodeurl" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Secure Node</label>
                                        <div class="col-sm-10 input-group-sm m-b-n-sm">
                                            <input disabled="" name="securenode" required="" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Deskripsi Node</label>
                                        <div class="col-sm-10 input-group-sm m-b-n-sm">
                                            <input disabled="" required="" name="descnode" type="text" placeholder="" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button disabled="" class="btn btn-w-m btn-outline btn-primary" type="submit"><i class="fa fa-save"></i> SAVE</button>                                        
                                            <button disabled="" class="btn btn-w-m btn-outline btn-primary" type="reset"><i class="fa fa-times"></i> RESET</button>
                                        </div>
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



<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<script>
                                                
$(".select2_demo_3").select2({
                                                allowClear: true
                                            });
</script>
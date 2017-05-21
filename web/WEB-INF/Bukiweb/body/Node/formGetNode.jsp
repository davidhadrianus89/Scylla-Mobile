<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--<link href="../css/plugins/chosen/chosen.css" rel="stylesheet">-->
<script src="../js/plugins/select2/select2.full.min.js"></script> 
<script type="text/javascript">
    function checkNode(URL) {
        
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
//        alert(URL);
        $("#test1").load(URL + "?" + $("form").serialize());
    }
</script>
<div class="form-group">
    <label class="col-sm-2 control-label">Node Name</label>
    <div class="col-sm-6 input-group-sm m-b-n-sm">
        <input id="validation2" maxlength="100" value="${allnode.SSNODENM}" name="nodename" type="text" class=" form-control">
    </div>
</div>

<div class="form-group">
    <div>
        <label class="col-sm-2 control-label">Node Status</label>
        <script>
            function cekrdb1() {
                document.getElementById("optNull").disabled = false;
                document.getElementById("optNull").hidden = false;
            }

            function cekrdb2() {
                document.getElementById("optNull").hidden = true;
            }

        </script>
        <div class="col-lg-10">
            <input ${cbb} ${radio1} onchange="cekrdb1()" value="0" id="optionsRadios1" name="nodestatus" type="radio"> Parent Node

        </div>
        <div class="col-lg-10">

            <input ${cbb} ${radio2} onchange="cekrdb2()" value="1" id="optionsRadios2" name="nodestatus" type="radio"> Child of Parent Node
        </div>
    </div>                                    
</div>
<div class="form-group">
    <div>

        <script>
            function pilihParent() {
                alert("YOU CAN'T UPDATE PARENT NODE, BEFORE YOU DELETE THIS NODE FROM TREE");
                document.getElementById("parentnode").selected = true;
            }
        </script>
        <label class="col-sm-2 control-label">Parent Node</label>
        <div class="col-sm-8 input-group-sm m-b-n-sm">
            <!--${cbb}-->
            <select ${btn} id="parentnodeid" class="select2_demo_3 form-control m-b" name="parentnode" >
                <!--<option disabled="" id="optNull" value="null">NULL</option>-->
                <option id="parentnode" value="${allnode.SSNODEPRNT}" hidden="">${allnode.SSNODEPRNT} <label class="col-sm-2 control-label"> / </label>${nameParentNode}</option>
                <c:forEach var="parent" items="${parent}" >
                    <c:if test="${parent.get(0) == allnode.SSNODEPRNT}">
                            <option value="${parent.get(0)}" selected="">${parent.get(0)} <label class="col-sm-2 control-label"> / </label>${parent.get(1)}</option>
                    </c:if>
                    <c:if test="${parent.get(0) != allnode.SSNODEPRNT}">
                            <option value="${parent.get(0)}">${parent.get(0)} <label class="col-sm-2 control-label"> / </label>${parent.get(1)}</option>
                    </c:if>
                </c:forEach>
            </select>                                           
        </div>
    </div>                                    
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">Version</label>
    <div class="col-sm-4 tooltip-demo input-group-sm m-b-n-sm">
        <input id="validation3" maxlength="50" value="${allnode.SSNODEVER}" name="version" type="text" placeholder="Only Numbers and Point" class="form-control" data-toggle="tooltip" data-placement="right" data-original-title="Hanya Angka dan Titik">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">IP Server Function</label>
    <div class="col-sm-10 input-group-sm m-b-n-sm">
        <input id="validation4" maxlength="20" value="${allnode.SSNDIPFUNC}" name="ipserver" type="text" placeholder="Only Numbers, Point and Colon" class="form-control">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">URL</label>
    <div class="col-sm-6 input-group-sm m-b-n-sm">
        <input id="validation5" maxlength="100" value="${allnode.SSNODEURL}" required="" name="nodeurl" type="text" placeholder="Only Letters, Numbers and Slash" class="form-control">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">Secure Node</label>
    <div class="col-sm-10 input-group-sm m-b-n-sm">
        <input id="validation6" maxlength="100" value="${allnode.SSSECCODE}" name="securenode" required="" type="text" placeholder="Only Letters, Numbers and Space" class="form-control">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">Deskripsi Node</label>
    <div class="col-sm-10 input-group-sm m-b-n-sm">
        <input id="validation7" maxlength="250" value="${allnode.SSDESCNODE}" required="" name="descnode" type="text" placeholder="Only Letters, Numbers and Space" class="form-control">
    </div>
</div>
<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        <button onclick="checkNode('NDCHG2')" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE</button>
        <button class="btn btn-w-m btn-outline btn-primary" type="reset"><i class="fa fa-times"></i> RESET</button>
    </div>
</div>
<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<script>

    $(".select2_demo_3").select2({
        allowClear: true
    });
</script>
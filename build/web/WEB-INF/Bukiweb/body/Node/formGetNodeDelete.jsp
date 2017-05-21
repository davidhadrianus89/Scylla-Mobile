<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="../js/plugins/select2/select2.full.min.js"></script>
<div class="form-group">
    <label class="col-sm-2 control-label">Node Name</label>
    <div class="col-sm-6 input-group-sm m-b-n-sm">
        <input disabled="" id="validation2" maxlength="100" value="${allnode.SSNODENM}" name="nodename" type="text" class="form-control">
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
            <input disabled="" ${cbb} ${radio1} onchange="cekrdb1()" value="0" id="optionsRadios1" name="nodestatus" type="radio"> Parent Node

        </div>
        <div class="col-lg-10">

            <input disabled="" ${cbb} ${radio2} onchange="cekrdb2()" value="1" id="optionsRadios2" name="nodestatus" type="radio"> Child of Parent Node
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
                <option disabled="" id="optNull" value="null">NULL</option>
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
        <input disabled="" id="validation3" maxlength="50" value="${allnode.SSNODEVER}" name="version" type="text" placeholder="Only Numbers and Point" class="form-control" data-toggle="tooltip" data-placement="right" data-original-title="Hanya Angka dan Titik">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">IP Server Function</label>
    <div class="col-sm-10 input-group-sm m-b-n-sm">
        <input disabled="" id="validation4" maxlength="20" value="${allnode.SSNDIPFUNC}" name="ipserver" type="text" placeholder="Only Numbers, Point and Colon" class="form-control">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">URL</label>
    <div class="col-sm-6 input-group-sm m-b-n-sm">
        <input disabled="" id="validation5" maxlength="100" value="${allnode.SSNODEURL}" required="" name="nodeurl" type="text" placeholder="Only Letters, Numbers and Slash" class="form-control">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">Secure Node</label>
    <div class="col-sm-10 input-group-sm m-b-n-sm">
        <input disabled="" id="validation6" maxlength="100" value="${allnode.SSSECCODE}" name="securenode" required="" type="text" placeholder="Only Letters, Numbers and Space" class="form-control">
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">Deskripsi Node</label>
    <div class="col-sm-10 input-group-sm m-b-n-sm">
        <input disabled="" id="validation7" maxlength="250" value="${allnode.SSDESCNODE}" required="" name="descnode" type="text" placeholder="Only Letters, Numbers and Space" class="form-control">
    </div>
</div>
<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        <button ${btn} class="btn btn-w-m btn-outline btn-primary demo4" type="button"><i class="fa fa-trash-o" /></i> DELETE</button>                                        
        <button class="btn btn-w-m btn-outline btn-primary" type="reset"><i class="fa fa-times" /></i> RESET</button>
    </div>
</div>
<!-- Sweet alert -->
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>



<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<script>

            $(".select2_demo_3").select2({
                allowClear: true
            });
</script>
<script>



    $(document).ready(function () {

        $('.demo4').click(function () {
            swal({
                title: "Are you sure?",
                text: "Your will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, delete it!",
                cancelButtonText: "No, cancel plx!",
                closeOnConfirm: true,
                closeOnCancel: false},
            function (isConfirm) {
                if (isConfirm) {
                    $("#test1").load("NDDEL1?" + $("form").serialize());
//                    loadBodyPost('NDDEL1');
//                    swal("Deleted!", "Your imaginary file has been deleted.", "success");
                } else {
                    swal("Cancelled", "Your imaginary file is safe :)", "error");
                }
            });
        });


    });
</script>


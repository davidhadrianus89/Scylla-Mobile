<link href="../css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">

<script src="../js/plugins/jeditable/jquery.jeditable.js"></script>
<script src="../js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../js/plugins/dataTables/dataTables.tableTools.min.rev.js"></script>

<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<script src="../js/plugins/select2/select2.full.min.js"></script>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

    $(document).ready(function () {
        $('#tabel1').dataTable();
    });

    function showMessage(response) {
        if (response !== "") {
            swal("Information!", response, "info");
        }
    }

    function update(productid, status, process) {
        
        $('#test1').load("updateStatusProduct?productid=" + productid + "&status=" + status );
        $('#modal-product').modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    }

    function hapus(productId) {

        swal({
            title: "Are you sure?",
            text: "You will not be able to recover this Product : " + productId + " !",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, Delete it!",
            cancelButtonText: "No, Cancel plx!",
            closeOnConfirm: false,
            closeOnCancel: false},
        function (isConfirm) {
            if (isConfirm) {

                $("#test1").load("deleteProduct?productid=" + productId);
            } else {
                swal("Cancelled", "Your Product is safe :)", "error");
            }
        }
        );
    }

    function detail(idProduct, prodCode, prodName, groupid, unitid, info, valuta, harga, pict, condition, stok, status_update) {

        $("#productName").val(prodName);
        $("#productCode").val(prodCode);
        $("#productGroup").val(groupid).change();
        $("#productUnit").val(unitid).change();
        $("#information").val(info);
        $("#price").val(harga);
        $('#blah').attr('src', "../imgProduct/" + pict);
        $("#condition").val(condition);
        $("#stok").val(stok);

        formDisable();

        $("#btnprocess").attr("onclick", "update(" + idProduct + " , "+status_update + " )");
        $("#btnreject").attr("onclick", "update(" + idProduct + " , 6 )");

    }


    function formDisable() {

        document.getElementById("productName").disabled = true;
        document.getElementById("productCode").disabled = true;
        document.getElementById("productGroup").disabled = true;
        document.getElementById("productUnit").disabled = true;
        document.getElementById("information").disabled = true;
        document.getElementById("price").disabled = true;
        document.getElementById("condition").disabled = true;
        document.getElementById("stok").disabled = true;
        $("#btnaddgroup").hide();
        $("#btnaddunit").hide();
        $("#btnupload").hide();
    }

    function formEnable() {

        document.getElementById("productName").disabled = false;
        document.getElementById("productCode").disabled = false;
        document.getElementById("productGroup").disabled = false;
        document.getElementById("productUnit").disabled = false;
        document.getElementById("information").disabled = false;
        document.getElementById("price").disabled = false;
        document.getElementById("condition").disabled = false;
        document.getElementById("stok").disabled = false;
        $("#btnaddgroup").show();
        $("#btnaddunit").show();
        $("#btnupload").show();
    }

</script>

<script>

    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            file = input.files[0];
            alert(file.size + " bytes in size");

            if (file.size <= 2000000) {
                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);

            } else {
                alert("Maximum upload image size 2MB");
            }
        }
    }

    $("#inputImage").change(function () {
        readURL(this);
    });

    $("#remove").click(function () {
        $('#blah').attr('src', "../img/no-image-found.jpg");
    });

//    $(".select2_demo_3").select2({
//        allowClear: true
//    });

</script>

<c:if test="${pesan != null}">
    <script>showMessage('${pesan}');</script>
</c:if>

<style type="text/css">
    #tabel1{ width: 100%; overflow-y: hidden !important; overflow-x: auto !important; -ms-overflow-style: -ms-autohiding-scrollbar; -webkit-overflow-scrolling: touch !important; }
</style>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <div class="col-sm-12">
            <div class="panel panel-info" style="font-family: Trebuchet MS">
                <div class="panel-heading">
                    PRODUCT MAINTENANCE
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h2>${title}</h2>
                        </div>
                        <div class="ibox-content" style="font-family: Trebuchet MS">

                            <div id="alerts"></div>
                            <div id="div_box" class="form-group" style="overflow-x: auto;">
                                <table class="table table-striped table-bordered table-hover" id="tabel1" >
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Product Code</th>
                                            <th>Product Name</th>
                                            <th>Product Group</th>
                                            <th>Seller</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                        <c:forEach var="product" items="${list_product}" varStatus="i">        
                                            <tr>
                                                <td>${i.count}</td>
                                                <td>${product.prodCode}</td>
                                                <td>${product.prodName}</td>
                                                <td>${product.groupid}</td>
                                                <td>${product.idProduct}</td>
                                                <td>
                                                    <a data-toggle="modal" onclick="detail('${product.idProduct}', '${product.prodCode}', '${product.prodName}',
                                                                    '${product.groupid}', '${product.unitid}', '${product.info}',
                                                                    '${product.valuta}', '${product.harga}', '${product.pict}',
                                                                    '${product.condition}', '${product.stok}',
                                                                    '${status_update}')" 
                                                       class="btn btn-sm btn-outline btn-primary" href="#modal-product">
                                                        <i class="fa fa-check-square" ></i> 
                                                        Approve
                                                    </a>
                                                </td>
                                            </c:forEach>

                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="modal-product" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h2 class="modal-title">${title}</h2>
            </div>
            <div class="modal-body">
                <form id="form" name="form" class="form-horizontal" enctype="multipart/form-data" method="POST" action="saveProduct">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Product Name</label>
                        <div class="col-sm-4 input-group-sm m-b-n-sm">
                            <input maxlength="50" id="productName" name="productName"  type="text" class="form-control" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Product Code</label>
                        <div class="col-sm-4 input-group-sm m-b-n-sm">
                            <input maxlength="10" id="productCode" name="productCode"  type="text" class="form-control" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Product Group</label>
                        <div class="col-sm-3 input-group-sm m-b-n-sm">
                            <select id="productGroup" name="productGroup" class="select2_demo_3 form-control m-b" required="required">
                                <option hidden="" id="optNullId" value="null">>> Select Group >></option>
                                <c:forEach var="cb" items="${list_group}" >
                                    <option value="${cb.getGroupid()}" id>${cb.getGroupname()}</option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>
                    <div id="btnaddgroup" class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-2 input-group-sm m-b-n-sm">
                            <a data-toggle="modal" class="btn btn-sm btn-outline btn-primary" href="#modal-group">
                                <i class="fa fa-plus-circle" ></i> 
                                Add New Group
                            </a>
                        </div>                                    
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Unit</label>
                        <div class="col-sm-3 input-group-sm m-b-n-sm">
                            <select id="productUnit" name="productUnit" class="select2_demo_3 form-control m-b" required="required">
                                <option hidden="" id="optNullId" value="null">>> Select Unit >></option>
                                <c:forEach var="cb" items="${list_unit}" >
                                    <option value="${cb.getUnitid()}" id>${cb.getUnitname()}</option>
                                </c:forEach>
                            </select>
                        </div>                                    
                    </div>
                    <div id="btnaddunit" class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-2 input-group-sm m-b-n-sm">
                            <a data-toggle="modal" id="btnaddunit" class="btn btn-sm btn-outline btn-primary" href="#modal-unit">
                                <i class="fa fa-plus-circle" ></i> 
                                Add New Unit
                            </a>
                        </div>                                    
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Information</label>
                        <div class="col-sm-4 input-group-sm m-b-n-sm">
                            <textarea id="information" name="information" class="form-control" placeholder="Information.." style="height: 117px;"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Price/Unit</label>
                        <div class="col-sm-2 input-group-sm m-b-n-sm">
                            <select id="valuta"  class="select2_demo_3 form-control m-b" name="pricecb" required="required">
                                <option hidden="" id="optNullId" value="null">Rp. </option>
                            </select>
                        </div>
                        <div class="col-sm-3 input-group-sm m-b-n-sm">
                            <input id="price" name="price"  type="text" class="form-control currency text-right" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Picture</label>
                        <div class="col-sm-4 input-group-sm m-b-n-sm">
                            <div id="btnupload" class="btn-group">
                                <label title="Upload image file" for="inputImage" class="btn btn-primary">
                                    <input accept="image/*" name="file" id="inputImage" class="hide" type="file">
                                    Select Image
                                </label>
                                <label title="Remove Picture" id="remove" class="btn btn-primary">Remove</label>
                                <span class="help-block">Maximum upload image size 2MB. 
                                    <br/> Upload file types : JPG, JPEG, PNG, GIF.
                                </span>
                            </div>
                            <div class="img-preview img-preview-sm">
                                <img id="blah" src="../img/no-image-found.jpg" 
                                     style="min-width: 0px !important; min-height: 0px !important; max-width: none !important; max-height: none !important; width: 200px; height: 125px; margin-left: 0px; margin-top: -1px;">
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Condition</label>
                        <div class="col-sm-4 input-group-sm m-b-n-sm">
                            <input id="condition" name="condition"  type="text" class="form-control" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Stok</label>
                        <div class="col-sm-4 input-group-sm m-b-n-sm">
                            <input id="stok" name="Stok"  type="text" class="form-control numbr" required="">
                        </div>
                    </div>
                    <br/>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <br/>
                            <button id="btnprocess" onclick="saveProduct()" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> PROSESS</button>
                            &nbsp;&nbsp;&nbsp;
                            <button id="btnreject" onclick="saveProduct()" class="btn btn-w-m btn-outline btn-danger" type="button"><i class="fa fa-remove" ></i> REJECT</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
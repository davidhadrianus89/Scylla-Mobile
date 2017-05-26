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

    function showMessageError(response) {
        if (response !== "") {
            swal("Attention!", response, "error");
        }
    }

    function saveProduct(act) {

        var productname = document.getElementById('productName').value;
        var productcode = document.getElementById('productCode').value;
        var productgroup = document.getElementById('productGroup').value;
        var productunit = document.getElementById('productUnit').value;
        var information = document.getElementById('information').value;
        var price = document.getElementById('price').value;
        var fileControl = document.getElementById('inputImage');
        var condition = document.getElementById('condition').value;
        var stok = document.getElementById('stok').value;

        if (productname.length === 0) {
            showMessageError("Please enter product name");
            return false;
        } else if (productcode.length === 0) {
            showMessageError("Please enter product code");
            return false;
        } else if (productgroup === "null") {
            showMessageError("Please select product group");
            return false;
        } else if (productunit === "null") {
            showMessageError("Please select product unit");
            return false;
        } else if (information.length === 0) {
            showMessageError("Please enter information");
            return false;
        } else if (price.length === 0) {
            showMessageError("Please enter price");
            return false;
        } else if (fileControl.files.length === 0) {
            showMessageError("Please Select File");
            return false;
        } else if (condition.length === 0) {
            showMessageError("Please enter condition");
            return false;
        } else if (stok.length === 0) {
            showMessageError("Please enter stok");
            return false;
        }

        var formData = new FormData();

        formData.append('productname', productname);
        formData.append('productcode', productcode);
        formData.append('productgroup', productgroup);
        formData.append('productunit', productunit);
        formData.append('information', information);
        formData.append('valuta', 'Rp.');
        formData.append('price', price);
        formData.append('stok', stok);
        formData.append('file', fileControl.files[0]);
        formData.append('condition', condition);
        formData.append('status', '3');

        $(document).ready(function () {
            $('#reset').trigger("click");
            $('#blah').attr('src', "../img/no-image-found.jpg");
        });

        jQuery.ajax({
            url: 'saveProduct',
            type: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: function (data, status, xhr) {
                if (data !== '0') {
                    swal("Warning!", data, "error");
//                    document.getElementById('div_table').hidden = true;
                } else {
//                    document.getElementById('div_table').hidden = false;
//                    $('#div_table').load("dataValidasi");
                    resetForm();

                    swal("Warning!", data, "info");
                }
            },
            error: function (xhr, status, e) {
                swal("Warning!", "500 - Internal Server Error. " + status, "error");
            }
        });

        if (act === 1) {
            $("#test1").load("masterProduct");
            hidemodal();
        }


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

    function detail(prodCode, prodName, groupid, unitid, info, valuta, harga, pict, condition, stok) {

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

    }

    function edit(prodCode, prodName, groupid, unitid, info, valuta, harga, pict, condition, stok) {

        $("#productName").val(prodName);
        $("#productCode").val(prodCode);
        $("#productGroup").val(groupid).change();
        $("#productUnit").val(unitid).change();
        $("#information").val(info);
        $("#price").val(harga);
        $('#blah').attr('src', "../imgProduct/" + pict);
        $("#condition").val(condition);
        $("#stok").val(stok);

        formEnable();

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
        document.getElementById("btnsave").disabled = true;
        document.getElementById("btnreset").disabled = true;
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
        document.getElementById("btnsave").disabled = false;
        document.getElementById("btnreset").disabled = false;
        $("#btnaddgroup").show();
        $("#btnaddunit").show();
        $("#btnupload").show();
    }

    function hidemodal() {
        $('#modal-product').modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
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

<script>
    $('.numbr').on("keypress", function (event) {
        var validationForm = /[0-9]/g;
        var key = String.fromCharCode(event.which);
        if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
            $('.currency').formatCurrency({symbol: '', roundToDecimalPlace: 0});
            return true;
        }
        return false;
    });

    $(document).ready(function ()
    {
        $('.currency').blur(function ()
        {
            $('.currency').formatCurrency({symbol: '', roundToDecimalPlace: 0});
        });
    });

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
                            <h2>MASTER PRODUCT</h2>
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
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                        <c:forEach var="product" items="${list_product}" varStatus="i">        
                                            <tr>
                                                <td>${i.count}</td>
                                                <td>${product.prodCode}</td>
                                                <td>${product.prodName}</td>
                                                <td>${product.TGroup.groupname}</td>

                                                <c:choose>
                                                    <c:when test="${product.status == '0'}">
                                                        <td><div class="label label-info">NEW</div></td>
                                                    </c:when>
                                                    <c:when test="${product.status == '1'}">
                                                        <td><div class="label label-warning">CHECKER</div></td>
                                                    </c:when>
                                                    <c:when test="${product.status == '2'}">
                                                        <td><div class="label label-primary">APPROVAL</div></div></td>
                                                    </c:when>
                                                    <c:when test="${product.status == '3'}">
                                                        <td><div class="label label-success">EDIT CHECKER</div></td>
                                                    </c:when>
                                                    <c:when test="${product.status == '4'}">
                                                        <td><div class="label label-inverse">EDIT APPROVAL</div></td>
                                                    </c:when>
                                                    <c:when test="${product.status == '6'}">
                                                        <td><div class="label label-danger">REJECT</div></td>
                                                    </c:when>
                                                </c:choose>

<!--<td>${product.status}</td>-->
                                                <td>
                                                    <a data-toggle="modal" onclick="detail('${product.prodCode}', '${product.prodName}',
                                                                    '${product.TGroup.groupid}', '${product.TUnit.unitid}', '${product.info}',
                                                                    '${product.valuta}', '${product.harga}', '${product.pict}',
                                                                    '${product.condition}', '${product.stok}')" 
                                                       class="btn btn-sm btn-outline btn-success" href="#modal-product">
                                                        <i class="fa fa-file-text-o" ></i> 
                                                        Detail
                                                    </a>
                                                    &nbsp;&nbsp;
                                                    <a data-toggle="modal" onclick="edit('${product.prodCode}', '${product.prodName}',
                                                                    '${product.TGroup.groupid}', '${product.TUnit.unitid}', '${product.info}',
                                                                    '${product.valuta}', '${product.harga}', '${product.pict}',
                                                                    '${product.condition}', '${product.stok}')" class="btn btn-sm btn-outline btn-primary" href="#modal-product">
                                                        <i class="fa fa-paste" ></i> 
                                                        Edit
                                                    </a>
                                                    &nbsp;&nbsp;
                                                    <a data-toggle="modal" onclick="hapus('${product.idProduct}')" class="btn btn-sm btn-outline btn-danger" href="#">
                                                        <i class="fa fa-trash" ></i> 
                                                        Delete
                                                    </a>    
                                                </td>
                                            </c:forEach>

                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            <div class="form-group" >
                                <a href="#" class="btn btn-w-m btn-outline btn-primary" type="button" onclick="loadPage('addProduct')" id="save" ><i class="fa fa-save"> ADD NEW</i></a>
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
                <h2 class="modal-title">Detail Product</h2>
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
                                <c:forEach var="cb" items="${list_cb}" >
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
                            <input id="price" name="price"  type="text" class="form-control currency numbr text-right" required="">
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
                            <button id="btnsave" onclick="saveProduct(1)" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE</button>
                            &nbsp;&nbsp;&nbsp;
                            <button id="btnreset" class="btn btn-w-m btn-outline btn-primary" type="reset"><i class="fa fa-times" ></i> RESET</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="modal-group" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h2 class="modal-title">Add New Group</h2>
            </div>
            <form id="form" name="form" role="form" method="get" action="#">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Group Name</label> 
                        <input name="groupname" placeholder="Enter group name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label> 
                        <textarea name="groupdesc" placeholder="Description.." class="form-control" required style="width: 240px; height: 117px;"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closemodal" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button type="button" onclick="saveGroupProduct()" class="btn btn-primary"><i class="fa fa-save" ></i> Save</button>
                </div>
            </form>

        </div>
    </div>
</div>
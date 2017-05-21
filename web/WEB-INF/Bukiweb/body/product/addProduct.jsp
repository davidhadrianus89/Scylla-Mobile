<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<script src="../js/plugins/select2/select2.full.min.js"></script>
<script src="../js/jquery/jquery.formatCurrency-1.4.0.js"></script> 


<script type="text/javascript">
    function showMessage(response) {
        if (response !== "") {
            swal("Attention!", response, "info");
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
        formData.append('status', '0');

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
        }


    }

    function adddata(act, ) {

        document.getElementById("titlemodal").innerHTML = "Add New " + act;
        document.getElementById("labelname").innerHTML = act + " Name";

        if (act === "Group") {
            $("#btnsavedata").attr("onclick", "saveGroupProduct()");
            //saveGroupProduct();
        } else {
            $("#btnsavedata").attr("onclick", "saveUnitProduct()");
            //saveUnitProduct();
        }
    }

    function saveGroupProduct() {

        $("#test1").load("addGroupProduct" + "?" + $("form").serialize() + "&act=0");
        hidemodal();
    }

    function saveUnitProduct() {
        $("#test1").load("addUnitProduct" + "?" + $("form").serialize() + "&act=0");
        hidemodal();
    }

    function hidemodal() {
        $('#modal-group').modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    }

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

<script>
    $(".select2_demo_3").select2({
        allowClear: true
    });


    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            file = input.files[0];
            //alert(file.size + " bytes in size");

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

</script>

<c:if test="${pesan != null}">
    <script>showMessage('${pesan}');</script>
</c:if>


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
                            <h2>ADD PRODUCT</h2>                                   
                        </div>

                        <div class="ibox-content" style="font-family: Trebuchet MS">
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
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-2 input-group-sm m-b-n-sm">
                                        <a data-toggle="modal" onclick="adddata('Group')" class="btn btn-sm btn-outline btn-primary" href="#modal-group">
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
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-2 input-group-sm m-b-n-sm">
                                        <a data-toggle="modal" onclick="adddata('Unit')" class="btn btn-sm btn-outline btn-primary" href="#modal-group">
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
                                    <div class="col-sm-1 input-group-sm m-b-n-sm">
                                        <select id="sysid" onchange="inputPress()" class="select2_demo_3 form-control m-b" name="pricecb" required="required">
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
                                        <div class="btn-group">
                                            <label title="Upload image file" for="inputImage" class="btn btn-primary">
                                                <input accept="image/*" name="file" id="inputImage" class="hide" type="file">
                                                Select Image
                                            </label>
                                            <label title="Remove Picture" id="remove" class="btn btn-primary">Remove</label>

                                            <div class="img-preview img-preview-sm">
                                                <img id="blah" src="../img/no-image-found.jpg" 
                                                     style="min-width: 0px !important; min-height: 0px !important; max-width: none !important; max-height: none !important; width: 200px; height: 125px; margin-left: 0px; margin-top: -1px;">
                                            </div>
                                        </div>
                                        <span class="help-block">Maximum upload image size 2MB. 
                                            <br/> Upload file types : JPG, JPEG, PNG, GIF.
                                        </span>
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
                                        <button onclick="saveProduct(1)" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE</button>
                                        &nbsp;&nbsp;&nbsp;
                                        <button onclick="saveProduct(2)" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> SAVE AND ADD ANOTHER</button>
                                        &nbsp;&nbsp;&nbsp;
                                        <button class="btn btn-w-m btn-outline btn-primary" type="reset" id="reset"><i class="fa fa-times" ></i> RESET</button>
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


<div class="modal inmodal fade" id="modal-group" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h2 class="modal-title" id="titlemodal">Add New</h2>
            </div>
            <form id="form" name="form" role="form" method="get" action="#">
                <div class="modal-body">
                    <div class="form-group">
                        <label id="labelname">Name</label> 
                        <input name="name" placeholder="Enter name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label> 
                        <textarea name="desc" placeholder="Description.." class="form-control" required style="width: 240px; height: 117px;"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closemodal" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button id="btnsavedata" type="button" class="btn btn-primary"><i class="fa fa-save" ></i> Save</button>
                </div>
            </form>

        </div>
    </div>
</div>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cekGroup" value="${group}" />

<script type="text/javascript">
    function save(URL) {
        if (document.getElementById('validation1').value === "") {
            alert('Username Cannot Be Null');
            document.getElementById('validation1').onfocus = true;
            return false;
        }
        
        if (document.getElementById('validation2').value === "") {
            alert('Email Cannot Be Null');
            document.getElementById('validation2').onfocus = true;
            return false;
        }
        
        if (document.getElementById('validation3').value === "") {
            alert('Phone Cannot Be Null');
            document.getElementById('validation3').onfocus = true;
            return false;
        }
        
        
        $("#test1").load("saveUser" + "?" + $("form").serialize());
    }
    
    function resetForm(){
        document.getElementById("validation2").value="";
        document.getElementById("validation3").value="";
    }
</script>

<link href="../css/plugins/select2/select2.min.css" rel="stylesheet">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">                        
        <div class="col-sm-12">
            <div class="panel panel-info" style="font-family: Trebuchet MS">
                <div class="panel-heading">
                    USER MAINTENANCE
                </div>
                <div class="panel-body">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h2>UPDATE USER</h2>                                   
                        </div>

                        ${pesan}

                        <div class="ibox-content" style="font-family: Trebuchet MS">
                            <form id="form" name="form" class="form-horizontal" method="post">
                                <input type="hidden" name="action" value="update"/>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Username</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input id="validation1" maxlength="20" readonly="" name="user" value="${user}" type="text" class="form-control" required="required" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation2" maxlength="100" name="email" value="${email}" type="text" class="form-control" required="required"/>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Phone</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <input  id="validation3" maxlength="16" name="phone" onkeypress="return isNumberKey(event)" value="${phone}" type="text" class="form-control" required="required"/>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Group User</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <select name="group" class="form-control" required="">
                                            <!--option selected="" disabled="disabled" >-- Choose Group --</option -->
                                            <c:forEach var="group" items="${listGroup}">
                                                <option value="${group.userGroupId}" <c:if test="${fn:contains(group.userGroupId, cekGroup)}">selected=""</c:if>>${group.description}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Status Active</label>
                                    <div class="col-sm-4 input-group-sm m-b-n-sm">
                                        <select name="status" class="form-control" required="">
                                            <!--option selected="" disabled="disabled">-- Choose Status --</option -->
                                            <option value="1" <c:if test="${fn:contains(status, '1')}">selected=""</c:if> >Aktif</option>
                                            <option value="2" <c:if test="${fn:contains(status, '2')}">selected=""</c:if> >Tidak Aktif</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <br/>
                                        <button onclick="save()" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-save" ></i> UPDATE</button>
                                        &nbsp;&nbsp;&nbsp;<button onclick="resetForm()" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-times" ></i> RESET</button>
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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

-->
<!--<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet">

--><link href="../css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet"><!--

<link href="../css/animate.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">-->


<style type="text/css">
    #tableNode{ width: 100%; overflow-y: hidden !important; overflow-x: auto !important; -ms-overflow-style: -ms-autohiding-scrollbar; -webkit-overflow-scrolling: touch !important; }
</style>
<div class="ibox-content" id="tableNode">
    <table class="table table-striped table-bordered table-hover " id="editable" >
        <thead>
            <tr align="center">
                <th align="center">No</th>
                <th>Node Id</th>
                <th>Node Name</th>
                <th>Parent Node</th>
                <th>IP Server Function</th>
                <th>Version</th>
                <th>URL</th>
                <th>Security Code</th>
                <th>Description Code</th>

            </tr>
        </thead>
        <tbody>
            <% int i = 1;%>
            <c:forEach var="node" items="${node}">
                <tr>
                    <td align="center"><%=i++%></td>
                    <td>${node.SSNODEID}</td>
                    <td>${node.SSNODENM}</td>
                    <td align="center">${node.SSNODEPRNT}</td>
                    <td>${node.SSNDIPFUNC}</td>
                    <td>${node.SSNODEVER}</td>
                    <td>${node.SSNODEURL}</td>
                    <td>${node.SSSECCODE}</td>
                    <td align="center">${node.SSDESCNODE}</td>

                </tr>

            </c:forEach>
        </tbody>

    </table>
</div>
<!-- Mainly scripts -->
<%--<%@include file="newjsp.jsp" %>--%>
<!--<script src="../js/jquery-2.1.1.js"></script>
<script src="../js/bootstrap.min.js"></script>-->
<!--<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>-->
<!--<script src="../js/plugins/jeditable/jquery.jeditable.js"></script>-->

<script src="../js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../js/plugins/dataTables/dataTables.tableTools.min.rev.js"></script>

<!-- Custom and plugin javascript -->
<!--<script src="../js/inspinia.js"></script>
<script src="../js/plugins/pace/pace.min.js"></script>-->
<script>
    $(document).ready(function () {
        $('#editable').DataTable({
//            "dom": 'lTfigt',
            "dom": 'T<"clear">lfrtip',
            "tableTools": {
                "sSwfPath": "../js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"}
        });

        /* Init DataTables */
        var oTable = $('#editable').DataTable();

        /* Apply the jEditable handlers to the table */
        oTable.$('td').editable('../example_ajax.php', {
            "callback": function (sValue, y) {
                var aPos = oTable.fnGetPosition(this);
                oTable.fnUpdate(sValue, aPos[0], aPos[1]);
            },
//            "submitdata": function (value, settings) {
//                return {
//                    "row_id": this.parentNode.getAttribute('id'),
//                    "column": oTable.fnGetPosition(this)[2]
//                };
//            },
            "width": "90%",
            "height": "100%"
        });


    });

    function fnClickAddRow() {
        $('#editable').dataTable().fnAddData([
            "Custom row",
            "New row",
            "New row",
            "New row",
            "New row"]);

    }
</script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet">-->
<link href="../css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
<link href="../css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">

<!--<link href="../css/animate.css" rel="stylesheet">
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

            <tr>
                <td align="center"></td>
                <td></td>
                <td></td>
                <td align="center"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td align="center"></td>

            </tr>

        </tbody>

    </table>
    <!--<div class="col-lg-offset-2 col-lg-10">-->
    <button onclick="loadHome('NDDIS2')" class="btn btn-w-m btn-outline btn-primary" type="button"><i class="fa fa-table"></i> RETRIEVE ALL NODE</button>                                        
    <!--</div>-->
</div>
<!--<script src="../js/jquery-2.1.1.js"></script>
<script src="../js/bootstrap.min.js"></script>-->
<!--<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>-->
<script src="../js/plugins/jeditable/jquery.jeditable.js"></script>

<script src="../js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../js/plugins/dataTables/dataTables.tableTools.min.rev.js"></script>

<!-- Custom and plugin javascript -->
<!--<script src="../js/inspinia.js"></script>
<script src="../js/plugins/pace/pace.min.js"></script>-->
<script>
                $(document).ready(function () {
        $('.dataTables-example').DataTable({
            "dom": 'lTfigt',
            "tableTools": {
                    "sSwfPath": "../js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"             }
        });

                    /* Init DataTables */
                var oTable = $('#editable').DataTable();

            /* Apply the jEditable handlers to the table */
    oTable.$('td').editable('../example_ajax.php', {
        "callback": function (sValue, y) {
            var aPos = oTable.fnGetPosition(this);
            oTable.fnUpdate(sValue, aPos[0], aPos[1]);
            },
    "submitdata": function (value, settings) {
                return {
                    "row_id": this.parentNode.getAttribute('id'),
                    "column": oTable.fnGetPosition(this)[2]
                };
            },
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
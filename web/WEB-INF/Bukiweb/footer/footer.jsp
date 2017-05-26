<%-- 
    Document   : footer
    Created on : Nov 19, 2015, 8:55:43 AM
    Author     : Rustanian
--%>
<script type="text/javascript" src="../js/MaskedPassword.js"></script>
<!-- Mainly scripts -->
<script src="/../js/jquery-2.1.1.js"></script>
<script src="/../js/bootstrap.min.js"></script>
<script src="/../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="/../js/plugins/flot/jquery.flot.js"></script>
<script src="/../js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="/../js/plugins/flot/jquery.flot.spline.js"></script>
<script src="/../js/plugins/flot/jquery.flot.resize.js"></script>
<script src="/../js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity -->
<script src="../js/plugins/peity/jquery.peity.min.js"></script>
<script src="../js/demo/peity-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="/../js/inspinia.js"></script>
<script src="/../js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="/../js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- GITTER -->
<script src="/../js/plugins/gritter/jquery.gritter.min.js"></script>

<!-- Sparkline -->
<script src="/../js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="/../js/demo/sparkline-demo.js"></script>


<!-- Toastr -->
<script src="/../js/plugins/toastr/toastr.min.js"></script>

<script src="/../js/plugins/iCheck/icheck.min.js"></script>
<script src="/../js/plugins/idle-timer/idle-timer.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
        $(document).idleTimer(600000);
//            alert('test1');
//        $(document).idleTimer(6000);
        $(document).on("idle.idleTimer", function (event, elem, obj) {
//            alert('test');
            toastr.options = {
                "positionClass": "toast-top-right",
                "timeOut": 8000
            }
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "removeSession?userid=" + document.getElementById("usercek").value, true);
            xhttp.send();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    var a = xhttp.responseText;
                    var li_ret = a.split("#");
                    a = li_ret[0];

                    document.getElementById("userbk").value=document.getElementById("usercek").value;
//                    alert();
//                    document.getElementsByName("username").valueOf()
                    $('#myModal').modal({backdrop: 'static', keyboard: false, show: true});
                }
            };
        });
    });
</script>

<script>

</script>
<script type="text/javascript">

    //apply masking to the demo-field
    //pass the field reference, masking symbol, and character limit
    new MaskedPassword(document.getElementById("password"), '\u25CF');

</script>


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

<!-- ChartJS-->
<script src="/../js/plugins/chartJs/Chart.min.js"></script>

<!-- Toastr -->
<script src="/../js/plugins/toastr/toastr.min.js"></script>

<!--datapicker and chosen select-->

<!--
<script src="../js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="../js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="../js/plugins/dataTables/dataTables.tableTools.min.js"></script>-->

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
//                 
//                    var log = "";
////                    log = log + "<label > <font color=\"red\" >Error Code :" + li_ret[0] + "</font> </label><br/>";
////                    log = log + "<label > <font color=\"red\" >Message :" + li_ret[1] + "</font> </label>";
//                    log = log + "<div class=\"form-group\"><div class=\"input-group m-b\"><span class=\"input-group-addon\"><span class=\"fa fa-user\"></span></span> <input name=\"username\" value=\"" + document.getElementById("usercek").value + "\" type=\"text\" placeholder=\"Enter your user name\" class=\"form-control\" maxlength=\"10\" id=\"userbk\" readonly=\"\"></div></div>";
//                    log = log + "<div class=\"form-group\"><div class=\"input-group m-b\"><span class=\"input-group-addon\"><span class=\"fa fa-lock\"></span></span> <input name=\"password\" type=\"text\" placeholder=\"Enter your password\" class=\"form-control password\" maxlength=\"10\" id=\"password\"></div></div>";
//                    
//                    document.getElementById("died").innerHTML = log;
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
<script>//
//    $(document).ready(function () {
//        setTimeout(function () {
//            toastr.options = {
//                closeButton: true,
//                progressBar: true,
//                showMethod: 'slideDown',
//                timeOut: 4000
//            };
//            toastr.success('BUKOPIN INFORMATION WEB', 'Welcome to BUKIWEB');
//
//        }, 1300);
//
//
//        var data1 = [
//            [0, 4], [1, 8], [2, 5], [3, 10], [4, 4], [5, 16], [6, 5], [7, 11], [8, 6], [9, 11], [10, 30], [11, 10], [12, 13], [13, 4], [14, 3], [15, 3], [16, 6]
//        ];
//        var data2 = [
//            [0, 1], [1, 0], [2, 2], [3, 0], [4, 1], [5, 3], [6, 1], [7, 5], [8, 2], [9, 3], [10, 2], [11, 1], [12, 0], [13, 2], [14, 8], [15, 0], [16, 0]
//        ];
//        $("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [
//            data1, data2
//        ],
//                {
//                    series: {
//                        lines: {
//                            show: false,
//                            fill: true
//                        },
//                        splines: {
//                            show: true,
//                            tension: 0.4,
//                            lineWidth: 1,
//                            fill: 0.4
//                        },
//                        points: {
//                            radius: 0,
//                            show: true
//                        },
//                        shadowSize: 2
//                    },
//                    grid: {
//                        hoverable: true,
//                        clickable: true,
//                        tickColor: "#d5d5d5",
//                        borderWidth: 1,
//                        color: '#d5d5d5'
//                    },
//                    colors: ["#1ab394", "#1C84C6"],
//                    xaxis: {
//                    },
//                    yaxis: {
//                        ticks: 4
//                    },
//                    tooltip: false
//                }
//        );
//
//        var doughnutData = [
//            {
//                value: 300,
//                color: "#a3e1d4",
//                highlight: "#1ab394",
//                label: "App"
//            },
//            {
//                value: 50,
//                color: "#dedede",
//                highlight: "#1ab394",
//                label: "Software"
//            },
//            {
//                value: 100,
//                color: "#A4CEE8",
//                highlight: "#1ab394",
//                label: "Laptop"
//            }
//        ];
//
//        var doughnutOptions = {
//            segmentShowStroke: true,
//            segmentStrokeColor: "#fff",
//            segmentStrokeWidth: 2,
//            percentageInnerCutout: 45, // This is 0 for Pie charts
//            animationSteps: 100,
//            animationEasing: "easeOutBounce",
//            animateRotate: true,
//            animateScale: false
//        };
//
//        var ctx = document.getElementById("doughnutChart").getContext("2d");
//        var DoughnutChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);
//
//        var polarData = [
//            {
//                value: 300,
//                color: "#a3e1d4",
//                highlight: "#1ab394",
//                label: "App"
//            },
//            {
//                value: 140,
//                color: "#dedede",
//                highlight: "#1ab394",
//                label: "Software"
//            },
//            {
//                value: 200,
//                color: "#A4CEE8",
//                highlight: "#1ab394",
//                label: "Laptop"
//            }
//        ];
//
//        var polarOptions = {
//            scaleShowLabelBackdrop: true,
//            scaleBackdropColor: "rgba(255,255,255,0.75)",
//            scaleBeginAtZero: true,
//            scaleBackdropPaddingY: 1,
//            scaleBackdropPaddingX: 1,
//            scaleShowLine: true,
//            segmentShowStroke: true,
//            segmentStrokeColor: "#fff",
//            segmentStrokeWidth: 2,
//            animationSteps: 100,
//            animationEasing: "easeOutBounce",
//            animateRotate: true,
//            animateScale: false
//        };
//        var ctx = document.getElementById("polarChart").getContext("2d");
//        var Polarchart = new Chart(ctx).PolarArea(polarData, polarOptions);
//
//    });
</script>

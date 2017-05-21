<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Welcome to Scylla Mobile Back Office</title>



    <link href="/../css/bootstrap.min.css" rel="stylesheet">
    <link href="/../font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="/../css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <!--Shortcut Icon-->
    <link rel="shortcut icon" href="/../img/miniLogoBukopin.png">

    <!-- Gritter -->
    <link href="/../js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <!--    <link href="../css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
        <link href="../css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
        <link href="../css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">-->
    <link href="/../css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/../css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">

    <link href="/../css/animate.css" rel="stylesheet">
    <link href="/../css/style.css" rel="stylesheet">
    <link href="/../css/loaderCoba.css" rel="stylesheet">
    <script src="/../js/jquery/jquery.min.js"></script>
    <style type="text/css">
        .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}
        .jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
    </style>
    <script>
//        window.history.forward();
        function noBack() {
//            location.reload(true);
//            window.onbeforeunload = function () {
//                alert("You Can't Back Page");
//            };
        }

//        End off tab mode

        var message = "Sorry !!! Right Click is Disabled";

        function clickIE4() {

            if (event.button == 2) {

                alert(message);

                return false;

            }

        }

        function clickNS4(e) {

            if (document.layers || document.getElementById && !document.all) {

                if (e.which == 2 || e.which == 3) {

                    alert(message);

                    return false;

                }

            }

        }

        if (document.layers) {

            document.captureEvents(Event.MOUSEDOWN);

            document.onmousedown = clickNS4;

        }

        else if (document.all && !document.getElementById) {

            document.onmousedown = clickIE4;

        }

        document.oncontextmenu = new Function("return false");
    </script>
    <script>
        var param;
        $(document).ready(function () {
            $(document).ajaxStart(function () {
                $("#wait").css("display", "block");
                $('#myModalCoba').modal({backdrop: 'static', keyboard: false, show: true});
            });
            $(document).ajaxComplete(function () {
//                alert('test');
                $("#wait").css("display", "none");
                $('#myModalCoba').modal('hide');
            });
        });

        function loadBody(URL) {
            //who's cika??
            var cika;
            alert(URL);
            var dita = URL.split("&");
//            alert(dita);
//            alert(dita[0]);
//            alert(dita[1]);
//            alert(dita[3]);
            var usrid = dita[3];
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "cekSession?" + dita[3], true);
            xhttp.send();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
//                    alert(xhttp.responseText);
                    var a = xhttp.responseText;
                    var li_ret = a.split("#");
                    a = li_ret[0];
//                    alert('a : ' + a);
                    if (a != 0) {
//                        alert('false')
//                        var log = "";
//                        log = log + "<label >Message :" + li_ret + " </label>";
//                        log = log + "<div class=\"form-group\"><label>User Name</label> <input name=\"username\" value=\"" + usrid.replace("userid=", "") + "\" type=\"text\" placeholder=\"Enter your user name\" class=\"form-control\" maxlength=\"10\" id=\"userbk\" readonly=\"\"></div>";
//                        log = log + "<div class=\"form-group\"><label>Password</label> <input name=\"password\" type=\"password\" placeholder=\"Enter your password\" class=\"form-control\" maxlength=\"10\" id=\"password\"></div>";
//                        document.getElementById("died").innerHTML = log;
                        document.getElementById("userbk").value = usrid.replace("userid=", "");
//                        document.getElementById("password").innerHTML = dita[3];
//                        $('#myModal').modal('show');
                        $('#myModal').modal({backdrop: 'static', keyboard: false, show: true});
//                          test123();
//                        $('#myModal').modal({backdrop:'static',keyboard:false, show:true});
                    } else {
                        URL = "validationPage?tujuan=" + URL + "&servRus=" + window.location;
                        //alert(URL);
                        cika = $("#test1").load(URL);
                    }
                }
            };
        }
        function checkSes(URL) {
//            alert(URL);
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "cekSession", true);
            xhttp.send();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
//                    alert(xhttp.responseText);
                    var a = xhttp.responseText;
//                    alert('a : ' + a);
                    if (a == 1) {
                        $('#myModal').modal('show');
                        return false;
                    } else {
                        return true;
                    }

//                        document.getElementById("time").innerHTML = xhttp.responseText;
                }
            };

        }

        function chg(URL) {
//            alert(URL);
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", URL, true);
            xhttp.send();
        }

        function loadHome(URL) {
//            alert(URL);
            $("#test1").load(URL);
        }

        function getValue()
        {
            var username = document.getElementById("username");
            var password = document.getElementById("password");
//            alert(username);
//            alert(password);
        }

        function loadNode(URL) {
            // alert(URL);
            $("#forup").load(URL);
        }

        function loadBb(URL) {
//            alert(URL);
            $("#neng").load(URL);
        }

        function loadDel(URL) {
//            alert(URL);
            if (confirm("Are you sure delete this tree ?") === true) {
                $("#test1").load(URL);
//                loadBodyPost(URL);
            } else {
                return false;
            }
        }

        function loadUp(URL) {
//            alert(URL);
            $("#test1").load("getforUpdate?nodeid=" + URL);
        }

        function loadAa(URL) {
//            alert(URL);
            $("#nengkuh").load(URL);
        }

        function loadAaTo(URL) {
//            alert(URL);
            $("#nengkuh1").load(URL);
        }

        function loadGrpTree(parameter) {
            param = parameter;
            $('#modalGrpTree').modal('show');
        }

        function loadModal(parameter) {
            param = parameter;
            $('#modalTree').modal('show');
        }

        function loadInsert(URL) {
//            alert(URL);
            $("#test1").load(URL + "?nodeid=" + param);
        }

        function loadBodyPost(URL) {
//            alert(URL);

//            alert($("form").);
//            alert($("form").serialize());
//            if($("form").serialize() == null){
//                
//            }
//            if (URL === 'TRDEL1') {
//                if (confirm("Are you sure delete this tree ?") === true) {
////                    return true;
//                } else {
//                    return false;
//                }
//            }else if(URL === 'NDDEL1'){
//                if (confirm("Are you sure delete this node ?") === true) {
////                    return true;
//                } else {
//                    return false;
//                }
//            }
//            alert(URL);
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    //$("#demo").load("test");
                    document.getElementById("test1").innerHTML = xhttp.responseText;
                }
            };
////            alert($("form").serialize());
            xhttp.open("GET", URL + '?' + $("form").serialize(), true);
            xhttp.send();

            $(document).ready(function () {
                $(document).ajaxStart(function () {
                    $("#wait").css("display", "block");
                    $('#myModalCoba').modal({backdrop: 'static', keyboard: false, show: true});
                });
                $(document).ajaxComplete(function () {
//                alert('test');
                    $("#wait").css("display", "none");
                    $('#myModalCoba').modal('hide');
                });
            });
//            alert('ada');
        }
        
        function loadPage(URL) {
            //alert(URL);
           $("#test1").load(URL); 
        }
        
        function loadMhs(URL) {
            //alert(URL);
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    //$("#demo").load("test");
                    document.getElementById("test1").innerHTML = xhttp.responseText;
                }
            };
////            alert($("form").serialize());
            xhttp.open("GET", URL + '?' + $("form").serialize(), true);
            xhttp.send();
        }

        function logout(URL) {
            checkSes(URL);
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "cekSession", true);
            xhttp.send();
        }
        
        function isNumberKey(evt){
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)){
                return false;
            }
            return true;
        }
        
    </script>

    <!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//localhost/piwik/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 2]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//localhost/piwik/piwik.php?idsite=2" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->

</head>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/MaskedPassword.js"></script>
        <title>Supply Chain Management System</title>
        <!--Shortcut Icon-->
        <link rel="shortcut icon" href="../img/miniLogoBukopin.png">                        
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">

        <link href="../css/animate.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <!-- Sweet Alert -->
        <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
        <!--Mainly scripts--> 
        <script src="../js/jquery-2.1.1.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
        <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Custom and plugin javascript -->
        <script src="../js/inspinia.js"></script>
        <script src="../js/plugins/pace/pace.min.js"></script>

    </head>

    <script>
//        window.history.forward();
//        function noBacklog() {
//            window.onbeforeunload = function () {
////                alert("You Can't Back Page");
//            };
//        }
//        var message = "Sorry !!! Right Click is Disabled";
//
//        function clickIE4() {
//
//            if (event.button == 2) {
//
//                alert(message);
//
//                return false;
//
//            }
//
//        }
//
//        function clickNS4(e) {
//
//            if (document.layers || document.getElementById && !document.all) {
//
//                if (e.which == 2 || e.which == 3) {
//
//                    alert(message);
//
//                    return false;
//
//                }
//
//            }
//
//        }
//
//        if (document.layers) {
//
//            document.captureEvents(Event.MOUSEDOWN);
//
//            document.onmousedown = clickNS4;
//
//        } else if (document.all && !document.getElementById) {
//
//            document.onmousedown = clickIE4;
//
//        }
//
//        document.oncontextmenu = new Function("alert(message);return false");
//

    </script>

    <body class="back-ground login-bg" onload="noBacklog();"
          onpageshow="if (event.persisted) noBack();" onunload="">
        <div 
            id="testing"
            style="text-align:center; 
            background: no-repeat center center fixed; 

            /* Set rules to fill background */
            min-height: 100%;
            min-width: 1024px;

            /* Set up proportionate scaling */
            width: 100%;
            height: auto;

            /* Set up positioning */
            position: fixed;
            top: 0;
            left: 0;

            border-width:0px;">
        </div>

        <div class="text-center">
            <!--<img src="../img/BigLogoBukopin.png">--> 
            <!--            <h1 class="logo-name">BSCMS</h1>-->
            <!--<h3 style="color:#fff;">BUKOPIN SUPPLY CHAIN MANAGEMENT SYSTEM</h3>-->
        </div>

        <div id="div1" class="middle-box text-center loginscreen animated bounceInUp" style="position: relative;
             top: 15%;
             transform: translateY(-50%);
             -moz-transform: translateY(-50%);
             -webkit-transform: translateY(-50%);
             -ms-transform: translateY(-50%);">
            <div style="border-radius: 3px;">
                <div class="ibox-content">

                    <div class="form-group">
                        <div class="logo-name">SMBO</div>
                        <span class="font-bold" style="color: #3da3ed;">Scylla Mobile Back Office</span>
                    </div>
                    <form class="m-t" role="form" method="post" action="login">

                        <div class="form-group" style="line-height: 22px">
                            <div class="input-group m-b tooltip-demo">                            
                                <span class="input-group-addon"><span class="fa fa-user"></span></span>                            
                                <input data-toggle="tooltip" data-placement="right" id="inputUsername" maxlength="50" type="text" autocomplete="off" class="form-control" placeholder="email" required="" name="username">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group m-b">                            
                                <span class="input-group-addon"><span class="fa fa-lock"></span></span>                            
                                <input class="form-control password" type="password" id="demo-field" maxlength="10" placeholder="password" required="" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group m-b col-lg-12">  
                                <span class="input-group-addon"><img src="../kapatcha.jpg" id="kaptchaImage"  onclick="document.location.reload()"/></span> 
                            </div>
                            <div class="input-group m-b col-lg-12">   
                                <input class="form-control" type="text" placeholder="captcha code" name="kaptcha" autocomplete="off">
                            </div>
                        </div>

                        <div>
                            <button type="submit" class="btn btn-success block full-width m-b">LOGIN</button>
                        </div>
                        <h4><font color="red" >${message}</font></h4>
                        <!--<a href="#"><small>Forgot password?</small></a>-->

                    </form>
                    <script type="text/javascript">

                        //apply masking to the demo-field
                        //pass the field reference, masking symbol, and character limit
                        new MaskedPassword(document.getElementById("demo-field"), '\u25CF');

                    </script>
                    <p class="m-t"> <small><p class="text-center" style="color:#fff;">Copyright Scylla Mobile Back Office &copy; 2017</p></small> </p>
                </div>
            </div>
        </div>

    </div>

    <!--Validation Username-->
    <script type="text/javascript" src="../js/validateUsername.js"></script>

    <script type="text/javascript">
//                        $("#inputUsername").on("keypress", function (event) {
//                            var validationForm = /[A-Za-z0-9]/g;
//
//                            var key = String.fromCharCode(event.which);
//
//                            if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || validationForm.test(key)) {
//                                return true;
//                            }
//                            return false;
//                        });
                        $('#demo-field').on("paste", function (e) {
                            e.preventDefault();
                        });
//                        $("#inputUsername").on('keyup', function (e) {
//                            $(this).val($(this).val().toUpperCase());
//                        });
    </script>
</body>
</html>
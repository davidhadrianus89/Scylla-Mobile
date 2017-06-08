<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <c:import url="header/header.jsp"/>
    <script type="text/javascript" src="../js/MaskedPassword.js"></script>
    <body onload="noBack();"
          onpageshow="if (event.persisted) noBack();" onunload="" class="fixed-nav pace-done fixed-sidebar skin-1">
<!--        <div class="pace  pace-inactive">
            <div class="" dpace-progressata-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
                <div class="pace-progress-inner"></div>
            </div>
            <div class="pace-activity"></div>              
        </div>-->
        <div id="wrapper">
            <nav class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav metismenu" id="side-menu">
                        <li class="nav-header">
                            <div class="dropdown profile-element text-center"> <span>

                                    <img src="../img/userWhite.jpg" width="80" height="80" class="img-circle" alt="profile">

                                </span>

                                <span class="clear" style="color: #ffffff"> 
                                    <span class="block m-t-xs"> <strong class="font-bold"> ${profil[0]} </strong> </span>
                                    <strong class="text-xs block"> ${profil[1]} </strong>
                                    <input type="hidden" id="usercek" value="${profil[0]}"/>
                                </span>

                            </div>
                            <div class="logo-element">
                                IN+
                            </div>
                        </li>
                        <li>
                            <a href="home" id="a"><i class="fa fa-th-large"></i> <span class="nav-label">DASHBOARD</span></a>
                        </li>  

                        <p id="mymenu">
                            ${menuku}

                        </p>
                    </ul>
                </div>
            </nav>

            <div id="page-wrapper" class="gray-bg dashbard-1" style="min-height: 432px;">
                <div class="row border-bottom">
                    <nav class="navbar navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                        <div class="navbar-header">
                            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>

                        </div>

                        <ul class="nav navbar-top-links navbar-right">
                            <li>
                                <span class="m-r-sm text-muted welcome-message ">Scylla Mobile Back Office</span>
                            </li>                           
                            <li>
                                <a href="#" style="color: #ffffff;">
                                    <i class="fa fa-question-circle"></i> <span>Help</span>
                                </a>
                            </li>             
                            <li>
                                <a href="logout?userid=${logout}" style="color: #ffffff;">
                                    <i class="fa fa-sign-out"></i> <span>Log Out</span>
                                </a>
                            </li>                            
                        </ul>

                    </nav>
                </div>
                <!--<div class="row dashboard-header" style="height: 3px;">
                        <span class="fa fa-home"> Home</span>
                    </div>-->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="wrapper wrapper-content">
                            <div id="wait" style="display:none;" class="cssload-loader" >Now Loading...!</div>
                            <div id="test1">
                                <c:import url="${url}"/>
                            </div>
                        </div>
                        <div id="foot" class="footer fixed" style="background-color:#445474;">
                            <div class="pull-right">
                                <strong style="color: #ffffff;">Scylla Mobile Back Office</strong>
                            </div>
                            <div>
                                <strong style="color: #ffffff;">Copyright &copy; 2017</strong>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <c:import url="footer/footer.jsp"/>
        <div class="theme-config">
            <div class="theme-config-box">
                <div class="spin-icon">
                    <i class="fa fa-cogs fa-spin"></i>
                </div>
                <div class="skin-setttings">
                    <div class="setings-item default-skin">
                        <span class="skin-name ">
                            <a href="#" class="s-skin-0">
                                Default
                            </a>
                        </span>
                    </div>
                    <div class="setings-item blue-skin">
                        <span class="skin-name ">
                            <a href="#" class="s-skin-1">
                                Blue light
                            </a>
                        </span>
                    </div>
                    <div class="setings-item yellow-skin">
                        <span class="skin-name ">
                            <a href="#" class="s-skin-3">
                                Yellow/Purple
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>


        <script>
            // Config box

            // Enable/disable fixed top navbar
            $('#fixednavbar').click(function () {
                if ($('#fixednavbar').is(':checked')) {
                    $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
                    $("body").removeClass('boxed-layout');
                    $("body").addClass('fixed-nav');
                    $('#boxedlayout').prop('checked', false);

                    if (localStorageSupport) {
                        localStorage.setItem("boxedlayout", 'off');
                    }

                    if (localStorageSupport) {
                        localStorage.setItem("fixednavbar", 'on');
                    }
                } else {
                    $(".navbar-fixed-top").removeClass('navbar-fixed-top').addClass('navbar-static-top');
                    $("body").removeClass('fixed-nav');

                    if (localStorageSupport) {
                        localStorage.setItem("fixednavbar", 'off');
                    }
                }
            });

            // Enable/disable fixed sidebar
            $('#fixedsidebar').click(function () {
                if ($('#fixedsidebar').is(':checked')) {
                    $("body").addClass('fixed-sidebar');
                    $('.sidebar-collapse').slimScroll({
                        height: '100%',
                        railOpacity: 0.9
                    });

                    if (localStorageSupport) {
                        localStorage.setItem("fixedsidebar", 'on');
                    }
                } else {
                    $('.sidebar-collapse').slimscroll({destroy: true});
                    $('.sidebar-collapse').attr('style', '');
                    $("body").removeClass('fixed-sidebar');

                    if (localStorageSupport) {
                        localStorage.setItem("fixedsidebar", 'off');
                    }
                }
            });

            // Enable/disable collapse menu
            $('#collapsemenu').click(function () {
                if ($('#collapsemenu').is(':checked')) {
                    $("body").addClass('mini-navbar');
                    SmoothlyMenu();

                    if (localStorageSupport) {
                        localStorage.setItem("collapse_menu", 'on');
                    }

                } else {
                    $("body").removeClass('mini-navbar');
                    SmoothlyMenu();

                    if (localStorageSupport) {
                        localStorage.setItem("collapse_menu", 'off');
                    }
                }
            });

            // Enable/disable boxed layout
            $('#boxedlayout').click(function () {
                if ($('#boxedlayout').is(':checked')) {
                    $("body").addClass('boxed-layout');
                    $('#fixednavbar').prop('checked', false);
                    $(".navbar-fixed-top").removeClass('navbar-fixed-top').addClass('navbar-static-top');
                    $("body").removeClass('fixed-nav');
                    $(".footer").removeClass('fixed');
                    $('#fixedfooter').prop('checked', false);

                    if (localStorageSupport) {
                        localStorage.setItem("fixednavbar", 'off');
                    }

                    if (localStorageSupport) {
                        localStorage.setItem("fixedfooter", 'off');
                    }
                    if (localStorageSupport) {
                        localStorage.setItem("boxedlayout", 'on');
                    }
                } else {
                    $("body").removeClass('boxed-layout');

                    if (localStorageSupport) {
                        localStorage.setItem("boxedlayout", 'off');
                    }
                }
            });

            // Enable/disable fixed footer
            $('#fixedfooter').click(function () {
                if ($('#fixedfooter').is(':checked')) {
                    $('#boxedlayout').prop('checked', false);
                    $("body").removeClass('boxed-layout');
                    $(".footer").addClass('fixed');

                    if (localStorageSupport) {
                        localStorage.setItem("boxedlayout", 'off');
                    }

                    if (localStorageSupport) {
                        localStorage.setItem("fixedfooter", 'on');
                    }
                } else {
                    $(".footer").removeClass('fixed');

                    if (localStorageSupport) {
                        localStorage.setItem("fixedfooter", 'off');
                    }
                }
            });

            // SKIN Select
            $('.spin-icon').click(function () {
                $(".theme-config-box").toggleClass("show");
            });

            // Default skin
            $('.s-skin-0').click(function () {
                $("body").removeClass("skin-1");
                $("body").removeClass("skin-2");
                $("body").removeClass("skin-3");
                $("#foot").attr("style", "background-color:#02923d;");
            });

            // Blue skin
            $('.s-skin-1').click(function () {
                $("body").removeClass("skin-2");
                $("body").removeClass("skin-3");
                $("body").addClass("skin-1");
                $("#foot").attr("style", "background-color:#445474;");
            });

//            // Inspinia ultra skin
//            $('.s-skin-2').click(function () {
//                $("body").removeClass("skin-1");
//                $("body").removeClass("skin-3");
//                $("body").addClass("skin-2");
//                $("#foot").attr("style", "background-color:#2f4050;");
//            });

            // Yellow skin
            $('.s-skin-3').click(function () {
                $("body").removeClass("skin-1");
                $("body").removeClass("skin-2");
                $("body").addClass("skin-3");
                $("#foot").attr("style", "background-color:#3e2c42;");
            });

            if (localStorageSupport) {
                var collapse = localStorage.getItem("collapse_menu");
                var fixedsidebar = localStorage.getItem("fixedsidebar");
                var fixednavbar = localStorage.getItem("fixednavbar");
                var boxedlayout = localStorage.getItem("boxedlayout");
                var fixedfooter = localStorage.getItem("fixedfooter");

                if (collapse === 'on') {
                    $('#collapsemenu').prop('checked', 'checked');
                }
                if (fixedsidebar === 'on') {
                    $('#fixedsidebar').prop('checked', 'checked');
                }
                if (fixednavbar === 'on') {
                    $('#fixednavbar').prop('checked', 'checked');
                }
                if (boxedlayout === 'on') {
                    $('#boxedlayout').prop('checked', 'checked');
                }
                if (fixedfooter === 'on') {
                    $('#fixedfooter').prop('checked', 'checked');
                }
            }
        </script>
    </body>
</html>

<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">

            <div class="modal-header">
                <!--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>-->
                <!--                <i class="fa fa-laptop modal-icon"></i>-->
                <h4 class="modal-title">BUKOPIN SUPPLY CHAIN MANAGEMENT SYSTEM</h4>
                <small class="font-bold ">Session telah mati, silahkan login kembali !!!</small>

            </div>
            <!--<form action="login" method="post">-->
            <form name="form" >
                <!--<div id="rustan"></div>-->
                <div class="modal-body" id="died">
                    <small class="font-bold text-color red-bg" id="msg_err"></small>
                    <br/>
                    <div class="form-group">
                        <div class="input-group m-b">
                            <span class="input-group-addon"><span class="fa fa-user"></span></span>
                            <input name="username" value=${profil[0]} type="text" placeholder="Enter your user name" class="form-control" maxlength="10" id="username" readonly="yes">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group m-b">
                            <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                            <input name="password" type="text" placeholder="Enter your password" class="form-control password" maxlength="10" id="password">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="loginSession()">LOGIN</button>
                </div>
            </form>
            <script type="text/javascript">

                //apply masking to the demo-field
                //pass the field reference, masking symbol, and character limit
                new MaskedPassword(document.getElementById("password"), '\u25CF');

                function loginSession() {
                    $("#wait").css("display", "block");
                    $('#myModalCoba').modal({backdrop: 'static', keyboard: false, show: true});
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            if (xhttp.responseText === '0') {
                                $('#myModal').modal('hide');
                            } else if (xhttp.responseText === '1') {
                                document.getElementById("msg_err").innerHTML = 'User not found';
                            } else if (xhttp.responseText === '2') {
                                document.getElementById("msg_err").innerHTML = 'Incorrect password';
                            } else if (xhttp.responseText === '3') {
                                document.getElementById("msg_err").innerHTML = 'User not active. Please call Administrator';
                            } else if (xhttp.responseText === '9') {
                                document.getElementById("msg_err").innerHTML = 'Internal Server Error. Please call Administrator';
                            }
                            document.getElementById("password").value = "";
                            $("#wait").css("display", "none");
                            $('#myModalCoba').modal('hide');
                        }
                        else {
                            //                    $('#myModal').modal('show');
                        }
                    };
                    xhttp.open("GET", "loginSession" + "?" + $("form").serialize(), true);
                    //                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send();
                    //                    $('#myModal').modal('show');
                }

            </script>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="myModalCoba" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top: 23%; margin-left: auto;margin-right: auto;">
    <div class="">
        <div class="">
            <div class="sk-spinner sk-spinner-three-bounce">
                <div class="sk-bounce1"></div>
                <div class="sk-bounce2"></div>
                <div class="sk-bounce3"></div>
            </div>
        </div>
    </div>
</div>
<!--<script type="text/javascript">
    $('#password').on("paste", function (e) {
        e.preventDefault();
    });
</script>-->


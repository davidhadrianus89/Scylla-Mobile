<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="../js/MaskedPassword.js"></script>
        <title>Login to BukiWEB 2015</title>
        <!--Shortcut Icon-->
        <link rel="shortcut icon" href="../img/miniLogoBukopin.png">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">

        <link href="../css/animate.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <!-- Sweet Alert -->
        <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script> 

        <!--<script>-->
        <!--${pesanexp}-->
        <!--</script>-->

    </head>

    <body>

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



        <div id="div1" class="middle-box text-center loginscreen animated bounceInUp" style="position: relative;
             top: 5%;
             transform: translateY(-50%);
             -moz-transform: translateY(-50%);
             -webkit-transform: translateY(-50%);
             -ms-transform: translateY(-50%);">
            <div style="border-radius: 3px;">
                <div>    
                    <div>

                        <img src="../img/NewLogoBUKIWEB215.png">

                    </div>
                    <h3 style="color:#ffffff;">SILAKAN LOGIN</h3>
                    <form class="m-t" role="form" method="post">

                        <div class="form-group">
                            <div class="input-group m-b">                            
                                <span class="input-group-addon"><span class="fa fa-user"></span></span>
                                <input type="text" class="form-control" placeholder="Username" required="" name="username" value="${user}" readonly="">
                                <input type="hidden" class="form-control" placeholder="Username" required="" name="userid" value="${user}" readonly="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group m-b">                            
                                <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                                <input id="password" type="password" class="form-control" placeholder="Password" required="" name="password" >
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group m-b">                            
                                <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                                <input class="form-control password" type="text" id="newpassword" maxlength="10" placeholder="New Password" required="" name="newpassword">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group m-b">                            
                                <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                                <input class="form-control password" type="text" id="confirmnewpassword" maxlength="10" placeholder="Confirm New Password" required="" name="confirmnewpassword">
                            </div>
                        </div>

                        <script>
                            function validate() {
                                var newpassword = document.getElementById("newpassword").value;
                                var password = document.getElementById("password").value;
//                                alert(newpassword.length);
//                                alert(newpassword + ":" + confirmnewpassword);
//                                if (newpassword != confirmnewpassword) {
////                                    alert("Your password and confirmation password do not match.");
//                                    document.getElementById("newpassword").innerHTML = "";
//                                    document.getElementById("confirmnewpassword").innerHTML = "";
////                                    confirmnewpassword.focus();
//                                    swal({
//                                        title: "Bukiweb Warning",
//                                        type: "warning",
//                                        text: "YOUR PASSWORD DOESN'T MATCH"
//                                    });
////                                        alert("YOUR PASSWORD DOESN'T MATCH");
////                                    document.getElementById("confirmnewpassword").onfocus;
//                                    return false;
//                                } else {
////                                    alert("Your pass");
//                                    return false;
//                                }
                                if (password == "") {
                                    swal({
                                        title: "Bukiweb Warning",
                                        type: "warning",
                                        text: "Please insert Your Current Password first"
                                    });
                                    return false;
                                } else {

                                    if (newpassword.length < 5) {
                                        swal({
                                            title: "Bukiweb Warning",
                                            type: "warning",
                                            text: "Your new Password is too short, minimun 5 digit"
                                        });
                                        return false;
                                    } else {
                                        return true;
                                    }
                                }
                            }
                        </script>
                        <div class="col-sm-6 input-group-sm m-b-n-sm">
                            <button type="submit"  onclick="return (validate())" class="btn btn-primary block full-width m-b" >CHANGE</button>
                        </div>
                        <div class="col-sm-6 input-group-sm m-b-n-sm">
                            <a href="home"><button type="button" class="btn btn-primary block full-width m-b" >CANCEL</button></a>
                        </div>

                        <font color="red" >${pesan}</font>
                        <a href="#"><small>Forgot password?</small></a>

                    </form>
                    <script type="text/javascript">

                        //apply masking to the demo-field
                        //pass the field reference, masking symbol, and character limit
                        new MaskedPassword(document.getElementById("newpassword"), '\u25CF');
                        new MaskedPassword(document.getElementById("confirmnewpassword"), '\u25CF');


                    </script>
                    <p class="m-t"> <small><p class="text-center" style="color:#fff;">Copyright PT. Bank Bukopin,Tbk &copy;</p></small> </p>
                </div>
            </div>
        </div>

    </div>


    <!-- Mainly scripts -->
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="../js/inspinia.js"></script>
    <script src="../js/plugins/pace/pace.min.js"></script>

    <!-- Sweet alert -->
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    <!--SCRIPT BACKGROUND IMAGE-->

    <script type="text/javascript">
                        $('#newpassword').on("paste", function (e) {
                            e.preventDefault();
                        });
                        $('#confirmnewpassword').on("paste", function (e) {
                            e.preventDefault();
                        });
    </script>
    <script type="text/javascript">

        var imageArray = new Array(); // leave as is.

// Specify number of milliseconds between image switches.
        var switchMilliseconds = 6000;

// Specify the id of the div or other HTML tag with the 
//   background image to switch.

        var divID = 'testing';

// To add more images, continue the pattern below.

        imageArray[0] = '../images/1.jpeg';
//        imageArray[1] = '../images/5.jpg';

// No further customization needed in this JavaScript

        function publishPicture(i) {
            document.getElementById(divID).style.background = 'url("' + imageArray[i] + '")';
            i++;
            if (i > (imageArray.length - 1)) {
                i = 0;
            }
            setTimeout('publishPicture(' + i + ')', switchMilliseconds);
        }
        publishPicture(0);
    </script>

    <script>

        $(document).ready(function () {

            $('.demo1').click(function () {
                swal({
                    title: "Welcome in Alerts",
                    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                });
            });

            $('.demo2').click(function () {
                swal({
                    title: "Good job!",
                    text: "You clicked the button!",
                    type: "success"
                });
            });

            $('.demo3').click(function () {
                swal({
                    title: "Are you sure?",
                    text: "You will not be able to recover this imaginary file!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, delete it!",
                    closeOnConfirm: false
                }, function () {
                    swal("Deleted!", "Your imaginary file has been deleted.", "success");
                });
            });

            $('.demo4').click(function () {
                swal({
                    title: "Are you sure?",
                    text: "Your will not be able to recover this imaginary file!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, delete it!",
                    cancelButtonText: "No, cancel plx!",
                    closeOnConfirm: false,
                    closeOnCancel: false},
                function (isConfirm) {
                    if (isConfirm) {
                        swal("Deleted!", "Your imaginary file has been deleted.", "success");
                    } else {
                        swal("Cancelled", "Your imaginary file is safe :)", "error");
                    }
                });
            });


        });

    </script>
    <!--        <div style="opacity: -0.18; display: none;" class="sweet-overlay" tabindex="-1"></div>
            <div style="display: none; margin-top: -128px; opacity: -0.19;" data-timer="null" data-animation="pop" data-has-done-function="false" data-allow-outside-click="false" data-has-confirm-button="true" data-has-cancel-button="false" data-custom-class="" class="sweet-alert hideSweetAlert">
                <div style="display: none;" class="sa-icon sa-error">
                    <span class="sa-x-mark">
                        <span class="sa-line sa-left"></span>
                        <span class="sa-line sa-right"></span>
                    </span>
                </div>
                <div style="display: none;" class="sa-icon sa-warning">
                    <span class="sa-body"></span>
                    <span class="sa-dot"></span>
                </div>
                <div style="display: none;" class="sa-icon sa-info"></div>
                <div style="display: none;" class="sa-icon sa-success">
                    <span class="sa-line sa-tip"></span>
                    <span class="sa-line sa-long"></span>
    
                    <div class="sa-placeholder"></div>
                    <div class="sa-fix"></div>
                </div>
                <div style="display: none;" class="sa-icon sa-custom"></div>
                <h2>Welcome in Alerts</h2>
                <p style="display: block;">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                <fieldset>
                    <input placeholder="" tabindex="3" type="text">
                    <div class="sa-input-error"></div>
                </fieldset>
                <div class="sa-error-container">
                    <div class="icon">!</div>
                    <p>Not valid!</p>
                </div>
                <div class="sa-button-container">
                    <button style="display: none; box-shadow: none;" class="cancel" tabindex="2">Cancel</button>
                    <button style="display: inline-block; background-color: rgb(174, 222, 244); box-shadow: 0px 0px 2px rgba(174, 222, 244, 0.8), 0px 0px 0px 1px rgba(0, 0, 0, 0.05) inset;" class="confirm" tabindex="1">OK</button>
                </div>
            </div>
            <div style="display: none;" class="sa-icon sa-error">
                <span class="sa-x-mark">
                    <span class="sa-line sa-left"></span>
                    <span class="sa-line sa-right"></span>
                </span>
            </div>
            <div style="display: none;" class="sa-icon sa-warning">
                <span class="sa-body"></span>
                <span class="sa-dot"></span>
            </div>
            <div style="display: none;" class="sa-icon sa-info"></div>
            <div style="display: none;" class="sa-icon sa-success">
                <span class="sa-line sa-tip"></span>
                <span class="sa-line sa-long"></span>
    
                <div class="sa-placeholder"></div>
                <div class="sa-fix"></div>
            </div>-->


    <!--    <script>
            $(document).ready(function () {
    
                var images = Array("http://placekitten.com/500/200",
                        "http://placekitten.com/499/200",
                        "http://placekitten.com/501/200",
                        "http://placekitten.com/500/199");
                var currimg = 0;
    
    
                function loadimg() {
    
                    $('#background').animate({opacity: 1}, 500, function () {
    
                        //finished animating, minifade out and fade new back in           
                        $('#background').animate({opacity: 0.7}, 100, function () {
    
                            currimg++;
    
                            if (currimg > images.length - 1) {
    
                                currimg = 0;
    
                            }
    
                            var newimage = images[currimg];
    
                            //swap out bg src                
                            $('#background').css("background-image", "url(" + newimage + ")");
    
                            //animate fully back in
                            $('#background').animate({opacity: 1}, 400, function () {
    
                                //set timer for next
                                setTimeout(loadimg, 5000);
    
                            });
    
                        });
    
                    });
    
                }
                setTimeout(loadimg, 5000);
    
            });
        </script>-->

</body>
</html>
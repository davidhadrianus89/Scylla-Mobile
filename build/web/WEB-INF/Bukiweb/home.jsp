<%-- 
    Document   : home
    Created on : Nov 10, 2015, 3:37:03 PM
    Author     : dpti
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!--<!DOCTYPE html>-->


<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">

    function showMessage(user, pass) {
        
        if (user === pass) {
            swal("Attention!", "Anda masih menggunakan password default. Silahkan Ganti Password pada Menu Pengaturan", "error");
        }
    }
</script>

<script>showMessage('${profil[0]}','${profil[2]}')</script>
    

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="col-md-12">
        <div class="profile-image">
            <!--../img/userWhite1.png-->
            <img src="../img/userWhite.jpg" class="img-circle m-b-md" alt="profile">
        </div>
        <div class="profile-info">
            <div class="">
                <div>
                    <h2 class="no-margins">
                        ${profil[0]}
                    </h2>
                    <h4>${profil[1]}</h4>
                    <small>

                        <table style="font-size: 11px;">
                            <tr>
                                <td>Email</td>
                                <td>&nbsp;:&nbsp;</td>
                                <td>${profil[3]}</td>
                            </tr>
                            <tr>
                                <td>Telephone</td>
                                <td>&nbsp;:&nbsp;</td>
                                <td>${profil[4]}</td>
                            </tr>
                            <tr>
                                <td>Logged Date</td>
                                <td>&nbsp;:&nbsp;</td>
                                <td>${profil[5]}</td>
                            </tr>
                            <tr>
                                <td>Logged Time</td>
                                <td>&nbsp;:&nbsp;</td>
                                <td>${profil[6]}</td>
                            </tr>
                            
                        </table>

                    </small>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="text-center p-md">
                        <h2><span class="text-navy">HI.. ${profil[0]} SELAMAT DATANG DI SCYLLA MOBILE BACK OFFICE</span></h2>
                        <p>
                            All config options you can trun on/off from the theme box configuration (green icon on the left side of page).
                        </p>
                        <br/>
                        <!--img src="../img/NewLogoBUKIWEB270.png"-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

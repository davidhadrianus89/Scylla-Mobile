<%-- 
    Document   : home
    Created on : Nov 10, 2015, 3:37:03 PM
    Author     : dpti
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!--<!DOCTYPE html>-->


<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="../css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="../css/plugins/footable/footable.core.css" rel="stylesheet">


<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">

    function showMessage(user, pass) {

        if (user === pass) {
            swal("Attention!", "Anda masih menggunakan password default. Silahkan Ganti Password pada Menu Pengaturan", "error");
        }
    }
</script>

<script>showMessage('${profil[0]}', '${profil[2]}');</script>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox-content m-b-sm border-bottom">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label" for="date_added">Date</label>
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input id="date_added" type="text" class="form-control datepicker" value="03/04/2014">
                    </div>
                </div>
            </div>
        </div>

    </div>
    
<div class="row">
        <div class="col-lg-9">    
    
    <div class="row">
        <div class="col-lg-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Sales By Category</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">Config option 1</a>
                            </li>
                            <li><a href="#">Config option 2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="flot-chart">
                        <div class="flot-chart-content" id="flot-bar-chart" style="padding: 0px; position: relative;"><canvas class="flot-base" width="486" height="200" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 486px; height: 200px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 69px; top: 185px; left: 14px; text-align: center;">1</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 69px; top: 185px; left: 96px; text-align: center;">2</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 69px; top: 185px; left: 179px; text-align: center;">3</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 69px; top: 185px; left: 261px; text-align: center;">4</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 69px; top: 185px; left: 343px; text-align: center;">5</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 69px; top: 185px; left: 426px; text-align: center;">6</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; top: 173px; left: 6px; text-align: right;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 138px; left: 0px; text-align: right;">10</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 104px; left: 0px; text-align: right;">20</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 69px; left: 0px; text-align: right;">30</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 35px; left: 0px; text-align: right;">40</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 1px; left: 0px; text-align: right;">50</div></div></div><canvas class="flot-overlay" width="486" height="200" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 486px; height: 200px;"></canvas></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>YTD ACV</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">Config option 1</a>
                            </li>
                            <li><a href="#">Config option 2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <div class="flot-chart">
                        <div class="flot-chart-content" id="flot-line-chart" style="padding: 0px; position: relative;"><canvas class="flot-base" width="486" height="200" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 486px; height: 200px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 81px; top: 185px; left: 14px; text-align: center;">1</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 81px; top: 185px; left: 106px; text-align: center;">2</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 81px; top: 185px; left: 198px; text-align: center;">3</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 81px; top: 185px; left: 291px; text-align: center;">4</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 81px; top: 185px; left: 383px; text-align: center;">5</div><div class="flot-tick-label tickLabel" style="position: absolute; max-width: 81px; top: 185px; left: 475px; text-align: center;">6</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; top: 173px; left: 6px; text-align: right;">0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 138px; left: 0px; text-align: right;">10</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 104px; left: 0px; text-align: right;">20</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 69px; left: 0px; text-align: right;">30</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 35px; left: 0px; text-align: right;">40</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 1px; left: 0px; text-align: right;">50</div></div></div><canvas class="flot-overlay" width="486" height="200" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 486px; height: 200px;"></canvas></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Sales Target</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">Config option 1</a>
                            </li>
                            <li><a href="#">Config option 2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="flot-chart">
                        <div class="flot-chart-pie-content" id="flot-pie-chart" style="padding: 0px; position: relative;"><canvas class="flot-base" width="200" height="200" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 200px; height: 200px;"></canvas><canvas class="flot-overlay" width="200" height="200" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 200px; height: 200px;"></canvas><div class="legend"><div style="position: absolute; width: 54px; height: 60px; top: 5px; right: 5px; background-color: rgb(255, 255, 255); opacity: 0.85;"> </div><table style="position:absolute;top:5px;right:5px;;font-size:smaller;color:#545454"><tbody><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid #d3d3d3;overflow:hidden"></div></div></td><td class="legendLabel">Sales 1</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid #bababa;overflow:hidden"></div></div></td><td class="legendLabel">Sales 2</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid #79d2c0;overflow:hidden"></div></div></td><td class="legendLabel">Sales 3</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid #1ab394;overflow:hidden"></div></div></td><td class="legendLabel">Sales 4</td></tr></tbody></table></div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQTpXj82d8UpCi97wzo_nKXL7nYrd4G70"></script>
    
    <div class="row">
        <div class="col-md-6">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>Last Location</h5>
                </div>
                <div class="ibox-content">
                    <div class="google-map" id="map1"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Sales Call</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">Config option 1</a>
                            </li>
                            <li><a href="#">Config option 2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Sales Name</th>
                                <th>EC</th>
                                <th>NOT EC</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td>3</td>
                                <td>15</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td>6</td>
                                <td>7</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Larry</td>
                                <td>7</td>
                                <td>11</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
    </div>
    <div class="col-md-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>5 Top Sales</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">Config option 1</a>
                            </li>
                            <li><a href="#">Config option 2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Sales Name</th>
                                <th>EC</th>
                                <th>NOT EC</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td>3</td>
                                <td>15</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td>6</td>
                                <td>7</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Larry</td>
                                <td>7</td>
                                <td>11</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    
    </div>
</div>
<!-- Mainly scripts -->
<script src="../js/jquery-2.1.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="../js/plugins/flot/jquery.flot.js"></script>
<script src="../js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../js/plugins/flot/jquery.flot.pie.js"></script>
<script src="../js/plugins/flot/jquery.flot.time.js"></script>

<!-- Custom and plugin javascript -->
<script src="../js/inspinia.js"></script>
<script src="../js/plugins/pace/pace.min.js"></script>

<!-- Flot demo data -->
<script src="../js/demo/flot-demo.js"></script>
<!-- Page-Level Scripts -->

<!-- Data picker -->
<script src="../js/plugins/datapicker/bootstrap-datepicker.js"></script>

<script>
$('.datepicker').datepicker({
    todayBtn: "linked",
    keyboardNavigation: false,
    forceParse: false,
    calendarWeeks: true,
    autoclose: true
});
</script>

<script type="text/javascript">
    // When the window has finished loading google map
    google.maps.event.addDomListener(window, 'load', init);

    function init() {
        // Options for Google map
        // More info see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
        var mapOptions1 = {
            zoom: 11,
            center: new google.maps.LatLng(-6.246886, 106.762142),
            // Style for Google Maps
            styles: [{"featureType": "water", "stylers": [{"saturation": 43}, {"lightness": -11}, {"hue": "#0088ff"}]}, {"featureType": "road", "elementType": "geometry.fill", "stylers": [{"hue": "#ff0000"}, {"saturation": -100}, {"lightness": 99}]}, {"featureType": "road", "elementType": "geometry.stroke", "stylers": [{"color": "#808080"}, {"lightness": 54}]}, {"featureType": "landscape.man_made", "elementType": "geometry.fill", "stylers": [{"color": "#ece2d9"}]}, {"featureType": "poi.park", "elementType": "geometry.fill", "stylers": [{"color": "#ccdca1"}]}, {"featureType": "road", "elementType": "labels.text.fill", "stylers": [{"color": "#767676"}]}, {"featureType": "road", "elementType": "labels.text.stroke", "stylers": [{"color": "#ffffff"}]}, {"featureType": "poi", "stylers": [{"visibility": "off"}]}, {"featureType": "landscape.natural", "elementType": "geometry.fill", "stylers": [{"visibility": "on"}, {"color": "#b8cb93"}]}, {"featureType": "poi.park", "stylers": [{"visibility": "on"}]}, {"featureType": "poi.sports_complex", "stylers": [{"visibility": "on"}]}, {"featureType": "poi.medical", "stylers": [{"visibility": "on"}]}, {"featureType": "poi.business", "stylers": [{"visibility": "simplified"}]}]
        };

        // Get all html elements for map
        var mapElement1 = document.getElementById('map1');

        // Create the Google Map using elements
        var map1 = new google.maps.Map(mapElement1, mapOptions1);
    }
</script>




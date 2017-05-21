/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var day;
var month;
var year;
var hours;
var minutes;
var seconds;
var tampedit = [];
var hasil_obj_awal;
$(document).ready(function(){
     var date = new Date().toLocaleFormat();
    day = date.split(' ')[0];
    month = new Date().getMonth()+1;
    year = date.split(' ')[2];
    hour = date.split(' ')[3].split(':')[0];
    minutes = date.split(' ')[3].split(':')[1];
    seconds = date.split(' ')[3].split(':')[2];
    if(month<10){
        month = '0'+month;
    } 
    $("#contentmastermstdpp").append('<table id="tblinputdpp"></table>');
    $("#tblinputdpp").append('<tr id="trkodedpp" class="form-group"></tr>');
    $("#trkodedpp").append('<td><label class="col-sm-12 control-label">Kode Pengelolaan Pajak</label></td>');
    $("#trkodedpp").append('<td id="tdkodedeldpp" class="col-sm-9"><input id="kodedeldpp" type="text" placeholder="Input Kode Delivery Channel" class="form-control"></td>');
    
    $("#tblinputdpp").append('<tr id="trnamadpp" class="form-group"></tr>');
    $("#trnamadpp").append('<td><label class="col-sm-12 control-label">Nama Pengelolaan Pajak</label></td>');
    $("#trnamadpp").append('<td id="tdnamadeldpp" class="col-sm-9"><input id="namadeldpp" type="text" placeholder="Nama Pengelolaan Pajak" class="form-control"></td>');
    
    $('#contentmastermstdpp').append('<table id ="tblbtnmstdpp" style="margin-top:20px"></table>');
    $('#tblbtnmstdpp').append('<tr id="trbtnmstdpp"></tr>');
    $('#trbtnmstdpp').append('<td><button id="btnsimpandpp" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdeldpp('+1+')">Simpan</button></td>');
    $('#trbtnmstdpp').append('<td><button id="btnubahdpp" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdeldpp('+2+')">Ubah</button></td>');
    $('#trbtnmstdpp').append('<td><button id="namadeldpp" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdeldpp('+3+')">Delete</button></td>');

    data_tabel();
    //klik_tabel_master();
//    $('#contenttablemstdpp').append('<table id="pbbmstdpp" border="1">');
//    $('#pbbmstdpp').append('<tr id="trthmstdpp"></tr>');
//    $('#trthmstdpp').append('<th>KdDPP</th>>');
//    $('#trthmstdpp').append('<th>Nama Pengelola</th>');
    
//    $.ajax({
//            type: "POST",
//            url: "/pbb_baru/master_pbbmstdpp.htm",
//            async:false,
//            data:{isi:"load"},
//            success: function (data1) {
//                hasil_obj_awal = JSON.parse(data1);
//                for(var i=0;i<hasil_obj_awal["tbl_master_dpp"].length;i++){
//                     $('#pbbmstdpp').append('<tr id="divtextareadpp'+i+'" onclick="clickdiv('+i+')">');
//                     $('#divtextareadpp'+i).append('<td value="'+hasil_obj_awal["tbl_master_dpp"][i]["kdmstdpp"]+'">'+hasil_obj_awal["tbl_master_dpp"][i]["kdmstdpp"]+'</td>');
//                     $('#divtextareadpp'+i).append('<td value="'+hasil_obj_awal["tbl_master_dpp"][i]["nama"]+'">'+hasil_obj_awal["tbl_master_dpp"][i]["nama"]+'</td>');
//                }
//            },
//            error: function (data1) {
//                alert("error"+data1);        
//            }
//        });
        
    $("#kodedeldpp").val("");
    $("#namadeldpp").val("");
});
function klik_tabel_master(){
    var data_table;
    console.log("klik");
    var oTable = $('#pbbmstdpp').dataTable();
    $('table#pbbmstdpp tbody').on("click", "tr", function(e) {
        var item = $(this).closest("tr");
        var index = $(e.currentTarget).index() + 1;        
        console.log(oTable.fnGetData(item[0]));       
        data_table = oTable.fnGetData(item[0]);
        var kddpp = data_table["kdmstdpp"];
        var nmchn = data_table["nama"];
        $('#kodedeldpp').val(kddpp);
        $('#namadeldpp').val(nmchn);
    } );
};
function clickdiv(ke){
   // console.log(ke);
   $("#kodedeldpp").remove();
   $("#namadeldpp").remove();
   $("#tdkodedeldpp").append('<input id="kodedeldpp" maxlength="100"></input>');
   $("#tdnamadeldpp").append('<input id="namadeldpp" maxlength="100"></input>');
   tampedit = [];
    $('tr#divtextareadpp'+ke).each(function( i ) {
        $("td", this).each(function( j ) {
          //console.log($(this).text());
          tampedit.push($(this).text());
        });
      });
      //console.log(tampedit.length);
      $("#kodedeldpp").val(tampedit[0]);
      $("#namadeldpp").val(tampedit[1]);
};
function simpanubahdeldpp(perintah){
    var datevalid = year+month+day+hour+minutes+seconds;
    if(perintah== 1){
        perintah = "simpan";
    }
    if(perintah== 2){
        perintah = "ubah";
    }
    if(perintah== 3){
        perintah = "hapus";
    }
   
    $('#pbbmstdpp').remove();
    $('#pbbmstdpp_wrapper').remove();
//    $('#contenttablemstdpp').append('<table id="pbbmstdpp" border="1">');
//    $('#pbbmstdpp').append('<tr id="trthmstdpp"></tr>');
//    $('#trthmstdpp').append('<th>KdDPP</th>>');
//    $('#trthmstdpp').append('<th>Nama Pengelola</th>');
    $.ajax({
        type: "POST",
        traditional:true,
        url: "/pbb_baru/master_pbbmstdpp.htm",
        async:false,
        data:{nodpp:$("#kodedeldpp").val(),nama:$("#namadeldpp").val(),insuser:"novira",date:datevalid,updusr:"novira",upddate:datevalid,perintah:perintah,isi:"crud"},
        success: function (data1, textStatus, xhr) {
                data_tabel();
//                 hasil_obj_awal = JSON.parse(data1);
//                for(var i=0;i<hasil_obj_awal["tbl_master_dpp"].length;i++){
//                     $('#pbbmstdpp').append('<tr id="divtextareadpp'+i+'" onclick="clickdiv('+i+')">');
//                     $('#divtextareadpp'+i).append('<td value="'+hasil_obj_awal["tbl_master_dpp"][i]["kdmstdpp"]+'">'+hasil_obj_awal["tbl_master_dpp"][i]["kdmstdpp"]+'</td>');
//                     $('#divtextareadpp'+i).append('<td value="'+hasil_obj_awal["tbl_master_dpp"][i]["nama"]+'">'+hasil_obj_awal["tbl_master_dpp"][i]["nama"]+'</td>');
//                }
        },
        error: function (data, textStatus, xhr) {
                alert("error");
        }
    });
};
function data_tabel(){
     ////////////////////////table master/////////////////
    $('#contenttablemstdpp').append('<table id="pbbmstdpp" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#pbbmstdpp').append('<thead><tr id=trheadmstdpp></tr></thead>');
    $('#trheadmstdpp').append('<th>KdDPP</th>');
    $('#trheadmstdpp').append('<th>Nama Pengelola</th>');
    $('#pbbmstdpp').DataTable( {
        "ajax": {
            "url": "/pbb_baru/master_pbbmstdpp.htm",
            "type": "POST",
            "data":{isi:"load"}
        },
        "columns": [
            { "data": "kdmstdpp" },
            { "data": "nama" }
        ]
    } );
    klik_tabel_master();
};
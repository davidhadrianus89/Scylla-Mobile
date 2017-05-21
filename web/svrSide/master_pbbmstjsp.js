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
    $("#contentmastermstjsp").append('<table id="tblinputjsp"></table>');
    $("#tblinputjsp").append('<tr id="trkodejsp" class="form-group"></tr>');
    $("#trkodejsp").append('<td><label class="col-sm-12 control-label">Kode Pengelolaan Pajak</label></td>');
    $("#trkodejsp").append('<td id="tdkodedeljsp" class="col-sm-9"><input id="kodedeljsp" type="text" placeholder="Input Kode Delivery Channel" class="form-control"></td>');
    
    $("#tblinputjsp").append('<tr id="trnamajsp" class="form-group"></tr>');
    $("#trnamajsp").append('<td><label class="col-sm-12 control-label">Nama Pengelolaan Pajak</label></td>');
    $("#trnamajsp").append('<td id="tdnamadeljsp" class="col-sm-9"><input id="namadeljsp" type="text" placeholder="Nama Pengelolaan Pajak" class="form-control"></td>');
    
    $('#contentmastermstjsp').append('<table id ="tblbtnmstjsp" style="margin-top:20px"></table>');
    $('#tblbtnmstjsp').append('<tr id="trbtnmstjsp"></tr>');
    $('#trbtnmstjsp').append('<td><button id="btnsimpanjsp" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdeljsp('+1+')">Simpan</button></td>');
    $('#trbtnmstjsp').append('<td><button id="btnubahjsp" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdeljsp('+2+')">Ubah</button></td>');
    $('#trbtnmstjsp').append('<td><button id="namadeljsp" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdeljsp('+3+')">Delete</button></td>');

    data_tabel();
    
//    $('#contenttablemstjsp').append('<table id="pbbmstjsp" border="1">');
//    $('#pbbmstjsp').append('<tr id="trthmstjsp"></tr>');
//    $('#trthmstjsp').append('<th>KdDPP</th>>');
//    $('#trthmstjsp').append('<th>Nama Pengelola</th>');
//    
//    $.ajax({
//            type: "POST",
//            url: "/pbb_baru/master_pbbmstjsp.htm",
//            async:false,
//            data:{isi:"load"},
//            success: function (data1) {
//                hasil_obj_awal = JSON.parse(data1);
//                for(var i=0;i<hasil_obj_awal["tbl_master_jsp"].length;i++){
//                     $('#pbbmstjsp').append('<tr id="divtextareajsp'+i+'" onclick="clickdiv('+i+')">');
//                     $('#divtextareajsp'+i).append('<td value="'+hasil_obj_awal["tbl_master_jsp"][i]["kdmstjsp"]+'">'+hasil_obj_awal["tbl_master_jsp"][i]["kdmstjsp"]+'</td>');
//                     $('#divtextareajsp'+i).append('<td value="'+hasil_obj_awal["tbl_master_jsp"][i]["nama"]+'">'+hasil_obj_awal["tbl_master_jsp"][i]["nama"]+'</td>');
//                }
//            },
//            error: function (data1) {
//                alert("error"+data1);        
//            }
//        });
        
    $("#kodedeljsp").val("");
    $("#namadeljsp").val("");
});
function klik_tabel_master(){
    var data_table;
    console.log("klik");
    var oTable = $('#pbbmstjsp').dataTable();
    $('table#pbbmstjsp tbody').on("click", "tr", function(e) {
        var item = $(this).closest("tr");
        var index = $(e.currentTarget).index() + 1;        
        console.log(oTable.fnGetData(item[0]));       
        data_table = oTable.fnGetData(item[0]);
        var kdjsp = data_table["kdmstjsp"];
        var nama = data_table["nama"];
        $('#kodedeljsp').val(kdjsp);
        $('#namadeljsp').val(nama);
    } );
};
function clickdiv(ke){
   // console.log(ke);
   $("#kodedeljsp").remove();
   $("#namadeljsp").remove();
   $("#tdkodedeljsp").append('<input id="kodedeljsp" maxlength="100"></input>');
   $("#tdnamadeljsp").append('<input id="namadeljsp" maxlength="100"></input>');
   tampedit = [];
    $('tr#divtextareajsp'+ke).each(function( i ) {
        $("td", this).each(function( j ) {
          //console.log($(this).text());
          tampedit.push($(this).text());
        });
      });
      //console.log(tampedit.length);
      $("#kodedeljsp").val(tampedit[0]);
      $("#namadeljsp").val(tampedit[1]);
};
function simpanubahdeljsp(perintah){
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
     $('#pbbmstjsp').remove();
    $('#pbbmstjsp_wrapper').remove();
//    $('#contenttablemstjsp').append('<table id="pbbmstjsp" border="1">');
//    $('#pbbmstjsp').append('<tr id="trthmstjsp"></tr>');
//    $('#trthmstjsp').append('<th>KdDPP</th>>');
//    $('#trthmstjsp').append('<th>Nama Pengelola</th>');
    $.ajax({
        type: "POST",
        traditional:true,
        url: "/pbb_baru/master_pbbmstjsp.htm",
        async:false,
        data:{nojsp:$("#kodedeljsp").val(),nama:$("#namadeljsp").val(),insuser:"novira",date:datevalid,updusr:"novira",upddate:datevalid,perintah:perintah,isi:"crud"},
        success: function (data1, textStatus, xhr) {
            data_tabel();
//                 hasil_obj_awal = JSON.parse(data1);
//                for(var i=0;i<hasil_obj_awal["tbl_master_jsp"].length;i++){
//                     $('#pbbmstjsp').append('<tr id="divtextareajsp'+i+'" onclick="clickdiv('+i+')">');
//                     $('#divtextareajsp'+i).append('<td value="'+hasil_obj_awal["tbl_master_jsp"][i]["kdmstjsp"]+'">'+hasil_obj_awal["tbl_master_jsp"][i]["kdmstjsp"]+'</td>');
//                     $('#divtextareajsp'+i).append('<td value="'+hasil_obj_awal["tbl_master_jsp"][i]["nama"]+'">'+hasil_obj_awal["tbl_master_jsp"][i]["nama"]+'</td>');
//                }
        },
        error: function (data, textStatus, xhr) {
                alert("error");
        }
    });
};
function data_tabel(){
     ////////////////////////table master/////////////////
    $('#contenttablemstjsp').append('<table id="pbbmstjsp" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#pbbmstjsp').append('<thead><tr id=trheadmstjsp></tr></thead>');
    $('#trheadmstjsp').append('<th>KdJSP</th>');
    $('#trheadmstjsp').append('<th>Nama Pengelola</th>');
    $('#pbbmstjsp').DataTable( {
        "ajax": {
            "url": "/pbb_baru/master_pbbmstjsp.htm",
            "type": "POST",
            "data":{isi:"load"}
        },
        "columns": [
            { "data": "kdmstjsp" },
            { "data": "nama" }
        ]
    } );
    klik_tabel_master();
};
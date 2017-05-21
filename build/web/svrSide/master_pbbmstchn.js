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
    
    $('#contentmastermstchn').append('<table id ="tblinputchannel"></table>');
    $('#tblinputchannel').append('<tr id="trkodemstchn" class="form-group"></tr>');
    $('#trkodemstchn').append('<td><label class="col-sm-12 control-label">Kode Delivery Channel</label></td>');
    $('#trkodemstchn').append('<td id="tdkodedelchn" class="col-sm-9"><input id="kodedelchn" type="text" placeholder="Input Kode Delivery Channel" class="form-control"></input></td>');
    
    $('#tblinputchannel').append('<tr id="trnamamstchn" class="form-group"></tr>');
    $('#trnamamstchn').append('<td><label class="col-sm-12 control-label">Nama Delivery Channel</label></td>');
    $('#trnamamstchn').append('<td id="tdnamadelchn" class="col-sm-9"><input id="namadelchn" type="text" placeholder="Nama Delivery Channel" class="form-control"></input></td>');
    
    $('#contentmastermstchn').append('<table id ="tblbtnmstchn" style="margin-top:20px"></table>');
    $('#tblbtnmstchn').append('<tr id="trbtnmstchn"></tr>');
    $('#trbtnmstchn').append('<td><button id="btnsimpanchn" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdelchn('+1+')">Simpan</button></td>');
    $('#trbtnmstchn').append('<td><button id="btnubahchn" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdelchn('+2+')">Ubah</button></td>');
    $('#trbtnmstchn').append('<td><button id="namadelchn" class="btn btn-block btn-outline btn-primary" type="button" onclick="simpanubahdelchn('+3+')">Delete</button></td>');
    
     ////////////////////////table master/////////////////
//    $('#contenttablemstchn').append('<table id="pbbmstchn" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
//    $('#pbbmstchn').append('<thead><tr id=trheadmstchn></tr></thead>');
//    $('#trheadmstchn').append('<th>KdCHN</th>');
//    $('#trheadmstchn').append('<th>Nama Channel</th>');
//    $('#pbbmstchn').DataTable( {
//        "ajax": {
//            "url": "/pbb_baru/master_pbbmstchn.htm",
//            "type": "POST",
//            "data":{isi:"load"}
//        },
//        "columns": [
//            { "data": "kdmstchn" },
//            { "data": "nama" }
//        ]
//    } );
    data_tabel();
    //klik_tabel_master();
    
    
//    $('#contenttablemstchn').append('<table id="pbbmstchn" border="1">');
//    $('#pbbmstchn').append('<tr id="trthmstchn"></tr>');
//    $('#trthmstchn').append('<th>KdCHN</th>>');
//    $('#trthmstchn').append('<th>Nama Channel</th>');
//    
//    $.ajax({
//            type: "POST",
//            url: "/pbb_baru/master_pbbmstchn.htm",
//            async:false,
//            data:{isi:"load"},
//            success: function (data1) {
//                hasil_obj_awal = JSON.parse(data1);
//                for(var i=0;i<hasil_obj_awal["tbl_master_chn"].length;i++){
//                     $('#pbbmstchn').append('<tr id="divtextareachn'+i+'" onclick="clickdiv('+i+')">');
//                     $('#divtextareachn'+i).append('<td value="'+hasil_obj_awal["tbl_master_chn"][i]["kdmstchn"]+'">'+hasil_obj_awal["tbl_master_chn"][i]["kdmstchn"]+'</td>');
//                     $('#divtextareachn'+i).append('<td value="'+hasil_obj_awal["tbl_master_chn"][i]["nama"]+'">'+hasil_obj_awal["tbl_master_chn"][i]["nama"]+'</td>');
//                }
//            },
//            error: function (data1) {
//                alert("error"+data1);        
//            }
//        });
        
    $("#kodedelchn").val("");
    $("#namadelchn").val("");
   // console.log(month);
});
function klik_tabel_master(){
    var data_table;
    console.log("klik");
    var oTable = $('#pbbmstchn').dataTable();
    $('table#pbbmstchn tbody').on("click", "tr", function(e) {
        var item = $(this).closest("tr");
        var index = $(e.currentTarget).index() + 1;        
        console.log(oTable.fnGetData(item[0]));       
        data_table = oTable.fnGetData(item[0]);
        var kdchn = data_table["kdmstchn"];
        var nmchn = data_table["nama"];
        $('#kodedelchn').val(kdchn);
        $('#namadelchn').val(nmchn);
    } );
};

function clickdiv(ke){
   // console.log(ke);
   $("#kodedelchn").remove();
   $("#namadelchn").remove();
   $("#tdkodedelchn").append('<input id="kodedelchn" maxlength="100"></input>');
   $("#tdnamadelchn").append('<input id="namadelchn" maxlength="100"></input>');
   tampedit = [];
    $('tr#divtextareachn'+ke).each(function( i ) {
        $("td", this).each(function( j ) {
          //console.log($(this).text());
          tampedit.push($(this).text());
        });
      });
      //console.log(tampedit.length);
      $("#kodedelchn").val(tampedit[0]);
      $("#namadelchn").val(tampedit[1]);
};
function simpanubahdelchn(perintah){
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
    
    $('#pbbmstchn').remove();
    $('#pbbmstchn_wrapper').remove();
    $.ajax({
        type: "POST",
        traditional:true,
        url: "/pbb_baru/master_pbbmstchn.htm",
        async:false,
        data:{nopbb:$("#kodedelchn").val(),nama:$("#namadelchn").val(),insuser:"novira",date:datevalid,updusr:"novira",upddate:datevalid,perintah:perintah,isi:"crud"},
        success: function (data1, textStatus, xhr) {
                   data_tabel();
//                 hasil_obj_awal = JSON.parse(data1);
//                for(var i=0;i<hasil_obj_awal["tbl_master_chn"].length;i++){
//                     $('#pbbmstchn').append('<tr id="divtextareachn'+i+'" onclick="clickdiv('+i+')">');
//                     $('#divtextareachn'+i).append('<td value="'+hasil_obj_awal["tbl_master_chn"][i]["kdmstchn"]+'">'+hasil_obj_awal["tbl_master_chn"][i]["kdmstchn"]+'</td>');
//                     $('#divtextareachn'+i).append('<td value="'+hasil_obj_awal["tbl_master_chn"][i]["nama"]+'">'+hasil_obj_awal["tbl_master_chn"][i]["nama"]+'</td>');
//                }
        },
        error: function (data, textStatus, xhr) {
                alert("error");
        }
    });
};
function data_tabel(){
     ////////////////////////table master/////////////////
    $('#contenttablemstchn').append('<table id="pbbmstchn" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#pbbmstchn').append('<thead><tr id=trheadmstchn></tr></thead>');
    $('#trheadmstchn').append('<th>KdCHN</th>');
    $('#trheadmstchn').append('<th>Nama Channel</th>');
    $('#pbbmstchn').DataTable( {
        "ajax": {
            "url": "/pbb_baru/master_pbbmstchn.htm",
            "type": "POST",
            "data":{isi:"load"}
        },
        "columns": [
            { "data": "kdmstchn" },
            { "data": "nama" }
        ]
    } );
    klik_tabel_master();
};
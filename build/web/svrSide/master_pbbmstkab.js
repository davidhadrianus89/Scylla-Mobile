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
var o;
var oTable;
var datatableprv;
var datamaster;
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
    //data table
     $('.dataTables-example').DataTable({
        "dom": 'lTfigt',
        "tableTools": {
             "sSwfPath": "js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"
         }
    });
     form_dialog();
    $('#contentmastermstkab').append('<table id= "inputkab"></table>');
    $('#inputkab').append('<tr id="kodekab" class="form-group"><td><label class="col-sm-2 control-label">Kode Kabupaten</label></td></tr>');
    $('#kodekab').append('<td class="col-sm-10"><input id="inpkodekab" type="text" placeholder="Input Kode Kabupaten" class="form-control"></td>');
    $('#inputkab').append('<tr id="namakab" class="form-group"><td><label class="col-sm-2 control-label">Nama Kabupaten</label></td></tr>');
    $('#namakab').append('<td class="col-sm-10"><input id="inpnamakab" type="text" placeholder="Input Nama Kabupaten" class="form-control"></td>');
    $('#inputkab').append('<tr id="kodeprov" class="form-group"><td><label class="col-sm-2 control-label">Kode Provinsi</label></td></tr>');
    $('#kodeprov').append('<td class="col-sm-10"><input id="inpkodeprov" type="text" placeholder="Select Kode Provinsi" class="form-control" editable="false" disabled = "true"></input></td>');
    $('#kodeprov').append('<td class="text-center"><a data-toggle="modal" class="btn btn-primary" href="#modal-form">Cari</a></td>');
 //  $('#kodeprov').append('<td class="text-center"><button id="btnsearch" onClick="form_dialog()">Search</a></td>');
    $('#contentmastermstkab').append('<table id= "btnkab"></table>');
    $('#btnkab').append('<tr id="btnkabtr" class="form-group"><td></td></tr>');
    $('#btnkabtr').append('<td><button class="btn btn-primary" onClick="simupddel('+1+')">Simpan</button></td>');
    $('#btnkabtr').append('<td><button class="btn btn-primary" onClick="simupddel('+2+')">Ubah</button></td>');
    $('#btnkabtr').append('<td><button class="btn btn-primary" onClick="simupddel('+3+')">Hapus</button></td>');
    ////////////////////////table master/////////////////
    $('#contenttablemstkab').append('<table id="tblmastrkab" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#tblmastrkab').append('<thead><tr id=trheadmstkab></tr></thead>');
    $('#trheadmstkab').append('<th>KdPrv</th>');
    $('#trheadmstkab').append('<th>KdKab</th>');
    $('#trheadmstkab').append('<th>Nama Kota/Kabupaten</th>');
    $('#tblmastrkab').DataTable( {
        "ajax": {
            "url": "/pbb_baru/master_pbbmstkab.htm",
            "type": "POST",
            "data":{isi:"tabelmasterkab"}
        }
    } );
    klik_tabel_master();
});

function form_dialog(){
    console.log("form dialog");
    $('#contentmastermstkab').append('<div id="modal-form" class="modal fade" aria-hidden="true"></div>');
    $('#modal-form').append('<div id ="modaldialog" class="modal-dialog"></div>');
    $('#modaldialog').append('<div id ="modalcontent" class="modal-content"></div>');
    $('#modalcontent').append(' <div id ="modalbody" class="modal-body"></div>');
    $('#modalbody').append('<div id="row1" class="row"></div>');
    $('#row1').append('<div id="tabelresponsive" class="table-responsive"></div>');
    $('#tabelresponsive').append('<table id="searchcolumn" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    //$('#row1').append('<table id="searchcolumn"></table>');
    $('#searchcolumn').append('<thead><tr id=trhead></tr></thead>');
    $('#trhead').append('<th>KdPrv</th>');
    $('#trhead').append('<th>Nama Provinsi</th>');
    $('#searchcolumn').DataTable( {
        "ajax": {
            "url": "/pbb_baru/master_pbbmstkab.htm",
            "type": "POST",
            "data":{isi:"tabelsearch"}        
        },
        "columns": [
            { "data": "kdmstprv" },
            { "data": "nama" }
        ]
    } );
    
    //oTable.fnGetData.fnGetPosition( this );
};

 $(function(){
    var oTable = $('#searchcolumn').dataTable();
    $('table#searchcolumn tbody').on("click", "tr", function(e) {
        var item = $(this).closest("tr");
        var index = $(e.currentTarget).index() + 1;        
       // console.log(oTable.fnGetData(item[0]));       
        datatableprv = oTable.fnGetData(item[0]);
        var isi = datatableprv["kdmstprv"];
        $('#inpkodeprov').val(isi);
        //$('.modal-backdrop.fade.in').remove();
        //$('.modal.fade').remove();  
        
        $( "body" ).removeClass( "pace-done modal-open" ).addClass( "pace-done" );
        $( "body" ).css("padding-right", "");
        
        $('#modal-form').removeClass( "modal fade in" ).addClass( "modal fade" );
        $('.modal-backdrop.fade.in').remove();
        $("#modal-form").css("display", "none");
        $("#modal-form").css("padding-right", "");

       // $('.btn btn-primary').remove();
       // $('.text-center').add('<a data-toggle="modal" class="btn btn-primary" href="#modal-form">Search</a>');

    } );
});
function klik_tabel_master(){
    var data_table;
    console.log("klik");
    var oTable = $('#tblmastrkab').dataTable();
    $('table#tblmastrkab tbody').on("click", "tr", function(e) {
        var item = $(this).closest("tr");
        var index = $(e.currentTarget).index() + 1;        
        console.log(oTable.fnGetData(item[0]));       
        data_table = oTable.fnGetData(item[0]);
        var kdprv = data_table[0];
        var kdkab = data_table[1];
        var nmkab = data_table[2];
        $('#inpkodekab').val(kdkab);
        $('#inpnamakab').val(nmkab);
        $('#inpkodeprov').val(kdprv);
    } );
};
function simupddel(perintah){
    console.log("button");
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
     ////////////////////////table master/////////////////
    $('#tblmastrkab').remove();
    $('#tblmastrkab_wrapper').remove();
    $('#contenttablemstkab').append('<table id="tblmastrkab" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#tblmastrkab').append('<thead><tr id=trheadmstkab></tr></thead>');
    $('#trheadmstkab').append('<th>KdPrv</th>');
    $('#trheadmstkab').append('<th>KdKab</th>');
    $('#trheadmstkab').append('<th>Nama Kota/Kabupaten</th>');
   
    $.ajax({
        type: "POST",
        traditional:true,
        url: "/pbb_baru/master_pbbmstkab.htm",
        async:false,
        data:{kdmstkab:$("#inpkodeprov").val()+$("#inpkodekab").val(),nama:$("#inpnamakab").val(),insuser:"novira",date:datevalid,updusr:"novira",upddate:datevalid,perintah:perintah,isi:"crud"},
        success: function (data1) {
           // console.log(data1);
            hasil_obj_awal = JSON.parse(data1)["data"];
        },
        error: function (data, textStatus, xhr) {
                alert("error");
        }
    });
   // console.log(hasil_obj_awal);
    $('#tblmastrkab').DataTable( {
        "data":hasil_obj_awal
    } );
     klik_tabel_master();
};
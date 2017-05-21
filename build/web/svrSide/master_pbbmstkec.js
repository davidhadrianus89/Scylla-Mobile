/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
   // form_dialog(1);
   // form_dialog(2);
    $('#contentmastermstkec').append('<table id= "inputkec"></table>');
    $('#inputkec').append('<tr id="kodekec" class="form-group"><td><label class="col-sm-2 control-label">Kode Kecamatan</label></td></tr>');
    $('#kodekec').append('<td class="col-sm-10"><input id="inpkodekec" type="text" placeholder="Input Kode Kecamatan" class="form-control"></td>');
    $('#inputkec').append('<tr id="namakec" class="form-group"><td><label class="col-sm-2 control-label">Nama Kecamatan</label></td></tr>');
    $('#namakec').append('<td class="col-sm-10"><input id="inpnamakec" type="text" placeholder="Input Nama Kecamatan" class="form-control"></td>');
    $('#inputkec').append('<tr id="kodeprov" class="form-group"><td><label class="col-sm-2 control-label">Kode Provinsi</label></td></tr>');
    $('#kodeprov').append('<td class="col-sm-10"><input id="inpkodeprov" type="text" placeholder="Select Kode Provinsi" class="form-control" editable="false" disabled = "true"></input></td>');
    $('#kodeprov').append('<td class="text-center"><a id="crkdkprv" data-toggle="modal" class="btn btn-primary" href="#modal-form" onClick="form_dialog('+1+')">Cari</a></td>');
    $('#inputkec').append('<tr id="kodekab" class="form-group"><td><label class="col-sm-2 control-label">Kode Kabupaten</label></td></tr>');
    $('#kodekab').append('<td class="col-sm-10"><input id="inpkodekab" type="text" placeholder="Select Kode Kabupaten" class="form-control" editable="false" disabled = "true"></input></td>');
    $('#kodekab').append('<td class="text-center"><a id="crkdkab" data-toggle="modal" class="btn btn-primary" href="#modal-form" onClick="form_dialog('+2+')">Cari</a></td>');
    //  $('#kodeprov').append('<td class="text-center"><button id="btnsearch" onClick="form_dialog()">Search</a></td>');
    $('#contentmastermstkec').append('<table id= "btnkec"></table>');
    $('#btnkec').append('<tr id="btnkectr" class="form-group"><td></td></tr>');
    $('#btnkectr').append('<td><button class="btn btn-primary" onClick="simupddel('+1+')">Simpan</button></td>');
    $('#btnkectr').append('<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>');
    $('#btnkectr').append('<td><button class="btn btn-primary" onClick="simupddel('+2+')">Ubah</button></td>');
    $('#btnkectr').append('<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>');
    $('#btnkectr').append('<td><button class="btn btn-primary" onClick="simupddel('+3+')">Hapus</button></td>');

     ////////////////////////table master/////////////////
    $('#contenttablemstkec').append('<table id="tblmastrkec" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#tblmastrkec').append('<thead><tr id=trheadmstkec></tr></thead>');
    $('#trheadmstkec').append('<th>KdPrv</th>');
    $('#trheadmstkec').append('<th>KdKab</th>');
    $('#trheadmstkec').append('<th>KdKec</th>');
    $('#trheadmstkec').append('<th>Nama Kecamatan</th>');
    $('#tblmastrkec').DataTable( {
        "ajax": {
            "url": "/pbb_baru/master_pbbmstkec.htm",
            "type": "POST",
            "data":{isi:"tabelmasterkec"}
        }
    } );
    klik_tabel_master();
});
function form_dialog(tanda){
    console.log("form dialog");
    console.log(tanda);
    $('#contentmastermstkec').append('<div id="modal-form" class="modal fade" aria-hidden="true"></div>');
    $('#modal-form').append('<div id ="modaldialog" class="modal-dialog"></div>');
    $('#modaldialog').append('<div id ="modalcontent" class="modal-content"></div>');
    $('#modalcontent').append(' <div id ="modalbody" class="modal-body"></div>');
    $('#modalbody').append('<div id="row1" class="row"></div>');
    $('#row1').append('<div id="tabelresponsive" class="table-responsive"></div>');
        //$('#row1').append('<table id="searchcolumn"></table>');
    $('#searchcolumn').remove();
    $('#searchcolumn_wrapper').remove();
    if(tanda == 1){
        $('#tabelresponsive').append('<table id="searchcolumn" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
        $('#searchcolumn').append('<thead><tr id=trhead></tr></thead>');
        $('#trhead').append('<th>KdPrv</th>');
        $('#trhead').append('<th>Nama Provinsi</th>');
        $('#searchcolumn').DataTable( {
            "ajax": {
                "url": "/pbb_baru/master_pbbmstkec.htm",
                "type": "POST",
                "data":{isi:"tabelsearch",perintah:tanda}        
            },
            "columns": [
                { "data": "kdmstprv" },
                { "data": "nama" }
            ]
        } );
    }
    if(tanda == 2){
        $('#tabelresponsive').append('<table id="searchcolumn" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
        $('#searchcolumn').append('<thead><tr id=trhead></tr></thead>');
        $('#trhead').append('<th>KdKab</th>');
        $('#trhead').append('<th>Nama Kabupaten</th>');
        $('#searchcolumn').DataTable( {
            "ajax": {
                "url": "/pbb_baru/master_pbbmstkec.htm",
                "type": "POST",
                "data":{isi:"tabelsearch",perintah:tanda}        
            },
            "columns": [
                { "data": "kdmstkab" },
                { "data": "nama" }
            ]
        } );
    }
    click_tabel_search(tanda);
    //oTable.fnGetData.fnGetPosition( this );
};
function click_tabel_search(tanda){
    var oTable = $('#searchcolumn').dataTable();
    $('table#searchcolumn tbody').on("click", "tr", function(e) {
        var item = $(this).closest("tr");
        var index = $(e.currentTarget).index() + 1;        
       // console.log(oTable.fnGetData(item[0]));       
        datatableprv = oTable.fnGetData(item[0]);
        if(tanda ==1){
            var isi = datatableprv["kdmstprv"];
            $('#inpkodeprov').val(isi);
        }
        if(tanda ==2){
            var isi = datatableprv["kdmstkab"];
            $('#inpkodekab').val(isi);
        }
        $( "body" ).removeClass( "pace-done modal-open" ).addClass( "pace-done" );
        $( "body" ).css("padding-right", "");
        
        $('#modal-form').removeClass( "modal fade in" ).addClass( "modal fade" );
        $('.modal-backdrop.fade.in').remove();
        $("#modal-form").css("display", "none");
        $("#modal-form").css("padding-right", "");

    } );
};
function klik_tabel_master(){
    var data_table;
    console.log("klik");
    var oTable = $('#tblmastrkec').dataTable();
    $('table#tblmastrkec tbody').on("click", "tr", function(e) {
        var item = $(this).closest("tr");
        var index = $(e.currentTarget).index() + 1;        
        console.log(oTable.fnGetData(item[0]));       
        data_table = oTable.fnGetData(item[0]);
        var kdprv = data_table[0];
        var kdkab = data_table[1];
        var kdkec = data_table[2];
        var nmkec = data_table[3];
        $('#inpkodeprov').val(kdprv);
        $('#inpkodekab').val(kdkab);
        $('#inpkodekec').val(kdkec);
        $('#inpnamakec').val(nmkec);
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
    $('#tblmastrkec').remove();
    $('#tblmastrkec_wrapper').remove();
    $('#contenttablemstkec').append('<table id="tblmastrkec" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#tblmastrkec').append('<thead><tr id=trheadmstkec></tr></thead>');
    $('#trheadmstkec').append('<th>KdPrv</th>');
    $('#trheadmstkec').append('<th>KdKab</th>');
    $('#trheadmstkec').append('<th>KdKec</th>');
    $('#trheadmstkec').append('<th>Nama Kecamatan</th>');
   
    $.ajax({
        type: "POST",
        traditional:true,
        url: "/pbb_baru/master_pbbmstkec.htm",
        async:false,
        data:{kdmstkab:$("#inpkodeprov").val()+$("#inpkodekab").val()+$("#inpkodekec").val(),nama:$("#inpnamakec").val(),insuser:"novira",date:datevalid,updusr:"novira",upddate:datevalid,perintah:perintah,isi:"crud"},
        success: function (data1) {
           // console.log(data1);
            hasil_obj_awal = JSON.parse(data1)["data"];
        },
        error: function (data, textStatus, xhr) {
                alert("error");
        }
    });
   // console.log(hasil_obj_awal);
    $('#tblmastrkec').DataTable( {
        "data":hasil_obj_awal
    } );
     klik_tabel_master();
};


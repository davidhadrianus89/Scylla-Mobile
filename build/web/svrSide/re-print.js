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
var hasil_obj_awal1;
var tahun = [];
var id_click="";
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
    buat_reprint(); 
    data_tabel();
    //$("#kodedelreprint").val("");
   // $("#namadelreprint").val("");
   // console.log(month);
});
function buat_reprint(){
      var awal = 1;
    akhir =  awal + 10;
    var min = new Date().getFullYear(),
    max = min + 9;
    for (i = 2000; i <= min; i++) { 
        tahun.push({label:i, value:i});
    }
    $('#contentreprint').append('<table id ="tblinputreprint"></table>');
    $('#tblinputreprint').append('<tr id="trDaerahreprint" class="form-group"></tr>');
    $('#trDaerahreprint').append('<td><label>Daerah Pajak</label></td>');
    $('#trDaerahreprint').append('<td class="col-sm-10"><select id="DaerahreprintId" name="Daerahreprintname" class="form-control"></select></td>');
    
    $('#tblinputreprint').append('<tr id="trJenisreprint" class="form-group"></tr>');
    $('#trJenisreprint').append('<td><label>Jenis Setoran Pajak</label></td>');
    $('#trJenisreprint').append('<td class="col-sm-10"><select id="JenisreprintId" name="Jenisreprintname" class="form-control"></select></td>');
    
    $('#tblinputreprint').append('<tr id="trIdentitasreprint" class="form-group"></tr>');
    $('#trIdentitasreprint').append('<td><label>Identitas NOP</label></td>');
    $('#trIdentitasreprint').append('<td class="col-sm-10"><input id="IdentitasreprintId" type="text" placeholder="Input Identitas NOP" class="form-control"></input></td>');

    $('#tblinputreprint').append('<tr id="trNamareprint" class="form-group"></tr>');
    $('#trNamareprint').append('<td><label>Nama Wajib Pajak</label></td>');
    $('#trNamareprint').append('<td class="col-sm-10"><input id="NamareprintId" type="text" placeholder="Input Nama Wajib Pajak" class="form-control"></input></td>');

    $('#tblinputreprint').append('<tr id="trAlamatreprint" class="form-group"></tr>');
    $('#trAlamatreprint').append('<td><label>Alamat Wajib Pajak</label></td>');
    $('#trAlamatreprint').append('<td class="col-sm-10"><input id="AlamatreprintId" type="text" placeholder="Input Alamat Wajib Pajak" class="form-control"></input></td>');

    $('#tblinputreprint').append('<tr id="trKecamatanreprint" class="form-group"></tr>');
    $('#trKecamatanreprint').append('<td><label>Kecamatan Wajib Pajak</label></td>');
    $('#trKecamatanreprint').append('<td class="col-sm-10"><input id="KecamatanreprintId" type="text" placeholder="Kecamatan Wajib Pajak" class="form-control"></input></td>');
    
    $('#tblinputreprint').append('<tr id="trProvinsireprint" class="form-group"></tr>');
    $('#trProvinsireprint').append('<td><label>Provinsi Wajib Pajak</label></td>');
    $('#trProvinsireprint').append('<td class="col-sm-10"><input id="ProvinsireprintId" type="text" placeholder="Input Provinsi Wajib Pajak" class="form-control"></input></td>');

    $('#tblinputreprint').append('<tr id="trTahunreprint" class="form-group"></tr>');
    $('#trTahunreprint').append('<td><label>Tahun Wajib Pajak</label></td>');
    $('#trTahunreprint').append('<td class="col-sm-10"><select id="TahunreprintId" name="Tahunreprintname" class="form-control"></select></td>');

    $('#tblinputreprint').append('<tr id="trNominalreprint" class="form-group"></tr>');
    $('#trNominalreprint').append('<td><label>Nominal Wajib Pajak</label></td>');
    $('#trNominalreprint').append('<td class="col-sm-10"><input id="NominalreprintId" type="text" placeholder="Input Nominal Wajib Pajak" class="form-control"></input></td>');

    $('#tblinputreprint').append('<tr id="trJurnalreprint" class="form-group"></tr>');
    $('#trJurnalreprint').append('<td><label>No Jurnal</label></td>');
    $('#trJurnalreprint').append('<td class="col-sm-10"><input id="JurnalreprintId" type="text" placeholder="Input No Jurnal" class="form-control"></input></td>');

    $('#tblinputreprint').append('<tr id="trTanggaltransreprint" class="form-group"></tr>');
    $('#trTanggaltransreprint').append('<td><label>Tanggal Transaksi</label></td>');
    $('#trTanggaltransreprint').append('<td class="col-sm-10"><div class="input-group date"><span class="input-group-addon"><i class="fa fa-calendar"></i></span><input id="date_added" type="text" class="form-control" value="07/01/2014"></div></td>');
    
    $('#tblinputreprint').append('<tr id="truseridsreprint" class="form-group"></tr>');
    $('#truseridsreprint').append('<td><label>User ID</label></td>');
    $('#truseridsreprint').append('<td class="col-sm-10"><input id="useridreprintId" type="text" placeholder="Input User ID" class="form-control"></input></td>');

    $('#contentreprint').append('<table id ="tblbtnmstreprint" style="margin-top:20px"></table>');
    $('#tblbtnmstreprint').append('<tr id="trbtnmstreprint"></tr>');
//    $('#trbtnmstreprint').append('<td><button id="btnRetrievereprint" class="btn btn-outline btn-primary pull-right" type="button" onclick="simpanubahdelreprint('+1+')">Retrieve</button></td>');
    $('#trbtnmstreprint').append('<td id="btnApprovereprintTd"><button id="btnApprovereprint" class="btn btn-outline btn-primary pull-right" type="button" onclick="simpanubahdelreprint()">Reprint Struk</button></td>');
    $('#trbtnmstreprint').append('<td id="namaResetreprintTd"><button id="namaResetreprint" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button></td>');
    $('#date_added').datepicker({
        todayBtn: "linked",
        keyboardNavigation: false,
        reprintParse: false,
        calendarWeeks: true,
        autoclose: true
    });
     $.ajax({
            type: "POST",
            url: "/pbb_baru/re-print.htm",
            async:false,
            data:{isi:"load"},
            success: function (data1) {
                hasil_obj_awal1 = JSON.parse(data1);
                  // console.log(hasil_obj_awal["transaksi_pembayaran"][0]["kdmstdpp"]); 
                hasil_obj_awal1["transaksi_pembayaran"].forEach(function(e,i){
                    // console.log(e["kdmstdpp"]+"-"+e["nama"]);
                     $("select[name=Daerahreprintname]").append('<option id="nocode'+i+'" value="'+e["kdmstdpp"]+"-"+e["nama"]+'">'+e["kdmstdpp"]+"-"+e["nama"]+'</option>')
                 });
                  hasil_obj_awal1["transaksi_pembayaranjsp"].forEach(function(e,i){
                    // console.log(e["kdmstdpp"]+"-"+e["nama"]);
                     $("select[name=Jenisreprintname]").append('<option id="nocode'+i+'" value="'+e["kdmstjsp"]+"-"+e["nama"]+'">'+e["kdmstjsp"]+"-"+e["nama"]+'</option>')
                 });
                },
            error: function (data1) {
                alert("error"+data1);        
            }
        });
    tahun.forEach(function(e,i){
        $("select[name=Tahunreprintname]").append('<option id="op'+i+'" value="'+ e["label"] +'">'+e["label"]+'</option>')
    });
     $("select[name=Tahunreprintname]").val(new Date().getFullYear());
};
function simpanubahdelreprint(){
    $.ajax({
        type: "POST",
        traditional:true,
        url: "/pbb_baru/re-print.htm",
        async:false,
        data:{isi:"crud",status:"1",id:id_click},
        success: function (data1) {
            //console.log(data1);
            alert("Approved Success");
            $('#pbbtabreprint').remove();
            $('#pbbtabreprint_wrapper').remove();
            $('#contenttablereprint').append('<table id="pbbtabreprint" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
            $('#pbbtabreprint').append('<thead><tr id=trheadtabreprint></tr></thead>');
            $('#trheadtabreprint').append('<th>No</th>');
            $('#trheadtabreprint').append('<th>Daerah Setoran Pajak</th>');
            $('#trheadtabreprint').append('<th>Jenis Setoran Pajak</th>');
            $('#trheadtabreprint').append('<th>NOP</th>');
            $('#trheadtabreprint').append('<th>Tahun Fiskal</th>');
        //    console.log(hasil_obj_awal);
            $('#pbbtabreprint').DataTable( {
                 "ajax": {
                    "url": "/pbb_baru/re-print.htm",
                    "type": "POST",
                    "data":{isi:"loadtab"}        
                },
                "columns": [
                    { "data": "id"},
                    { "data": "daerahPajak"},
                    { "data": "jnsSetPajak"},
                    { "data": "nop"},
                    { "data": "thnNop"}
                ]
            } );
            $('#btnApprovereprint').remove();
            $('#namaResetreprint').remove();
            $('#btnApprovereprintTd').append('<button id="btnApprovereprint" class="btn btn-outline btn-primary pull-right" type="button" onclick="simpanubahdelreprint()">Approve</button>');
            $('#namaResetreprintTd').append('<button id="namaResetreprint" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button>');
            reset();
        },
        error: function (data) {
                alert("error");
        }
    });
};
function data_tabel(){
     ////////////////////////table master/////////////////
     $.ajax({
        type: "POST",
        traditional:true,
        url: "/pbb_baru/re-print.htm",
        async:false,
        data:{isi:"loadtab"},
        success: function (data1) {
            //console.log(data1);
            hasil_obj_awal = JSON.parse(data1);
        },
        error: function (data, textStatus, xhr) {
                alert("error");
        }
    });
    $('#contenttablereprint').append('<table id="pbbtabreprint" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#pbbtabreprint').append('<thead><tr id=trheadtabreprint></tr></thead>');
    $('#trheadtabreprint').append('<th>No</th>');
    $('#trheadtabreprint').append('<th>Daerah Setoran Pajak</th>');
    $('#trheadtabreprint').append('<th>Jenis Setoran Pajak</th>');
    $('#trheadtabreprint').append('<th>NOP</th>');
    $('#trheadtabreprint').append('<th>Tahun Fiskal</th>');
//    console.log(hasil_obj_awal);
    $('#pbbtabreprint').DataTable( {
         "ajax": {
            "url": "/pbb_baru/re-print.htm",
            "type": "POST",
            "data":{isi:"loadtab"}        
        },
        "columns": [
            { "data": "id"},
            { "data": "daerahPajak"},
            { "data": "jnsSetPajak"},
            { "data": "nop"},
            { "data": "thnNop"}
        ]
    } );
    klik_tabel_master();
};
var data_fill =[];
function klik_tabel_master(){
    var data_table;
    console.log("klik");
    var oTable = $('#pbbtabreprint').dataTable();
    $('table#pbbtabreprint tbody').on("click", "tr", function(e) {
        var item = $(this).closest("tr");
        var index = $(e.currentTarget).index() + 1;        
//        console.log(oTable.fnGetData(item[0]));       
        data_table = oTable.fnGetData(item[0]);
        var id = data_table["id"];
        id_click = id;
//        console.log(hasil_obj_awal["data"][0]["id"]);
//        console.log(hasil_obj_awal["data"].length);
        for(var i=0;i<hasil_obj_awal["data"].length;i++){
            if(hasil_obj_awal["data"][i]["id"] === id){
                $("select[name=Daerahreprintname]").val(hasil_obj_awal["data"][i]["daerahPajak"]);
                $("select[name=Jenisreprintname]").val(hasil_obj_awal["data"][i]["jnsSetPajak"]);
                $("#IdentitasreprintId").val(hasil_obj_awal["data"][i]["nop"]);
                $("#NamareprintId").val(hasil_obj_awal["data"][i]["nmNop"]);
                $("#AlamatreprintId").val(hasil_obj_awal["data"][i]["alamatNop"]);
                $("#KecamatanreprintId").val(hasil_obj_awal["data"][i]["kecNop"]);
                $("#ProvinsireprintId").val(hasil_obj_awal["data"][i]["prvNop"]);
                $("#TahunreprintId").val(hasil_obj_awal["data"][i]["thnNop"]);
                $("#NominalreprintId").val(hasil_obj_awal["data"][i]["nominal"]);
                $("#JurnalreprintId").val(hasil_obj_awal["data"][i]["noJurnal"]);
                $("#date_added").val(hasil_obj_awal["data"][i]["tglTrans"]);
                $("#useridreprintId").val(hasil_obj_awal["data"][i]["userid"]);
            }
        }
        //$('#JenisappId').val(jnsSetPajak);
    } );
};

function reset(){
    $('#namaResetreprint').remove();
    $('#namaResetreprintTd').append('<button id="namaResetreprint" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button>');
    $("select[name=Daerahreprintname]").val("");
    $("select[name=Jenisreprintname]").val("");
    $("#IdentitasreprintId").val("");
    $("#NamareprintId").val("");
    $("#AlamatreprintId").val("");
    $("#KecamatanreprintId").val("");
    $("#ProvinsireprintpId").val("");
    $("#TahunreprintId").val("");
    $("#NominalreprintId").val("");
    $("#JurnalreprintId").val("");
    $("#date_added").val("");
    $("#useridreprintId").val("");
    $("select[name=Daerahreprintname]").val(hasil_obj_awal1["transaksi_pembayaran"][0]["kdmstdpp"]+"-"+hasil_obj_awal1["transaksi_pembayaran"][0]["nama"]);
    $("select[name=Jenisreprintname]").val(hasil_obj_awal1["transaksi_pembayaranjsp"][0]["kdmstjsp"]+"-"+hasil_obj_awal1["transaksi_pembayaranjsp"][0]["nama"]);
    $("select[name=Tahunreprintname]").val(new Date().getFullYear());
};

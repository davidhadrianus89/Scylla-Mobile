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
var hasil_obj_approve;
var tahun = [];
var id_click="";
var url;
var url2;
var url3;
var userbukiweb;
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
    $.getJSON("../json/url.json", function(data) {
        url2 = data["url2"];
        url3 = data["url3"];
        url = data["url"];
        $.ajax({
            type: "POST",
            traditional:true,
            url: url2+"/GETUSERAPP",
            async:false,
            dataType : 'json',
            crossDomain:true,
            success: function (data1) {
                userbukiweb = data1;
                console.log(userbukiweb);
            }
        });
        buat_transaksi_app(); 
        data_tabel();
    });
   
    //$("#kodedelapp").val("");
   // $("#namadelapp").val("");
   // console.log(month);
});
function buat_transaksi_app(){
    var awal = 1;
    akhir =  awal + 10;
    var min = new Date().getFullYear(),
    max = min + 9;
    for (i = 2000; i <= min; i++) { 
        tahun.push({label:i, value:i});
    }
    console.log("approval");
    tgl_trans = month+"/"+day+"/"+year;
   // console.log(url);
    $('#contentapp').append('<table id ="tblinputapp"></table>');
    $('#tblinputapp').append('<tr id="trDaerahapp" class="form-group"></tr>');
    $('#trDaerahapp').append('<td><label>Daerah Pajak</label></td>');
    $('#trDaerahapp').append('<td class="col-sm-10"><select id="DaerahappId" name="Daerahappname" class="form-control"></select></td>');
    
    $('#tblinputapp').append('<tr id="trJenisapp" class="form-group"></tr>');
    $('#trJenisapp').append('<td><label>Jenis Setoran Pajak</label></td>');
    $('#trJenisapp').append('<td class="col-sm-10"><select id="JenisappId" name="Jenisappname" class="form-control"></select></td>');
    
    $('#tblinputapp').append('<tr id="trIdentitasapp" class="form-group"></tr>');
    $('#trIdentitasapp').append('<td><label>Identitas NOP</label></td>');
    $('#trIdentitasapp').append('<td class="col-sm-10"><input id="IdentitasappId" type="text" placeholder="Input Identitas NOP" class="form-control"></input></td>');

    $('#tblinputapp').append('<tr id="trNamaapp" class="form-group"></tr>');
    $('#trNamaapp').append('<td><label>Nama Wajib Pajak</label></td>');
    $('#trNamaapp').append('<td class="col-sm-10"><input id="NamaappId" type="text" placeholder="Input Nama Wajib Pajak" class="form-control" disabled = "true"></input></td>');

    $('#tblinputapp').append('<tr id="trAlamatapp" class="form-group"></tr>');
    $('#trAlamatapp').append('<td><label>Alamat Wajib Pajak</label></td>');
    $('#trAlamatapp').append('<td class="col-sm-10"><input id="AlamatappId" type="text" placeholder="Input Alamat Wajib Pajak" class="form-control" disabled = "true"></input></td>');

    $('#tblinputapp').append('<tr id="trKecamatanapp" class="form-group"></tr>');
    $('#trKecamatanapp').append('<td><label>Kecamatan Wajib Pajak</label></td>');
    $('#trKecamatanapp').append('<td class="col-sm-10"><input id="KecamatanappId" type="text" placeholder="Kecamatan Wajib Pajak" class="form-control" disabled = "true"></input></td>');
    
    $('#tblinputapp').append('<tr id="trProvinsiapp" class="form-group"></tr>');
    $('#trProvinsiapp').append('<td><label>Provinsi Wajib Pajak</label></td>');
    $('#trProvinsiapp').append('<td class="col-sm-10"><input id="ProvinsiappId" type="text" placeholder="Input Provinsi Wajib Pajak" class="form-control" disabled = "true"></input></td>');

    $('#tblinputapp').append('<tr id="trTahunapp" class="form-group"></tr>');
    $('#trTahunapp').append('<td><label>Tahun Wajib Pajak</label></td>');
    $('#trTahunapp').append('<td class="col-sm-10"><select id="TahunappId" name="Tahunappname" class="form-control"></select></td>');

    $('#tblinputapp').append('<tr id="trNominalapp" class="form-group"></tr>');
    $('#trNominalapp').append('<td><label>Nominal Wajib Pajak</label></td>');
    $('#trNominalapp').append('<td class="col-sm-10"><input id="NominalappId" type="text" placeholder="Input Nominal Wajib Pajak" class="form-control" disabled = "true"></input></td>');

    $('#tblinputapp').append('<tr id="trJurnalapp" class="form-group"></tr>');
    $('#trJurnalapp').append('<td><label>No Jurnal</label></td>');
    $('#trJurnalapp').append('<td class="col-sm-10"><input id="JurnalappId" type="text" placeholder="Input No Jurnal" class="form-control" disabled = "true"></input></td>');

    $('#tblinputapp').append('<tr id="trTanggaltransapp" class="form-group"></tr>');
    $('#trTanggaltransapp').append('<td><label>Tanggal Transaksi</label></td>');
    $('#trTanggaltransapp').append('<td class="col-sm-10"><div class="input-group date"><span class="input-group-addon"><i class="fa fa-calendar"></i></span><input id="date_added" type="text" class="form-control" value="'+tgl_trans+'"></div></td>');
    
    $('#tblinputapp').append('<tr id="truseridsapp" class="form-group"></tr>');
    $('#truseridsapp').append('<td><label>User ID</label></td>');
    $('#truseridsapp').append('<td class="col-sm-10"><input id="useridappId" type="text" placeholder="Input User ID" class="form-control" disabled = "true"></input></td>');

    $('#contentapp').append('<table id ="tblbtnmstapp" style="margin-top:20px"></table>');
    $('#tblbtnmstapp').append('<tr id="trbtnmstapp"></tr>');
//    $('#trbtnmstapp').append('<td><button id="btnRetrieveapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="simpanubahdelapp('+1+')">Retrieve</button></td>');
    $('#trbtnmstapp').append('<td id="btnApproveappTd"><button id="btnApproveapp" class="btn btn-outline btn-primary pull-right" type="button">Approve</button></td>');
    $('#trbtnmstapp').append('<td id="namaResetappTd"><button id="namaResetapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button></td>');
    $('#trbtnmstapp').append('<td id="btnPrintappTd"><button id="namaPrintapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="print()">Print</button></td>');
    $('#date_added').datepicker({
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        calendarWeeks: true,
        autoclose: true
    });
     $.ajax({
            type: "POST",
            traditional:true,
            url: url+"/trxapp.htm",
            async:false,
            dataType : 'json',
            crossDomain:true,
            data:{isi:"load"},
            success: function (data1) {
                hasil_obj_awal1 = data1;
                  // console.log(hasil_obj_awal["transaksi_pembayaran"][0]["kdmstdpp"]); 
                data1["transaksi_pembayaran"].forEach(function(e,i){
                    // console.log(e["kdmstdpp"]+"-"+e["nama"]);
                     $("select[name=Daerahappname]").append('<option id="nocode'+i+'" value="'+e["fermsccode"]+"-"+e["fermscva07"]+'">'+e["fermsccode"]+"-"+e["fermscva07"]+'</option>')
                 });
                data1["transaksi_pembayaranjsp"].forEach(function(e,i){
                    // console.log(e["kdmstdpp"]+"-"+e["nama"]);
                     $("select[name=Jenisappname]").append('<option id="nocode'+i+'" value="'+e["fermsccode"]+"-"+e["fermscva07"]+'">'+e["fermsccode"]+"-"+e["fermscva07"]+'</option>')
                 });
                },
            error: function (data1) {
                alert("error"+data1);        
            }
        });
    tahun.forEach(function(e,i){
        $("select[name=Tahunappname]").append('<option id="op'+i+'" value="'+ e["label"] +'">'+e["label"]+'</option>')
    });
     $("select[name=Tahunappname]").val(new Date().getFullYear());
     $('#namaPrintapp').hide();
     $('#btnApproveapp').click(function(){
     var r = confirm("Apakah Anda Akan Melakukan Approve Payment?");
        if(r == true){
           simpanubahdelapp();
        }   
    });
};
function print(){
    console.log("print");
   
    if($("#IdentitasappId").val() != "" && $("#TahunappId").val() != "" && $("#date_added").val() != ""){
        splitbulan_hari = $('#JurnalappId').val().substr(0,4);
        splitbatch_user = $('#JurnalappId').val().substr(4,4);
        splittr_no = $('#JurnalappId').val().substr(8,7);
        user_login = $("#useridappId").val();
        $('#test1').load("/report/PBB/TCPBRP1005?nop="+$("#idnop").val()+"&tahun="+$("#TahunappId").val()+"&tgl_trans="+$("#date_added").val()+"&BulanHari="+BulanHari+"&batch_user="+batch_user+"&trno="+trno+"&userlogin="+user_login);
        //window.location.href = url2+"/RPRCP";
    }
    //else if($("#IdentitasappId").val() === "" && $("#TahunappId").val() === "" && $("#date_added").val() === ""){
     else{ 
        console.log("click tabel first");
        alert("Click Table First");
    }
};
function simpanubahdelapp(){
    $('#pbbmstapp').remove();
    $('#pbbmstapp_wrapper').remove();
    $.getJSON( "../json/yang_dipake_app.json", function(data) { 
        pass= data["app"][0]["pass"];
        clientid =data["app"][0]["clientid"];
        userid=data["app"][0]["userid"];
        operation_code = data["app"][0]["operation_code"];
        user_login = userbukiweb["userlogin"].trim()+data["app"][0]["userlogin"].substr(0,(data["app"][0]["userlogin"].length-(userbukiweb["userlogin"].trim().length)));
        console.log(user_login);
        cabang = data["app"][0]["cabang"].substr(0,(data["app"][0]["cabang"].length-(userbukiweb["cabangCode"].trim().length)))+userbukiweb["cabangCode"].trim();
        lokasi = data["app"][0]["lokasi"].substr(0,(data["app"][0]["lokasi"].length-(userbukiweb["lokasiCode"].trim().substr(userbukiweb["lokasiCode"].length-2,2).length)))+userbukiweb["lokasiCode"].trim().substr(userbukiweb["lokasiCode"].length-2,2);
        type = data["app"][0]["type"];
        splitbulan_hari = $('#JurnalappId').val().substr(0,4);
        splitbatch_user = $('#JurnalappId').val().substr(4,4);
        splittr_no = $('#JurnalappId').val().substr(8,7);
        batch_user = splitbatch_user+data["app"][0]["batch_user"].substr(0,(data["app"][0]["batch_user"].length-(splitbatch_user.length)));
        trno = data["app"][0]["trno"].substr(0,(data["app"][0]["trno"].length-(splittr_no.length)))+splittr_no;
        BulanHari = data["app"][0]["bulan_hari"].substr(0,(data["app"][0]["bulan_hari"].length-(splitbulan_hari.length)))+splitbulan_hari;
        var daerah_pajak = $('#DaerahappId').val();
        var jns_set_pajak = $('#JenisappId').val();
        //tgl_trans = month+"/"+day+"/"+year;
        jam_trans = hour+minutes+seconds;
        //nop,tgl_trans,nojurnal
        // console.log("crud");
        $.ajax({
            type: "POST",
            traditional:true,
            url: url+"/trxapp.htm",
            async:false,
            dataType : 'json',
            crossDomain:true,
            beforeSend: function() { 
                 $("#loading-image").show();
            },
            data:{isi:"crud",type:type,pass:pass,clientid:clientid,operation_code:operation_code,userid:userid,user_login:user_login,cabang:cabang,lokasi:lokasi,status:"1",id:id_click,nop:$("#IdentitasappId").val(),tgl_trans:$("#date_added").val(),BulanHari:BulanHari,batch_user:batch_user,trno:trno,daerah_pajak:daerah_pajak,jns_set_pajak:jns_set_pajak,jam_trans:jam_trans},
            success: function (data1) {
                $("#loading-image").hide();
                //console.log(data1);
                hasil_obj_approve =[];
                //hasil_obj_approve = JSON.parse(data1);
                //console.log(data1["hasil_res"]);
                if(data1["hasil_respon_code"] != "00"){
                    alert(data1["hasil_respon"]);
                    console.log(data1["hasil_respon_code"]);
                    if(data1["hasil_respon_code"] === "86"){
                        console.log("force payment");
                        var daerah_pajak = $('#DaerahappId').val();
                        var jns_set_pajak = $('#JenisappId').val();
                        var nop = $('#IdentitasappId').val();
                        var nm_nop = $('#NamaappId').val();
                        var alamat_nop = $('#AlamatappId').val();
                        var kec_nop = $('#KecamatanappId').val();
                        var prv_nop = $('#ProvinsiappId').val();
                        var thn_nop = $('#TahunappId').val();
                        var nominal = $('#NominalappId').val();
                        var no_jurnal = $('#JurnalappId').val();//.replace(/[ ]/g,'');//hanya tahun
                        //console.log(no_jurnal);
                        tgl_trans = month+"/"+day+"/"+new Date().getUTCFullYear();
                        jam_trans = hour+minutes+seconds;
                        var userlogin = userbukiweb["userlogin"];
                        $.ajax({
                            type: "POST",
                            traditional:true,
                            url: url+"/transpem.htm",
                            async:false,
                            dataType : 'json',
                            crossDomain:true,
                            data:{isi:"force",daerah_pajak:daerah_pajak,jns_set_pajak:jns_set_pajak,nop:nop,nm_nop:nm_nop,alamat_nop:alamat_nop,kec_nop:kec_nop,prv_nop:prv_nop,thn_nop:thn_nop,nominal:nominal,no_jurnal:no_jurnal,tgl_trans:tgl_trans,jam_trans:jam_trans,userid:userlogin}
                        });
                    }
                    $('#btnApproveapp').remove();
                    $('#namaResetapp').remove();
                    $('#btnApproveappTd').append('<button id="btnApproveapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="simpanubahdelapp()">Approve</button>');
                    $('#namaResetappTd').append('<button id="namaResetapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button>');
                    reset();
                }
                else if(data1["hasil_respon_code"] === "00"){
                    alert("Approved Success");
                    $('#namaPrintapp').show();
                    $('#namaResetapp').remove();
                    $('#btnApproveapp').remove();
                    $('#btnApproveappTd').append('<button id="btnApproveapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="simpanubahdelapp()">Approve</button>');
                    $('#namaResetappTd').append('<button id="namaResetapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button>');
                }
                
                $('#pbbtabapp').remove();
                $('#pbbtabapp_wrapper').remove();
                $('#contenttableapp').append('<table id="pbbtabapp" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
                $('#pbbtabapp').append('<thead><tr id=trheadtabapp></tr></thead>');
                $('#trheadtabapp').append('<th>No</th>');
                $('#trheadtabapp').append('<th>Daerah Setoran Pajak</th>');
                $('#trheadtabapp').append('<th>Jenis Setoran Pajak</th>');
                $('#trheadtabapp').append('<th>NOP</th>');
                $('#trheadtabapp').append('<th>Tahun Fiskal</th>');
                $('#trheadtabapp').append('<th>Tanggal Transaksi</th>');
                 $('#trheadtabapp').append('<th>Jam Transaksi</th>');
            //    console.log(hasil_obj_awal);
               var t =  $('#pbbtabapp').DataTable( {
                     "ajax": {
                        "url": url+"/trxapp.htm",
                        "type": "POST",
                        "traditional":true,
                        "dataType":'json',
                        "crossDomain":true,
                        "data":{isi:"loadtab",tgltrans:month+"/"+day+"/"+year}        
                    },
                    "columns": [
                        { "data": "id"},
                        { "data": "daerahPajak"},
                        { "data": "jnsSetPajak"},
                        { "data": "nop"},
                        { "data": "thnNop"},
                        { "data": "tglTrans"},
                        { "data": "jamTrans"}
                    ],
                    "columnDefs": [ {
                        "searchable": false,
                        "orderable": false,
                        "targets": 0
                    } ],
                    "order": [[ 1, 'asc' ]]
                } );
                
                t.on( 'order.dt search.dt', function () {
                    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                        cell.innerHTML = i+1;
                    } );
                } ).draw();
            },
            error: function (data) {
               alert("error");
            }
        });
         klik_tabel_master();
    });
  
};
function data_tabel(){
    console.log("datatable'");
     ////////////////////////table master/////////////////
     $.ajax({
        type: "POST",
        traditional:true,
        url: url+"/trxapp.htm",
        async:false,
        dataType : 'json',
        crossDomain:true,
        data:{isi:"loadtab",tgltrans:month+"/"+day+"/"+year},
        success: function (data1) {
            hasil_obj_awal = data1;
           
        },
        error: function (data, textStatus, xhr) {
                alert("error");
        }
    });
    $('#contenttableapp').append('<table id="pbbtabapp" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#pbbtabapp').append('<thead><tr id=trheadtabapp></tr></thead>');
    $('#trheadtabapp').append('<th>No</th>');
    $('#trheadtabapp').append('<th>Daerah Setoran Pajak</th>');
    $('#trheadtabapp').append('<th>Jenis Setoran Pajak</th>');
    $('#trheadtabapp').append('<th>NOP</th>');
    $('#trheadtabapp').append('<th>Tahun Fiskal</th>');
    $('#trheadtabapp').append('<th>Tanggal Transaksi</th>');
    $('#trheadtabapp').append('<th>Jam Transaksi</th>');
//    console.log(hasil_obj_awal);
    var t = $('#pbbtabapp').DataTable( {
         "ajax": {
            "url": url+"/trxapp.htm",
            "type": "POST",
            "traditional":true,
            "dataType" : 'json',
            "crossDomain":true,
            "data":{isi:"loadtab",tgltrans:$("#date_added").val()}        
        },
        "columns": [
          //  { "data": "id"},
            { "data": "daerahPajak"},
            { "data": "jnsSetPajak"},
            { "data": "nop"},
            { "data": "thnNop"},
            { "data": "tglTrans"},
            { "data": "jamTrans"}
        ],
        "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        } ],
        "order": [[ 1, 'asc' ]]
    } );
    t.on( 'order.dt search.dt', function () {
            t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
    klik_tabel_master();
};
var data_fill =[];
function klik_tabel_master(){
    var data_table;
    console.log("klik");
    var oTable = $('#pbbtabapp').dataTable();
    $('table#pbbtabapp tbody').on("click", "tr", function(e) {
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
                BulanHari = hasil_obj_awal["data"][i]["bulanHari"];
                batch_user = hasil_obj_awal["data"][i]["batchUser"];
                trno = hasil_obj_awal["data"][i]["noTrans"];
                $("select[name=Daerahappname]").val(hasil_obj_awal["data"][i]["daerahPajak"]);
                $("select[name=Jenisappname]").val(hasil_obj_awal["data"][i]["jnsSetPajak"]);
                $("#IdentitasappId").val(hasil_obj_awal["data"][i]["nop"]);
                $("#NamaappId").val(hasil_obj_awal["data"][i]["nmNop"]);
                $("#AlamatappId").val(hasil_obj_awal["data"][i]["alamatNop"]);
                $("#KecamatanappId").val(hasil_obj_awal["data"][i]["kecNop"]);
                $("#ProvinsiappId").val(hasil_obj_awal["data"][i]["prvNop"]);
                $("#TahunappId").val(hasil_obj_awal["data"][i]["thnNop"]);
                $("#NominalappId").val(hasil_obj_awal["data"][i]["nominal"]);
                $("#JurnalappId").val(hasil_obj_awal["data"][i]["bulanHari"].replace(/[ ]/g,'')+hasil_obj_awal["data"][i]["batchUser"].replace(/[ ]/g,'')+hasil_obj_awal["data"][i]["noTrans"].replace(/[ ]/g,''));
                $("#date_added").val(hasil_obj_awal["data"][i]["tglTrans"]);
                $("#useridappId").val(hasil_obj_awal["data"][i]["userid"]);
            }
        }
        //$('#JenisappId').val(jnsSetPajak);
    } );
};

function reset(){
    $('#namaResetapp').remove();
    $('#namaResetappTd').append('<button id="namaResetapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button>');
    $("select[name=Daerahappname]").val("");
    $("select[name=Jenisappname]").val("");
    $("#IdentitasappId").val("");
    $("#NamaappId").val("");
    $("#AlamatappId").val("");
    $("#KecamatanappId").val("");
    $("#ProvinsiappId").val("");
    $("#TahunappId").val("");
    $("#NominalappId").val("");
    $("#JurnalappId").val("");
    $("#date_added").val("");
    $("#useridappId").val("");
    $("select[name=Daerahappname]").val(hasil_obj_awal1["transaksi_pembayaran"][0]["kdmstdpp"]+"-"+hasil_obj_awal1["transaksi_pembayaran"][0]["nama"]);
    $("select[name=Jenisappname]").val(hasil_obj_awal1["transaksi_pembayaranjsp"][0]["kdmstjsp"]+"-"+hasil_obj_awal1["transaksi_pembayaranjsp"][0]["nama"]);
    $("select[name=Tahunappname]").val(new Date().getFullYear());
};
$(function(){
   $('#btnApproveapp').click(function(){
     var r = confirm("Apakah Anda Akan Melakukan Payment?");
        if(r == true){
           simpanubahdelapp();
        }   
    });
});
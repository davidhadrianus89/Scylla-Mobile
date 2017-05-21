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
var url;
var url2;
var url3;
var hasil_obj_force;
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
            url: url2+"/GETUSERFORCE",
            async:false,
            dataType : 'json',
            crossDomain:true,
            success: function (data1) {
                userbukiweb = data1;
                //console.log(data1);
            }
        });
        buat_force(); 
        data_tabel();
    });
   
    //$("#kodedelforce").val("");
   // $("#namadelforce").val("");
   // console.log(month);
});
function buat_force(){
    var awal = 1;
    akhir =  awal + 10;
    var min = new Date().getFullYear(),
    max = min + 9;
    for (i = 2000; i <= min; i++) { 
        tahun.push({label:i, value:i});
    }
    tgl_trans = month+"/"+day+"/"+year;
    $('#contentforce').append('<table id ="tblinputforce"></table>');
    $('#tblinputforce').append('<tr id="trDaerahforce" class="form-group"></tr>');
    $('#trDaerahforce').append('<td><label>Daerah Pajak</label></td>');
    $('#trDaerahforce').append('<td class="col-sm-10"><select id="DaerahforceId" name="Daerahforcename" class="form-control"></select></td>');
    
    $('#tblinputforce').append('<tr id="trJenisforce" class="form-group"></tr>');
    $('#trJenisforce').append('<td><label>Jenis Setoran Pajak</label></td>');
    $('#trJenisforce').append('<td class="col-sm-10"><select id="JenisforceId" name="Jenisforcename" class="form-control"></select></td>');
    
    $('#tblinputforce').append('<tr id="trIdentitasforce" class="form-group"></tr>');
    $('#trIdentitasforce').append('<td><label>Identitas NOP</label></td>');
    $('#trIdentitasforce').append('<td class="col-sm-10"><input id="IdentitasforceId" type="text" placeholder="Input Identitas NOP" class="form-control"></input></td>');

    $('#tblinputforce').append('<tr id="trNamaforce" class="form-group"></tr>');
    $('#trNamaforce').append('<td><label>Nama Wajib Pajak</label></td>');
    $('#trNamaforce').append('<td class="col-sm-10"><input id="NamaforceId" type="text" placeholder="Input Nama Wajib Pajak" class="form-control"></input></td>');

    $('#tblinputforce').append('<tr id="trAlamatforce" class="form-group"></tr>');
    $('#trAlamatforce').append('<td><label>Alamat Wajib Pajak</label></td>');
    $('#trAlamatforce').append('<td class="col-sm-10"><input id="AlamatforceId" type="text" placeholder="Input Alamat Wajib Pajak" class="form-control"></input></td>');

    $('#tblinputforce').append('<tr id="trKecamatanforce" class="form-group"></tr>');
    $('#trKecamatanforce').append('<td><label>Kecamatan Wajib Pajak</label></td>');
    $('#trKecamatanforce').append('<td class="col-sm-10"><input id="KecamatanforceId" type="text" placeholder="Kecamatan Wajib Pajak" class="form-control"></input></td>');
    
    $('#tblinputforce').append('<tr id="trProvinsiforce" class="form-group"></tr>');
    $('#trProvinsiforce').append('<td><label>Provinsi Wajib Pajak</label></td>');
    $('#trProvinsiforce').append('<td class="col-sm-10"><input id="ProvinsiforceId" type="text" placeholder="Input Provinsi Wajib Pajak" class="form-control"></input></td>');

    $('#tblinputforce').append('<tr id="trTahunforce" class="form-group"></tr>');
    $('#trTahunforce').append('<td><label>Tahun Wajib Pajak</label></td>');
    $('#trTahunforce').append('<td class="col-sm-10"><select id="TahunforceId" name="Tahunforcename" class="form-control"></select></td>');

    $('#tblinputforce').append('<tr id="trNominalforce" class="form-group"></tr>');
    $('#trNominalforce').append('<td><label>Nominal Wajib Pajak</label></td>');
    $('#trNominalforce').append('<td class="col-sm-10"><input id="NominalforceId" type="text" placeholder="Input Nominal Wajib Pajak" class="form-control"></input></td>');

    $('#tblinputforce').append('<tr id="trJurnalforce" class="form-group"></tr>');
    $('#trJurnalforce').append('<td><label>No Jurnal</label></td>');
    $('#trJurnalforce').append('<td class="col-sm-10"><input id="JurnalforceId" type="text" placeholder="Input No Jurnal" class="form-control"></input></td>');

    $('#tblinputforce').append('<tr id="trTanggaltransforce" class="form-group"></tr>');
    $('#trTanggaltransforce').append('<td><label>Tanggal Transaksi</label></td>');
    $('#trTanggaltransforce').append('<td class="col-sm-10"><div class="input-group date"><span class="input-group-addon"><i class="fa fa-calendar"></i></span><input id="date_added" type="text" class="form-control" value="'+tgl_trans+'"></div></td>');
    
    $('#tblinputforce').append('<tr id="truseridsforce" class="form-group"></tr>');
    $('#truseridsforce').append('<td><label>User ID</label></td>');
    $('#truseridsforce').append('<td class="col-sm-10"><input id="useridforceId" type="text" placeholder="Input User ID" class="form-control"></input></td>');

    $('#contentforce').append('<table id ="tblbtnmstforce" style="margin-top:20px"></table>');
    $('#tblbtnmstforce').append('<tr id="trbtnmstforce"></tr>');
//    $('#trbtnmstforce').append('<td><button id="btnRetrieveforce" class="btn btn-outline btn-primary pull-right" type="button" onclick="simpanubahdelforce('+1+')">Retrieve</button></td>');
    $('#trbtnmstforce').append('<td id="btnApproveforceTd"><button id="btnApproveforce" class="btn btn-outline btn-primary pull-right" type="button">Force</button></td>');
    $('#trbtnmstforce').append('<td id="namaResetforceTd"><button id="namaResetforce" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button></td>');
    $('#trbtnmstforce').append('<td id="btnPrintappTd"><button id="namaPrintapp" class="btn btn-outline btn-primary pull-right" type="button" onclick="print()">Print</button></td>');
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
            url: url+"/trxfrc.htm",
            async:false,
            dataType : 'json',
            crossDomain:true,
            data:{isi:"load"},
            success: function (data1) {
                hasil_obj_awal1 = data1;
                console.log(hasil_obj_awal1);
                  // console.log(hasil_obj_awal["transaksi_pembayaran"][0]["kdmstdpp"]); 
                data1["transaksi_pembayaran"].forEach(function(e,i){
                    // console.log(e["kdmstdpp"]+"-"+e["nama"]);
                     $("select[name=Daerahforcename]").append('<option id="nocode'+i+'" value="'+e["fermsccode"]+"-"+e["fermscva07"]+'">'+e["fermsccode"]+"-"+e["fermscva07"]+'</option>')
                 });
                  data1["transaksi_pembayaranjsp"].forEach(function(e,i){
                    // console.log(e["kdmstdpp"]+"-"+e["nama"]);
                     $("select[name=Jenisforcename]").append('<option id="nocode'+i+'" value="'+e["fermsccode"]+"-"+e["fermscva07"]+'">'+e["fermsccode"]+"-"+e["fermscva07"]+'</option>')
                 });
                },
            error: function (data1) {
                alert("error"+data1);        
            }
        });
    tahun.forEach(function(e,i){
        $("select[name=Tahunforcename]").append('<option id="op'+i+'" value="'+ e["label"] +'">'+e["label"]+'</option>')
    });
     $("select[name=Tahunforcename]").val(new Date().getFullYear());
     $('#btnApproveforce').click(function(){
     var r = confirm("Apakah Anda Akan Melakukan Force Payment?");
        if(r == true){
           simpanubahdelforce();
        }   
    });
};
function print(){
    console.log("print");
    if($("#IdentitasforceId").val() != "" && $("#TahunforceId").val() != "" && $("#date_added").val() != ""){
        splitbulan_hari = $('#JurnalforceId').val().substr(0,4);
        splitbatch_user = $('#JurnalforceId').val().substr(4,4);
        splittr_no = $('#JurnalforceId').val().substr(8,7);
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
function simpanubahdelforce(){
    $('#pbbmstforce').remove();
    $('#pbbmstforce_wrforceer').remove();
    $.getJSON( "../json/yang_dipake_force.json", function(data) { 
        pass= data["force"][0]["pass"];
        clientid =data["force"][0]["clientid"];
        userid=data["force"][0]["userid"];
        user_login = userbukiweb["userlogin"].trim()+data["force"][0]["userlogin"].substr(0,(data["force"][0]["userlogin"].length-(userbukiweb["userlogin"].trim().length)));
        cabang = data["force"][0]["cabang"].substr(0,(data["force"][0]["cabang"].length-(userbukiweb["cabangCode"].trim().length)))+userbukiweb["cabangCode"].trim();
        lokasi = data["force"][0]["lokasi"].substr(0,(data["force"][0]["lokasi"].length-(userbukiweb["lokasiCode"].trim().substr(userbukiweb["lokasiCode"].length-2,2).length)))+userbukiweb["lokasiCode"].trim().substr(userbukiweb["lokasiCode"].length-2,2);
        type = data["force"][0]["type"];
        splitbulan_hari = $('#JurnalforceId').val().substr(0,4);
        splitbatch_user = $('#JurnalforceId').val().substr(4,4);
        splittr_no = $('#JurnalforceId').val().substr(8,7);
        batch_user = splitbatch_user+data["force"][0]["batch_user"].substr(0,(data["force"][0]["batch_user"].length-(splitbatch_user.length)));
        trno = data["force"][0]["trno"].substr(0,(data["force"][0]["trno"].length-(splittr_no.length)))+splittr_no;
        BulanHari = data["force"][0]["bulan_hari"].substr(0,(data["force"][0]["bulan_hari"].length-(splitbulan_hari.length)))+splitbulan_hari;
        var daerah_pajak = $('#trDaerahforce').val();
        var jns_set_pajak = $('#JenisforceId').val();
        jam_trans = hour+minutes+seconds;
        $.ajax({
            type: "POST",
            traditional:true,
            url: url+"/trxfrc.htm",
            async:false,
            dataType : 'json',
            crossDomain:true,
            beforeSend: function() { 
                 $("#loading-image").show();
            },
            data:{isi:"crud",type:type,pass:pass,clientid:clientid,userid:userid,user_login:user_login,cabang:cabang,lokasi:lokasi,status:"1",id:id_click,nop:$("#IdentitasappId").val(),tgl_trans:$("#date_added").val(),BulanHari:BulanHari,batch_user:batch_user,trno:trno,daerah_pajak:daerah_pajak,jns_set_pajak:jns_set_pajak,jam_trans:jam_trans},
            success: function (data1) {
                $("#loading-image").hide();
                //console.log(data1);
                //alert("Approved Success");
                hasil_obj_force =[];
                hasil_obj_force = data1;
                console.log(hasil_obj_force["hasil_res"]);
                if(hasil_obj_force["hasil_respon_code"] != "00"){
                    alert(hasil_obj_force["hasil_respon"]);
                    reset();
                    //console.log(hasil_obj_force["hasil_respon_code"]);
                }
                else if(hasil_obj_force["hasil_respon_code"] === "00"){
                    alert("Approved Success");
                    $('#namaPrintapp').show();
                }
                $('#pbbtabforce').remove();
                $('#pbbtabforce_wrapper').remove();
                $('#contenttableforce').append('<table id="pbbtabforce" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
                $('#pbbtabforce').append('<thead><tr id=trheadtabforce></tr></thead>');
                $('#trheadtabforce').append('<th>No</th>');
                $('#trheadtabforce').append('<th>Daerah Setoran Pajak</th>');
                $('#trheadtabforce').append('<th>Jenis Setoran Pajak</th>');
                $('#trheadtabforce').append('<th>NOP</th>');
                $('#trheadtabforce').append('<th>Tahun Fiskal</th>');
            //    console.log(hasil_obj_awal);
                var t = $('#pbbtabforce').DataTable( {
                     "ajax": {
                        "url": url+"/trxfrc.htm",
                        "type": "POST",
                        "traditional":true,
                        "dataType" : 'json',
                        "crossDomain":true,
                        "data":{isi:"loadtab",tgltrans:month+"/"+day+"/"+year}        
                    },
                    "columns": [
                       // { "data": "id"},
                        { "data": "daerahPajak"},
                        { "data": "jnsSetPajak"},
                        { "data": "nop"},
                        { "data": "thnNop"}
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
                $('#btnApproveforce').remove();
                $('#namaResetforce').remove();
                $('#btnApproveforceTd').append('<button id="btnApproveforce" class="btn btn-outline btn-primary pull-right" type="button" onclick="simpanubahdelforce()">Approve</button>');
                $('#namaResetforceTd').append('<button id="namaResetforce" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button>');
                
            },
            error: function (data) {
                    alert("error");
            }
        });
        klik_tabel_master();
    });
};
function data_tabel(){
     ////////////////////////table master/////////////////
     $.ajax({
        type: "POST",
        traditional:true,
        url: url+"/trxfrc.htm",
        async:false,
        dataType : 'json',
        crossDomain:true,
        data:{isi:"loadtab",tgltrans:month+"/"+day+"/"+year},
        success: function (data1) {
            //console.log(data1);
            hasil_obj_awal = data1;
        },
        error: function (data, textStatus, xhr) {
                alert("error");
        }
    });
    $('#contenttableforce').append('<table id="pbbtabforce" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    $('#pbbtabforce').append('<thead><tr id=trheadtabforce></tr></thead>');
    $('#trheadtabforce').append('<th>No</th>');
    $('#trheadtabforce').append('<th>Daerah Setoran Pajak</th>');
    $('#trheadtabforce').append('<th>Jenis Setoran Pajak</th>');
    $('#trheadtabforce').append('<th>NOP</th>');
    $('#trheadtabforce').append('<th>Tahun Fiskal</th>');
//    console.log(hasil_obj_awal);
    var t = $('#pbbtabforce').DataTable( {
         "ajax": {
            "url": url+"/trxfrc.htm",
            "type": "POST",
            "traditional":true,
            "dataType" : 'json',
            "crossDomain":true,
            "data":{isi:"loadtab"}        
        },
        "columns": [
            //{ "data": "id"},
            { "data": "daerahPajak"},
            { "data": "jnsSetPajak"},
            { "data": "nop"},
            { "data": "thnNop"}
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
    var oTable = $('#pbbtabforce').dataTable();
    $('table#pbbtabforce tbody').on("click", "tr", function(e) {
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
                $("select[name=Daerahforcename]").val(hasil_obj_awal["data"][i]["daerahPajak"]);
                $("select[name=Jenisforcename]").val(hasil_obj_awal["data"][i]["jnsSetPajak"]);
                $("#IdentitasforceId").val(hasil_obj_awal["data"][i]["nop"]);
                $("#NamaforceId").val(hasil_obj_awal["data"][i]["nmNop"]);
                $("#AlamatforceId").val(hasil_obj_awal["data"][i]["alamatNop"]);
                $("#KecamatanforceId").val(hasil_obj_awal["data"][i]["kecNop"]);
                $("#ProvinsiforceId").val(hasil_obj_awal["data"][i]["prvNop"]);
                $("#TahunforceId").val(hasil_obj_awal["data"][i]["thnNop"]);
                $("#NominalforceId").val(hasil_obj_awal["data"][i]["nominal"]);
                $("#JurnalforceId").val(hasil_obj_awal["data"][i]["noJurnal"]);
                $("#date_added").val(hasil_obj_awal["data"][i]["tglTrans"]);
                $("#useridforceId").val(hasil_obj_awal["data"][i]["userid"]);
            }
        }
        //$('#JenisappId').val(jnsSetPajak);
    } );
};

function reset(){
    $('#namaResetforce').remove();
    $('#namaResetforceTd').append('<button id="namaResetforce" class="btn btn-outline btn-primary pull-right" type="button" onclick="reset()">Reset</button>');
    $("select[name=Daerahforcename]").val("");
    $("select[name=Jenisforcename]").val("");
    $("#IdentitasforceId").val("");
    $("#NamaforceId").val("");
    $("#AlamatforceId").val("");
    $("#KecamatanforceId").val("");
    $("#ProvinsiforcepId").val("");
    $("#TahunforceId").val("");
    $("#NominalforceId").val("");
    $("#JurnalforceId").val("");
    $("#date_added").val("");
    $("#useridforceId").val("");
    $("select[name=Daerahforcename]").val(hasil_obj_awal1["transaksi_pembayaran"][0]["kdmstdpp"]+"-"+hasil_obj_awal1["transaksi_pembayaran"][0]["nama"]);
    $("select[name=Jenisforcename]").val(hasil_obj_awal1["transaksi_pembayaranjsp"][0]["kdmstjsp"]+"-"+hasil_obj_awal1["transaksi_pembayaranjsp"][0]["nama"]);
    $("select[name=Tahunforcename]").val(new Date().getFullYear());
};
$(function(){
   $('#btnApproveforce').click(function(){
     var r = confirm("Apakah Anda Akan Melakukan Payment?");
        if(r == true){
           simpanubahdelforce()();
        }   
    });
});
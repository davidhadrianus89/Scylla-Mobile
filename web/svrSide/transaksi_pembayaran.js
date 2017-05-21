/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var tahun = [];
var tipe_rek = [{norek:1, value:"giro"},{norek:4,value:"tabungan"}];
var hasil_obj_inq;
var hasil_obj_pay;
var hasil_obj_awal;
var day;
var month;
var year;
var hours;
var minutes;
var seconds;
var daytom;
var element;
var elemeneach =[];
var elemeneachisi =[];
var elementpaytab;
var elemeneachpaytab =[];
var elemeneachisipaytab =[];
var totbay;
var biayaadm = 3000;
var no_jurnal;
var ntpn;
var tgl_trans;
var jam_trans;
var start = new Date();
var maxTime = 835000;
var timeoutVal = Math.floor(maxTime/100);
var inqprog;
var elemeninq= [];
var url;
var url2;
var accnum= [{accnumber:"4301006610",nama:"Bangun"},{accnumber:"4201012423",nama:"novira"},{accnumber:"accnumber",nama:"agam"}];
var userbukiweb;
var user_login;
var tabungan;
$(document).ready(function(){
    $.getJSON("../json/url.json", function(data) { 
        url2 = data["url2"];
        console.log(url2);
        $.ajax({
            type: "POST",
            traditional:true,
            url: url2+"/GETUSER",
            async:false,
            crossDomain: true,
            dataType:"json",
            success: function (data1) {
                userbukiweb = data1;
                console.log(userbukiweb);
            }
        });
//        console.log(userbukiweb);
    });
    $.getJSON("../json/url.json", function(data) { 
        url = data["url"];
        //url.push(data["url"]);
        //console.log(url);
        $.ajax({
            type: "POST",
            traditional:true,
            url: url+"/transpem.htm",
            async:false,
            crossDomain: true,
            dataType:"json",
            data:{isi:"load"},
            success: function (data1, textStatus, xhr) {
                console.log(textStatus);
                console.log(data1["transaksi_pembayaran"]);
                //hasil_obj_awal = JSON.parse(data1);
                  // console.log(hasil_obj_awal["transpem"][0]["kdmstdpp"]); 
                data1["transaksi_pembayaran"].forEach(function(e,i){
                    // console.log(e["kdmstdpp"]+"-"+e["nama"]);
                     $("select[name=item1dpp]").append('<option id="nocode'+i+'" value="'+e["fermsccode"]+"-"+e["fermscva07"]+'">'+e["fermsccode"]+"-"+e["fermscva07"]+'</option>')
                 });
                data1["transaksi_pembayaranjsp"].forEach(function(e,i){
                    // console.log(e["kdmstdpp"]+"-"+e["nama"]);
                     $("select[name=item1jsp]").append('<option id="nocode'+i+'" value="'+e["fermsccode"]+"-"+e["fermscva07"]+'">'+e["fermsccode"]+"-"+e["fermscva07"]+'</option>')
                 });
                },
           
            error: function (data1) {
                alert("error"+data1);        
            }
        });
    });
    var awal = 1;
    akhir =  awal + 10;
    var min = new Date().getFullYear(),
    max = min + 9;
    for (i = 2000; i <= min; i++) { 
        tahun.push({label:i, value:i});
    }
    $('.footable').footable();
    progbar();
    contentinq();
    
    $('#menutrans').css('display',"none");
    $('#transnontunai').css('display',"none");
    $('#jurnalId').css('display',"none");
    
    tahun.forEach(function(e,i){
        $("select[name=tahun]").append('<option id="op'+i+'" value="'+ e["label"] +'">'+e["label"]+'</option>')
    });
     $("select[name=tahun]").val(new Date().getFullYear());
});
function contentinq(){
    $('#isian1').remove();
    $('#contentinq').append('<table id=isian1></table>');
    $('#isian1').append('<tr id ="trloopno" class="form-group"></tr>');
    $('#trloopno').append('<td class="injinq"><label>Daerah pajak</label></td>');
    $('#trloopno').append('<td class="col-sm-10"><select id="ITEMdpp" name="item1dpp" class="form-control"></select></td>');
    
    $('#isian1').append('<tr id="jnssetpjk" class="form-group"></tr>');
    $('#jnssetpjk').append('<td class="injinq"><label>Jenis Setoran Pajak</label></td>');
    $('#jnssetpjk').append('<td class="col-sm-10"><select id="ITEMjsp" name="item1jsp" class="form-control"></select></td>');
    
    $('#isian1').append('<tr id ="trnop" class="form-group"></tr>');
    $('#trnop').append('<td class="injinq"><label>Identitas NOP</label></td>');
    $('#trnop').append('<td class="col-sm-10"><input id="idnop" type="text" placeholder="Input Identitas NOP" class="form-control"/></input></td>');
    
    $('#isian1').append('<tr id ="trtahunfiskal" class="form-group"></tr>');
    $('#trtahunfiskal').append('<td class="injinq"><label>Tahun Fiskal Pajak</label></td>');
    $('#trtahunfiskal').append('<td class="col-sm-10" id="selthnpjkinq"><select id="dtahun" name="tahun" class="form-control"></select></td>');
    $('#isian1').append('<tr id="btninqtr" class="form-group"></tr>');
    $('#btninqtr').append('<td class="injinq"><label></label></td>');
    $('#btninqtr').append('<td class="col-sm-10"><button id="btninq" class="btn btn-outline btn-primary pull-right">inquiry</button></td>');
    $('#btninqtr').append('<td class="injinq"><label></label></td>');
    $('#btninqtr').append('<td class="col-sm-10"><button id="btnprint" class="btn btn-outline btn-primary pull-right" onClick="print()">Print</button></td>');
};
function inquiry(){
     //console.log(userbukiweb);
    $('#proginqIdval').remove();
    $('#proginqId').append('<div id="proginqIdval" style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-success"><span class="sr-only">35% Complete (success)</span></div>');
    var html = $("body").html();
        var date = new Date().toLocaleFormat();
        day = date.split(' ')[0];
        month = new Date().getMonth()+1;
        year = date.split(' ')[2];
        hour = date.split(' ')[3].split(':')[0];
        minutes = date.split(' ')[3].split(':')[1];
        seconds = date.split(' ')[3].split(':')[2];
        daytom = parseInt(day)+1;
        if(daytom <10){
            daytom= '0'+ daytom;
        }
        if(month<10){
          month = '0'+month;
        }
        console.log(url);
        $.getJSON( "../json/yang_dipake_inq.json", function(data) { 
            //console.log(data["inq"][0]["Bitmap"]);
            pass= data["inq"][0]["pass"];
            clientid =data["inq"][0]["clientid"];
            userid=data["inq"][0]["userid"];
            el1= data["inq"][0]["Bitmap"]; //harcode
            el2 =data["inq"][0]["PAN"];//primary account
            el3 = data["inq"][0]["Processing_Code"]+data["inq"][0]["Tipe_Akun"]+data["inq"][0]["Tipe_Akun_to"]; // processing code inq
            el4=data["inq"][0]["Transaction_Amount"]; // amaount
            el18 =data["inq"][0]["Merchant_ID"]; // merchant ID
            el41 = data["inq"][0]["Terminal_ID"];//terminal ID
           // console.log();
           var tahun;
            if( $('#dtahun').prop('disabled') === false){
               tahun = $('#dtahun').val();
            }
            else if( $('#dtahun').prop('disabled') === true){
               tahun = "    ";
            }
            el48 = $('#idnop').val()+tahun; //nop + tahun
             //console.log(el48);
            el49 = data["inq"][0]["Transaction_Currency"];//transaction currency
            el120 = data["inq"][0]["Settlement_InstitutionID"]+$('#ITEMdpp').val().split("-")[0].trim()+el18+data["inq"][0]["ForwardID"];
            tgl_trans = month+"/"+day+"/"+year;
            jam_trans = hour+minutes+seconds;
            //console.log("pass"+data["inq"][0]["pass"]);
           var progressBar = $('#proginqIdval');
        $.ajax({
            type: "POST",
            traditional:true,
            url: url+"/transpem.htm",
            async:false,
            crossDomain: true,
            dataType:"json",
            beforeSend: function() { 
                 progressBar.css("width","0%");
                 $("#loading-image").show();
            },
            data:{isi:"inq",type:"INQ",pass:pass,clientid:clientid,userid:userid,el1:el1,el2:el2,el3:el3,el4:el4,el18:el18,el41:el41,el48:el48,el49:el49,el120:el120,Settlement_Institution_ID:data["inq"][0]["Settlement_InstitutionID"],Product_Code:$('#ITEMdpp').val().split("-")[0].trim(),Forwarding_ID:data["inq"][0]["ForwardID"],Tipe_Transaksi:data["inq"][0]["Processing_Code"],Tipe_Akun:data["inq"][0]["Tipe_Akun"],nop:$('#idnop').val(),tahun:$('#dtahun').val(),biayaadm:data["inq"][0]["biaya_adm"],tgl_trans:tgl_trans,jam_trans:jam_trans},
            success: function (data1) {
                elemeneachisi =[];
                var elemeninq = {};
                //hasil_obj_inq = JSON.parse(data1);
                console.log(data1);
                if(data1["tibco"]["rescode"] === "SUCCESS"){
                    progressBar.css("width","100%");
                    $("#loading-image").hide();
                     elemeneachisi = data1["tibco"]["psyres"];
                     if(elemeneachisi["Element39"] === "00"){
                        $('#menutrans').css('display',"block");
                        menupayment();
                        $('#tbtransnontunai').remove();
                        $('#transnontunai').css('display',"none");
                        $('#jurnaltabelid').remove();
                        $('#jurnalId').css('display',"none");
                        $('#inptagihan').val(comma(elemeneachisi["Element48"].substring(127).replace(/^0+(?!$)/,"")));
                        $('#inpdenda').val(0);
                        $('#inpbiayaadmin').val(comma(data["inq"][0]["biaya_adm"]));
                        totbay = (parseInt(elemeneachisi["Element48"].substring(127).replace(/^0+(?!$)/,""))) + (parseInt($('#inpdenda').val()))+(parseInt(biayaadm));
                        $('#inptotbayar').val(comma(totbay));
                        $('#btndetinq').click(detail());
                     }
                     if(elemeneachisi["Element39"] != "00"){
                         //console.log("disini");
                         $('#tabeltranpay').remove();
                         $('#tbtransnontunai').css('display',"none");
                         $('#tbtransnontunai').remove();
                         $('#transnontunai').css('display',"none");
                         $('#jurnaltabelid').remove();
                         $('#jurnalId').css('display',"none");
                         alert("Error Code"+ elemeneachisi["Element39"] + "," + elemeneachisi["Element44"]);
                     }
                }
                else{
                    alert("Failed Run Services");
                    progressBar.css("width","0%");
                    $("#loading-image").hide();
                }
            },
            error: function (data1) {
                alert("error"+data1);
            },

        }).done(function(){
           
            //var perc = 100;
           // animateUpdate(perc);
        });
       
    });
     
};
function showProgress(evt) {
    console.log(evt);
    if (evt.lengthComputable) {
        var percentComplete = (evt.loaded / evt.total) * 100;
        $('#progcoreId').progressbar("option", "value", percentComplete );
    }  
}
function detail(){
//    console.log("detail");
    $('#modal-form').remove();
    $('#menutrans').append('<div id="modal-form" class="modal fade" aria-hidden="true"></div>');
    $('#modal-form').append('<div id ="modaldialog" class="modal-dialog"></div>');
    $('#modaldialog').append('<div id ="modalcontent" class="modal-content"></div>');
    $('#modalcontent').append(' <div id ="modalbody" class="modal-body"></div>');
    $('#modalbody').append('<div id="row1" class="row"></div>');
    $('#row1').append('<p>Informasi penyetor Wajib Pajak </p>');
    $('#row1').append('<table id="tabinq"></table>');
    $('#tabinq').append('<tr id="trdaerahpjk" class="form-group"><td class="col-sm-4"><label>Daerah Pajak</label></td></tr>');
    $('#trdaerahpjk').append('<td class="col-sm-10"><label>'+$("select[name=item1dpp]").val().split('-')[1]+'</label></td>');
    $('#tabinq').append('<tr id="trjnssetpaj" class="form-group"><td class="col-sm-4"><label>Jenis Setoran Pajak</label></td></tr>');
    $('#trjnssetpaj').append('<td class="col-sm-10"><label>'+$("select[name=item1jsp]").val().split('-')[1]+'</label></td>');
    $('#tabinq').append('<tr id="trnopinq" class="form-group"><td class="col-sm-4"><label>Nomor Objek Pajak / Kode Bayar</label></td></tr>');
    $('#trnopinq').append('<td class="col-sm-10"><label>'+elemeneachisi["Element48"].substring(0,18)+'</label></td>');
    $('#tabinq').append('<tr id="trthfiskal" class="form-group"><td class="col-sm-4"><label>Tahun Fiskal Pajak</label></td></tr>');
    $('#trthfiskal').append('<td class="col-sm-10"><label>'+elemeneachisi["Element48"].substring(18,22)+'</label></td>');
    $('#tabinq').append('<tr id="trnmwjbpjk" class="form-group"><td class="col-sm-4"><label>Nama Wajib Pajak</label></td></tr>');
    $('#trnmwjbpjk').append('<td class="col-sm-10"><label>'+elemeneachisi["Element48"].substring(22,52)+'</label></td>');
    $('#tabinq').append('<tr id="tralamatpjk" class="form-group"><td class="col-sm-4"><label>Alamat</label></td></tr>');
    $('#tralamatpjk').append('<td class="col-sm-10"><label>'+elemeneachisi["Element48"].substring(52,97)+'</label></td>');
    $('#tabinq').append('<tr id="trkecpjk" class="form-group"><td class="col-sm-4"><label>Kecamatan / Jenis Pajak</label></td></tr>');
    $('#trkecpjk').append('<td class="col-sm-10"><label>'+elemeneachisi["Element48"].substring(97,127)+'</label></td>');
//    $('#tabinq').append('<tr id="trprovpjk" class="form-group"><td class="col-sm-4"><label>Provinsi</label></td></tr>');
//    $('#trprovpjk').append('<td class="col-sm-10"><label>'+$("select[name=item1dpp]").val().split('-')[1]+'</label></td>');
    $('#tabinq').append('<tr id="tramountpjk" class="form-group"><td class="col-sm-4"><label>Nominal Tagihan Pajak</label></td></tr>');
    $('#tramountpjk').append('<td class="col-sm-10"><label>'+elemeneachisi["Element48"].substring(127).replace(/^0+(?!$)/,"")+'</label></td>');

    //$('#tabelresponsive').append('<table id="searchcolumn" class="table table-striped table-bordered table-hover dataTables-example" ></table>');
    //$('#row1').append('<table id="searchcolumn"></table>');
};
function menupayment(){
    $('#tabeltranpay').remove();
    ////////////////////////menu trans////////////////////
     $('#menutrans').append('<table id="tabeltranpay"></table>');
     $('#tabeltranpay').append('<tr id="trtagihan" class="form-group"></tr>');
     $('#trtagihan').append('<td class="col-sm-3"><label>Tagihan</label></td>');
     $('#trtagihan').append('<td class="col-sm-12"><input id="inptagihan" type="text" placeholder="Input Tagihan" editable="false" disabled = "true" class="form-control"></input></td>');
     
     $('#tabeltranpay').append('<tr id="trdenda" class="form-group"></tr>');
     $('#trdenda').append('<td class="col-sm-3"><label>Denda</label></td>');
     $('#trdenda').append('<td class="col-sm-12"><input id="inpdenda" type="text" placeholder="Input Denda" editable="false" disabled = "true" class="form-control"></input></td>');
     
     $('#tabeltranpay').append('<tr id="trbiayaadmin" class="form-group"></tr>');
     $('#trbiayaadmin').append('<td class="col-sm-3"><label>Biaya Admin</label></td>');
     $('#trbiayaadmin').append('<td class="col-sm-12"><input id="inpbiayaadmin" type="text" placeholder="Input Biaya Admin" editable="false" disabled = "true" class="form-control"></input></td>');
     
     $('#tabeltranpay').append('<tr id="trtotbay1" class="form-group"></tr>');
     $('#trtotbay1').append('<td class="col-sm-3"><label>Total Bayar</label></td>');
     $('#trtotbay1').append('<td class="col-sm-12"><input id="inptotbayar" type="text" placeholder="Input Total Bayar" editable="false" disabled = "true" class="form-control"></input></td>');

     $('#tabeltranpay').append('<tr id="trcrbayar" class="form-group"></tr>');
     $('#trcrbayar').append('<td class="col-sm-3"><label>Cara Bayar</label></td>');
     $('#trcrbayar').append('<td class="col-sm-12" id="opbayar"></td>');
     $('#opbayar').append('<input type="radio" name="lang" value="tunai">TUNAI</input><br>');
     $('#opbayar').append('<input type="radio" name="lang" value="non-tunai">NON - TUNAI</input>');
    
     $('#tabeltranpay').append('<tr id="trbtnpay" class="form-group"></tr>');
     $('#trbtnpay').append('<td class="col-sm-3"><label></label></td>');
     $('#trbtnpay').append('<td class="col-sm-12"><button class="btn btn-outline btn-primary pull-right" id="btnpayment" value="Payment">Payment</button></td>');
     $('#trbtnpay').append('<td><a data-toggle="modal" id="btndetinq" class="btn btn-outline btn-primary pull-right" href="#modal-form">Detail</a></td>');
    $('#btnpayment').hide();
    cek_radio_button_payment();
     $('#btnpayment').click(function(){
     var r = confirm("Apakah Anda Akan Melakukan Payment?");
        if(r == true){
           payment();
        }   
    });
     
};
function menutransaksinontunai(){
    $('#tbtransnontunai').remove();
    //////////////////////menu trans non tunai///////////////////////////////
     $("#transnontunai").append('<table id="tbtransnontunai"></table>');
     $("#tbtransnontunai").append('<tr id="trtiperek" class="form-group"></tr>');
     $("#trtiperek").append('<td class="col-sm-4"><label control-label">Tipe Rekening</label></td>');
     $("#trtiperek").append('<td class="col-sm-12"><select id="seltiprek" name="seltiprekname" class="form-control""></select></td>');
     
     $("#tbtransnontunai").append('<tr id="trnorek" class="form-group"></tr>');
     $("#trnorek").append('<td class="col-sm-4"><label>Nomor Rekening</label></td>');
     $("#trnorek").append('<td class="col-sm-12"><input id="inpnorek" type="text" placeholder="Input Nomor Rekening" class="form-control"></input></td>');
     $("#trnorek").append('<td><input class="btn btn-outline btn-primary" type="submit" id="btnceknorek" value="CHECK" onClick="cekrek()"></input></td>');
     
     $("#tbtransnontunai").append('<tr id="trnamarek" class="form-group"></tr>');
     $("#trnamarek").append('<td class="col-sm-4"><label>Nama Rekening</label></td>');
     $("#trnamarek").append('<td class="col-sm-12"><input id="inpnamarek" class="form-control" editable="false" disabled = "true"></input></td>');
     
     $("#tbtransnontunai").append('<tr id="trnowarkat" class="form-group"></tr>');
     $("#trnowarkat").append('<td class="col-sm-4"><label>No Warkat</label></td>');
     $("#trnowarkat").append('<td class="col-sm-12"><input id="inpnowarkat" class="form-control" type="text" placeholder="Input No Warkat"></input></td>');
     
     $("#tbtransnontunai").append('<tr id="trnamawarkat" class="form-group"></tr>');
     $("#trnamawarkat").append('<td class="col-sm-4"><label>Tanggal Warkat</label></td>');
     $('#trnamawarkat').append('<td class="col-sm-12"><div class="input-group date"><span class="input-group-addon"><i class="fa fa-calendar"></i></span><input id="date_added" type="text" class="form-control" value="07/01/2014"></div></td>');
     tipe_rek.forEach(function(e,i){
        $("select[name=seltiprekname]").append('<option id="optiprekname'+i+'" value="'+ e["norek"] +'-'+e["value"]+'">'+ e["norek"] +'-'+e["value"]+'</option>')
     });
     change_selecttyperek();
     $('#date_added').datepicker({
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        calendarWeeks: true,
        autoclose: true
    });
};
function progbar(){
    console.log("progbar");
    
    $("#progbarId").append('<h5>Inquiry Transaksi</h5>');
    $("#progbarId").append('<div class="progress" id="proginqId"><div id="proginqIdval" style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-success"><span class="sr-only">35% Complete (success)</span></div></div>'); 
//    $("#progbarId").append('<h5>Transaksi Core Banking</h5>');    
//    $("#progbarId").append(' <div class="progress" id="progcoreId"><div id="progcoreIdval" style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" role="progressbar" class="progress-bar progress-bar-success"><span class="sr-only">35% Complete (success)</span></div></div>');                             
    $("#progbarId").append('<h5>Payment Transaksi</h5>');                                
    $("#progbarId").append('<div class="progress" id="progbillId"><div id="progbillIdval" style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-success"><span class="sr-only">35% Complete (success)</span></div></div>');                             
   // $("#progbarId").append('<h5>Print Struk Transaksi</h5>');                        
    //$("#progbarId").append('<div class="progress" id="progprintstrukId"><div id="progprintstrukIdval" style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-success"><span class="sr-only">35% Complete (success)</span></div></div>');                           
  //  $("#progbarId").append('<h5>Kirim Struk Transaksi</h5>');                         
  //  $("#progbarId").append('<div class="progress" id="progkrmstrukId"><div id="progkrmstrukIdval" style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-success"><span class="sr-only">35% Complete (success)</span></div></div>');                             
};
function jurnal(){
    $('#jurnaltabelid').remove();
    $("#jurnalId").append('<table id="jurnaltabelid"></table>');
    $("#jurnaltabelid").append('<tr><td class="col-sm-4"><label>No Jurnal</label></td><td class="col-sm-12"><input id="inpnojurnal" maxlength="100" editable="false" disabled = "true"></input></td></tr>');  
    $("#jurnaltabelid").append('<tr><td class="col-sm-4"><label>NTPN</label></td><td class="col-sm-12"><input id="inpntpn" maxlength="20" editable="false" disabled = "true"></input></td></tr>');
    $("#jurnaltabelid").append('<tr><td class="col-sm-4"><button id="btnprint" class="btn btn-outline btn-primary pull-right" onClick="print()">Print Struk</button></td></tr>');
//    $("#jurnaltabelid").append('<tr><td class="col-sm-4"><label>Email Resi</label></td><td class="col-sm-12"><input id="inpemailresi" maxlength="100" editable="false" disabled = "true"></input></td></tr>');                       
};
function print(){
    //payment dari tabungan 
    if($("#IdentitasappId").val() != "" && $("#TahunappId").val() != "" && $("#date_added").val() != ""){
        var no_jurnal = "011204110001340";
        var tgl_trans  = month+"/"+day+"/"+year;
        //var no_jurnal = $('#inpnojurnal').val();
        BulanHari = no_jurnal.substr(0,4);
        batch_user = no_jurnal.substr(4,4);
        trno = no_jurnal.substr(8,7);
//        user_login = userbukiweb["userlogin"];
        user_login = 'BK21288022';
        $("#test1").load("/PBBCLIENT/TCPBRP1005?nop=31710100010010028&BulanHari="+BulanHari+"&batch_user="+batch_user+"&trno="+trno+"&userlogin="+user_login);
//        $("#test1").load("/PBBCLIENT/printResi?nop=31710100010010028&tahun="+$("#TahunappId").val()+"&tgl_trans="+tgl_trans+"&BulanHari="+BulanHari+"&batch_user="+batch_user+"&trno="+trno);
//        $("#test1").load("/PBBCLIENT/printResi");
        //window.location.href = url2+"/RPRCP";
    }
         //else if($("#IdentitasappId").val() === "" && $("#TahunappId").val() === "" && $("#date_added").val() === ""){
    else{ 
        console.log("click tabel first");
        alert("Click Table First");
    }
}
function payment(){
    //payment dari tabungan 
     $('#progbillIdval').remove();
    $('#progbillId').append('<div id="progbillIdval" style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-success"><span class="sr-only">35% Complete (success)</span></div>');
     $.getJSON( "../json/yang_dipake_pay.json", function(data) { 
            pass= data["pay"][0]["pass"];
            clientid =data["pay"][0]["clientid"];
            userid=data["pay"][0]["userid"];
            penambahannol=data["pay"][0]["penambahannol"];
            biayaadm=data["pay"][0]["biaya_adm"];
            el1= data["pay"][0]["Bitmap"]; //harcode
            el2 =data["pay"][0]["PAN"];//primary account
            
           // el4=data["pay"][0]["Transaction_Amount"]; // amaount
            el18 =data["pay"][0]["Merchant_ID"]; // merchant ID
            el28 =biayaadm+penambahannol; // merchant ID
            el41 = data["pay"][0]["Terminal_ID"];//terminal ID
           // el48 = $('#idnop').val()+$('#dtahun').val(); //nop + tahun
            el49 = data["pay"][0]["Transaction_Currency"];//transaction currency
            el120 = data["pay"][0]["Settlement_InstitutionID"]+$('#ITEMdpp').val().split("-")[0].trim()+el18+data["pay"][0]["ForwardID"];
            
        // el3 = Tipe_trans[1]["kode"]+Tipe_akun[1]["kode"]+"00"; // processing code pay
            el4 = elemeneachisi["Element48"].substring(127).replace(/^0+(?!$)/,"")+penambahannol;
            el48 = elemeneachisi["Element48"]; //si response 48 inq
            el63 = data["pay"][0]["Institution_Code"]; //institution code DKI
            el100 = data["pay"][0]["Settlement_InstitutionID"]; //settlement ins code DKI
            tgl_trans = month+"/"+day+"/"+year;
            jam_trans = hour+minutes+seconds;
            user_login = userbukiweb["userlogin"].trim()+data["pay"][0]["userlogin"].substr(0,(data["pay"][0]["userlogin"].length-(userbukiweb["userlogin"].trim().length)));
            cabang = data["pay"][0]["cabang"].substr(0,(data["pay"][0]["cabang"].length-(userbukiweb["cabangCode"].trim().length)))+userbukiweb["cabangCode"].trim();
            lokasi =data["pay"][0]["lokasi"].substr(0,(data["pay"][0]["lokasi"].length-(userbukiweb["lokasiCode"].trim().substr(userbukiweb["lokasiCode"].length-2,2).length)))+userbukiweb["lokasiCode"].trim().substr(userbukiweb["lokasiCode"].length-2,2);
            //    el102 = accnum[2]["accnumber"]; //no rekening utama
            if(cek === $("input:radio[name=lang]:checked").val()){
                el102 = $('#inpnorek').val();
                if($("select[name=seltiprekname]").val().split('-')[0] == "4"){
                   el3 = data["pay"][0]["Processing_Code"]+data["pay"][0]["Tipe_Akun_saving"]+data["pay"][0]["Tipe_Akun_to"]; // processing code inq
                   el123 = data["pay"][0]["Transaction_Currency"]+data["pay"][0]["conv_rate"]+data["pay"][0]["fee_code"]+$('#ITEMdpp').val().split("-")[0].trim()+data["pay"][0]["operation_code"]+data["pay"][0]["UseridTrans"]+data["pay"][0]["tanggal_warkat"]+data["pay"][0]["no_warkat"]+data["pay"][0]["indikator_app"]+data["pay"][0]["device_code"]+user_login+cabang+lokasi;//Currency Code +Conversion Rate+Fee Code+Product Code+Operation Code+User ID Transaction+Tanggal Warkat+Nomor Warkat+Indikator Approval+Device Code+UserLogin+Cabang+lokasi
                }
                if($("select[name=seltiprekname]").val().split('-')[0] == "1"){
                    el3 = data["pay"][0]["Processing_Code"]+data["pay"][0]["Tipe_Akun_giro"]+data["pay"][0]["Tipe_Akun_to"]; // processing code inq
                    var tanggal_warkat= $('#date_added').val().split("/");
                    var no_warkat =data["pay"][0]["no_warkat"];
                    if($('#inpnowarkat').val() !=""){
                        var warkat = no_warkat.substr(0,parseInt(no_warkat.length)-parseInt($('#inpnowarkat').val().length))+$('#inpnowarkat').val();
                        el123 = data["pay"][0]["Transaction_Currency"]+data["pay"][0]["conv_rate"]+data["pay"][0]["fee_code"]+$('#ITEMdpp').val().split("-")[0].trim()+data["pay"][0]["operation_code"]+data["pay"][0]["UseridTrans"]+"00"+tanggal_warkat[2]+tanggal_warkat[0]+tanggal_warkat[1]+warkat+data["pay"][0]["indikator_app"]+data["pay"][0]["device_code"]+user_login+cabang+lokasi;//Currency Code +Conversion Rate+Fee Code+Product Code+Operation Code+User ID Transaction+Tanggal Warkat+Nomor Warkat+Indikator Approval+Device Code+UserLogin+Cabang+lokasi
                    }
                    else{
                        el123 = data["pay"][0]["Transaction_Currency"]+data["pay"][0]["conv_rate"]+data["pay"][0]["fee_code"]+$('#ITEMdpp').val().split("-")[0].trim()+data["pay"][0]["operation_code"]+data["pay"][0]["UseridTrans"]+data["pay"][0]["tanggal_warkat"]+data["pay"][0]["no_warkat"]+data["pay"][0]["indikator_app"]+data["pay"][0]["device_code"]+user_login+cabang+lokasi;//Currency Code +Conversion Rate+Fee Code+Product Code+Operation Code+User ID Transaction+Tanggal Warkat+Nomor Warkat+Indikator Approval+Device Code+UserLogin+Cabang+lokasi
                    }
                 }
            }
            if(cek != $("input:radio[name=lang]:checked").val()){
                el3 = data["pay"][0]["Processing_Code"]+data["pay"][0]["Tipe_Akun_tunai"]+data["pay"][0]["Tipe_Akun_to"];
                el102 = data["pay"][0]["rek1"];
                el123 = data["pay"][0]["Transaction_Currency"]+data["pay"][0]["conv_rate"]+data["pay"][0]["fee_code"]+$('#ITEMdpp').val().split("-")[0].trim()+data["pay"][0]["operation_code"]+data["pay"][0]["UseridTrans"]+data["pay"][0]["tanggal_warkat"]+data["pay"][0]["no_warkat"]+data["pay"][0]["indikator_app"]+data["pay"][0]["device_code"]+user_login+cabang+lokasi;//Currency Code +Conversion Rate+Fee Code+Product Code+Operation Code+User ID Transaction+Tanggal Warkat+Nomor Warkat+Indikator Approval+Device Code+UserLogin+Cabang+lokasi
            }
            el103 = data["pay"][0]["rek2"]; //no rekening kedua
            var deskripsi1=data["pay"][0]["desk1"];
            var deskripsi2 =data["pay"][0]["desk2"];
            var deskripsi3 =data["pay"][0]["desk3"];
            var pbbp2=$('#ITEMjsp').val().split("-")[1].trim()+"-"+$('#ITEMjsp').val().split("-")[2].trim();
            var daerah=$('#ITEMdpp').val().split("-")[1].trim();
            var nop = $('#idnop').val();
            var data1 = deskripsi1.substr(0,(deskripsi1.length-(data["pay"][0]["katadesc1"].length+pbbp2.length+daerah.length+nop.length)))+data["pay"][0]["katadesc1"]+pbbp2+daerah+nop;
            var data2 = deskripsi2.substr(0,(deskripsi2.length-(data["pay"][0]["katadesc2"].length)))+data["pay"][0]["katadesc2"];
            var data3 = deskripsi3.substr(0,(deskripsi3.length-(data["pay"][0]["katadesc3"].length)))+data["pay"][0]["katadesc3"];
            el122 = data1+data2+data3;//deskripsi transaksi dengan panjang 140
            var daerah_pajak = $('#ITEMdpp').val();
            var jns_set_pajak = $('#ITEMjsp').val();
        //el123 ="36000000000000000000000005102505000000000000000000000000000000000000000000000000000000000000000000006BK20986489";
       // console.log(el1+","+el2+","+el3+","+el4+","+el18+","+el41+","+el48+","+","+el49+","+el63+","+el100+","+el102+","+el103+","+el120+","+el122+","+el123);
        var progressBar = $('#progbillIdval');
         $.ajax({
            type: "POST",
            traditional:true,
            url: url+"/transpem.htm",
            async:true,
            crossDomain: true,
            dataType:"json",
            beforeSend: function() { 
                 progressBar.css("width","0%");
                 $("#loading-image").show();
            },
            data:{isi:"pay",type:"PAY",pass:pass,clientid:clientid,userid:userid,el1:el1,el2:el2,el3:el3,el4:el4,el18:el18,el28:el28,el41:el41,el48:el48,el49:el49,el63:el63,el100:el100,el102:el102,el103:el103,el120:el120,el122:el122,el123:el123,tgl_trans:tgl_trans,jam_trans:jam_trans,daerah_pajak:daerah_pajak,jns_set_pajak:jns_set_pajak},
             success: function (data1) {
                if(data1["tibco"]["rescode"] === "SUCCESS"){
                    progressBar.css("width","100%");
                    $("#loading-image").hide();
                     elemeneachisipaytab =data1["tibco"]["payres"];
                     if(elemeneachisipaytab["Element39"] === "00"){
                        alert("Transaction Approved");
                        $('#jurnalId').css('display',"block");
                        jurnal();
                        ntpn = elemeneachisipaytab["Element48"].substring(139);
                        no_jurnal = elemeneachisipaytab["Element122"].substring(144).replace(/[ ]/g,'');
                        $('#inpnojurnal').val(no_jurnal);
                        $('#inpntpn').val(ntpn);
                      }
                      else if(elemeneachisipaytab["Element39"] != "00"){//error
                         $('#jurnaltabelid').remove();
                         $('#jurnalId').css('display',"none");
                          //console.log(elemeneachisipaytab["Element122"].substring(140));
                         if(elemeneachisipaytab["Element39"] === "86"){ ////force payment
                            //alert("Error Code"+ elemeneachisipaytab["Element39"] + "," + elemeneachisipaytab["Element44"]+ "," + elemeneachisipaytab["Element121"]+"Force Payment");
                            alert("Error Code"+ elemeneachisipaytab["Element39"]+ ", Need Force Payment");
                            var daerah_pajak = $('#ITEMdpp').val();
                            var jns_set_pajak = $('#ITEMjsp').val();
                            var nop = $('#idnop').val();
                            var nm_nop = elemeneachisi["Element48"].substring(22,52);
                            var alamat_nop = elemeneachisi["Element48"].substring(52,97);
                            var kec_nop = elemeneachisi["Element48"].substring(97,127);
                            var prv_nop = $("select[name=item1dpp]").val().split('-')[1];
                            var thn_nop = elemeneachisi["Element48"].substring(18,22);
                            var nominal = elemeneachisi["Element48"].substring(127).replace(/^0+(?!$)/,"");
                            var no_jurnal = elemeneachisipaytab["Element122"].substring(140);//.replace(/[ ]/g,'');
                            //console.log(no_jurnal);
                            tgl_trans = elemeneachisipaytab["Element13"].substring(0,2)+"/"+elemeneachisipaytab["Element13"].substring(2,4)+"/"+new Date().getUTCFullYear();
                            jam_trans = hour+minutes+seconds;
                            var userlogin = userbukiweb["userlogin"];
                            $.ajax({
                               type: "POST",
                               traditional:true,
                               url: url+"/transpem.htm",
                               async:false,
                               crossDomain: true,
                               dataType:"json",
                               data:{isi:"force",daerah_pajak:daerah_pajak,jns_set_pajak:jns_set_pajak,nop:nop,nm_nop:nm_nop,alamat_nop:alamat_nop,kec_nop:kec_nop,prv_nop:prv_nop,thn_nop:thn_nop,nominal:nominal,no_jurnal:no_jurnal,tgl_trans:tgl_trans,jam_trans:jam_trans,userid:userlogin}
                            });
                         }
                         else if((elemeneachisipaytab["Element39"] === "85")){ //approval
                           // alert("Error Code"+ elemeneachisipaytab["Element39"] + "," + elemeneachisipaytab["Element44"]+ "," + elemeneachisipaytab["Element121"]+"Butuh Approval");
                            alert("Error Code"+ elemeneachisipaytab["Element39"] + ", Need Approval");
                            //nop,tanggal,waktu,no_JURNAL
                            var daerah_pajak = $('#ITEMdpp').val();
                            var jns_set_pajak = $('#ITEMjsp').val();
                            var nop = $('#idnop').val();
                            var nm_nop = elemeneachisi["Element48"].substring(22,52);
                            var alamat_nop = elemeneachisi["Element48"].substring(52,97);
                            var kec_nop = elemeneachisi["Element48"].substring(97,127);
                            var prv_nop = $("select[name=item1dpp]").val().split('-')[1];
                            var thn_nop = elemeneachisi["Element48"].substring(18,22);
                            var nominal = elemeneachisi["Element48"].substring(127).replace(/^0+(?!$)/,"");
                            var no_jurnal = elemeneachisipaytab["Element122"].substring(140);//.replace(/[ ]/g,'');
                            //console.log(no_jurnal);
                            tgl_trans = elemeneachisipaytab["Element13"].substring(0,2)+"/"+elemeneachisipaytab["Element13"].substring(2,4)+"/"+new Date().getUTCFullYear();
                            jam_trans = hour+minutes+seconds;
                            var userlogin = userbukiweb["userlogin"];
                            $.ajax({
                                type: "POST",
                                traditional:true,
                                url: url+"/transpem.htm",
                                async:false,
                                crossDomain: true,
                                dataType:"json",
                                data:{isi:"app",daerah_pajak:daerah_pajak,jns_set_pajak:jns_set_pajak,nop:nop,nm_nop:nm_nop,alamat_nop:alamat_nop,kec_nop:kec_nop,prv_nop:prv_nop,thn_nop:thn_nop,nominal:nominal,no_jurnal:no_jurnal,tgl_trans:tgl_trans,jam_trans:jam_trans,userid:userlogin}
                            });
                        }
                        else{
                            alert("Error Code"+ elemeneachisipaytab["Element39"] + "," + elemeneachisipaytab["Element44"]+ "," + elemeneachisipaytab["Element121"]);
                        }
                         $('#tabeltranpay').remove();
                         $('#tbtransnontunai').css('display',"none");
                         $('#tbtransnontunai').remove();
                         $('#transnontunai').css('display',"none");
                         $('#jurnaltabelid').remove();
                         $('#jurnalId').css('display',"none");
                     }
                    else{
                        alert("Failed Run Services");
                        progressBar.css("width","0%");
                        $("#loading-image").hide();
                    }
                  }
//                 console.log(elemeneachisipaytab[47].substring(139));
            },
            error: function (data1) {
                     alert("error"+data1);    
            }
        });
    });
   
};
$(function(){
   $('#btnpayment').click(function(){
       console.log("disini");
     var r = confirm("Apakah Anda Akan Melakukan Payment?");
        if(r == true){
           payment();
        }   
    });
});
function updateProgress(percentage) {
    $('#progcoreId').css("width", percentage+"%");
   // $('#pbar_innertext').text(percentage + "%");
}

function animateUpdate(perc) {
    console.log(perc);
     var now = new Date();
     var timeDiff = now.getTime() - start.getTime();
     var perc = Math.round((timeDiff/maxTime)*100);
      if (perc <= 100) {
       updateProgress(perc);
       setTimeout(animateUpdate, timeoutVal);
      }
};
function cekrek(){
    var flag=0;
    var nama;
    $.ajax({
        type: "POST",
        traditional:true,
        url: url+"/transpem.htm",
        async:true,
        crossDomain: true,
        dataType:"json",
        data:{isi:"cekrek",accnumb:$('#inpnorek').val(),jenis_acc:$('#seltiprek' ).val().split("-")[0]},
        success: function (data1) {
            //tabungan = JSON.parse(data1);
            //console.log(tabungan["tabungan"]);
            if(data1["tabungan"][0] === "" || data1["tabungan"][0] === undefined){
                alert("Masukkan Nomor Akun Yang Benar");
                $('#inpnamarek').val("");
            }
            else if(data1["tabungan"][0] != ""){
                if($('#seltiprek' ).val().split("-")[0] === "4"){
                    //console.log(tabungan[0]["nama"]);
                    $('#inpnamarek').val(data1["tabungan"][0]["nama"]);
                }
                if($('#seltiprek' ).val().split("-")[0] === "1"){
                    $('#inpnamarek').val(data1["tabungan"][0]["bname"]);
                }
            }
            //console.log(tabungan["tabungan"][0]["nama"]);

            //$('#inpnamarek').val(t) ;
        },
        error: function (data1) {
            alert("error"+data1);    
        }
    });
};
var cek;
function cek_radio_button_payment(){
  $('input:radio[name=lang]').click(function(){
      console.log("cek");
    if($('input:radio[name=lang]')[1].checked){
        cek = $('input:radio[name=lang]')[1].value;
        $('#transnontunai').css('display',"block");
        menutransaksinontunai();
        $('#btnpayment').show();
    };
    if($('input:radio[name=lang]')[0].checked){
        cek = "";
        $('#transnontunai').css('display',"none");
        $('#btnpayment').show();
    };
  });
};
function change_selecttyperek(){
    $('#seltiprek' ).change(function() {
        if($('#seltiprek' ).val() == $('#optiprekname0' ).val()){
            $('#trnowarkat').show();
             $('#trnamawarkat').show();
        }
        if($('#seltiprek' ).val() == $('#optiprekname1' ).val()){
            $('#trnowarkat').hide();
            $('#trnamawarkat').hide();
        }
    });
};
function comma(x){
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};
$(function(){
   $('#btninq').click(function(){
     var r = confirm("Apakah Anda Akan Melakukan Inquiry?");
        if(r == true){
           inquiry();
        }   
    });
    $('#ITEMjsp').change(function(){
        $.getJSON( "../json/endis.json", function(data) { 
            $.each( data.disable, function(i, m) {
                if($('#ITEMjsp').val().split('-')[1].trim() === m.jenis){
                   // console.log(i+","+m.ket_dis);
                    document.getElementById("dtahun").disabled = m.ket_dis;
                }
            });
	});
    });
});
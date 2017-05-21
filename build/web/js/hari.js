function hari(){
				var t=new Date();
				var hari=new Array("Minggu","Senin","Selasa","Rabu","Kamis","Jum'at","Sabtu");
				var bulan=new Array("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember");
				var hari_ini=hari[t.getDay()];
				var tanggal=t.getDate();
				var bulan_ini=bulan[t.getMonth()];
				var tahun=t.getYear()+1900;
					
				var hari_div = document.getElementById('hari');
                hari_div.innerHTML = hari_ini + ", " + tanggal + " " + bulan_ini + " " + tahun;
                setTimeout("hari()", 1000);
			}
			hari();
<?php 
require 'function.php';

$id = $_GET["id"];
if(edit_pemesanan_verifikasi ($id) > 0 ){
    echo " 
    <script>
        alert('Pemesanan Berhasil Diverifikasi');
        document.location.href = 'pemesanan.php';
    </script>";
}else{
    echo " 
    <script>
        alert('Pemesanan Telah Diverifikasi');
        document.location.href = 'pemesanan.php';
    </script>";
}

?>
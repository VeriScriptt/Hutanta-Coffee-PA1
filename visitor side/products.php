<?php
include('function.php');
$id_produk = $_GET['id'];
$select = "SELECT * FROM produk p  WHERE p.id_produk = '$id_produk'";
$query  = mysqli_query($conn, $select);
$produk     = mysqli_fetch_assoc($query);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produk</title>
    <link rel="stylesheet" href="style keranjang.css" type="text/css">
    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>

<body>
    <?= template_header('Product') ?>

    <div class="product content-wrapper">
        <img src="../img/<?= $produk['gambar_produk'] ?>" width="500" height="500" alt="<?= $produk['nama_produk'] ?>">
        <div>
            <h1 class="name"><?= $produk['nama_produk'] ?></h1>
            <span class="price">
                <?= "Rp.", number_format($produk["harga_produk"], 0, ',', '.'); ?>
            </span>
            <form action="" method="post" enctype="multipart/form-data">
                <input type="number" name="kuantitas" value="1" min="1" max="<?= $produk['kuantitas'] ?>" placeholder="kuantitas" required>
                <input type="hidden" name="product_id" value="<?= $produk['id_produk'] ?>">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Tambahkan Ke Keranjang
                </button>
            </form>
            <div class="description">
                <p><b>Kategori : </b><?= $produk['tipe_produk'] ?></p>
            </div>
            <div class="description">
                <p>
                    <b>Deskripsi : </b> <?= $produk['deskripsi'] ?>
                </p>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tambah Produk</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Anda perlu login sebelum menambahkan produk ke keranjang
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <a href="login.php"><button type="button" class="btn btn-primary">Login</button></a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
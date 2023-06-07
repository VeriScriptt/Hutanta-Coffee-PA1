-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 06:42 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hutanta`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL DEFAULT 1,
  `nama_admin` varchar(100) NOT NULL DEFAULT 'Admin',
  `id_akun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `id_akun`) VALUES
(1, 'Administrator', 1);

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_akun`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'admin123'),
(2, 'yessi@gmail.com', 'yessi123'),
(3, '20williampanjaitan@gmail.com', 'william123'),
(4, 'joice@gmail.com', 'joice123'),
(5, 'veri@gmail.com', 'veri123');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `konten`
--

CREATE TABLE `konten` (
  `id_konten` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konten`
--

INSERT INTO `konten` (`id_konten`, `keterangan`, `gambar`, `judul`) VALUES
(3, 'fino alla fine', '646a41fce92fc.jpeg', 'Allianz Stadium'),
(4, 'kopi toba', '647dddc833ed5.jpg', 'judul 2'),
(5, 'contoh konten', '647dde0685aa2.jpg', 'judul 3'),
(6, 'kopi toba', '647de023a3284.jpg', 'judul 3'),
(7, 'kopi toba', '647de04327146.jpg', 'judul 4'),
(8, 'kopi toba', '647de09012c7d.jpg', 'judul 5'),
(9, 'contoh konten', '647de0af7c165.jpg', 'judul 6'),
(10, 'contoh konten', '647de0bd1c801.jpg', 'judul 7'),
(11, 'contoh konten', '647de13ff2d0b.jpg', 'judul 8'),
(12, 'contoh konten', '647de17ea290d.jpg', 'judul 9'),
(13, 'contoh konten', '647de1cd7d5f4.jpg', 'judul 10');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telepon` varchar(13) NOT NULL,
  `id_akun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `id_produk`, `nama_lengkap`, `alamat`, `no_telepon`, `id_akun`) VALUES
(1, 0, 'Administrator', 'Hutanta Coffee', '08113921607', 1),
(2, 0, 'Yessi Charissa Sipahutar', 'Tarutung, Silangkitang', '082162127549', 2),
(3, 0, 'William Panjaitan', 'Tampubolon, Laguboti', '081991656520', 3),
(4, 0, 'Joice Sharon Sinaga', 'Tebing tinggi, Jambi', '0821567408568', 4),
(5, 0, 'Veri Marsil Marpaung', 'Tomuan, Siantar', '082136457893', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `total` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `id_pelanggan`, `status`, `tanggal`, `total`) VALUES
(1, 3, 'Verifikasi', '2023-06-06 20:11:48', '45000'),
(2, 3, 'Verifikasi', '2023-06-06 08:12:13', '45000'),
(4, 3, 'Verifikasi', '2023-06-06 21:07:27', '360000'),
(5, 3, 'Verifikasi', '2023-06-07 02:30:48', '320000'),
(6, 2, 'Verifikasi', '2023-06-07 04:59:30', '25000'),
(7, 2, 'Menunggu', '2023-06-07 05:04:08', '125000'),
(8, 2, 'Menunggu', '2023-06-07 05:08:24', '50000'),
(9, 5, 'Menunggu', '2023-06-07 06:09:42', '110000'),
(10, 5, 'Menunggu', '2023-06-07 06:12:54', '110000'),
(11, 5, 'Menunggu', '2023-06-07 06:14:49', '28000'),
(12, 5, 'Menunggu', '2023-06-07 06:19:37', '28000'),
(13, 5, 'Verifikasi', '2023-06-07 06:30:32', '73000');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `desc` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `rrp` decimal(7,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `desc`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(1, 'camera', 'Camera Canon P40 series', '55.00', '0.00', 10, 'camera.jpg', '2023-05-15 16:06:26'),
(2, 'headphones', 'headphones kualitas tinggi', '25.00', '0.00', 10, 'headphones.jpg', '2023-05-15 16:28:01'),
(3, 'wallet', 'wallet terbuat dari kulit dino', '20.00', '0.00', 15, 'wallet.jpeg', '2023-05-15 16:29:36'),
(4, 'watch', 'watch tahan air', '40.00', '0.00', 5, 'watch.jpeg', '2023-05-15 16:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(4) NOT NULL,
  `nama_produk` varchar(50) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `tipe_produk` varchar(20) DEFAULT NULL CHECK (`tipe_produk` in ('Makanan','Minuman','Toping','Snack')),
  `harga_produk` decimal(10,0) DEFAULT NULL,
  `gambar_produk` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi`, `kuantitas`, `tipe_produk`, `harga_produk`, `gambar_produk`) VALUES
(2, 'Hot Coffee Latte', 'Campuran sempurna antara espresso pekat dan kelembutan susu yang memanjakan lidah Anda. Rasakan keharmonisan rasa yang kaya, dengan sentuhan pahit dan manis yang terasa dalam setiap tegukan', 100, 'Minuman', '25000', '645cfcb67011b.jpg'),
(5, 'Dimsum Ayam', 'Dimsum adalah sejenis hidangan kecil yang terdiri dari berbagai macam makanan gigitan, dibungkus dengan kulit tipis seperti pangsit atau dimsum.Dari pangsit yang renyah dan lezat hingga bola daging yang kenyal dan beraroma, setiap suapan menghadirkan kombinasi rasa yang menggugah selera', 100, 'Toping', '23000', '645cfd3fe5087.jpg'),
(6, 'Ice Afogato', ' Ice afogato adalah minuman yang menyegarkan dan lezat, dengan es krim lembut yang ditempatkan di atas espresso yang baru diseduh. Gabungan antara suhu dingin dan panas menciptakan sensasi yang unik saat es krim mulai meleleh dan bercampur dengan aroma kopi yang kaya. ', 100, 'Minuman', '28000', '645cfd851c1a8.jpg'),
(7, 'Spagethi', 'Spaghetti adalah hidangan pasta yang terkenal, dengan mie panjang yang kenyal dimasak al dente dan disajikan dengan beragam saus yang menggugah selera. Setiap gigitan spaghetti memberikan sensasi kenyal yang memuaskan, dan saat dilumuri oleh saus yang kaya rasa, menghasilkan kombinasi yang sempurna antara tekstur dan cita rasa yang lezat', 100, 'Makanan', '35000', '645cfdd3a745a.jpeg'),
(8, 'Ayam Goreng Madu', 'Ayam goreng madu adalah hidangan yang menggoda selera, dengan potongan ayam yang renyah dan dilapisi dengan saus madu yang manis dan lengkap dengan aroma yang menggugah. Kombinasi antara gurihnya daging ayam yang digoreng dengan manisnya saus madu menciptakan harmoni cita rasa yang sempurna, memberikan sensasi lezat dan memanjakan lidah', 100, 'Makanan', '45000', '645cfdfd74dfc.jpg'),
(9, 'Roti Bakar', 'Roti bakar adalah hidangan sarapan yang terkenal dan populer, dengan irisan roti yang renyah dan gurih yang dipanggang hingga kecokelatan. Sajian ini memberikan sensasi yang memanjakan saat gigitan pertama, dengan tekstur yang renyah di luar dan lembut di dalam. ', 100, 'Snack', '15000', '645dbbbb0ec6a.jpg'),
(10, 'Bihun Goreng Ayam', ' Bihun goreng ayam adalah hidangan Indonesia yang lezat, terdiri dari bihun yang digoreng dengan sempurna dan dicampur dengan potongan ayam yang gurih. Tekstur lembut bihun dan kelezatan daging ayam yang terasa saat dikombinasikan menciptakan pengalaman makan yang memuaskan bagi para pecinta kuliner.', 100, 'Makanan', '25000', '6461a4dbc6388.jpg'),
(11, 'Hot Vanilla Latte', 'Hot vanilla latte adalah minuman hangat yang menggugah selera, dengan perpaduan sempurna antara kopi espresso yang kaya dan manisnya vanilla. Sajian ini memberikan sensasi kehangatan dan kenyamanan saat diseruput, dengan aroma kopi yang menguar dan rasa vanilla yang menyelubungi lidah dengan kelembutan. ', 100, 'Minuman', '30000', '6461a5d80b673.jpeg'),
(12, 'Indomie Rebus', 'Mie kering yang terbuat dari tepung terigu di rebus hingga menjadi lembut, kemudian disajikan dengan bumbu dan minyak khusus.', 100, 'Makanan', '15000', '6461a607c882b.jpg'),
(13, 'Ice Mochacinno', 'minuman kopi yang menyegarkan dengan kombinasi yang sempurna antara espresso, susu, cokelat, dan es serut.', 100, 'Minuman', '32000', '6461a643a0cba.jpeg'),
(14, 'Pisang Marhara', 'Pisang Marhara, pisang yang dicelupkan ke dalam adonan tepung yang terbuat dari campuran tepung terigu, gula, dan rempah-rempah seperti kayu manis. Kemudian, pisang tersebut digoreng dalam minyak panas hingga kecokelatan dan krispi', 100, 'Snack', '17000', '6461a694515be.jpg'),
(15, 'Ice Lemon Tea', 'Ice Lemon Tea adalah minuman segar yang terdiri dari teh hitam yang disajikan dengan es batu dan perasan air lemon. Rasanya yang seimbang antara rasa teh yang menyegarkan dan keasaman lemon memberikan sensasi kesegaran yang menyenangkan pada setiap tegukan.', 100, 'Minuman', '22000', '6461a7399d669.jpg'),
(16, 'Nasi Goreng Hutanta', 'nasi yang digoreng bersama dengan bumbu, sayuran, daging atau seafood, dan  juga telur, dengan resep khas Hutanta. Nasi goreng adalah kombinasi sempurna antara rasa yang gurih dan lezat.', 100, 'Makanan', '40000', '6461a798345fa.jpeg'),
(18, 'Ice Coffee Latte', 'Ice Coffee Latte adalah minuman yang menyegarkan dan lezat, dengan kombinasi sempurna antara espresso yang diseduh dingin, susu, dan es batu. Rasanya yang kaya dan sejuk membuat Ice Coffee Latte menjadi pilihan yang populer untuk mengatasi cuaca panas. Minuman ini memberikan energi dan kesegaran dengan setiap tegukan yang memberikan sensasi dingin dan kelezatan kopi yang khas.', 100, 'Minuman', '28000', '6461a8d94d346.jpeg'),
(19, 'Waffle Hutanta', 'waffle terdiri dari campuran tepung terigu, telur, susu, mentega, gula, dan bahan lainnya yang memberikan rasa dan tekstur khas. Setelah adonan dipanggang dalam cetakan waffle, muncullah waffle dengan lapisan renyah di luar dan lembut di dalam.', 100, 'Snack', '30000', '6461aa299bf20.png'),
(20, 'Waffle Yogurt', 'waffle terdiri dari campuran tepung terigu, telur, susu, mentega, gula, dan bahan lainnya yang memberikan rasa dan tekstur khas. Setelah adonan dipanggang dalam cetakan waffle, muncullah waffle dengan lapisan renyah di luar dan lembut di dalam, dengan lapisan yogurt yang menyegarkan.', 100, 'Snack', '35000', '6461aa4ae7a83.png'),
(21, 'Spagethi Carbonara ', 'Hidangan ini terdiri dari spaghetti yang dimasak al dente dan disajikan dengan saus carbonara kaya dan gurih.  Saus carbonara biasanya terbuat dari campuran telur, keju parmesan atau pecorino, pancetta atau bacon yang digoreng, serta bawang putih dan lada hitam.', 100, 'Makanan', '35000', '6461aa74ef40f.jpg'),
(22, 'Roti Bakar Bontar', 'Hidangan ini terdiri dari dua lembar roti yang diisi dengan berbagai bahan selai atau topping, kemudian dipanggang atau digoreng hingga bagian luar roti menjadi renyah dan bagian dalamnya tetap lembut.', 100, 'Snack', '13000', '6461aa8d20177.jpeg'),
(23, 'Pancake Hutanta', 'Pancake terbuat dari adonan tepung yang dicampur dengan telur, susu, dan bahan lainnya, kemudian digoreng di atas wajan datar atau griddle hingga matang.  Pancake memiliki tekstur yang lembut di tengah dan permukaan yang renyah.', 100, 'Snack', '30000', '6461aabbe3c81.jpg'),
(24, 'Nasi Goreng Teri Medan', 'Nasi Goreng Teri Medan, nasi goreng yang dihasilkan memiliki cita rasa yang kaya dan gurih. Nasi goreng tersebut  dibumbui dengan rempah-rempah seperti bawang merah, bawang putih, cabai, dan terasi', 100, 'Makanan', '25000', '6461aad13a865.jpg'),
(25, 'Indomie Goreng Keju', 'Hidangan ini menggabungkan mi instan goreng dengan sentuhan keju yang lezat.', 100, 'Makanan', '23000', '6461ab1641b48.jpg'),
(26, 'Guan Fu Kwe Tiau', 'Guan Fu Kwe Tiau adalah hidangan makanan terdiri dari mie tebal yang digoreng dengan berbagai bahan seperti daging, seafood, sayuran, dan rempah-rempah yang khas, menciptakan rasa yang lezat dan tekstur yang kenyal.', 100, 'Makanan', '35000', '6461ab2cb961f.jpeg'),
(27, 'French Fries', 'Terbuat dari potongan kentang yang digoreng hingga renyah di luar dan lembut di dalam, French Fries merupakan kombinasi sempurna antara cita rasa gurih dan tekstur yang renyah.', 100, 'Snack', '20000', '6461ab46baec6.jpg'),
(28, 'Chicken Pop', 'Terbuat dari potongan ayam yang digoreng dengan kulit yang renyah dan daging yang juicy,Chicken Pop juga sering disajikan dengan berbagai saus tambahan, seperti saus barbekyu, saus pedas, atau saus mayo, yang menambahkan dimensi rasa yang beragam', 100, 'Toping', '25000', '6461ab6e4612a.jpg'),
(29, 'Banana Split', 'Banana Split adalah hidangan penutup klasik yang terdiri dari pisang yang dipotong menjadi dua, disajikan dengan bola es krim beraneka rasa, dan ditambahkan dengan saus cokelat, saus strawberry, kacang, dan topping lainnya, menciptakan kombinasi manis, segar, dan menggugah selera.', 100, 'Snack', '22000', '6461ab8844492.jpg'),
(30, 'Ayam Goreng Mozarella', 'Ayam Goreng Mozzarella adalah hidangan ayam yang digoreng dengan tepung crispy yang renyah, kemudian disajikan dengan lapisan keju mozzarella yang meleleh di atasnya, menciptakan perpaduan lezat antara daging ayam yang juicy dan keju yang creamy.', 100, 'Makanan', '43000', '6461aba14028b.png'),
(32, 'Frappe Tobacino Vanilla', 'French Tobacino Vanilla adalah minuman kopi yang lezat dengan perpaduan unik antara rasa kopi yang kaya dan aroma manis vanila. Dengan sentuhan tambahan tabacco yang memberikan nuansa sedikit beraroma tembakau, minuman ini memberikan pengalaman kopi yang berbeda dan memikat bagi pecinta kopi.', 100, 'Minuman', '35000', '6461ceb80c95a.jpg'),
(33, 'French Press Robusta', 'minuman kopi yang kuat dengan karakteristik khas biji kopi Robusta yang tangguh dan penuh cita rasa. Dengan menggunakan metode French Press, minuman ini menghadirkan kekayaan rasa, keasaman yang lebih rendah, dan body yang kuat, cocok bagi pecinta kopi dengan preferensi yang lebih bold.', 100, 'Minuman', '20000', '6461ced1440f2.jpeg'),
(35, 'Hot AB Moccacino', 'minuman kopi yang hangat dengan perpaduan sempurna antara aroma kopi yang kaya, rasa cokelat yang lezat, dan sentuhan krim yang lembut di atasnya.', 100, 'Minuman', '30000', '6461cf806c9b9.jpg'),
(36, 'Hot Chocolate', 'minuman cokelat hangat yang menyenangkan dengan cita rasa manis dan creamy yang memanjakan lidah. Dengan taburan marshmallow atau bubuk cokelat di atasnya', 100, 'Minuman', '22000', '6461cfa41406f.jpg'),
(37, 'Hot Matcha Latte', 'minuman hangat yang nikmat dengan perpaduan sempurna antara bubuk matcha yang kaya akan antioksidan dan susu yang lembut. Rasanya yang unik, lezat, dan sedikit beraroma rumput memberikan pengalaman minum yang menyegarkan dan menenangkan', 100, 'Minuman', '22000', '6461cfe7661a6.jpg'),
(38, 'Ice Pandan Coffee Latte', 'minuman segar yang menyajikan kombinasi unik antara rasa pandan yang harum, kopi yang kaya, dan susu yang lembut, disajikan dengan es serut yang menyegarkan.', 100, 'Minuman', '30000', '6461d01096a9f.jpeg'),
(39, 'Ice Rum Coffee Latte', 'minuman yang menggabungkan kelezatan kopi dengan sentuhan anggur rum yang memberikan aroma khas dan rasa yang kaya. Dengan es yang menyegarkan, minuman ini memberikan sensasi menyenangkan dan elegan bagi pecinta kopi dan anggur rum.', 100, 'Minuman', '32000', '6461d0315ba1c.jpeg'),
(40, 'Ice Chocolate Wafer', 'Ice Chocolate Wafer adalah minuman segar yang menggugah selera, dengan perpaduan antara cokelat yang lezat dan kelezatan wafer yang renyah. Saat disajikan dengan es batu, minuman ini memberikan sensasi kelembutan cokelat yang memanjakan lidah, ditambah dengan rasa kriuk-kriuk wafer yang memperkaya tekstur. Ice Chocolate Wafer menjadi pilihan yang sempurna untuk menyegarkan diri sambil menikmati kombinasi manis dan renyah yang memikat.', 100, 'Minuman', '30000', '6461d07971a4c.png'),
(41, 'Ice Peach Tea', 'Ice Peach Tea adalah minuman yang menyegarkan dan menyenangkan, dengan perpaduan antara rasa segar teh dan kelembutan buah persik. Rasanya yang manis dan aroma buah persik yang harum memberikan sensasi kesegaran yang memanjakan lidah. Ketika disajikan dengan es batu, Ice Peach Tea menjadi minuman yang sempurna untuk menikmati momen santai atau menghilangkan dahaga di hari yang panas.', 100, 'Minuman', '25000', '6461d08cec547.jpg'),
(42, 'Ice Tea lychee', 'Ice Tea lychee adalah minuman yang menyegarkan dan menggoda selera, dengan perpaduan antara teh yang segar dan kelembutan buah leci. Rasanya yang manis dan aroma leci yang khas memberikan sensasi kelezatan yang memanjakan lidah. Ketika disajikan dengan es batu, Ice Tea lychee menjadi minuman yang cocok untuk menyegarkan diri dan memberikan kesegaran yang menyenangkan di tengah cuaca yang panas.', 100, 'Minuman', '25000', '6461d25c1ee3f.jpg'),
(43, 'Ice Thai Tea', ' Ice Thai Tea adalah minuman yang menggugah selera, dengan perpaduan sempurna antara teh Thai yang khas dan rasa manis yang lezat. Saat disajikan dengan es batu, Ice Thai Tea memberikan sensasi kelembutan dan kesegaran yang memanjakan lidah, ditambah dengan sentuhan krim susu yang melengkapi cita rasa yang unik', 100, 'Minuman', '25000', '6461d270cfbe0.jpg'),
(44, 'Ice V60 Tobanese Arabica', 'Ice V60 Tobanese Arabica adalah minuman yang istimewa, dengan menggunakan biji kopi Arabika Tobanese yang berkualitas tinggi dan diseduh menggunakan metode V60. Rasanya yang kaya, dengan sentuhan manis dan asam yang seimbang, memberikan pengalaman minum kopi yang memuaskan. Ketika disajikan dengan es batu', 100, 'Minuman', '37000', '6461d290b4639.jpeg'),
(45, 'Kopi sanger', 'Kopi Sanger adalah minuman kopi yang unik dan menggugah selera, terdiri dari campuran kopi espresso yang kuat, perasan jeruk segar, dan sirup gula merah. Rasanya yang menyegarkan dengan kombinasi asam jeruk dan kekayaan kopi menciptakan sensasi yang tak terlupakan di lidah. Kopi Sanger menjadi pilihan yang populer untuk menyegarkan diri dan menikmati rasa unik yang menggabungkan citarasa kopi dan sentuhan jeruk yang segar.', 100, 'Minuman', '20000', '6461d32e47d84.jpeg'),
(46, 'Kopi Tubruk Robusta', 'Kopi Tubruk Robusta adalah minuman kopi yang khas dan bercita rasa kuat, dengan biji kopi Robusta yang digiling kasar dan diseduh langsung dengan air panas. Rasanya yang pekat dan penuh karakter memberikan kelezatan yang kuat, dengan aroma yang khas dan sedap. Kopi Tubruk Robusta menjadi pilihan yang cocok bagi pecinta kopi yang menginginkan kekuatan dan keaslian rasa kopi yang khas.', 100, 'Minuman', '16000', '6461d354dddf6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id_ulasan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `pesan` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Tampilkan',
  `tanggal` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`id_ulasan`, `id_pelanggan`, `pesan`, `status`, `tanggal`) VALUES
(1, 3, 'makanan nya enak', 'Tampilkan', '2023-05-30'),
(2, 3, 'Suasananya nyaman', 'Tampilkan', '2023-05-30'),
(3, 3, 'Pelayanannya memuaskan', 'Tampilkan', '2023-05-30'),
(5, 2, 'Makanan dan pelayanannya memuaskan', 'Tampilkan', '2023-06-04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_akun` (`id_akun`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `konten`
--
ALTER TABLE `konten`
  ADD PRIMARY KEY (`id_konten`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_akun` (`id_akun`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `konten`
--
ALTER TABLE `konten`
  MODIFY `id_konten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`);

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Okt 2018 pada 11.44
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cobaaja`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `username` varchar(64) NOT NULL COMMENT 'Username',
  `password` varchar(64) NOT NULL COMMENT 'Password',
  `last_login` datetime DEFAULT NULL COMMENT 'Last Login'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `last_login`) VALUES
(1, 'admin', 'admin', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `author`
--

CREATE TABLE `author` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `first_name` varchar(64) NOT NULL COMMENT 'First Name',
  `last_name` varchar(64) DEFAULT NULL COMMENT 'Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'E-mail'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `author`
--

INSERT INTO `author` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Wiro', 'Sableng', 'wiro.s@authors.org'),
(2, 'Jaka', 'Sembung', 'jaka.s@authors.org'),
(3, 'Saras', '008', 'saras.0@authors.org'),
(4, 'Arman', 'Maulagi', 'arman.m@authors.org'),
(5, 'Pandapotan', 'Bangsa', 'pandapotan@b@authors.org'),
(6, 'Milky', 'Man', 'milky.m@authors.org'),
(7, 'Bejo', 'Angin', 'bejo.a@authors.org');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', NULL),
('create-book', '2', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'admin can create books, author, publishers, and view detail.', NULL, NULL, NULL, NULL),
('create-author', 1, 'allow user to add an author', NULL, NULL, NULL, NULL),
('create-book', 1, 'allow a user to add a book', NULL, NULL, NULL, NULL),
('create-publisher', 1, 'allow user to add publisher', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'create-author'),
('admin', 'create-book'),
('admin', 'create-publisher');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `book`
--

CREATE TABLE `book` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `author_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Author ID',
  `publisher_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Publisher ID',
  `isbn` varchar(16) DEFAULT NULL COMMENT 'ISBN',
  `title` varchar(64) DEFAULT NULL COMMENT 'Title',
  `price` double DEFAULT NULL COMMENT 'Price',
  `year` char(4) DEFAULT NULL COMMENT 'Year',
  `description` text COMMENT 'Description'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `book`
--

INSERT INTO `book` (`id`, `author_id`, `publisher_id`, `isbn`, `title`, `price`, `year`, `description`) VALUES
(1, 2, 1, '0123123001', 'Ada gula gak ada semut', 11.02, '2015', 'Ada gula ada semut? Tidak!, Sapi dapat berlari di atas air dan banyak keunikan di dunia ini yang dapat ditemukan di buku ini dan Anda akan semakin mengagumi kehidupan.'),
(2, 2, 1, '0123123002', 'Bukan pesan biasa', 14.28, '2013', 'Telodong Cu Lun, seorang bintang kenamaan yang digandrungi remaja alay saat ini, menemukan sebuah gambar berbentuk bulat di dinding kamarnya. Keanehan lain yang ia temukan adalah kosongnya tudung saji di ruang makan dan kosongnya dompet. Suasana makin mencekam ketika sebuah pesan singkat diterimanya melalui telepon gengamnya, isi pesan itu tidak biasa... temukan kisahnya!'),
(3, 3, 2, '0123123003', 'Celana di jemuran ASPA, merah berbunga', 7.85, '2013', 'Pada saat liburan semester yang lalu, seorang penanggungjawab bidang akademik berjalan di daerah jemuran Asrama Putra yang tengah ditinggal para penghuninya berlibur, namun karena beberapa hal ada beberapa mahasiswa yang masih tinggal di gedung megah itu. Terlihat sebuah celana merah dengan corak bunga bangkai, terjatuh dari jemuran pakaian, alamak! Investigasi dilakukan, dan hal tidak disangka pun terkuak.'),
(4, 3, 1, '0123123004', 'Di mana ada PHP, aman!', 18.99, '2014', 'Pengembang web sering kesulitan dalam memanajemen situs statis yang mereka kembangkan. Mereka harus mengubah kode yang sudah mereka tulis setiap kali ada perubahan konten. PHP sebagai salah satu server-side programming language dapat mengeliminir persoalan tersebut. Buku ini menjelaskan bagaimana caranya.'),
(5, 5, 2, '0123123005', 'Tiki-taka pemrograman', 10.5, '2014', 'Tidak mudah memahami konsep pemrograman. Buku ini memberikan tutorial dengan cara pandang berbeda untuk memahami konsep-konsep tersebut. Dilangkapi dengan contoh kasus yang mudah dipahami dan penyelesaian yang sistematis dan tepat sasaran.'),
(6, 1, 2, '0123123008', 'Ngoding itu Enak', 12.05, '2013', 'Ngoding itu ada enak dan ga enaknya. Ayo cari tahu apa-apa saja itu'),
(7, 2, 1, '0123123006', 'Kelamnya Orde Lama', 10, '2010', 'Penasaran gimana kelamnya Orde Lama? Yuk, cari tahu disini.'),
(8, 6, 2, '0123123019', 'Tutorial PHP', 12.03, '2018', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m140506_102106_rbac_init', 1540528062);

-- --------------------------------------------------------

--
-- Struktur dari tabel `publisher`
--

CREATE TABLE `publisher` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `address` varchar(64) DEFAULT NULL COMMENT 'Address',
  `email` varchar(128) DEFAULT NULL COMMENT 'E-mail',
  `phone` varchar(16) DEFAULT NULL COMMENT 'Phone'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `address`, `email`, `phone`) VALUES
(1, 'Blahblah Publisher', 'Jl. Koding no.172/22a', 'blah@publishers.org', NULL),
(2, 'Kiri-Kanan Publisher', 'Jl. Source Code Indah no. 2/22', 'kirkan@publishers.org', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'hariaty', 'TcZp9WXFrD6cWMZTN6cLlxSaosvm5M5L', '$2y$13$sNgL1rTcFPwD2IGwZV.JbuUifX8xeo1uUt6IuUiM6TLYYUvwXRDDK', NULL, 'hariatyyyy@gmail.com', 10, 1540542546, 1540542546),
(2, 'Sisca', 'Qvp__DXePhmItITYKWLlPHx25BmJww3d', '$2y$13$0SZ8vp0c1mkZGLYYEKiuoe3buczh4Ln.7YIUvpqSMWCCDploTn17S', NULL, 'siskaaaa@gmail.com', 10, 1540542598, 1540542598);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indeks untuk tabel `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indeks untuk tabel `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indeks untuk tabel `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indeks untuk tabel `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_ref_author` (`author_id`),
  ADD KEY `book_ref_publisher` (`publisher_id`);

--
-- Indeks untuk tabel `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indeks untuk tabel `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `author`
--
ALTER TABLE `author`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `book`
--
ALTER TABLE `book`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Feb 2025 pada 04.31
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `daftar_siswa_meminjam` ()   BEGIN
    SELECT DISTINCT siswa.id_siswa, siswa.nama
    FROM siswa
    JOIN pinjaman ON siswa.id_siswa = pinjaman.id_siswa
    WHERE pinjamann.tgl_kembali IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletebukur` (IN `id` INT)   BEGIN
    DELETE FROM buku
    WHERE id_buku=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletepinjam` (IN `id` INT)   BEGIN
    DELETE FROM pinjaman
    WHERE id_pinjaman=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletesiswa` (IN `id` INT)   BEGIN
    DELETE FROM siswa
    WHERE id_siswa=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertbuku` (IN `Id_buku` INT, IN `Judul` VARCHAR(255), IN `Penulis` VARCHAR(255), IN `Kategori` VARCHAR(50), IN `Stok` INT)   BEGIN 
   INSERT INTO buku(id_buku,judul,penulis,kategori,stok)
   VALUES (Id_buku,Judul,Penulis,Kategori,Stok);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertpinjam` (IN `Id_pinjaman` INT, IN `Id_siswa` INT, IN `Id_buku` INT, IN `Tgl_pinjam` DATE, IN `Tgl_kembali` DATE, IN `Statu` VARCHAR(50))   BEGIN 
   INSERT INTO pinjaman(id_pinjaman,id_siswa,id_buku,tgl_pinjam,tgl_kembali,status)
   VALUES (Id_pinjaman,Id_siswa,Id_buku,Tgl_pinjam,Tgl_kembali,Statu);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertsiswa` (IN `Id_siswa` INT, IN `Nama` VARCHAR(50), IN `Kelas` VARCHAR(50))   BEGIN 
   INSERT INTO siswa(id_siswa,nama,kelas)
   VALUES (Id_siswa,Nama,Kelas);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kembalikan_buku` (IN `Id_peminjaman` INT)   BEGIN
    UPDATE peminjaman
    SET tanggal_kembali = CURRENT_DATE
    WHERE id_pinjaman = Id_peminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectbuku` ()   BEGIN
    SELECT * FROM buku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectpinjam` ()   BEGIN
    SELECT * FROM pinjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectsiswa` ()   BEGIN
    SELECT * FROM siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `semua_buku_termasuk_tidak_dipinjam` ()   BEGIN
    SELECT buku.id_buku, buku.judul, buku.penulis, buku.kategori, buku.stok
    FROM buku
    LEFT JOIN pinjaman ON buku.id_buku = pinjaman.id_buku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `semua_siswa_termasuk_tidak_meminjam` ()   BEGIN
    SELECT siswa.id_siswa, siswa.nama, siswa.kelas
    FROM siswa
    LEFT JOIN pinjaman ON siswa.id_siswa = pinjaman.id_siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilkan_semua_siswa` ()   BEGIN
    SELECT siswa.id_siswa, siswa.nama
    FROM siswa
    LEFT JOIN pinjaman ON siswa.id_siswa = pinjaman.id_siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatebuku` (IN `Id_buku` INT, IN `Judul` VARCHAR(255), IN `Penulis` VARCHAR(255), IN `Kategori` VARCHAR(50), IN `Stok` INT)   BEGIN 
 UPDATE buku SET judul=Judul,penulis=Penulis,kategori=Kategori,stok=Stok
 WHERE id_buku=Id_buku;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatepinjaman` (IN `Id_pinjam` INT, IN `Id_siswa` INT, IN `Id_buku` INT, IN `tgl_pin` DATE, IN `tgl_kem` DATE, IN `sts` VARCHAR(50))   BEGIN 
 UPDATE pinjaman SET id_siswa=Id_siswa,id_buku=Id_buku,tgl_pinjam=tgl_pin,tgl_kembali=tgl_kem,status=sts
 WHERE id_pinjaman=Id_pinjam;
 
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatesiswa` (IN `Id_siswa` INT, IN `Nama` VARCHAR(50), IN `Kelas` VARCHAR(50))   BEGIN 
 UPDATE siswa SET nama=Nama,kelas=Kelas
 WHERE id_siswa=Id_siswa;
 
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `kategori`, `stok`) VALUES
(1, 'Algoritma dan Pemrograman', 'Andi Wijaya', 'Teknologi', 5),
(2, 'Dasar-dasar Database', 'Budi Santoso', 'Teknologi', 7),
(3, 'Matematika Diskrit', 'Rina Sari', 'Matematika', 4),
(4, 'Sejarah Dunia', 'Jhon Smith', 'Sejarah', 3),
(5, 'Pemrograman Web Dengan PHP', 'Eko Prasetyo', 'Teknologi', 8),
(6, 'Sistem Operasi', 'Dian Kurniawan', 'Teknologi', 6),
(7, 'Jaringan Komputer', 'Ahmad Fauzi', 'Teknologi', 5),
(8, 'Cerita Rakyat Nusantara', 'Lestari Dewi', 'Sastra', 9),
(9, 'Bahasa Inggris untuk Pemula', 'Jane Doe', 'Bahasa', 10),
(10, 'Biologi Dasar', 'Budi Rahman', 'Sains', 7),
(11, 'Kimia Organik', 'Siti Aminah', 'Sains', 5),
(12, 'Teknik Elektro', 'Ridwan Hakim', 'Teknik', 6),
(13, 'Fisika Modern', 'Albert Einstein', 'Sains', 4),
(14, 'Manajemen Waktu', 'Steven Covey', 'Pengembangan', 8),
(15, 'Strategi Belajar Efektif', 'Tony Buzan', 'Pendidikan', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id_pinjaman` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pinjaman`
--

INSERT INTO `pinjaman` (`id_pinjaman`, `id_siswa`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `status`) VALUES
(1, 11, 2, '2025-02-01', '2025-02-08', 'Dipinjam'),
(2, 2, 5, '2025-01-28', '2025-02-04', 'Dikembalikan'),
(3, 3, 8, '2025-02-02', '2025-02-09', 'Dipinjam'),
(4, 4, 10, '2025-01-30', '2025-02-06', 'Dikembalikan'),
(5, 5, 3, '2025-01-25', '2025-02-01', 'Dikembalikan'),
(6, 15, 7, '2025-02-01', '2025-02-08', 'Dipinjam'),
(7, 7, 1, '2025-01-29', '2025-02-05', 'Dikembalikan'),
(8, 8, 9, '2025-02-03', '2025-02-10', 'Dipinjam'),
(9, 13, 4, '2025-01-27', '2025-02-03', 'Dikembalikan'),
(10, 10, 11, '2025-02-01', '2025-02-08', 'Dipinjam');

--
-- Trigger `pinjaman`
--
DELIMITER $$
CREATE TRIGGER `update_stok_after_pinjam` AFTER UPDATE ON `pinjaman` FOR EACH ROW UPDATE buku
    SET stok = stok - 1
    WHERE id_buku = NEW.id_buku
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_buku_after_kembali` AFTER UPDATE ON `pinjaman` FOR EACH ROW BEGIN
    IF OLD.tgl_kembali IS NULL AND NEW.tgl_kembali IS NOT NULL THEN
        UPDATE buku
        SET stok = stok + 1
        WHERE id_buku = NEW.id_buku;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama`, `kelas`) VALUES
(1, 'Andi Saputra', 'X-RPL'),
(2, 'Budi Wijaya', 'X-TKJ'),
(3, 'Citra Lestari', 'XI-RPL'),
(4, 'Dewi Kumiawan', 'XI-TKJ'),
(5, 'Eko Prasetyo', 'XII-RPL'),
(6, 'Farhan Maulana', 'XII-TKJ'),
(7, 'Gita Permata', 'X-RPL'),
(8, 'Hadi Sucipto', 'X-TKJ'),
(9, 'Intan Permadi', 'XI-RPL'),
(10, 'Joko Santoso', 'XI-TKJ'),
(11, 'Kartika Sari', 'XII-RPL'),
(12, 'Lintang Putri', 'XII-TKJ'),
(13, 'Muhammad Rizky', 'X-RPL'),
(14, 'Novi Andriana', 'X-TKJ'),
(15, 'Olivia Hernanda', 'XI-RPL');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id_pinjaman`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

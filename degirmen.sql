-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Tem 2018, 00:43:12
-- Sunucu sürümü: 5.7.17
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `degirmen`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hesap`
--

CREATE TABLE `hesap` (
  `Id` int(11) NOT NULL,
  `musteriId` int(11) NOT NULL,
  `acıklama` varchar(250) COLLATE utf8mb4_turkish_ci NOT NULL,
  `borc` double NOT NULL,
  `kdv` double NOT NULL,
  `alacak` double NOT NULL,
  `bakiye` double NOT NULL,
  `tarih` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log`
--

CREATE TABLE `log` (
  `Id` int(11) NOT NULL,
  `acıklama` varchar(250) COLLATE utf8mb4_turkish_ci NOT NULL,
  `tarih` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

CREATE TABLE `musteri` (
  `Id` int(11) NOT NULL,
  `sirketAdi` varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  `bankaAdi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `hesapNo` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8mb4_turkish_ci NOT NULL,
  `faks` varchar(15) COLLATE utf8mb4_turkish_ci NOT NULL,
  `vergiDairesi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `adres` varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  `bakiye` double NOT NULL,
  `deletedAt` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`Id`, `sirketAdi`, `bankaAdi`, `hesapNo`, `telefon`, `faks`, `vergiDairesi`, `adres`, `bakiye`, `deletedAt`) VALUES
(1, 'Karaaslan Un San', 'banka adi', '580580301', '0312 338 87 33', '0312 540 45 45', 'vergi dairesi', 'baÄŸlarbaÅŸÄ± mah vezir Ã§ifliÄŸi', 0, '0000-00-00'),
(5, 'asd', 'banka adÄ±', 'banka adÄ±', '', '654654', 'zxczxc', 'qweasd', 0.3, '2018-06-29'),
(6, 'bilal bakr ÅŸirketleri', 'banka adÄ±', 'banka adÄ±', '0312 0312 1231', '505 123 123123', '555 555 55', 'baÄŸlarbaÅŸÄ± mah', 0, '2018-06-29'),
(7, 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 0, '0000-00-00'),
(8, 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 0, '0000-00-00'),
(9, 'ÅŸirket adÄ±', 'banka adÄ±', 'banka adÄ±', 'telefon', 'faks', 'vergi dairesi', 'adres', 0, '0000-00-00'),
(10, 'qwe', '123', '123', 'qwe', 'qwe', 'qwe', 'qwe', 0, '0000-00-00'),
(11, 'bilal', 'asdasd', 'asdasd', 'asd', 'q231', 'asd', 'asd', 0, '2018-06-29'),
(12, 'qwe', 'qwe', 'qwe', 'qwe', 'qwe', 'qwe', 'qwe', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun`
--

CREATE TABLE `urun` (
  `Id` int(11) NOT NULL,
  `cinsi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kg` double NOT NULL,
  `fiyat` double NOT NULL,
  `kdv` double NOT NULL,
  `deletedAt` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `urun`
--

INSERT INTO `urun` (`Id`, `cinsi`, `kg`, `fiyat`, `kdv`, `deletedAt`) VALUES
(1, 'Kırmızı un', 50, 50, 8, '0000-00-00'),
(2, 'Mavi Un', 8, 8, 8, '0000-00-00'),
(3, 'Kepek', 50, 50, 0, '0000-00-00'),
(4, 'Buğday', 1, 1, 0.8, '0000-00-00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetici`
--

CREATE TABLE `yonetici` (
  `Id` int(11) NOT NULL,
  `adSoy` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `sifre` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `email` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `yonetici`
--

INSERT INTO `yonetici` (`Id`, `adSoy`, `sifre`, `email`) VALUES
(1, 'bilal', 'asd', 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `hesap`
--
ALTER TABLE `hesap`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `musteri`
--
ALTER TABLE `musteri`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `yonetici`
--
ALTER TABLE `yonetici`
  ADD PRIMARY KEY (`Id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `hesap`
--
ALTER TABLE `hesap`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `log`
--
ALTER TABLE `log`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `musteri`
--
ALTER TABLE `musteri`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Tablo için AUTO_INCREMENT değeri `urun`
--
ALTER TABLE `urun`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `yonetici`
--
ALTER TABLE `yonetici`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

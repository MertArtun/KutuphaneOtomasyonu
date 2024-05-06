

DROP TABLE IF EXISTS `admin`;

CREATE TABLE IF NOT EXISTS `admin` (
  `k_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `k_adi` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `k_sifre` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`k_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `admin` (`k_id`, `k_adi`, `k_sifre`) VALUES
(1, 'root@root', '123456'),
(2, 'umar@gmail.com', 'umar123');

DROP TABLE IF EXISTS `istekoneri`;
CREATE TABLE IF NOT EXISTS `istekoneri` (
  `istek_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eposta` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `konu` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `icerik` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `adi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`istek_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `istekoneri` (`istek_id`, `eposta`, `konu`, `icerik`, `adi`) VALUES
(1, 'keremkaplan633@gmail.com', 'Merhaba', 'Deneme Yazısı Bana Ulaşırmısınız acaba ?', 'Kerem'),
(2, 'keremkaplan633@gmail.com', 'Merhaba', 'Merhaba', 'Kerem'),
(3, 'keremkaplan633@gmail.com', 'Merhaba', '6849r347/5*235/4*23/4*23/523/4/*82*348/*-234/-2*34-234Ã©\'!+)?==*', 'Kerem');


DROP TABLE IF EXISTS `kitap`;
CREATE TABLE IF NOT EXISTS `kitap` (
  `kitap_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kitap_adi` varchar(200) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kitap_yazari` varchar(200) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kitap_aciklama` longtext COLLATE utf8mb4_turkish_ci,
  `kitap_resim` text COLLATE utf8mb4_turkish_ci,
  `kitap_durumu` varchar(200) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`kitap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `kitap` (`kitap_id`, `kitap_adi`, `kitap_yazari`, `kitap_aciklama`, `kitap_resim`, `kitap_durumu`) VALUES
(1, 'Sıfırdan İleri Seviyeye PHP Web Programlama', 'Emrah Yüksel, Kodlab Yayın', 'Mesleğiniz farklı olabilir, Web Programlama konusunda hiçbir bilginiz olmayabilir, daha önce deneyip vazgeçmiş olabilirsiniz... Bu kitap, size PHP ile Web Geliştirme dünyasının kapılarını açarak, hayal ettiğiniz projeleri kodlamanız için gerekli olan tüm bilgi, uygulama ve yönlendirmeleri içermektedir.', 'images/kitap_resimleri/kitap_php.jpeg', 'Mevcut Değil'),
(2, 'Şeker Portakalı', 'Jose Mauro De Vasconcelos', 'Şeker Portakalı, Brezilyalı yazar Jose Mauro De Vasconcelosun tam dünyayı etkisi altına almayı başaaran 1968 tarihli dram ve çocukluk romanıdır.', 'images/kitap_resimleri/seker_portalı.jpeg', 'Mevcut');

-- Kitap Bağışları Tablosu
DROP TABLE IF EXISTS `kitap_bagisi`;
CREATE TABLE IF NOT EXISTS `kitap_bagisi` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bagisyapanadi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `bagisyapaneposta` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `bagiskitapadi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `kitap_bagisi` (`id`, `bagisyapanadi`, `bagisyapaneposta`, `bagiskitapadi`) VALUES
(1, 'Kerem Kaplan', 'keremkaplan633@gmail.com', 'Milenaya Mektuplar');


DROP TABLE IF EXISTS `kitap_grscks`;
CREATE TABLE IF NOT EXISTS `kitap_grscks` (
  `alan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aldigi_kitap` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `verecegi_tarih` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `aldigi_tarih` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kitap_id` int(10) UNSIGNED NOT NULL,
  FOREIGN KEY (`kitap_id`) REFERENCES `kitap`(`kitap_id`),
  PRIMARY KEY (`alan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `kitap_grscks` (`alan_id`, `aldigi_kitap`, `verecegi_tarih`, `aldigi_tarih`, `kitap_id`) VALUES
(1, 'Milena ya Mektuplar', '01.02.2022', '22.01.2022', 1),
(6, 'Milena ya Mektuplar', '01.02.2022', '22.01.2022', 2);


DROP TABLE IF EXISTS `uyeistegi`;
CREATE TABLE IF NOT EXISTS `uyeistegi` (
  `uyeistegi_eposta` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `istek_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`istek_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `uyeistegi` (`uyeistegi_eposta`, `istek_id`) VALUES
('keremkaplan633@gmail.com', 1),
('keremkaplan633@gmail.com', 2),
('rukensahin@gmail.com', 3);


DROP TABLE IF EXISTS `uyeler`;
CREATE TABLE IF NOT EXISTS `uyeler` (
  `uye_id` int(10) UNSIGNED NOT NULL,
  `uye_adi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uye_soyadi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uye_posta` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uye_durumu` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uye_ceza` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`uye_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `uyeler` (`uye_id`, `uye_adi`, `uye_soyadi`, `uye_posta`, `uye_durumu`, `uye_ceza`) VALUES
(1, 'Kerem', 'Kaplan', 'keremkaplan633@gmail.com', 'pasif', 'Ceza Yok'),
(2, 'Mehmet', 'DemircioÄŸlu', 'mehmetdemircioglu@gmail.com', 'Ä°naktif', '0'),
(3, 'can', 'Demir', 'mehmetdemircioglua@gmail.com', 'Aktif', '0'),
(4, 'Caner', 'Aslan', 'caneraslan@hotmail.com', 'Ä°naktif', '0'),
(5, 'Eren', 'Demir', 'erendemir@gmail.com', 'Aktif', '0'),
(6, 'Ruken', 'Åžahin', 'rukensahin@gmail.com', 'Aktif', '0');


CREATE INDEX idx_kitap_adi ON kitap(kitap_adi);
CREATE INDEX idx_uye_posta ON uyeler(uye_posta);


CREATE VIEW `v_kitap_bilgileri` AS
SELECT k.kitap_adi, k.kitap_yazari, k.kitap_aciklama, k.kitap_durumu, b.bagisyapanadi
FROM kitap k
JOIN kitap_bagisi b ON k.kitap_adi = b.bagiskitapadi;


DELIMITER //
CREATE TRIGGER trg_kitap_durum AFTER UPDATE ON kitap
FOR EACH ROW
BEGIN
  IF NEW.kitap_durumu <> OLD.kitap_durumu THEN
    INSERT INTO kitap_durum_degisiklikleri(kitap_id, eski_durum, yeni_durum, degisiklik_zamani)
    VALUES (NEW.kitap_id, OLD.kitap_durumu, NEW.kitap_durumu, NOW());
  END IF;
END;
DELIMITER ;

COMMIT;





-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- START TRANSACTION;
-- SET time_zone = "+00:00";


-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8mb4 */;



-- DROP TABLE IF EXISTS `admin`;
-- CREATE TABLE IF NOT EXISTS `admin` (
--   `k_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
--   `k_adi` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `k_sifre` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
--   PRIMARY KEY (`k_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;


-- INSERT INTO `admin` (`k_id`, `k_adi`, `k_sifre`) VALUES
-- (1, 'root@root', '123456'),
-- (2, 'umar@gmail.com', 'umar123');



-- DROP TABLE IF EXISTS `istekoneri`;
-- CREATE TABLE IF NOT EXISTS `istekoneri` (
--   `istek_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
--   `eposta` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `konu` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `icerik` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
--   `adi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   PRIMARY KEY (`istek_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;



-- INSERT INTO `istekoneri` (`istek_id`, `eposta`, `konu`, `icerik`, `adi`) VALUES
-- (1, 'keremkaplan633@gmail.com', 'Merhaba', 'Deneme Yazısı Bana Ulaşırmısınız acaba ?', 'Kerem'),
-- (2, 'keremkaplan633@gmail.com', 'Merhaba', 'Merhaba', 'Kerem'),
-- (3, 'keremkaplan633@gmail.com', 'Merhaba', '6849r347/5*235/4*23/4*23/523/4/*82*348/*-234/-2*34-234Ã©\'!+)?==*', 'Kerem');



-- DROP TABLE IF EXISTS `kitap`;
-- CREATE TABLE IF NOT EXISTS `kitap` (
--   `kitap_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
--   `kitap_adi` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `kitap_yazari` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `kitap_aciklama` longtext COLLATE utf8mb4_turkish_ci,
--   `kitap_resim` text COLLATE utf8mb4_turkish_ci,
--   `kitap_durumu` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   PRIMARY KEY (`kitap_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;



-- INSERT INTO `kitap` (`kitap_id`, `kitap_adi`, `kitap_yazari`, `kitap_aciklama`, `kitap_resim`, `kitap_durumu`) VALUES
-- (1, 'Sıfırdan İleri Seviyeye PHP Web Programlama', 'Emrah Yüksel, Kodlab Yayın', 'Mesleğiniz farklı olabilir, Web Programlama konusunda hiçbir bilginiz olmayabilir, daha önce deneyip vazgeçmiş olabilirsiniz... Bu kitap, size PHP ile Web Geliştirme dünyasının kapılarını açarak, hayal ettiğiniz projeleri kodlamanız için gerekli olan tüm bilgi, uygulama ve yönlendirmeleri içermektedir. Kitapta, asıl amacımız PHP programlama dilini öğrenmek olsa da PHP ile web tabanlı projeler içerisinde olacağımız için Temel HTML ve Temel CSS bölümlerine de yer verilmiştir.\r\n\r\nVerdiğim tüm eğitimlerde öğrencilerime tavsiyem bir “Başucu Defterleri”nin olması ve önemli görüp hatırlamak isteyeceklerini bu deftere not etmeleriydi. Bu kitap aslında o başucu defterinin hazırlanmış halidir. Birlikte başarmak için hadi hemen başlayalım...\r\n\r\n\r\n\r\• Başlarken İhtiyacınız Olanlar\r\n\r\• Lokal Sunucu ve Editör Kurulumu\r\n\r\• Temel HTML\r\n\r\• Temel CSS\r\n\r\• PHP Giriş\r\n\r\• Değişkenler ve Operatörler\r\n\r\• Diziler\r\n\r\• Denetim Yapıları\r\n\r\•HTML Formlar ile Çalışma\r\n\r\• Fonksiyonlar\r\n\r\• Zaman İşlemleri\r\n\r\• Hata İstisna Yönetimi\r\n\r\• Düzenli İfadeler\r\n\r\• Dosya Sistemi\r\n\r\• MySQL Veritabanı\r\n\r\• PDO\r\n\r\• Bootstrap & CRUD İşlemleri  Proje\r\n\r\• OOP\r\n\r\• cURL\r\n\r\• PHP Simple HTML Dom Parser\r\n\r\• Filtreleme ve Doğrulama\r\n\r\• Şifreleme Veri Güvenliği\r\n\r\• URL İşlevleri \r\n\r\• Güvenlik\r\n\r\• SEF .htaccess Yapılandırması\r\n\r\• PHPMailer ile E-Posta', 'images/kitap_resimleri/kitap_php.jpeg', 'Mevcut Değil'),
-- (2, 'Şeker Portakalı', 'Jose Mauro De Vasconcelos', 'Şeker Portakalı, Brezilyalı yazar Jose Mauro De Vasconcelos\'un tam dünyayı etkisi altına almayı başaaran 1968 tarihli dram ve çocukluk romanıdır. Brezilya\'nın Minas Gerais bölgesinde yaşayan fakir bir ailenin beş yaşındaki oğlu olan ve hayal gücü çok gelişmiş olan Zeze adlı bir çoçuğuj başından geçenleri konu edinir.', 'images/kitap_resimleri/seker_portalı.jpeg', 'Mevcut');



-- DROP TABLE IF EXISTS `kitap_bagisi`;
-- CREATE TABLE IF NOT EXISTS `kitap_bagisi` (
--   `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
--   `bagisyapanadi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `bagisyapaneposta` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `bagiskitapadi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;



-- INSERT INTO `kitap_bagisi` (`id`, `bagisyapanadi`, `bagisyapaneposta`, `bagiskitapadi`) VALUES
-- (1, 'Kerem Kaplan', 'keremkaplan633@gmail.com', 'Milenaya Mektuplar');



-- DROP TABLE IF EXISTS `kitap_grscks`;
-- CREATE TABLE IF NOT EXISTS `kitap_grscks` (
--   `alan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
--   `aldigi_kitap` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `verecegi_tarih` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `aldigi_tarih` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   PRIMARY KEY (`alan_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;



-- INSERT INTO `kitap_grscks` (`alan_id`, `aldigi_kitap`, `verecegi_tarih`, `aldigi_tarih`) VALUES
-- (1, 'Milena ya Mektuplar', '01.02.2022', '22.01.2022'),
-- (6, 'Milena ya Mektuplar', '01.02.2022', '22.01.2022');

-- -- --------------------------------------------------------



-- DROP TABLE IF EXISTS `uyeistegi`;
-- CREATE TABLE IF NOT EXISTS `uyeistegi` (
--   `uyeistegi_eposta` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `istek_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
--   PRIMARY KEY (`istek_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;



-- INSERT INTO `uyeistegi` (`uyeistegi_eposta`, `istek_id`) VALUES
-- ('keremkaplan633@gmail.com', 1),
-- ('keremkaplan633@gmail.com', 2),
-- ('rukensahin@gmail.com', 3);



-- DROP TABLE IF EXISTS `uyeler`;
-- CREATE TABLE IF NOT EXISTS `uyeler` (
--   `uye_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
--   `uye_adi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `uye_soyadi` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `uye_posta` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `uye_durumu` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   `uye_ceza` varchar(225) COLLATE utf8mb4_turkish_ci NOT NULL,
--   PRIMARY KEY (`uye_id`)
-- ) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;



-- INSERT INTO `uyeler` (`uye_id`, `uye_adi`, `uye_soyadi`, `uye_posta`, `uye_durumu`, `uye_ceza`) VALUES
-- (1, 'Kerem', 'Kaplan', 'keremkaplan633@gmail.com', 'pasif', 'Ceza Yok'),
-- (2, 'Mehmet', 'DemircioÄŸlu', 'mehmetdemircioglu@gmail.com', 'Ä°naktif', '0'),
-- (3, 'can', 'Demir', 'mehmetdemircioglua@gmail.com', 'Aktif', '0'),
-- (4, 'Caner', 'Aslan', 'caneraslan@hotmail.com', 'Ä°naktif', '0'),
-- (5, 'Eren', 'Demir', 'erendemir@gmail.com', 'Aktif', '0'),
-- (6, 'Ruken', 'Åžahin', 'rukensahin@gmail.com', 'Aktif', '0');
-- COMMIT;

-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

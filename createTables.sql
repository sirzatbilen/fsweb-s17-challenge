-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.
CREATE TABLE `trestaurant`(
    `restaurant_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `restaurant_adi` TEXT NOT NULL,
    `tur_id` BIGINT NOT NULL,
	PRIMARY KEY (`restaurant_id`)
);

CREATE TABLE `tmagaza`(
    `magaza_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `magaza_adi` TEXT NOT NULL,
    `tur_id` BIGINT NOT NULL,
    PRIMARY KEY (`magaza_id`)
);

CREATE TABLE `tur`(
    `tur_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tur_adi` TEXT NOT NULL,
    PRIMARY KEY (`tur_id`)
);

CREATE TABLE `tmarket`(
    `market_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `market_adi` TEXT NOT NULL,
    `tur_id` BIGINT NOT NULL,
     PRIMARY KEY (`market_id`)
);

CREATE TABLE `kullanıcı`(
    `kullanici_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kullanici_adi` TEXT NOT NULL,
    `kullanici_soyadi` TEXT NOT NULL,
    `kullanici_eposta` TEXT NOT NULL,
    `kullanici_telefon` INT NOT NULL,
    `kullanici_adres` TEXT NOT NULL,
    PRIMARY KEY (`kullanici_id`)
);

CREATE TABLE `siparis`(
    `siparis_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `siparis_adi` TEXT NOT NULL,
    `siparis_adedi` INT NOT NULL,
    `tur_id` BIGINT NOT NULL,
    `kullanici_id` BIGINT NOT NULL,
    PRIMARY KEY (`siparis_id`)
);

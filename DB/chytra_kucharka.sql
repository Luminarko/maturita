-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema chytra_kucharka
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema chytra_kucharka
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `chytra_kucharka` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci ;
USE `chytra_kucharka` ;

-- -----------------------------------------------------
-- Table `chytra_kucharka`.`kategorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chytra_kucharka`.`kategorie` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chytra_kucharka`.`recept`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chytra_kucharka`.`recept` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  `postup` VARCHAR(500) NOT NULL,
  `casova_narocnost` INT UNSIGNED NOT NULL,
  `kategorie_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recept_kategorie1_idx` (`kategorie_id` ASC) VISIBLE,
  CONSTRAINT `fk_recept_kategorie1`
    FOREIGN KEY (`kategorie_id`)
    REFERENCES `chytra_kucharka`.`kategorie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chytra_kucharka`.`suroviny`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chytra_kucharka`.`suroviny` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chytra_kucharka`.`jednotky`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chytra_kucharka`.`jednotky` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chytra_kucharka`.`recept_has_suroviny`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chytra_kucharka`.`recept_has_suroviny` (
  `jednotky_id` INT UNSIGNED NOT NULL,
  `recept_id` INT UNSIGNED NOT NULL,
  `suroviny_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`recept_id`, `suroviny_id`),
  INDEX `fk_recept_has_suroviny_jednotky1_idx` (`jednotky_id` ASC) VISIBLE,
  INDEX `fk_recept_has_suroviny_recept1_idx` (`recept_id` ASC) VISIBLE,
  INDEX `fk_recept_has_suroviny_suroviny1_idx` (`suroviny_id` ASC) VISIBLE,
  CONSTRAINT `fk_recept_has_suroviny_jednotky1`
    FOREIGN KEY (`jednotky_id`)
    REFERENCES `chytra_kucharka`.`jednotky` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recept_has_suroviny_recept1`
    FOREIGN KEY (`recept_id`)
    REFERENCES `chytra_kucharka`.`recept` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recept_has_suroviny_suroviny1`
    FOREIGN KEY (`suroviny_id`)
    REFERENCES `chytra_kucharka`.`suroviny` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

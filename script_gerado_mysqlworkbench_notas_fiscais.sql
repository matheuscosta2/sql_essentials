-- MySQL Script generated by MySQL Workbench
-- Sat Mar  5 00:34:59 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema nota_fiscal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nota_fiscal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nota_fiscal` DEFAULT CHARACTER SET utf8 ;
USE `nota_fiscal` ;

-- -----------------------------------------------------
-- Table `nota_fiscal`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nota_fiscal`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `fone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nota_fiscal`.`notas_fiscais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nota_fiscal`.`notas_fiscais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_de_emissao` DATE NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notas_fiscais_1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_notas_fiscais_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `nota_fiscal`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nota_fiscal`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nota_fiscal`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `discriminacao` VARCHAR(45) NOT NULL,
  `valor_unitario` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nota_fiscal`.`produtos_nota_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nota_fiscal`.`produtos_nota_fiscal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nota_fiscal` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_nota_fiscal_1_idx` (`id_nota_fiscal` ASC) VISIBLE,
  INDEX `fk_produtos_nota_fiscal_2_idx` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_nota_fiscal_1`
    FOREIGN KEY (`id_nota_fiscal`)
    REFERENCES `nota_fiscal`.`notas_fiscais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_nota_fiscal_2`
    FOREIGN KEY (`id_produto`)
    REFERENCES `nota_fiscal`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
<<<<<<< HEAD
-- Wed 06 Nov 2019 02:44:01 PM -03
=======
-- Tue 22 Oct 2019 10:07:36 PM -03
>>>>>>> origin/master
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
<<<<<<< HEAD
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
=======
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
>>>>>>> origin/master

-- -----------------------------------------------------
-- Schema null_bank
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema null_bank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `null_bank` DEFAULT CHARACTER SET utf8 ;
USE `null_bank` ;

-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome_completo` VARCHAR(150) NOT NULL,
  `RG` VARCHAR(15) NOT NULL,
  `orgao_emissor` VARCHAR(45) NOT NULL,
  `UF_emissor` VARCHAR(2) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `idade` INT NULL,
=======
-- Table `null_bank`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `null_bank`.`cliente` (
  `cpf` INT NOT NULL,
  `nome_completo` VARCHAR(150) NOT NULL,
  `RG` INT NOT NULL,
  `orgao_emissor` VARCHAR(45) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `data_nasc` DATE NOT NULL,
>>>>>>> origin/master
  `tipo_logradouro` VARCHAR(45) NOT NULL,
  `nome_logradouro` VARCHAR(150) NOT NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(150) NOT NULL,
  `CEP` INT NOT NULL,
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(100) NOT NULL,
<<<<<<< HEAD
=======
  `telefone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nro_conta` INT NOT NULL,
>>>>>>> origin/master
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telefone` (
=======
-- Table `null_bank`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `null_bank`.`telefone` (
>>>>>>> origin/master
  `numero_ctt` INT(11) NOT NULL,
  `cliente_cpf` INT NOT NULL,
  PRIMARY KEY (`numero_ctt`, `cliente_cpf`),
  INDEX `fk_telefone_cliente_idx` (`cliente_cpf` ASC),
  CONSTRAINT `fk_telefone_cliente`
    FOREIGN KEY (`cliente_cpf`)
<<<<<<< HEAD
    REFERENCES `cliente` (`cpf`)
=======
    REFERENCES `null_bank`.`cliente` (`cpf`)
>>>>>>> origin/master
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `email` (
=======
-- Table `null_bank`.`email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `null_bank`.`email` (
>>>>>>> origin/master
  `email` VARCHAR(45) NOT NULL,
  `cliente_cpf` INT NOT NULL,
  PRIMARY KEY (`email`, `cliente_cpf`),
  INDEX `fk_email_cliente1_idx` (`cliente_cpf` ASC),
  CONSTRAINT `fk_email_cliente1`
    FOREIGN KEY (`cliente_cpf`)
<<<<<<< HEAD
    REFERENCES `cliente` (`cpf`)
=======
    REFERENCES `null_bank`.`cliente` (`cpf`)
>>>>>>> origin/master
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `agencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agencia` (
  `id_agencia` INT NOT NULL,
  `nome_agencia` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `montante_salarial` FLOAT NULL,
  PRIMARY KEY (`id_agencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `funcionario` (
  `matricula` INT NOT NULL,
  `nome_completo` VARCHAR(150) NOT NULL,
  `senha` VARCHAR(15) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `cargo` VARCHAR(20) NOT NULL,
  `salario` FLOAT NOT NULL,
  `data_nasc` DATE NOT NULL,
  `idade` INT NOT NULL,
  `tipo_logradouro` VARCHAR(45) NOT NULL,
  `nome_logradouro` VARCHAR(150) NOT NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(150) NOT NULL,
  `CEP` INT NOT NULL,
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(100) NOT NULL,
  `agencia_id_agencia` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_funcionario_agencia1_idx` (`agencia_id_agencia` ASC),
  CONSTRAINT `fk_funcionario_agencia1`
    FOREIGN KEY (`agencia_id_agencia`)
    REFERENCES `agencia` (`id_agencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dependente` (
  `nome_completo` INT NOT NULL,
  `data_nasc` DATE NULL,
  `idade` INT NULL,
  `parentesco` VARCHAR(45) NULL,
  `funcionario_matricula` INT NOT NULL,
  PRIMARY KEY (`nome_completo`, `funcionario_matricula`),
  INDEX `fk_dependente_funcionario1_idx` (`funcionario_matricula` ASC),
  CONSTRAINT `fk_dependente_funcionario1`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conta` (
  `id_conta` INT NOT NULL,
  `saldo` FLOAT NULL,
  `senha` VARCHAR(15) NULL,
  `gerente` INT NULL,
  `cliente_cpf` VARCHAR(11) NOT NULL,
  `gerente_matricula` INT NOT NULL,
  `agencia_id_agencia` INT NOT NULL,
  PRIMARY KEY (`id_conta`, `cliente_cpf`, `gerente_matricula`, `agencia_id_agencia`),
  INDEX `fk_conta_agencia1_idx` (`agencia_id_agencia` ASC),
  INDEX `fk_conta_cliente1_idx` (`cliente_cpf` ASC),
  INDEX `fk_conta_funcionario1_idx` (`gerente_matricula` ASC),
  CONSTRAINT `fk_conta_agencia1`
    FOREIGN KEY (`agencia_id_agencia`)
    REFERENCES `agencia` (`id_agencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_cliente1`
    FOREIGN KEY (`cliente_cpf`)
    REFERENCES `cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_funcionario1`
    FOREIGN KEY (`gerente_matricula`)
    REFERENCES `funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poupanca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poupanca` (
  `conta_id_conta` INT NOT NULL,
  `poupancacol` FLOAT NOT NULL,
  INDEX `fk_poupanca_conta1_idx` (`conta_id_conta` ASC),
  PRIMARY KEY (`conta_id_conta`),
  CONSTRAINT `fk_poupanca_conta1`
    FOREIGN KEY (`conta_id_conta`)
    REFERENCES `conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `especial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `especial` (
  `conta_id_conta` INT NOT NULL,
  `limite_credito` FLOAT NOT NULL,
  INDEX `fk_poupanca_conta1_idx` (`conta_id_conta` ASC),
  PRIMARY KEY (`conta_id_conta`),
  CONSTRAINT `fk_poupanca_conta10`
    FOREIGN KEY (`conta_id_conta`)
    REFERENCES `conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `corrente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corrente` (
  `id_conta` INT NOT NULL,
  `aniver_contrato` FLOAT NOT NULL,
  INDEX `fk_poupanca_conta1_idx` (`id_conta` ASC),
  PRIMARY KEY (`id_conta`),
  CONSTRAINT `fk_poupanca_conta11`
    FOREIGN KEY (`id_conta`)
    REFERENCES `conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trasnsacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trasnsacao` (
  `id_trasnsacao` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  `data_hora` DATE NOT NULL,
  `conta_id_conta` INT NOT NULL,
  PRIMARY KEY (`id_trasnsacao`, `conta_id_conta`),
  INDEX `fk_trasnsacao_conta1_idx` (`conta_id_conta` ASC),
  CONSTRAINT `fk_trasnsacao_conta1`
    FOREIGN KEY (`conta_id_conta`)
    REFERENCES `conta` (`id_conta`)
=======
-- Table `null_bank`.`dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `null_bank`.`dependente` (
  `nome_completo` INT NOT NULL,
  `cliente_cpf` INT NOT NULL,
  `data_nasc` DATE NOT NULL,
  `idade` INT NOT NULL,
  PRIMARY KEY (`nome_completo`, `cliente_cpf`),
  INDEX `fk_dependente_cliente1_idx` (`cliente_cpf` ASC),
  CONSTRAINT `fk_dependente_cliente1`
    FOREIGN KEY (`cliente_cpf`)
    REFERENCES `null_bank`.`cliente` (`cpf`)
>>>>>>> origin/master
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

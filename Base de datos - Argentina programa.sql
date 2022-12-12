-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Portfolio` DEFAULT CHARACTER SET utf8 ;
USE `Portfolio` ;

-- -----------------------------------------------------
-- Table `Portfolio`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Persona` (
  `Id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `domicilio` VARCHAR(45) NULL,
  `fechaNac` DATE NULL,
  `telefono` VARCHAR(12) NULL,
  `correo` VARCHAR(45) NULL,
  `sobreMi` VARCHAR(200) NULL,
  `url_foto` VARCHAR(100) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Tipo_Empleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Tipo_Empleo` (
  `Id` INT NOT NULL,
  `nombreTipo` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Experiencia_Laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Experiencia_Laboral` (
  `Id` INT NOT NULL,
  `nombreEmpresa` VARCHAR(45) NULL,
  `esTrabajoActual` TINYINT NULL,
  `fechaInicio` DATE NULL,
  `fechaFin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `Persona_Id` INT NOT NULL,
  `Tipo_Empleo_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Persona_Id`, `Tipo_Empleo_Id`),
  INDEX `fk_Experiencia_Laboral_Persona_idx` (`Persona_Id` ASC) VISIBLE,
  INDEX `fk_Experiencia_Laboral_Tipo_Empleo1_idx` (`Tipo_Empleo_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_Laboral_Persona`
    FOREIGN KEY (`Persona_Id`)
    REFERENCES `Portfolio`.`Persona` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiencia_Laboral_Tipo_Empleo1`
    FOREIGN KEY (`Tipo_Empleo_Id`)
    REFERENCES `Portfolio`.`Tipo_Empleo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

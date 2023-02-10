-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemon` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemon` ;

-- -----------------------------------------------------
-- Table `LittleLemon`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Customer` (
  `CustID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `CustPhone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `StaffFullName` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Booking` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNo` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `CustID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustID_idx` (`CustID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `CustID`
    FOREIGN KEY (`CustID`)
    REFERENCES `LittleLemon`.`Customer` (`CustID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemon`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Order` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `BookingID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemon`.`Booking` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`MenuItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`MenuItem` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `Starter Name` VARCHAR(45) NOT NULL,
  `Desert Name` VARCHAR(45) NOT NULL,
  `Drink` VARCHAR(45) NOT NULL,
  `Sides` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  `Cost` DECIMAL NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `Cuisine` VARCHAR(45) NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `MenuItemsID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuItemsID_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `MenuItemsID`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemon`.`MenuItem` (`MenuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`OrderDelivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`OrderDelivery` (
  `OrderDeliveryID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderDeliveryID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemon`.`Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemon`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

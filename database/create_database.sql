-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema store1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema store1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `store1` DEFAULT CHARACTER SET utf8 ;
USE `store1` ;

-- -----------------------------------------------------
-- Table `store1`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store1`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store1`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store1`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store1`.`adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store1`.`adress` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_adress_usuario1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_adress_usuario1`
    FOREIGN KEY (`user_id`)
    REFERENCES `store1`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store1`.`order_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store1`.`order_products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `price` FLOAT NOT NULL,
  `quantity` INT NOT NULL,
  INDEX `fk_order_products_product1_idx` (`product_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_products_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `store1`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store1`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store1`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `adress_id` INT NOT NULL,
  `order_products_id` INT NOT NULL,
  `total_price` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ventas_usuarios1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_venta_adress1_idx` (`adress_id` ASC) VISIBLE,
  INDEX `fk_order_order_products1_idx` (`order_products_id` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_usuarios1`
    FOREIGN KEY (`user_id`)
    REFERENCES `store1`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_adress1`
    FOREIGN KEY (`adress_id`)
    REFERENCES `store1`.`adress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_order_products1`
    FOREIGN KEY (`order_products_id`)
    REFERENCES `store1`.`order_products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store1`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store1`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store1`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store1`.`product_has_category` (
  `product_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `fk_product_has_catogories_catogories1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_product_has_catogories_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_catogories_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `store1`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_catogories_catogories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `store1`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

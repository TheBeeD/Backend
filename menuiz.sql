-- MySQL Script generated by MySQL Workbench
-- Tue Jun 28 15:44:46 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema menuiz
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema menuiz
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `menuiz` DEFAULT CHARACTER SET utf8mb4 ;
USE `menuiz` ;

-- -----------------------------------------------------
-- Table `menuiz`.`t_d_TicketSavDetail_TSD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_TicketSavDetail_TSD` (
  `TSD_ID` INT NOT NULL,
  `TSD_IP` VARCHAR(15) NULL,
  `TSD_DESCRIPTION` VARCHAR(120) NULL,
  `t_d_user_usr_USR_ID` INT(11) NOT NULL,
  `t_d_user_usr_t_d_address_adr_ADR_ID` INT(11) NOT NULL,
  PRIMARY KEY (`TSD_ID`),
  INDEX `fk_t_d_TicketSavDetail_TSD_t_d_user_usr1_idx` (`t_d_user_usr_USR_ID` ASC, `t_d_user_usr_t_d_address_adr_ADR_ID` ASC),
  CONSTRAINT `fk_t_d_TicketSavDetail_TSD_t_d_user_usr1`
    FOREIGN KEY (`t_d_user_usr_USR_ID` , `t_d_user_usr_t_d_address_adr_ADR_ID`)
    REFERENCES `menuiz`.`t_d_user_usr` (`USR_ID` , `t_d_address_adr_ADR_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_customerservicefolder_csf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_customerservicefolder_csf` (
  `csf_ID` INT NOT NULL AUTO_INCREMENT,
  `csf_status` VARCHAR(45) NULL,
  `csf_description` VARCHAR(45) NULL,
  `t_d_orderheader_ohr_OHR_ID` INT(11) NOT NULL,
  `t_d_user_usr_USR_ID` INT(11) NOT NULL,
  `t_d_product_prd_PRD_ID` INT(11) NOT NULL,
  `t_d_TicketSavDetail_tsd_tsd_ID` INT NOT NULL,
  `t_d_TicketSavDetail_tsd_t_d_user_usr_USR_ID` INT(11) NOT NULL,
  PRIMARY KEY (`csf_ID`, `t_d_TicketSavDetail_tsd_tsd_ID`, `t_d_TicketSavDetail_tsd_t_d_user_usr_USR_ID`),
  INDEX `fk_t_d_customerservicefolder_csf_t_d_orderheader_ohr1_idx` (`t_d_orderheader_ohr_OHR_ID` ASC) ,
  INDEX `fk_t_d_customerservicefolder_csf_t_d_user_usr1_idx` (`t_d_user_usr_USR_ID` ASC) ,
  INDEX `fk_t_d_customerservicefolder_csf_t_d_product_prd1_idx` (`t_d_product_prd_PRD_ID` ASC),
  INDEX `fk_t_d_customerservicefolder_csf_t_d_TicketSavDetail_tsd1_idx` (`t_d_TicketSavDetail_tsd_tsd_ID` ASC, `t_d_TicketSavDetail_tsd_t_d_user_usr_USR_ID` ASC) ,
  CONSTRAINT `fk_t_d_customerservicefolder_csf_t_d_orderheader_ohr1`
    FOREIGN KEY (`t_d_orderheader_ohr_OHR_ID`)
    REFERENCES `menuiz`.`t_d_orderheader_ohr` (`OHR_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_d_customerservicefolder_csf_t_d_user_usr1`
    FOREIGN KEY (`t_d_user_usr_USR_ID`)
    REFERENCES `menuiz`.`t_d_user_usr` (`USR_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_d_customerservicefolder_csf_t_d_product_prd1`
    FOREIGN KEY (`t_d_product_prd_PRD_ID`)
    REFERENCES `menuiz`.`t_d_product_prd` (`PRD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_d_customerservicefolder_csf_t_d_TicketSavDetail_tsd1`
    FOREIGN KEY (`t_d_TicketSavDetail_tsd_tsd_ID`)
    REFERENCES `menuiz`.`t_d_TicketSavDetail_TSD` (`TSD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_moveStock_mvs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_moveStock_mvs` (
  `mvs_ID` INT NOT NULL,
  `mvs_product` VARCHAR(45) NULL,
  `mvs_countbuy` DECIMAL(8,2) NULL,
  `mvs_countSell` DECIMAL(8,2) NULL,
  `mvs_stock` DECIMAL(8,2) NULL,
  `t_d_product_prd_PRD_ID` INT(11) NOT NULL,
  `t_d_product_prd_PRD_PRICE` DECIMAL(8,2) NOT NULL,
  `t_d_orderdetails_odt_OHR_ID` INT(11) NOT NULL,
  `t_d_orderdetails_odt_PRD_ID` INT(11) NOT NULL,
  `t_d_orderdetails_odt_EXP_ID` INT(11) NOT NULL,
  PRIMARY KEY (`mvs_ID`, `t_d_orderdetails_odt_OHR_ID`, `t_d_orderdetails_odt_PRD_ID`, `t_d_orderdetails_odt_EXP_ID`),
  INDEX `fk_t_d_moovStock_mvt_t_d_product_prd1_idx` (`t_d_product_prd_PRD_ID` ASC, `t_d_product_prd_PRD_PRICE` ASC) ,
  INDEX `fk_t_d_moovStock_mvt_t_d_orderdetails_odt1_idx` (`t_d_orderdetails_odt_OHR_ID` ASC, `t_d_orderdetails_odt_PRD_ID` ASC, `t_d_orderdetails_odt_EXP_ID` ASC),
  CONSTRAINT `fk_t_d_moovStock_mvt_t_d_product_prd1`
    FOREIGN KEY (`t_d_product_prd_PRD_ID` , `t_d_product_prd_PRD_PRICE`)
    REFERENCES `menuiz`.`t_d_product_prd` (`PRD_ID` , `PRD_PRICE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_d_moovStock_mvt_t_d_orderdetails_odt1`
    FOREIGN KEY (`t_d_orderdetails_odt_OHR_ID` , `t_d_orderdetails_odt_PRD_ID` , `t_d_orderdetails_odt_EXP_ID`)
    REFERENCES `menuiz`.`t_d_orderdetails_odt` (`OHR_ID` , `PRD_ID` , `EXP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuiz`.`T_D_HISTFOLDER_HFO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`T_D_HISTFOLDER_HFO` (
  `HFO_INTERVENTIONTIME` DATETIME NULL,
  `t_d_TicketSavDetail_TSD_TSD_ID` INT NOT NULL,
  INDEX `fk_T_D_HISTFOLDER_HFO_t_d_TicketSavDetail_TSD1_idx` (`t_d_TicketSavDetail_TSD_TSD_ID` ASC),
  CONSTRAINT `fk_T_D_HISTFOLDER_HFO_t_d_TicketSavDetail_TSD1`
    FOREIGN KEY (`t_d_TicketSavDetail_TSD_TSD_ID`)
    REFERENCES `menuiz`.`t_d_TicketSavDetail_TSD` (`TSD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuiz`.` t_d_diagSav_dsa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.` t_d_diagSav_dsa` (
  `DSA_DIAG` VARCHAR(20) NOT NULL,
  `t_d_TicketSavDetail_TSD_TSD_ID` INT NOT NULL,
  PRIMARY KEY (`DSA_DIAG`),
  INDEX `fk_ t_d_diagSav_dsa_t_d_TicketSavDetail_TSD1_idx` (`t_d_TicketSavDetail_TSD_TSD_ID` ASC),
  CONSTRAINT `fk_ t_d_diagSav_dsa_t_d_TicketSavDetail_TSD1`
    FOREIGN KEY (`t_d_TicketSavDetail_TSD_TSD_ID`)
    REFERENCES `menuiz`.`t_d_TicketSavDetail_TSD` (`TSD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

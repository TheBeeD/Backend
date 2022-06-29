-- MySQL Workbench Forward Engineering par OLIVIER BEDNAREK

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
-- Table `menuiz`.` t_d_diagsav_dsa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.` t_d_diagsav_dsa` (
  `DSA_DIAG` VARCHAR(20) NULL,
  `DSA_ID` INT NOT NULL,
  PRIMARY KEY (`DSA_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_address_adr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_address_adr` (
  `ADR_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ADR_FIRSTNAME` VARCHAR(1024) NOT NULL,
  `ADR_LASTNAME` VARCHAR(1024) NOT NULL,
  `ADR_LINE1` VARCHAR(1024) NOT NULL,
  `ADR_LINE2` VARCHAR(1024) NULL DEFAULT NULL,
  `ADR_LINE3` VARCHAR(1024) NULL DEFAULT NULL,
  `ADR_ZIPCODE` VARCHAR(1024) NOT NULL,
  `ADR_CITY` VARCHAR(1024) NOT NULL,
  `ADR_COUNTRY` VARCHAR(1024) NOT NULL,
  `ADR_MAIL` VARCHAR(1024) NOT NULL,
  `ADR_PHONE` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`ADR_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_ticketsavdetail_tsd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_ticketsavdetail_tsd` (
  `TSD_ID` INT(11) NOT NULL,
  `TSD_IP` VARCHAR(15) NULL DEFAULT NULL,
  `TSD_DESCRIPTION` VARCHAR(120) NULL DEFAULT NULL,
  `t_d_user_usr_t_d_address_adr_ADR_ID` INT(11) NOT NULL,
  PRIMARY KEY (`TSD_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_paymenttype_pmt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_paymenttype_pmt` (
  `PMT_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `PMT_WORDING` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`PMT_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_orderstatus_oss`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_orderstatus_oss` (
  `OSS_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `OSS_WORDING` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`OSS_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_expeditiontype_ety`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_expeditiontype_ety` (
  `ETY_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ETY_WORDING` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`ETY_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_user_usr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_user_usr` (
  `USR_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `USR_MAIL` VARCHAR(1024) NOT NULL,
  `USR_PASSWORD` VARCHAR(1024) NOT NULL,
  `USR_FIRSTNAME` VARCHAR(1024) NOT NULL,
  `USR_LASTNAME` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`USR_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_orderheader_ohr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_orderheader_ohr` (
  `OHR_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ADR_ID_LIV` INT(11) NOT NULL,
  `ADR_ID_FAC` INT(11) NOT NULL,
  `PMT_ID` INT(11) NOT NULL,
  `OSS_ID` INT(11) NOT NULL,
  `ETY_ID` INT(11) NOT NULL,
  `USR_ID` INT(11) NOT NULL,
  `OHR_NUMBER` VARCHAR(1024) NOT NULL,
  `OHR_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`OHR_ID`),
  INDEX `FK_A_POUR_PAIEMENT` (`PMT_ID` ASC) ,
  INDEX `FK_A_POUR_STATUT` (`OSS_ID` ASC) ,
  INDEX `FK_A_POUR_TYPE_EXPEDITION` (`ETY_ID` ASC) ,
  INDEX `FK_COMMANDE` (`USR_ID` ASC) ,
  INDEX `FK_EST_FACTURE` (`ADR_ID_FAC` ASC) ,
  INDEX `FK_EST_LIVRE` (`ADR_ID_LIV` ASC) ,
  CONSTRAINT `FK_A_POUR_PAIEMENT`
    FOREIGN KEY (`PMT_ID`)
    REFERENCES `menuiz`.`t_d_paymenttype_pmt` (`PMT_ID`),
  CONSTRAINT `FK_A_POUR_STATUT`
    FOREIGN KEY (`OSS_ID`)
    REFERENCES `menuiz`.`t_d_orderstatus_oss` (`OSS_ID`),
  CONSTRAINT `FK_A_POUR_TYPE_EXPEDITION`
    FOREIGN KEY (`ETY_ID`)
    REFERENCES `menuiz`.`t_d_expeditiontype_ety` (`ETY_ID`),
  CONSTRAINT `FK_COMMANDE`
    FOREIGN KEY (`USR_ID`)
    REFERENCES `menuiz`.`t_d_user_usr` (`USR_ID`),
  CONSTRAINT `FK_EST_FACTURE`
    FOREIGN KEY (`ADR_ID_FAC`)
    REFERENCES `menuiz`.`t_d_address_adr` (`ADR_ID`),
  CONSTRAINT `FK_EST_LIVRE`
    FOREIGN KEY (`ADR_ID_LIV`)
    REFERENCES `menuiz`.`t_d_address_adr` (`ADR_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_customerservicefolder_csf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_customerservicefolder_csf` (
  `csf_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `csf_status` VARCHAR(45) NULL DEFAULT NULL,
  `csf_description` VARCHAR(45) NULL DEFAULT NULL,
  `t_d_orderheader_ohr_OHR_ID` INT(11) NOT NULL,
  `t_d_TicketSavDetail_tsd_tsd_ID` INT(11) NOT NULL,
  ` t_d_diagsav_dsa_DSA_ID` INT NOT NULL,
  PRIMARY KEY (`csf_ID`, `t_d_TicketSavDetail_tsd_tsd_ID`, ` t_d_diagsav_dsa_DSA_ID`),
  INDEX `fk_t_d_customerservicefolder_csf_t_d_orderheader_ohr1_idx` (`t_d_orderheader_ohr_OHR_ID` ASC) ,
  INDEX `fk_t_d_customerservicefolder_csf_t_d_TicketSavDetail_tsd1_idx` (`t_d_TicketSavDetail_tsd_tsd_ID` ASC) ,
  INDEX `fk_t_d_customerservicefolder_csf_ t_d_diagsav_dsa1_idx` (` t_d_diagsav_dsa_DSA_ID` ASC) ,
  CONSTRAINT `fk_t_d_customerservicefolder_csf_t_d_TicketSavDetail_tsd1`
    FOREIGN KEY (`t_d_TicketSavDetail_tsd_tsd_ID`)
    REFERENCES `menuiz`.`t_d_ticketsavdetail_tsd` (`TSD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_d_customerservicefolder_csf_t_d_orderheader_ohr1`
    FOREIGN KEY (`t_d_orderheader_ohr_OHR_ID`)
    REFERENCES `menuiz`.`t_d_orderheader_ohr` (`OHR_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_d_customerservicefolder_csf_ t_d_diagsav_dsa1`
    FOREIGN KEY (` t_d_diagsav_dsa_DSA_ID`)
    REFERENCES `menuiz`.` t_d_diagsav_dsa` (`DSA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_expedition_exp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_expedition_exp` (
  `EXP_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `EXP_WEIGTH` DECIMAL(8,2) NULL DEFAULT NULL,
  `EXP_TRACKINGNUMBER` VARCHAR(1024) NULL DEFAULT NULL,
  `EXP_SENTDATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`EXP_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_histfolder_hfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_histfolder_hfo` (
  `HFO_INTERVENTIONTIME` DATETIME NULL DEFAULT NULL,
  `t_d_TicketSavDetail_TSD_TSD_ID` INT(11) NOT NULL,
  INDEX `fk_T_D_HISTFOLDER_HFO_t_d_TicketSavDetail_TSD1_idx` (`t_d_TicketSavDetail_TSD_TSD_ID` ASC) ,
  CONSTRAINT `fk_T_D_HISTFOLDER_HFO_t_d_TicketSavDetail_TSD1`
    FOREIGN KEY (`t_d_TicketSavDetail_TSD_TSD_ID`)
    REFERENCES `menuiz`.`t_d_ticketsavdetail_tsd` (`TSD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_producttype_pty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_producttype_pty` (
  `PTY_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `PTY_DESCRIPTION` VARCHAR(1024) NULL DEFAULT NULL,
  PRIMARY KEY (`PTY_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_supplier_spl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_supplier_spl` (
  `SPL_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `SPL_NAME` VARCHAR(1024) NULL DEFAULT NULL,
  PRIMARY KEY (`SPL_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_product_prd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_product_prd` (
  `PRD_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `SPL_ID` INT(11) NOT NULL,
  `PTY_ID` INT(11) NOT NULL,
  `PRD_DESCRIPTION` VARCHAR(1024) NOT NULL,
  `PRD_GUARANTEE` SMALLINT(6) NOT NULL,
  `PRD_PICTURE` LONGTEXT NULL DEFAULT NULL,
  `PRD_PRICE` DECIMAL(8,2) NOT NULL,
  `PRD_CODE` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`PRD_ID`, `PRD_PRICE`),
  INDEX `FK_EST_DE_TYPE` (`PTY_ID` ASC) ,
  INDEX `FK_PROVIENT_DE` (`SPL_ID` ASC) ,
  CONSTRAINT `FK_EST_DE_TYPE`
    FOREIGN KEY (`PTY_ID`)
    REFERENCES `menuiz`.`t_d_producttype_pty` (`PTY_ID`),
  CONSTRAINT `FK_PROVIENT_DE`
    FOREIGN KEY (`SPL_ID`)
    REFERENCES `menuiz`.`t_d_supplier_spl` (`SPL_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_orderdetails_odt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_orderdetails_odt` (
  `OHR_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `PRD_ID` INT(11) NOT NULL,
  `EXP_ID` INT(11) NOT NULL,
  `ODT_QUANTITY` INT(11) NOT NULL,
  `ODT_ISCANCELED` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`OHR_ID`, `PRD_ID`, `EXP_ID`),
  INDEX `FK_CONCERNE2` (`PRD_ID` ASC) ,
  INDEX `FK_CONCERNE3` (`EXP_ID` ASC) ,
  CONSTRAINT `FK_CONCERNE1`
    FOREIGN KEY (`OHR_ID`)
    REFERENCES `menuiz`.`t_d_orderheader_ohr` (`OHR_ID`),
  CONSTRAINT `FK_CONCERNE2`
    FOREIGN KEY (`PRD_ID`)
    REFERENCES `menuiz`.`t_d_product_prd` (`PRD_ID`),
  CONSTRAINT `FK_CONCERNE3`
    FOREIGN KEY (`EXP_ID`)
    REFERENCES `menuiz`.`t_d_expedition_exp` (`EXP_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_movestock_mvs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_movestock_mvs` (
  `mvs_ID` INT(11) NOT NULL,
  `mvs_product` VARCHAR(45) NULL DEFAULT NULL,
  `mvs_countbuy` DECIMAL(8,2) NULL DEFAULT NULL,
  `mvs_countSell` DECIMAL(8,2) NULL DEFAULT NULL,
  `mvs_stock` DECIMAL(8,2) NULL DEFAULT NULL,
  `t_d_product_prd_PRD_ID` INT(11) NOT NULL,
  `t_d_product_prd_PRD_PRICE` DECIMAL(8,2) NOT NULL,
  `t_d_orderdetails_odt_OHR_ID` INT(11) NOT NULL,
  `t_d_orderdetails_odt_PRD_ID` INT(11) NOT NULL,
  `t_d_orderdetails_odt_EXP_ID` INT(11) NOT NULL,
  PRIMARY KEY (`mvs_ID`, `t_d_orderdetails_odt_OHR_ID`, `t_d_orderdetails_odt_PRD_ID`, `t_d_orderdetails_odt_EXP_ID`),
  INDEX `fk_t_d_moovStock_mvt_t_d_product_prd1_idx` (`t_d_product_prd_PRD_ID` ASC, `t_d_product_prd_PRD_PRICE` ASC) ,
  INDEX `fk_t_d_moovStock_mvt_t_d_orderdetails_odt1_idx` (`t_d_orderdetails_odt_OHR_ID` ASC, `t_d_orderdetails_odt_PRD_ID` ASC, `t_d_orderdetails_odt_EXP_ID` ASC) ,
  CONSTRAINT `fk_t_d_moovStock_mvt_t_d_orderdetails_odt1`
    FOREIGN KEY (`t_d_orderdetails_odt_OHR_ID` , `t_d_orderdetails_odt_PRD_ID` , `t_d_orderdetails_odt_EXP_ID`)
    REFERENCES `menuiz`.`t_d_orderdetails_odt` (`OHR_ID` , `PRD_ID` , `EXP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_d_moovStock_mvt_t_d_product_prd1`
    FOREIGN KEY (`t_d_product_prd_PRD_ID` , `t_d_product_prd_PRD_PRICE`)
    REFERENCES `menuiz`.`t_d_product_prd` (`PRD_ID` , `PRD_PRICE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_productkit_kit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_productkit_kit` (
  `PRD_ID_KIT` INT(11) NOT NULL AUTO_INCREMENT,
  `PRD_ID_COMPONENT` INT(11) NOT NULL,
  `KIT_QUANTITY` INT(11) NOT NULL,
  PRIMARY KEY (`PRD_ID_KIT`, `PRD_ID_COMPONENT`),
  INDEX `FK_T_D_PROD_SE_COMPOS_T_D_PROD2` (`PRD_ID_COMPONENT` ASC) ,
  CONSTRAINT `FK_SE_COMPOSE`
    FOREIGN KEY (`PRD_ID_KIT`)
    REFERENCES `menuiz`.`t_d_product_prd` (`PRD_ID`),
  CONSTRAINT `FK_T_D_PROD_SE_COMPOS_T_D_PROD2`
    FOREIGN KEY (`PRD_ID_COMPONENT`)
    REFERENCES `menuiz`.`t_d_product_prd` (`PRD_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `menuiz`.`t_d_usertype_uty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuiz`.`t_d_usertype_uty` (
  `UTY_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `UTY_TYPE` VARCHAR(50) NOT NULL,
  `t_d_user_usr_USR_ID` INT(11) NOT NULL,
  PRIMARY KEY (`UTY_ID`, `t_d_user_usr_USR_ID`),
  INDEX `fk_t_d_usertype_uty_t_d_user_usr1_idx` (`t_d_user_usr_USR_ID` ASC) ,
  CONSTRAINT `fk_t_d_usertype_uty_t_d_user_usr1`
    FOREIGN KEY (`t_d_user_usr_USR_ID`)
    REFERENCES `menuiz`.`t_d_user_usr` (`USR_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

delimiter $$

CREATE DATABASE `hatdevmichal` /*!40100 DEFAULT CHARACTER SET latin1 */$$

USE hatdevmichal$$

CREATE TABLE `account` (
  `account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  `is_current` bit(1) DEFAULT b'0',
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_id_UNIQUE` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `creditor` (
  `creditor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  PRIMARY KEY (`creditor_id`),
  UNIQUE KEY `creditor_id_UNIQUE` (`creditor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `tag` (
  `tag_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_id_UNIQUE` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `pool_income` (
  `pool_income_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_pool_income_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  PRIMARY KEY (`pool_income_id`),
  UNIQUE KEY `pool_income_id_UNIQUE` (`pool_income_id`),
  CONSTRAINT `parent_pool_income_id_fk` FOREIGN KEY (`parent_pool_income_id`) REFERENCES `pool_income` (`pool_income_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `pool_expense` (
  `pool_expense_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_pool_expense_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  PRIMARY KEY (`pool_expense_id`),
  UNIQUE KEY `pool_expense_id_UNIQUE` (`pool_expense_id`),
  CONSTRAINT `parent_pool_expense_id_fk` FOREIGN KEY (`parent_pool_expense_id`) REFERENCES `pool_expense` (`pool_expense_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `pool_transfer` (
  `pool_transfer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_pool_transfer_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  PRIMARY KEY (`pool_transfer_id`),
  UNIQUE KEY `pool_transfer_id_UNIQUE` (`pool_transfer_id`),
  CONSTRAINT `parent_pool_transfer_id_fk` FOREIGN KEY (`parent_pool_transfer_id`) REFERENCES `pool_transfer` (`pool_transfer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `pool_loan` (
  `pool_loan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_pool_loan_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  PRIMARY KEY (`pool_loan_id`),
  UNIQUE KEY `pool_loan_id_UNIQUE` (`pool_loan_id`),
  CONSTRAINT `parent_pool_loan_id_fk` FOREIGN KEY (`parent_pool_loan_id`) REFERENCES `pool_loan` (`pool_loan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `pool_borrow` (
  `pool_borrow_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_pool_borrow_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  PRIMARY KEY (`pool_borrow_id`),
  UNIQUE KEY `pool_borrow_id_UNIQUE` (`pool_borrow_id`),
  CONSTRAINT `parent_pool_borrow_id_fk` FOREIGN KEY (`parent_pool_borrow_id`) REFERENCES `pool_borrow` (`pool_borrow_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `monthly_pool_group` (
  `monthly_pool_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `month` int(2) unsigned NOT NULL,
  `year` int(4) unsigned NOT NULL,
  PRIMARY KEY (`monthly_pool_group_id`),
  UNIQUE KEY `monthly_pool_group_id_UNIQUE` (`monthly_pool_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `monthly_pool_income` (
  `monthly_pool_income_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monthly_pool_group_id` int(10) unsigned NOT NULL,
  `pool_income_id` int(10) unsigned NOT NULL,
  `destination_account_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`monthly_pool_income_id`),
  UNIQUE KEY `monthly_pool_income_id_UNIQUE` (`monthly_pool_income_id`),
  CONSTRAINT `monthly_pool_income_pool_group_id_fk` FOREIGN KEY (`monthly_pool_group_id`) REFERENCES `monthly_pool_group` (`monthly_pool_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_income_id_fk` FOREIGN KEY (`pool_income_id`) REFERENCES `pool_income` (`pool_income_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_income_destination_account_id_fk` FOREIGN KEY (`destination_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `monthly_pool_expense` (
  `monthly_pool_expense_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monthly_pool_group_id` int(10) unsigned NOT NULL,
  `pool_expense_id` int(10) unsigned NOT NULL,
  `source_account_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`monthly_pool_expense_id`),
  UNIQUE KEY `monthly_pool_expense_id_UNIQUE` (`monthly_pool_expense_id`),
  CONSTRAINT `monthly_pool_expense_pool_group_id_fk` FOREIGN KEY (`monthly_pool_group_id`) REFERENCES `monthly_pool_group` (`monthly_pool_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_expense_id_fk` FOREIGN KEY (`pool_expense_id`) REFERENCES `pool_expense` (`pool_expense_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_expense_source_account_id_fk` FOREIGN KEY (`source_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `monthly_pool_transfer` (
  `monthly_pool_transfer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monthly_pool_group_id` int(10) unsigned NOT NULL,
  `pool_transfer_id` int(10) unsigned NOT NULL,
  `source_account_id` int(10) unsigned NOT NULL,
  `destination_account_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`monthly_pool_transfer_id`),
  UNIQUE KEY `monthly_pool_transfer_id_UNIQUE` (`monthly_pool_transfer_id`),
  CONSTRAINT `monthly_pool_transfer_pool_group_id_fk` FOREIGN KEY (`monthly_pool_group_id`) REFERENCES `monthly_pool_group` (`monthly_pool_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_transfer_id_fk` FOREIGN KEY (`pool_transfer_id`) REFERENCES `pool_transfer` (`pool_transfer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_transfer_source_account_id_fk` FOREIGN KEY (`source_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_transfer_destination_account_id_fk` FOREIGN KEY (`destination_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `monthly_pool_loan` (
  `monthly_pool_loan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monthly_pool_group_id` int(10) unsigned NOT NULL,
  `pool_loan_id` int(10) unsigned NOT NULL,
  `source_account_id` int(10) unsigned NOT NULL,
  `creditor_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`monthly_pool_loan_id`),
  UNIQUE KEY `monthly_pool_loan_id_UNIQUE` (`monthly_pool_loan_id`),
  CONSTRAINT `monthly_pool_loan_pool_group_id_fk` FOREIGN KEY (`monthly_pool_group_id`) REFERENCES `monthly_pool_group` (`monthly_pool_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_loan_id_fk` FOREIGN KEY (`pool_loan_id`) REFERENCES `pool_loan` (`pool_loan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_loan_source_account_id_fk` FOREIGN KEY (`source_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_loan_creditor_id_fk` FOREIGN KEY (`creditor_id`) REFERENCES `creditor` (`creditor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `monthly_pool_borrow` (
  `monthly_pool_borrow_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monthly_pool_group_id` int(10) unsigned NOT NULL,
  `pool_borrow_id` int(10) unsigned NOT NULL,
  `destination_account_id` int(10) unsigned NOT NULL,
  `creditor_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`monthly_pool_borrow_id`),
  UNIQUE KEY `monthly_pool_borrow_id_UNIQUE` (`monthly_pool_borrow_id`),
  CONSTRAINT `monthly_pool_borrow_pool_group_id_fk` FOREIGN KEY (`monthly_pool_group_id`) REFERENCES `monthly_pool_group` (`monthly_pool_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_borrow_id_fk` FOREIGN KEY (`pool_borrow_id`) REFERENCES `pool_borrow` (`pool_borrow_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_borrow_destination_account_id_fk` FOREIGN KEY (`destination_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `monthly_pool_borrow_creditor_id_fk` FOREIGN KEY (`creditor_id`) REFERENCES `creditor` (`creditor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation_group` (
  `operation_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`operation_group_id`),
  UNIQUE KEY `operation_group_id_UNIQUE` (`operation_group_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation_income` (
  `operation_income_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_income_id` int(10) unsigned NOT NULL,
  `operation_group_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `destination_account_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`operation_income_id`),
  UNIQUE KEY `operation_income_id_UNIQUE` (`operation_income_id`),
  CONSTRAINT `operation_income_pool_id_fk` FOREIGN KEY (`pool_income_id`) REFERENCES `pool_income` (`pool_income_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_income_group_id_fk` FOREIGN KEY (`operation_group_id`) REFERENCES `operation_group` (`operation_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_income_destination_account_id_fk` FOREIGN KEY (`destination_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation_expense` (
  `operation_expense_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_expense_id` int(10) unsigned NOT NULL,
  `operation_group_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `source_account_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`operation_expense_id`),
  UNIQUE KEY `operation_expense_id_UNIQUE` (`operation_expense_id`),
  CONSTRAINT `operation_expense_pool_id_fk` FOREIGN KEY (`pool_expense_id`) REFERENCES `pool_expense` (`pool_expense_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_expense_group_id_fk` FOREIGN KEY (`operation_group_id`) REFERENCES `operation_group` (`operation_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_expense_source_account_id_fk` FOREIGN KEY (`source_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation_transfer` (
  `operation_transfer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_transfer_id` int(10) unsigned NOT NULL,
  `operation_group_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `source_account_id` int(10) unsigned NOT NULL,
  `destination_account_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`operation_transfer_id`),
  UNIQUE KEY `operation_transfer_id_UNIQUE` (`operation_transfer_id`),
  CONSTRAINT `operation_transfer_pool_id_fk` FOREIGN KEY (`pool_transfer_id`) REFERENCES `pool_transfer` (`pool_transfer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_transfer_group_id_fk` FOREIGN KEY (`operation_group_id`) REFERENCES `operation_group` (`operation_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_transfer_source_account_id_fk` FOREIGN KEY (`source_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_transfer_destination_account_id_fk` FOREIGN KEY (`destination_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation_loan` (
  `operation_loan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_loan_id` int(10) unsigned NOT NULL,
  `operation_group_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `source_account_id` int(10) unsigned NOT NULL,
  `creditor_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`operation_loan_id`),
  UNIQUE KEY `operation_loan_id_UNIQUE` (`operation_loan_id`),
  CONSTRAINT `operation_loan_pool_id_fk` FOREIGN KEY (`pool_loan_id`) REFERENCES `pool_loan` (`pool_loan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_loan_group_id_fk` FOREIGN KEY (`operation_group_id`) REFERENCES `operation_group` (`operation_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_loan_source_account_id_fk` FOREIGN KEY (`source_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_loan_creditor_id_fk` FOREIGN KEY (`creditor_id`) REFERENCES `creditor` (`creditor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation_borrow` (
  `operation_borrow_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_borrow_id` int(10) unsigned NOT NULL,
  `operation_group_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `destination_account_id` int(10) unsigned NOT NULL,
  `creditor_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`operation_borrow_id`),
  UNIQUE KEY `operation_borrow_id_UNIQUE` (`operation_borrow_id`),
  CONSTRAINT `operation_borrow_pool_id_fk` FOREIGN KEY (`pool_borrow_id`) REFERENCES `pool_borrow` (`pool_borrow_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_borrow_group_id_fk` FOREIGN KEY (`operation_group_id`) REFERENCES `operation_group` (`operation_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_borrow_destination_account_id_fk` FOREIGN KEY (`destination_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_borrow_creditor_id_fk` FOREIGN KEY (`creditor_id`) REFERENCES `creditor` (`creditor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$
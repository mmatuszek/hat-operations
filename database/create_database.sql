delimiter $$

CREATE DATABASE `hatdevmichal` /*!40100 DEFAULT CHARACTER SET latin1 */$$

USE hatdevmichal$$

CREATE TABLE `operation_group_type` (
  `operation_group_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`operation_group_type_id`),
  UNIQUE KEY `operation_type_id_UNIQUE` (`operation_group_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `resource_type` (
  `resource_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`resource_type_id`),
  UNIQUE KEY `resource_type_id_UNIQUE` (`resource_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `resource` (
  `resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `resource_type_id` int(10) unsigned NOT NULL,
  `is_hidden` bit(1) DEFAULT b'0',
  PRIMARY KEY (`resource_id`),
  UNIQUE KEY `resource_id_UNIQUE` (`resource_id`),
  CONSTRAINT `resource_resource_type_id_fk` FOREIGN KEY (`resource_id`) REFERENCES `resource_type` (`resource_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `tag` (
  `tag_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_id_UNIQUE` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation_group_type_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`),
  CONSTRAINT `category_operation_group_type_id_fk` FOREIGN KEY (`operation_group_type_id`) REFERENCES `operation_group_type` (`operation_group_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `pool` (
  `pool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `month` int(10) unsigned NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT '0',
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pool_id`),
  UNIQUE KEY `pool_id_UNIQUE` (`pool_id`),
  KEY `pool_category_id_fk` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `pool_to_resource` (
  `pool_to_resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pool_id` int(10) unsigned NOT NULL,
  `resource_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`pool_to_resource_id`),
  UNIQUE KEY `pool_to_resource_id_UNIQUE` (`pool_to_resource_id`),
  CONSTRAINT `pool_to_resource_pool_id_fk` FOREIGN KEY (`pool_id`) REFERENCES `pool` (`pool_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pool_to_resource_resource_id_fk` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation_group` (
  `operation_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation_group_type_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`operation_group_id`),
  UNIQUE KEY `operation_group_id_UNIQUE` (`operation_group_id`),
  CONSTRAINT `operation_group_operation_group_type_id_fk` FOREIGN KEY (`operation_group_type_id`) REFERENCES `operation_group_type` (`operation_group_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation` (
  `operation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `pool_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`operation_id`),
  UNIQUE KEY `operation_id_UNIQUE` (`operation_id`),
  CONSTRAINT `operation_pool_id_fk` FOREIGN KEY (`pool_id`) REFERENCES `pool` (`pool_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `operation_to_resource` (
  `operation_to_resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation_id` int(10) unsigned NOT NULL,
  `resource_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`operation_to_resource_id`),
  UNIQUE KEY `operation_to_resource_id_UNIQUE` (`operation_to_resource_id`),
  CONSTRAINT `operation_to_resource_operation_id_fk` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`operation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operation_to_resource_resource_id_fk` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE TABLE `month_to_resource` (
  `month_to_resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `month` int(10) unsigned NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `resource_id` int(10) unsigned NOT NULL,
  `operation_amount` decimal(10,2) DEFAULT '0.00',
  `pool_amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`month_to_resource_id`),
  UNIQUE KEY `month_to_resource_id_UNIQUE` (`month_to_resource_id`),
  CONSTRAINT `month_to_resource_resource_id_fk` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

INSERT INTO `hatdevmichal`.`operation_group_type` (`name`) VALUES ('INCOME')$$
INSERT INTO `hatdevmichal`.`operation_group_type` (`name`) VALUES ('EXPENSE')$$
INSERT INTO `hatdevmichal`.`operation_group_type` (`name`) VALUES ('TRANSFER')$$
INSERT INTO `hatdevmichal`.`resource_type` (`name`) VALUES ('CURRENT')$$
INSERT INTO `hatdevmichal`.`resource_type` (`name`) VALUES ('INVESTMENT')$$
INSERT INTO `hatdevmichal`.`resource_type` (`name`) VALUES ('CREDIT')$$


CREATE TABLE `member` (
  `id` int(11) NOT NULL DEFAULT '13472',
  `member_identifier` varchar(8) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `member_identifier_UNIQUE` (`member_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `skill_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `idx_skill_category_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `skill_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`skill_category_id`),
  CONSTRAINT `skill_category_fk` FOREIGN KEY (`skill_category_id`) REFERENCES `skill_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

CREATE TABLE `skill_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `max_proficiency` enum('READ_ABOUT','BASIC','INTERMEDIATE','EXPERT') NOT NULL,
  `current_proficiency` enum('READ_ABOUT','BASIC','INTERMEDIATE','EXPERT') NOT NULL,
  `last_used` date DEFAULT NULL,
  `currently_using` enum('Y','N') NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_fk_idx` (`member_id`),
  KEY `skill_id_fk_idx` (`skill_id`),
  CONSTRAINT `member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `skill_id_fk` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


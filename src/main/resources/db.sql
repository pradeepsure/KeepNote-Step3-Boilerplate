create database keepnote;

USE KEEPNOTE;


CREATE TABLE `keepnote`.`Category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  `category_descr` VARCHAR(45) NULL,
  `category_creation_date` DATE NULL,
  `category_creator` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`)  
);


CREATE TABLE `keepnote`.`Reminder` (
  `reminder_id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `reminder_name` VARCHAR(45) NOT NULL,
  `reminder_descr` VARCHAR(200) NULL,
  `reminder_type` VARCHAR(20) NULL,
  `reminder_creation_date` DATE NULL,
  `reminder_creator` VARCHAR(45) NULL,
  PRIMARY KEY (`reminder_id`),
);



CREATE TABLE `keepnote`.`Note` (
  `note_id` INT(15) NOT NULL AUTO_INCREMENT,
  `note_title` VARCHAR(45) NOT NULL,
  `note_content` VARCHAR(500) NULL,
  `note_status` VARCHAR(10) NULL,
  `note_creation_date` DATE NULL,
  `created_by` VARCHAR(45) NULL,
  `category_id` int(15),
  `reminder_id` int(15),
  PRIMARY KEY (`note_id`),
  FOREIGN KEY (`category_id`) REFERENCES Category(`category_id`),
  FOREIGN KEY (`reminder_id`) REFERENCES Reminder(`reminder_id`)
  );



CREATE TABLE `keepnote`.`User` (
  `user_id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL ,
  `user_added_date` DATE NULL,
  `user_password` VARCHAR(45) NULL,
  `user_mobile` VARCHAR(15) NULL,
  PRIMARY KEY (`user_id`));


 


CREATE TABLE `keepnote`.`Reminder` (
  `reminder_id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `reminder_name` VARCHAR(45) NOT NULL,
  `reminder_descr` VARCHAR(200) NULL,
  `reminder_type` VARCHAR(20) NULL,
  `reminder_creation_date` DATE NULL,
  `reminder_creator` BIGINT(15) NULL,
  PRIMARY KEY (`reminder_id`),
  FOREIGN KEY (`reminder_creator`) REFERENCES User(`user_id`)
);

CREATE TABLE `keepnote`.`NoteCategory` (
  `notecategory_id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `note_id` BIGINT(15) NOT NULL,
  `category_id` BIGINT(15) NOT NULL,
  PRIMARY KEY (`notecategory_id`),
  FOREIGN KEY (`note_id`) REFERENCES Note(`note_id`),
  FOREIGN KEY (`category_id`) REFERENCES Category(`category_id`)
);

CREATE TABLE `keepnote`.`Notereminder` (
  `notereminder_id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `note_id` BIGINT(15) NOT NULL,
  `reminder_id` BIGINT(15) NOT NULL,
  PRIMARY KEY (`notereminder_id`),
  FOREIGN KEY (`note_id`) REFERENCES Note(`note_id`),
  FOREIGN KEY (`reminder_id`) REFERENCES Reminder(`reminder_id`)
);


CREATE TABLE `keepnote`.`UserNote` (
  `usernote_id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(15) NOT NULL,
  `note_id` BIGINT(15) NOT NULL,
  PRIMARY KEY (`usernote_id`),
  FOREIGN KEY (`user_id`) REFERENCES User(`user_id`),
  FOREIGN KEY (`note_id`) REFERENCES Note(`note_id`)
);









